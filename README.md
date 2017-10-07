# sysctl-formula

This formula will configure kernel parameters based on a hash.

## Available states

### sysctl

given a dict will create a /etc/sysctl.d/filename.conf and apply using `sysctl --system`

e.g:
```
sysctrl:
  kernel_parameters:
		networking:  
			'net.core.wmem_max': '12582912'
			'net.core.rmem_max': '12582912'
-------------------------------------
# /etc/sysctl.d/networking.conf
net.core.rmem_max=12582912
net.core.wmem_max=12582912
```

### toggle

For additional proctection this forumla has a toggle. A toggle will prevent the formula
from being applied unless `sysctrl.enabled = true`. Currently this defaults to false.

## How to use test-kitchen

Install and setup brew:
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install vagrant with brew:
```
brew install cask
brew cask install vagrant
```

Install test-kitchen and dependencies:
```
sudo gem install test-kitchen
sudo gem install kitchen-vagrant
sudo gem install kitchen-salt
```

Run a converge on the the server configuration:
```
kitchen converge
```
