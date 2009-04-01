class mysql {
	package { 'mysql-client':
		ensure => installed,
	}

	service { 'mysql':
		ensure => stopped,
		enable => false,
		hasstatus => true,
		hasrestart => true,
	}
}

class mysql::server inherits mysql {
	package { 'mysql-server':
		ensure => installed,
	}

	Service['mysql'] {
		ensure => running,
		enable => true,
		require => Package['mysql-server'],
	 }
}
