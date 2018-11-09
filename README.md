# nagios-plugin-check\_amqp1.0

Nagios NRPE and "regular" check for checking the AMQP 1.0 connection to a
message queue/broker/server (like RabbitMQs check aliveness does). It supports
SSL/TLS connections as well.

## Installation

Depending on your distro and usecase you might need to install any or all of
these:
* `libsasl2-dev`
* `libssl-dev`
* `pkg-config`
* `python-dev`
* `python-pip`
* `swig`

```sh
$ pip install .
```
