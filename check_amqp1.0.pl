#!/usr/bin/env perl
use strict;
use warnings;
use Nagios::Plugin;
use Data::Dumper;

my $np = Nagios::Plugin->new(
  shortname => "#",
  usage => "Usage: %s [-v|--verbose] [-t <timeout>] [--critical=<value to emit critical>] [--warning=<value to emit warning>] […]",
  version => "1.0",
  timeout => 10,
  extra => qq(
FIXME
),
);

$np->add_arg(
  spec => 'hostname=s',
  help => "--hostname\n   Hostname to connect to. (default: %s)",
  default => 'localhost',
);

$np->add_arg(
  spec => 'port=s',
  help => "--port\n   port to connect with. (default: %s)",
  default => 5672,
);

$np->add_arg(
  spec => 'username=s',
  help => "--username\n   Username to connect with. (default: %s)",
  default => 'system',
);

$np->add_arg(
  spec => 'password=s',
  help => "--password\n   Password to connect with. (default: %s)",
  default => 'manager',
);

$np->add_arg(
  spec => 'ssl',
  help => "--ssl\n   Use SSL when connecting. (default: %s)",
  default => 0,
);

$np->add_arg(
  spec => 'cafile=s',
  help => "--cafile\n   CA to verify against when using SSL. (default: %s)",
  default => "/etc/ssl/certs/ca-certificates.crt",
);

$np->getopts;

print Dumper $np;
