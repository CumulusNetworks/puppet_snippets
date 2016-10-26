class ntp {

    $device_info = hiera('devices')[$hostname]
    $ntp_servers = hiera('ntp_servers')

    file { '/etc/ntp.conf':
        owner   => root,
        group   => root,
        mode    => '0644',
        content => template('ntp/ntp.conf.erb'),
    }

    service { 'ntp':
        subscribe   => File['/etc/ntp.conf'],
        enable  => true,
        ensure => running,
    }

    file { '/etc/timezone':
        owner   => root,
        group   => root,
        mode    => '0644',
        source => 'puppet:///modules/ntp/timezone',
    }

    exec { '/usr/sbin/dpkg-reconfigure --frontend noninteractive tzdata':
        subscribe   => File['/etc/timezone'],
        refreshonly => true
    }

}
