# -*- coding: utf-8 -*-
# vim: ft=yaml

sysctl:
  enabled: True
  kernel_parameters:
    networking:  
      'net.core.wmem_max': '12582912'
      'net.core.rmem_max': '12582912'
    virtualmemory:
      'vm.dirty_background_ratio': '5'
      'vm.dirty_ratio': '60'

