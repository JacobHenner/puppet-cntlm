
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

`include cntlm` should be sufficient to install , configure, and start the service, assuming a valid combination of parameters is included in hiera.

## Reference

### Classes

#### Public classes

* cntlm: Main class, contains all other classes.

#### Private classes

* cntlm::install: Handles the packages.
* cntlm::config: Handles the configuration file.
* cntlm::service: Handles the service.

### Parameters

For more information about this module's parameters, generate the [_puppet strings_](https://github.com/puppetlabs/puppet-strings) documentation using `puppet strings` and view docs/index.html

## Limitations

This module has only been tested on CentOS 7, Debian Stretch and Ubuntu Xenial. Support for other platforms is possible by overriding default configuration values using hiera.  

## Development

Contributions are encouraged, please open a pull request for all proposed changes, and ensure Puppet best practices are maintained.


