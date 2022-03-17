#!/usr/bin/python3

import argparse
import os
import sys
import time
import xml.etree.ElementTree as ET

from ssg.constants import (
    cat_namespace, datastream_namespace, oval_namespace, XCCDF12_NS,
    xlink_namespace)
import ssg.xml

try:
    from urllib.parse import urlparse
except ImportError:
    from urlparse import urlparse


ID_NS = "org.open-scap"
component_ref_prefix = "#scap_org.open-scap_cref_"


# Inspired by openscap ds_sds_mangle_filepath() function
def mangle_path(path):
    path = path.replace('/', '-')
    path = path.replace('@', '-')
    path = path.replace('~', '-')
    return path


def move_patches_up_to_date_to_source_data_stream_component(datastreamtree):
    ds_checklists = datastreamtree.find(
        ".//{%s}checklists" % datastream_namespace)

    for checklists_component_ref in ds_checklists:
        checklists_component_ref_id = checklists_component_ref.get('id')
        # The component ID is the component-ref href without leading '#'
        checklists_component_id = checklists_component_ref.get(
            '{%s}href' % xlink_namespace)[1:]

        # Locate the <xccdf:check> element of an <xccdf:Rule> with id
        # security_patches_up_to_date
        checklist_component = None
        oval_check = None
        ds_components = datastreamtree.findall(
            ".//{%s}component" % datastream_namespace)
        for ds_component in ds_components:
            if ds_component.get('id') == checklists_component_id:
                checklist_component = ds_component
        if checklist_component is None:
            # Something strange happened
            sys.stderr.write(
                "Couldn't find <component> %s referenced by "
                "<component-ref> %s" % (
                    checklists_component_id, checklists_component_ref_id))
            sys.exit(1)

        rules = checklist_component.findall(".//{%s}Rule" % XCCDF12_NS)
        for rule in rules:
            if rule.get('id').endswith('rule_security_patches_up_to_date'):
                rule_checks = rule.findall("{%s}check" % XCCDF12_NS)
                for check in rule_checks:
                    if check.get('system') == oval_namespace:
                        oval_check = check
                        break

        if oval_check is None:
            # The component doesn't have a security patches up to date rule
            # with an OVAL check
            continue

        # SCAP 1.3 demands multi-check true if the Rules
        # security_patches_up_to_date is evaluated by multiple OVAL patch class
        # definitinos. See 3.2.4.3, SCAP 1.3 standard (NIST.SP.800-126r3)
        oval_check.set('multi-check', 'true')

        check_content_ref = oval_check.find(
            '{%s}check-content-ref' % XCCDF12_NS)
        href_url = check_content_ref.get('href')

        # Use URL's path to define the component name and URI
        # Path attribute returned from urlparse contains a leading '/', when
        # mangling it it will get replaced by '-'. Let's strip the '/' to avoid
        # a sequence of "_-" in the component-ref ID.
        component_ref_name = mangle_path(urlparse(href_url).path[1:])
        component_ref_uri = component_ref_prefix + component_ref_name

        # update @href to refer the datastream component name
        check_content_ref.set('href', component_ref_name)

        # Add a uri refering the component in Rule's Benchmark component-ref
        # catalog
        uri_exists = False
        catalog = checklists_component_ref.find('{%s}catalog' % cat_namespace)
        uris = catalog.findall("{%s}uri" % cat_namespace)
        for uri in uris:
            if uri.get('name') == component_ref_name:
                uri_exists = True
                break
        if not uri_exists:
            uri = ssg.xml.ElementTree.Element('{%s}uri' % cat_namespace)
            uri.set('name', component_ref_name)
            uri.set('uri', component_ref_uri)
            catalog.append(uri)

        # The component-ref ID is the catalog uri without leading '#'
        component_ref_feed_id = component_ref_uri[1:]

        # Add the component-ref to list of datastreams' checks
        check_component_ref_exists = False
        ds_checks = datastreamtree.find(".//{%s}checks" % datastream_namespace)
        check_component_refs = ds_checks.findall(
            "{%s}component-ref" % datastream_namespace)
        for check_component_ref in check_component_refs:
            if check_component_ref.get('id') == component_ref_feed_id:
                check_component_ref_exists = True
                break
        if not check_component_ref_exists:
            component_ref_feed = ssg.xml.ElementTree.Element(
                '{%s}component-ref' % datastream_namespace)
            component_ref_feed.set('id', component_ref_feed_id)
            component_ref_feed.set('{%s}href' % xlink_namespace, href_url)
            ds_checks.append(component_ref_feed)


