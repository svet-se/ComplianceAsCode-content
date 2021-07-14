from ssg.utils import parse_template_boolean_value

def _file_owner_groupowner_permissions_regex(data):
    # this avoids code duplicates
    if isinstance(data["filepath"], str):
        data["filepath"] = [ data["filepath"] ]

    if "file_regex" in data:
        # we can have a list of filepaths, but only one regex
        # instead of declaring the same regex multiple times
        if isinstance(data["file_regex"], str):
            data["file_regex"] = [ data["file_regex"] ] * len(data["filepath"])

        # if the length of filepaths and file_regex are not the same, then error.
        # in case we have multiple regexes for just one filepath, than we need
        # to declare that filepath multiple times
        if len(data["filepath"]) != len(data["file_regex"]):
            raise ValueError(
                "You should have one file_path per file_regex. Please check "
                "rule '{0}'".format(data["_rule_id"]))

    for f in data["filepath"]:
        if "is_directory" in data and data["is_directory"] != f.endswith("/"):
            raise ValueError(
                "If passing a list of filepaths, all of them need to be "
                "either directories or files. Mixing is not possible. "
                "Please fix rules '{0}' filepath '{1}'".format(data["_rule_id"], f))

        data["is_directory"] = f.endswith("/")

        if "file_regex" in data and not data["is_directory"]:
            raise ValueError(
                "Used 'file_regex' key in rule '{0}' but filepath '{1}' does not "
                "specify a directory. Append '/' to the filepath or remove the "
                "'file_regex' key.".format(data["_rule_id"], f))


def preprocess(data, lang):
    _file_owner_groupowner_permissions_regex(data)

    data["allow_stricter_permissions"] = parse_template_boolean_value(data, parameter="allow_stricter_permissions", default_value=True)

    data["missing_file_pass"] = parse_template_boolean_value(data, parameter="missing_file_pass", default_value=False)

    if lang == "oval":
        data["fileid"] = data["_rule_id"].replace("file_permissions", "")
        # build the state that describes our mode
        # mode_str maps to STATEMODE in the template
        mode = data["filemode"]
        fields = [
            'oexec', 'owrite', 'oread', 'gexec', 'gwrite', 'gread',
            'uexec', 'uwrite', 'uread', 'sticky', 'sgid', 'suid']
        mode_int = int(mode, 8)
        mode_str = ""
        for field in fields:
            if mode_int & 0x01 == 1:
                if not data['allow_stricter_permissions']:
                    mode_str = (
                        "<unix:" + field + " datatype=\"boolean\">true</unix:"
                        + field + ">\n" + mode_str)
            else:
                value = "false"
                if data['allow_stricter_permissions']:
                    value = "true"
                mode_str = (
                    "<unix:" + field + " datatype=\"boolean\">{}</unix:".format(value)
                    + field + ">\n" + mode_str)
            mode_int = mode_int >> 1
        data["statemode"] = mode_str.rstrip("\n")
    return data
