class ptm {

    file { '/etc/ptm.d/topology.dot':
        owner   => root,
        group   => root,
        mode    => '0644',
        source => 'puppet:///modules/ptm/topology.dot',
    }

    service { 'ptmd':
        subscribe   => File['/etc/ptm.d/topology.dot'],
        enable  => true,
        ensure => running,
    }

}
