class packages {

    file { '/etc/apt/sources.list.d/debian.list':
        owner   => root,
        group   => root,
        mode    => '0644',
        source => 'puppet:///modules/packages/debian.list',
    }

    exec { '/usr/bin/apt-get update -y':
        subscribe   => File['/etc/apt/sources.list.d/debian.list'],
        refreshonly => true
    }

    # you can specify the packages in an array ...
    $extras = [ 'nmap', 'htop' ]
    package { $extras: ensure => 'installed' }

}

