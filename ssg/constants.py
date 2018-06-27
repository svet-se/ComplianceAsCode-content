from __future__ import absolute_import
from __future__ import print_function

import datetime
import os.path


JINJA_MACROS_DEFINITIONS = os.path.join(os.path.dirname(os.path.dirname(
    __file__)), "shared", "macros.jinja")

xml_version = """<?xml version="1.0" encoding="UTF-8"?>"""

datastream_namespace = "http://scap.nist.gov/schema/scap/source/1.2"
ocil_namespace = "http://scap.nist.gov/schema/ocil/2.0"
oval_footer = "</oval_definitions>"
oval_namespace = "http://oval.mitre.org/XMLSchema/oval-definitions-5"
ocil_cs = "http://scap.nist.gov/schema/ocil/2"
xccdf_header = xml_version + "<xccdf>"
xccdf_footer = "</xccdf>"
bash_system = "urn:xccdf:fix:script:sh"
ansible_system = "urn:xccdf:fix:script:ansible"
puppet_system = "urn:xccdf:fix:script:puppet"
anaconda_system = "urn:redhat:anaconda:pre"
cce_uri = "https://nvd.nist.gov/cce/index.cfm"
stig_ns = "http://iase.disa.mil/stigs/Pages/stig-viewing-guidance.aspx"
stig_refs = 'http://iase.disa.mil/stigs/'
disa_cciuri = "http://iase.disa.mil/stigs/cci/Pages/index.aspx"
disa_srguri = "http://iase.disa.mil/stigs/srgs/Pages/index.aspx"
ssg_version_uri = \
    "https://github.com/OpenSCAP/scap-security-guide/releases/latest"
OSCAP_VENDOR = "org.ssgproject"
OSCAP_DS_STRING = "xccdf_%s.content_benchmark_" % OSCAP_VENDOR
OSCAP_GROUP = "xccdf_%s.content_group_" % OSCAP_VENDOR
OSCAP_GROUP_PCIDSS = "xccdf_%s.content_group_pcidss-req" % OSCAP_VENDOR
OSCAP_GROUP_VAL = "xccdf_%s.content_group_values" % OSCAP_VENDOR
OSCAP_GROUP_NON_PCI = "xccdf_%s.content_group_non-pci-dss" % OSCAP_VENDOR
OSCAP_PATH = "oscap"
XCCDF11_NS = "http://checklists.nist.gov/xccdf/1.1"
XCCDF12_NS = "http://checklists.nist.gov/xccdf/1.2"
min_ansible_version = "2.3"
ansible_version_requirement_pre_task_name = \
    "Verify Ansible meets SCAP-Security-Guide version requirements."

oval_header = (
    """
<oval_definitions
    xmlns="{0}"
    xmlns:oval="http://oval.mitre.org/XMLSchema/oval-common-5"
    xmlns:ind="{0}#independent"
    xmlns:unix="{0}#unix"
    xmlns:linux="{0}#linux"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://oval.mitre.org/XMLSchema/oval-common-5 oval-common-schema.xsd
        {0} oval-definitions-schema.xsd
        {0}#independent independent-definitions-schema.xsd
        {0}#unix unix-definitions-schema.xsd
        {0}#linux linux-definitions-schema.xsd">"""
    .format(oval_namespace))

timestamp = datetime.datetime.utcnow().strftime("%Y-%m-%dT%H:%M:%S")

PKG_MANAGER_TO_SYSTEM = {
    "yum": "rpm",
    "zypper": "rpm",
    "dnf": "rpm",
    "apt_get": "dpkg",
}

RHEL_CENTOS_CPE_MAPPING = {
    "cpe:/o:redhat:enterprise_linux:6": "cpe:/o:centos:centos:6",
    "cpe:/o:redhat:enterprise_linux:7": "cpe:/o:centos:centos:7",
}

RHEL_SL_CPE_MAPPING = {
    "cpe:/o:redhat:enterprise_linux:6": "cpe:/o:scientificlinux:scientificlinux:6",
    "cpe:/o:redhat:enterprise_linux:7": "cpe:/o:scientificlinux:scientificlinux:7",
}

