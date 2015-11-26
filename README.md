# nagios-plugin-check\_amqp1.0

Nagios NRPE and "regular" check for checking the AMQP 1.0 connection to a
message queue/broker/server (like RabbitMQs check aliveness does). It supports
SSL/TLS connections as well.

## Dependencies

| CPAN module      | Debian/Ubuntu package   |
|------------------|-------------------------|
| `Nagios::Plugin` | `libnagios-plugin-perl` |
| `qpid::proton`   | `-`                     |

QPid Proton must be [installed from source](https://git-wip-us.apache.org/repos/asf?p=qpid-proton.git;a=blob_plain;f=INSTALL.md), sadly.
