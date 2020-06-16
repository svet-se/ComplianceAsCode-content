import pytest
import logging
import os

import ssg.controls

data_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), "data"))
controls_dir = os.path.join(data_dir, "controls_dir")

def test_controls_load():
    controls_manager = ssg.controls.ControlsManager(controls_dir)
    controls_manager.load()

    c_r1 = controls_manager.get_control("abcd", "R1")
    assert c_r1.title == "User session timeout"
    assert c_r1.description == "Remote user sessions must be closed after " \
        "a certain period of inactivity."
    assert c_r1.automated == "yes"
    assert "sshd_set_idle_timeout" in c_r1.rules
    assert "accounts_tmout" in c_r1.rules
    assert "var_accounts_tmout=10_min" in c_r1.rules
    # we haven't specified product but this rule should appear
    # only if product is rhel9
    assert "cockpit_session_timeout" not in c_r1.rules

    c_r2 = controls_manager.get_control("abcd", "R2")
    assert c_r2.automated == "no"
    assert c_r2.note == "This is individual depending on the system " \
        "workload therefore needs to be audited manually."
    assert len(c_r2.rules) == 0

    c_r4 = controls_manager.get_control("abcd", "R4")
    assert len(c_r4.rules) == 3
    assert "accounts_passwords_pam_faillock_deny_root" in c_r4.rules
    assert "accounts_password_pam_minlen" in c_r4.rules
    assert "accounts_password_pam_ocredit" in c_r4.rules
    #logging.info(c.rules)
