class snmp {

    file { '/etc/snmp/snmpd.conf':
        owner   => root,
        group   => root,
        mode    => '0644',
        source => 'puppet:///modules/snmp/snmpd.conf',
        notify => Service['snmpd'],
    }

    service { 'snmpd':
        enable  => true,
        ensure => running,
    }

}