CENTOS_NOTICE = \
    "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n" \
    "<p>This benchmark is a direct port of a <i>SCAP Security Guide </i> " \
    "benchmark developed for <i>Red Hat Enterprise Linux</i>. It has been " \
    "modified through an automated process to remove specific dependencies " \
    "on <i>Red Hat Enterprise Linux</i> and to function with <i>CentOS</i>. " \
    "The result is a generally useful <i>SCAP Security Guide</i> benchmark " \
    "with the following caveats:</p>\n" \
    "<ul>\n" \
    "<li><i>CentOS</i> is not an exact copy of " \
    "<i>Red Hat Enterprise Linux</i>. There may be configuration differences " \
    "that produce false positives and/or false negatives. If this occurs " \
    "please file a bug report.</li>\n" \
    "\n" \
    "<li><i>CentOS</i> has its own build system, compiler options, patchsets, " \
    "and is a community supported, non-commercial operating system. " \
    "<i>CentOS</i> does not inherit " \
    "certifications or evaluations from <i>Red Hat Enterprise Linux</i>. As " \
    "such, some configuration rules (such as those requiring " \
    "<i>FIPS 140-2</i> encryption) will continue to fail on <i>CentOS</i>.</li>\n" \
    "</ul>\n" \
    "\n" \
    "<p>Members of the <i>CentOS</i> community are invited to participate in " \
    "<a href=\"http://open-scap.org\">OpenSCAP</a> and " \
    "<a href=\"https://github.com/OpenSCAP/scap-security-guide\">" \
    "SCAP Security Guide</a> development. Bug reports and patches " \
    "can be sent to GitHub: " \
    "<a href=\"https://github.com/OpenSCAP/scap-security-guide\">" \
    "https://github.com/OpenSCAP/scap-security-guide</a>. " \
    "The mailing list is at " \
    "<a href=\"https://fedorahosted.org/mailman/listinfo/scap-security-guide\">" \
    "https://fedorahosted.org/mailman/listinfo/scap-security-guide</a>" \
    ".</p>" \
    "</div>"

SL_NOTICE = \
    "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n" \
    "<p>This benchmark is a direct port of a <i>SCAP Security Guide </i> " \
    "benchmark developed for <i>Red Hat Enterprise Linux</i>. It has been " \
    "modified through an automated process to remove specific dependencies " \
    "on <i>Red Hat Enterprise Linux</i> and to function with <i>Scientifc Linux</i>. " \
    "The result is a generally useful <i>SCAP Security Guide</i> benchmark " \
    "with the following caveats:</p>\n" \
    "<ul>\n" \
    "<li><i>Scientifc Linux</i> is not an exact copy of " \
    "<i>Red Hat Enterprise Linux</i>. Scientific Linux is a Linux distribution " \
    "produced by <i>Fermi National Accelerator Laboratory</i>. It is a free and " \
    "open source operating system based on <i>Red Hat Enterprise Linux</i> and aims " \
    "to be \"as close to the commercial enterprise distribution as we can get it.\" " \
    "There may be configuration differences that produce false positives and/or " \
    "false negatives. If this occurs please file a bug report.</li>\n" \
    "\n" \
    "<li><i>Scientifc Linux</i> is derived from the free and open source software " \
    "made available by Red Hat, but it is not produced, maintained or supported by <i>Red Hat</i>. " \
    "<i>Scientifc Linux</i> has its own build system, compiler options, patchsets, " \
    "and is a community supported, non-commercial operating system. " \
    "<i>Scientifc Linux</i> does not inherit " \
    "certifications or evaluations from <i>Red Hat Enterprise Linux</i>. As " \
    "such, some configuration rules (such as those requiring " \
    "<i>FIPS 140-2</i> encryption) will continue to fail on <i>Scientifc Linux</i>.</li>\n" \
    "</ul>\n" \
    "\n" \
    "<p>Members of the <i>Scientifc Linux</i> community are invited to participate in " \
    "<a href=\"http://open-scap.org\">OpenSCAP</a> and " \
    "<a href=\"https://github.com/OpenSCAP/scap-security-guide\">" \
    "SCAP Security Guide</a> development. Bug reports and patches " \
    "can be sent to GitHub: " \
    "<a href=\"https://github.com/OpenSCAP/scap-security-guide\">" \
    "https://github.com/OpenSCAP/scap-security-guide</a>. " \
    "The mailing list is at " \
    "<a href=\"https://fedorahosted.org/mailman/listinfo/scap-security-guide\">" \
    "https://fedorahosted.org/mailman/listinfo/scap-security-guide</a>" \
    ".</p>" \
    "</div>"

OVAL_TO_XCCDF_DATATYPE_CONSTRAINTS = {
    'int': 'number',
    'float': 'number',
    'boolean': 'boolean',
    'string': 'string',
    'evr_string': 'string',
    'version': 'string',
    'ios_version': 'string',
    'fileset_revision': 'string',
    'binary': 'string'
}

OVALTAG_TO_ABBREV = {
    'definition': 'def',
    'criteria': 'crit',
    'test': 'tst',
    'object': 'obj',
    'state': 'ste',
    'variable': 'var',
}

OCILTAG_TO_ABBREV = {
    'questionnaire': 'questionnaire',
    'action': 'testaction',
    'question': 'question',
    'artifact': 'artifact',
    'variable': 'variable',
}

OVALREFATTR_TO_TAG = {
    "definition_ref": "definition",
    "test_ref": "test",
    "object_ref": "object",
    "state_ref": "state",
    "var_ref": "variable",
}

OCILREFATTR_TO_TAG = {
    "question_ref": "question",
}
