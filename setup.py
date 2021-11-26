#!/usr/bin/env python3
# vim: set fileencoding=utf-8
'''
Nagios NRPE check for checking the AMQP 1.0 connection to a server (like check aliveness does)

Copyright (c) 2015-, IT Services, Stockholm University
Licensed under the Revised BSD License.
'''

import sys
from setuptools import setup, find_packages

version = "1.2.0"

setup(
    name="check_amqp1.0",
    version=version,
    description="Nagios NRPE check for checking the AMQP 1.0 connection to a server (like check aliveness does)",
    long_description=open("README.md").read(),
    author="Simon Lundström <simlu@su.se>, Johan Wassberg <jocar@su.se>",
    url="https://github.com/stockholmuniversity/nagios-plugin-check_amqp1.0",
    license="Revised BSD License",
    scripts=['check_amqp1.0'],
    install_requires=open('requirements.txt').readlines(),
    packages=find_packages(exclude=['contrib', 'docs', 'tests']),
)
