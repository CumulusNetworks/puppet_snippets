class motd {

    file { '/etc/motd':
        owner   => root,
        group   => root,
        mode    => '0644',
        source => 'puppet:///modules/motd/motd',
    }
}
