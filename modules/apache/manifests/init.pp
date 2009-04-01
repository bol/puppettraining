class apache {
	package { 'apache2':
		ensure => installed,
	}

	user {'apache':
		ensure => present,
		gid => Apache,
		shell => '/sbin/nologin',
	}
}
