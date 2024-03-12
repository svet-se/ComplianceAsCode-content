"""
Common functions for enabling derivative products
"""

from __future__ import absolute_import
from __future__ import print_function

import re
from .xml import ElementTree
from .constants import (
    standard_profiles,
    OSCAP_VENDOR,
    cpe_dictionary_namespace,
    oval_namespace,
    datastream_namespace,
)
from .build_cpe import ProductCPEs, get_linked_cpe_oval_document
from .products import load_product_yaml


def add_cpes(elem, namespace, mapping):
    """
    Adds derivative CPEs next to RHEL ones, checks XCCDF elements of given
    namespace.
    """

    affected = False

    for child in list(elem):
        affected = affected or add_cpes(child, namespace, mapping)

    # precompute this so that we can affect the tree while iterating
    children = list(elem.findall(".//{%s}platform" % (namespace)))

    for child in children:
        idref = child.get("idref")
        if idref in mapping:
            new_platform = ElementTree.Element("{%s}platform" % (namespace))
            new_platform.set("idref", mapping[idref])
            # this is done for the newline and indentation
            new_platform.tail = child.tail

            index = list(elem).index(child)
            # insert it right after the respective RHEL CPE
            elem.insert(index + 1, new_platform)

            affected = True

    return affected


def get_cpe_item(product_yaml, cpe_ref, cpe_items_dir):
    product_cpes = ProductCPEs()
    product_cpes.load_cpes_from_directory_tree(cpe_items_dir, product_yaml)
    return product_cpes.get_cpe(cpe_ref)


def add_cpe_item_to_dictionary(
    tree_root, product_yaml_path, cpe_ref, id_name, cpe_items_dir
):
    cpe_list = tree_root.find(".//{%s}cpe-list" % cpe_dictionary_namespace)
    if cpe_list is not None:
        product_yaml = load_product_yaml(product_yaml_path)
        cpe_item = get_cpe_item(product_yaml, cpe_ref, cpe_items_dir)
        cpe_item.content_id = id_name
        cpe_item.set_cpe_oval_def_id()
        cpe_list.append(
            cpe_item.to_xml_element("ssg-%s-cpe-oval.xml" % product_yaml.get("product"))
        )
        return cpe_item.cpe_oval_short_def_id
    return None


def add_element_to(oval_root, tag_name, component_element):
    xml_el = oval_root.find(".//{%s}%s" % (oval_namespace, tag_name))
    if xml_el is None:
        xml_el = ElementTree.Element("{%s}%s" % (oval_namespace, tag_name))
        oval_root.append(xml_el)
    xml_el.append(component_element)


def add_oval_components_to_oval_xml(oval_root, tag_name, component_dict):
    for component in component_dict.values():
        add_element_to(oval_root, tag_name, component.get_xml_element())


def get_cpe_oval_root(root):
    for component_el in root.findall("./{%s}component" % datastream_namespace):
        if "cpe-oval" in component_el.get("id", ""):
            return component_el
    return None


def add_oval_definition_to_cpe_oval(root, unlinked_oval_file_path, oval_def_id):
    oval_cpe_root = get_cpe_oval_root(root)
    if oval_cpe_root is None:
        raise Exception("CPE OVAL is missing in base DS!")

    oval_document = get_linked_cpe_oval_document(unlinked_oval_file_path)

    references_to_keep = oval_document.get_all_references_of_definition(oval_def_id)
    oval_document.keep_referenced_components(references_to_keep)

    add_oval_components_to_oval_xml(
        oval_cpe_root, "definitions", oval_document.definitions
    )
    add_oval_components_to_oval_xml(oval_cpe_root, "tests", oval_document.tests)
    add_oval_components_to_oval_xml(oval_cpe_root, "objects", oval_document.objects)
    add_oval_components_to_oval_xml(oval_cpe_root, "states", oval_document.states)
    add_oval_components_to_oval_xml(oval_cpe_root, "variables", oval_document.variables)


def add_notice(benchmark, namespace, notice, warning):
    """
    Adds derivative notice as the first notice to given benchmark.
    """

    index = -1
    prev_element = None
    existing_notices = list(benchmark.findall("./{%s}notice" % (namespace)))
    if existing_notices:
        prev_element = existing_notices[0]
        # insert before the first notice
        index = list(benchmark).index(prev_element)
    else:
        existing_descriptions = list(
            benchmark.findall("./{%s}description" % (namespace))
        )
        prev_element = existing_descriptions[-1]
        # insert after the last description
        index = list(benchmark).index(prev_element) + 1

    if index == -1:
        raise RuntimeError(
            "Can't find existing notices or description in benchmark '%s'." %
            (benchmark)
        )

    elem = ElementTree.Element("{%s}notice" % (namespace))
    elem.set("id", warning)
    elem.append(notice)
    # this is done for the newline and indentation
    elem.tail = prev_element.tail
    benchmark.insert(index, elem)

    return True


def remove_idents(tree_root, namespace, prod="RHEL"):
    """
    Remove product identifiers from rules in XML tree
    """

    ident_exp = '.*' + prod + '-*'
    ref_exp = prod + '-*'
    for rule in tree_root.findall(".//{%s}Rule" % (namespace)):
        for ident in rule.findall(".//{%s}ident" % (namespace)):
            if ident is not None:
                if (re.search(r'CCE-*', ident.text) or
                        re.search(ident_exp, ident.text)):
                    rule.remove(ident)

        for ref in rule.findall(".//{%s}reference" % (namespace)):
            if ref.text is not None:
                if re.search(ref_exp, ref.text):
                    rule.remove(ref)

        for fix in rule.findall(".//{%s}fix" % (namespace)):
            sub_elems = fix.findall(".//{%s}sub" % (namespace))
            for sub_elem in sub_elems:
                sub_elem.tail = re.sub(r"[\s]+- CCE-.*", "", sub_elem.tail)
                sub_elem.tail = re.sub(r"CCE-[0-9]*-[0-9]*", "", sub_elem.tail)
            if fix.text is not None:
                fix.text = re.sub(r"[\s]+- CCE-.*", "", fix.text)
                fix.text = re.sub(r"CCE-[0-9]*-[0-9]*", "", fix.text)


def remove_cce_reference(tree_root, namespace):
    """
    Remove CCE identifiers from OVAL checks in XML tree
    """
    for definition in tree_root.findall(".//{%s}definition" % (namespace)):
        for metadata in definition.findall(".//{%s}metadata" % (namespace)):
            for ref in metadata.findall(".//{%s}reference" % (namespace)):
                if (re.search(r'CCE-*', ref.get("ref_id"))):
                    metadata.remove(ref)


def profile_handling(tree_root, namespace):
    ns_profiles = []
    for i in standard_profiles:
        ns_profiles.append("xccdf_%s.content_profile_%s" % (OSCAP_VENDOR, i))
    all_profiles = standard_profiles + ns_profiles
    for profile in tree_root.findall(".//{%s}Profile" % (namespace)):
        if profile.get("id") not in all_profiles:
            tree_root.remove(profile)


def replace_platform(tree_root, namespace, product):
    for oval in tree_root.findall(".//{%s}oval_definitions" % (namespace)):
        for platform in oval.findall(".//{%s}platform" % (namespace)):
            platform.text = (platform.text).replace("Red Hat Enterprise Linux", product)
