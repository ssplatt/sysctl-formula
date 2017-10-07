# -*- coding: utf-8 -*-
# vim: ft=sls
{%- from "sysctl/map.jinja" import sysctl with context %}

{# Do not process the hash if there are no parameters defined #}
{% if sysctl.kernel_parameters is defined %}
{% for catagory, parameters in sysctl.kernel_parameters.iteritems() -%}

{# create the tuning file -#}
sysctl_{{ catagory }}_parameters:
  file.managed:
    - name: '/etc/sysctl.d/{{ catagory }}.conf'
    - source: salt://sysctl/parameters.conf.j2
    - user: root
    - group: root
    - mode: 0600
    - template: jinja
    - catagory: {{ catagory }}
    - parameters: {{ parameters }}
{% endfor -%}

{# update the kernel parameters #}
sysctl_update:
  cmd:
    - wait
    - name: {{ sysctl.bin }} --system
    - watch:
{% for catagory, parameters in sysctl.kernel_parameters.iteritems() %}
      - file: sysctl_{{ catagory }}_parameters
{% endfor %}

{% else %}
'sysctl-formula no parameters defined':
  test.succeed_without_changes

{%- endif %}

