
# cntlm

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with cntlm](#setup)
    * [What cntlm affects](#what-cntlm-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with cntlm](#beginning-with-cntlm)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

The cntlm module installs, configures, and manages the cntlm service across a range of Linux distributions.

## Setup

### Setup Requirements

If you intend to use this module to install cntlm, please ensure any optional repositories containing cntlm have been enabled. For example, on Red Hat and its derivatives EPEL must be enabled. 

### Beginning with cntlm

To install and configure cntlm with some basic settings:

```puppet
class { 'cntlm':
  cntlm_username => 'test_user',
  cntlm_domain   => 'test_domain',
  cntlm_password => 'test_password',
  cntlm_proxy    => ['localhost:8080'],
}
```
All cntlm settings are configurable via cntlm_&lt;lowercase_param_name&gt;.

## Reference

### Classes

#### Public classes

* cntlm: Main class, contains all other classes.

#### Private classes

* cntlm::install: Handles the packages.
* cntlm::config: Handles the configuration file.
* cntlm::service: Handles the service.

### Parameters

For more information about this module's parameters, generate the [_puppet strings_](https://github.com/puppetlabs/puppet-strings) documentation using `puppet strings` and view doc/puppet_classes/cntlm.html

## Limitations

This module has only been tested on CentOS 7, Debian Stretch and Ubuntu Xenial. Support for other platforms is possible by overriding default configuration values.

Pre-hashed passwords must be supplied to the module's hashed password parameters. The module does not perform automatic hashing of cleartext passwords.

## Development

Contributions are encouraged, please open a pull request for all proposed changes, and ensure Puppet best practices are maintained.