def parse_args():
    parser = argparse.ArgumentParser(description="Compose an SCAP source data \
        stream from individual SCAP components")
    parser.add_argument("--xccdf", help="XCCDF 1.2 checklist file name")
    parser.add_argument("--oval", help="OVAL file name")
    parser.add_argument("--ocil", help="OCIL file name")
    parser.add_argument("--cpe-dict", help="CPE dictionary file name")
    parser.add_argument("--cpe-oval", help="CPE OVAL file name")
    parser.add_argument(
        "--output-12", help="Output SCAP 1.2 source data stream file name")
    parser.add_argument(
        "--output-13", required=True,
        help="Output SCAP 1.3 source data stream file name")
    return parser.parse_args()


def get_timestamp(file_name):
    source_date_epoch = os.getenv("SOURCE_DATE_EPOCH")
    if source_date_epoch:
        time_sec = float(source_date_epoch)
    else:
        time_sec = os.path.getmtime(file_name)
    timestamp = time.strftime("%Y-%m-%dT%H:%M:%S", time.localtime(time_sec))
    return timestamp


def add_component(
        ds_collection, component_ref_parent, component_file_name,
        dependencies=None):
    component_id = "scap_%s_comp_%s" % (
        ID_NS, os.path.basename(component_file_name))
    component = ET.SubElement(
        ds_collection, "{%s}component" % datastream_namespace)
    component.set("id", component_id)
    component.set("timestamp", get_timestamp(component_file_name))
    component_ref = ET.SubElement(
        component_ref_parent, "{%s}component-ref" % datastream_namespace)
    component_ref_id = "scap_%s_cref_%s" % (
        ID_NS, os.path.basename(component_file_name))
    component_ref.set("id", component_ref_id)
    component_ref.set("{%s}href" % xlink_namespace, "#" + component_id)
    component_root = ET.parse(component_file_name).getroot()
    component.append(component_root)
    if dependencies:
        create_catalog(component_ref, dependencies)


def create_catalog(component_ref, dependencies):
    catalog = ET.SubElement(component_ref, "{%s}catalog" % cat_namespace)
    for dep in dependencies:
        uri = ET.SubElement(catalog, "{%s}uri" % cat_namespace)
        dep_base_name = os.path.basename(dep)
        uri.set("name", dep_base_name)
        uri.set("uri", "#scap_%s_cref_%s" % (ID_NS, dep_base_name))


def compose_ds(
        xccdf_file_name, oval_file_name, ocil_file_name,
        cpe_dict_file_name, cpe_oval_file_name):
    ds_collection = ET.Element(
        "{%s}data-stream-collection" % datastream_namespace)
    name = "from_xccdf_" + os.path.basename(xccdf_file_name)
    ds_collection.set("id", "scap_%s_collection_%s" % (ID_NS, name))
    ds_collection.set("schematron-version", "1.2")
    ds = ET.SubElement(ds_collection, "{%s}data-stream" % datastream_namespace)
    ds.set("id", "scap_%s_datastream_%s" % (ID_NS, name))
    ds.set("scap-version", "1.2")
    ds.set("use-case", "OTHER")
    dictionaries = ET.SubElement(ds, "{%s}dictionaries" % datastream_namespace)
    checklists = ET.SubElement(ds, "{%s}checklists" % datastream_namespace)
    checks = ET.SubElement(ds, "{%s}checks" % datastream_namespace)
    cpe_dict_dependencies = [cpe_oval_file_name]
    add_component(
        ds_collection, dictionaries, cpe_dict_file_name, cpe_dict_dependencies)
    xccdf_dependencies = [oval_file_name, ocil_file_name]
    add_component(
        ds_collection, checklists, xccdf_file_name, xccdf_dependencies)
    add_component(ds_collection, checks, oval_file_name)
    add_component(ds_collection, checks, ocil_file_name)
    add_component(ds_collection, checks, cpe_oval_file_name)
    return ET.ElementTree(ds_collection)


def upgrade_ds_to_scap_13(ds):
    dsc_el = ds.getroot()
    dsc_el.set("schematron-version", "1.3")
    ds_el = ds.find("{%s}data-stream" % datastream_namespace)
    ds_el.set("scap-version", '1.3')
    # Move reference to remote OVAL content to a source data stream component
    move_patches_up_to_date_to_source_data_stream_component(ds)
    return ds


if __name__ == "__main__":
    args = parse_args()
    ssg.xml.register_namespaces()
    ds = compose_ds(
        args.xccdf, args.oval, args.ocil, args.cpe_dict, args.cpe_oval)
    if args.output_12:
        ds.write(args.output_12)
    ds_13 = upgrade_ds_to_scap_13(ds)
    ds_13.write(args.output_13)
