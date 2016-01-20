#!/usr/bin/env perl
use strict;
use warnings;
use Nagios::Plugin;
use Data::Dumper;
use Net::Domain qw(hostfqdn);
use qpid_proton;

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

# FIXME Test if we need to check for cafile or if Proton gives a good enough message if it's missing.

my $default_port;
for my $opt (@{$np->opts->{_args}}) {
  $default_port = $opt->{default} if $opt->{name} eq "port";
}

# Change the port if not set and we're using SSL
if ($np->opts->get('ssl') && $np->opts->get('port') eq $default_port) {
  warn "Silently changing to SSL port since SSL is requested but the default SSL port number isn't used.\n" if $np->opts->{verbose};
  $np->opts->{port} = 5671;
}

# Build the adress
my $fqdn = hostfqdn();
my $protocol = "amqp".($np->opts->get('ssl') ? "s" : "");

my $address = "$protocol://".$np->opts->get('username').":".$np->opts->get('password').'@'.$np->opts->get('hostname').":".$np->opts->get('port')."/nagios-test-queue-$fqdn";

my $messenger = new qpid::proton::Messenger();
$messenger->set_incoming_window(1);
my $msg  = new qpid::proton::Message();
