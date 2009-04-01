# defined types
# pretty cool

class people {
	define create() {
		$homedir = "/home/$name"
		$sshkey = "$homedir/.ssh/id_rsa"

		user {"$name":
			ensure => present,
			gid => users,
		}

		file {"$homedir":
			ensure => directory,
			owner => $name,
			group => users,
			source => "file:///etc/skel",
			recurse => true,
			require => User["$name"],
		}

		exec { "genkey $name":
			command => "/usr/bin/ssh-keygen -f $sshkey -P \"\"",
			creates => $sshkey,
			user => $name,
			require => File["$homedir"],
		}
	}

	define delete($purge=false) {
		$homedir = "/home/$name"
	
		user {"$name":
			ensure => absent,
			gid => users,
		}

		file {"$homedir":
			ensure => absent,
			purge => $purge,
			force => $purge,
			recurse => true,
		}
	}
}
