#!/bin/bash

firewall-cmd --add-port=22/tcp
firewall-cmd --add-port=22/tcp --permanent
