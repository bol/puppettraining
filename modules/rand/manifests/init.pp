class rand {

	file { '/tmp/en.fil':
		content => rand(100)
	}
}
