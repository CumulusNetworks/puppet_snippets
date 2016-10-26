class dns {

    $device_info = hiera('devices')[$hostname]
    $domain = hiera('domain')
    $dns_servers = hiera('dns_servers')

    file { '/etc/resolv.conf':
        owner   => root,
        group   => root,
        mode    => '0644',
        content => template('dns/resolv.conf.erb'),
    }

}
