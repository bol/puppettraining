
class inetd::discard inherits inetd {
	inetdservice { 'discard':
		proto => udp,
		sock_type => dgram,
		flags => wait,
	}
}



