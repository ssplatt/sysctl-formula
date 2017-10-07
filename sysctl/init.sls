# -*- coding: utf-8 -*-
# vim: ft=sls
{%- from "sysctl/map.jinja" import sysctl with context %}

{% if sysctl.enabled %}
include:
  - sysctl.config
{% else %}
'sysctl-formula disabled':
  test.succeed_without_changes
{% endif %}
