class inetd {
	$inetdconfdir = "/etc/inet.d"
	$inetdconf= "/etc/inetd.conf"

	package { 'inetd':
		name => 'inetutils-inetd',
		ensure => installed,
	}

	file { "$inetdconfdir":
		path => "$inetdconfdir",
		ensure => directory,
		recurse => true,
		purge => true,
		notify => Exec['rebuildinetd'],
		before => Exec['rebuildinetd'],
	}

	service { 'inetd':
		name => 'inetutils-inetd',
		ensure => running,
		enable => true,
	}

	exec { 'rebuildinetd':
		command => "/bin/cat  $inetdconfdir/* > $inetdconf",
		user => root,
		group => root,
		refreshonly => true,
		notify => Service['inetd'],
	}
	define inetdservice( $sock_type=stream, $proto=tcp, $flags=wait, $user=root, $path=internal, $args="") {
		file { "$inetdconfdir/$name":
			content => "$name\t\t$sock_type\t$proto\t$flags\t$user\t$path\t$args\n",
			notify => Exec['rebuildinetd'],
			before => Exec['rebuildinetd'],
		}
	}
}
