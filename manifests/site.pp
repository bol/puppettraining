node default {
	notice => "Node $name has no node configuration."
}

node "puppetclient2.reductivelabs.com" {
	include ssh
}
