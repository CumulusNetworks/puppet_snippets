class hostname {

    $domain = hiera('domain')

    file { '/etc/hostname':
        owner   => root,
        group   => root,
        mode    => '0644',
        content => template('hostname/hostname.erb'),
    }

    file { '/etc/hosts':
        owner   => root,
        group   => root,
        mode    => '0644',
        content => template('hostname/hosts.erb'),
    }

}
