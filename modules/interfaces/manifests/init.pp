class interfaces {

    $device_info = hiera('devices')[$hostname]
    $vlans = hiera('vlans')
    $vlan_descriptions = hiera('vlan_descriptions')
    $locations = hiera('locations')
    file { '/etc/network/interfaces':
        owner   => root,
        group   => root,
        mode    => '0644',
        content => template('interfaces/interfaces.erb'),
    }

    exec { '/sbin/ifreload -a':
        subscribe   => File['/etc/network/interfaces'],
        refreshonly => true
    }
}
