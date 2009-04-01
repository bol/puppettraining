class sshd {
	package { 'openssh-server':
		ensure => present;
	}

	file { 'sshd_config':
		name => '/etc/ssh/sshd_config',
		owner => root,
		group => root,
		mode => 640,
		source => 'file:///home/bol/puppet/files/sshd_config',
		require => Package['openssh-server'],
	}

	service { 'ssh':
		ensure => running,
		hasstatus => false,
		hasrestart => true,
		binary => '/usr/sbin/sshd',
		subscribe => File['sshd_config'],
		require => Package['openssh-server'],
	}
}
