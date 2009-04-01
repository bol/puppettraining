include people

$userlist = [ dopey, grumpey, doc, happy, bashful, sneezy, sleepy  ]

people::delete{ $userlist:
	purge => true,
}
