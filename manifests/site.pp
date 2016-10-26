
# Set default provider on CL 3+ as systemd
if $::os['name'] == 'CumulusLinux' and $::os['release']['major']>='3' {
  Service {
    provider => 'systemd',
  }
}

# Any node that doesn't fit into another category will use the default node
# instead.
node default {
    include hostname
    include motd
    include dns
    include ntp
    include syslog
    include snmp
    include packages
    include interfaces
    include ptm
}

