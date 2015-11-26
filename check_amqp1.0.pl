#!/usr/bin/env perl
use strict;
use warnings;
use Nagios::Plugin;
use Data::Dumper;

my $np = Nagios::Plugin->new(
  shortname => "#",
  usage => "Usage: %s [-v|--verbose] [-t <timeout>] [--critical=<value to emit critical>] [--warning=<value to emit warning>] FIXME",
  version => "1.0",
  timeout => 10,
  extra => qq(
FIXME
),
);

$np->getopts;
