class syslog {

    $device_info = hiera('devices')[$hostname]
    $syslog_servers = hiera('syslog_servers')

    file { '/etc/rsyslog.d/90-remotesyslog.conf':
        owner   => root,
        group   => root,
        mode    => '0644',
        content => template('syslog/90-remotesyslog.conf.erb'),
    }

    service { 'rsyslog':
        subscribe   => File['/etc/rsyslog.d/90-remotesyslog.conf'],
        enable  => true,
        ensure => running,
    }

}
