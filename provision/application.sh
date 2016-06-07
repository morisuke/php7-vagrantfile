#!/bin/bash

: "Application" && {

	: "clone" && {
	}

	: "install" && {
	}

	: "vhosts" && {
		cat <<-HOSTS >> /etc/httpd/conf.d/vhosts.default.conf
		HOSTS

		service httpd restart
	}
}
