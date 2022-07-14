import ssg.utils


def preprocess(data, lang):
    data["sysctlid"] = ssg.utils.escape_id(data["sysctlvar"])
    if not data.get("sysctlval"):
        data["sysctlval"] = ""
    ipv6_flag = "P"
    if data["sysctlid"].find("ipv6") >= 0:
        ipv6_flag = "I"
    data["flags"] = "SR" + ipv6_flag
    if "operation" not in data:
        data["operation"] = "equals"
    if isinstance(data["sysctlval"], list) and len(data["sysctlval"]) == 0:
        raise ValueError(
            "The sysctlval parameter of {0} is an empty list".format(
                data["_rule_id"]))

    if not data.get("sysctlval_remediate"):
        if isinstance(data["sysctlval"], list):
            raise ValueError(
                "Problem with rule {0}: the 'sysctlval' parameter is a list "
                "but we are missing the 'sysctlval_remediate' parameter, so "
                "we don't know how to generate remediation content.".format(
                    data["_rule_id"]))
        data["sysctlval_remediate"] = data["sysctlval"]

    # Configure data for test scenarios
    if data["datatype"] not in ["string", "int"]:
        raise ValueError(
            "Test scenarios for data type '{0}' are not implemented yet.\n"
            "Please check if rule '{1}' has correct data type and edit "
            "{2} to add tests for it.".format(
                data["datatype"], data["_rule_id"], __file__))

    if data["sysctlval"] == "":
        if data["datatype"] == "int":
            data["sysctl_correct_value"] = "0"
            data["sysctl_wrong_value"] = "1"
        elif data["datatype"] == "string":
            data["sysctl_correct_value"] = "correct_value"
            data["sysctl_wrong_value"] = "wrong_value"
    elif isinstance(data["sysctlval"], list):
        data["sysctl_correct_value"] = data["sysctlval_remediate"]
        data["sysctl_wrong_value"] = data["sysctlval_wrong"]
    else:
        data["sysctl_correct_value"] = data["sysctlval"]
        if data["datatype"] == "int":
            data["sysctl_wrong_value"] = "1" + data["sysctlval"]
        elif data["datatype"] == "string":
            data["sysctl_wrong_value"] = "wrong_value"
    return data
