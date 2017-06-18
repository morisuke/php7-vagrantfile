#!/bin/bash

: "Basics" && {

	yum install -y mlocate tree wget httpd nkf
	chkconfig httpd on
	service httpd start
	updatedb

	: "npm" && {
		curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
		yum -y install nodejs npm
	}

	: "bashrc" && {
		cat <<-BASH >> ~/.bashrc
		BASH

		source ~/.bashrc
	}

	: "inputrc" && {
		cat <<-INPUTS >> ~/.inputrc
		set completion-ignore-case on
		INPUTS
	}

	: "hosts" && {
		cat <<-HOSTS >> /etc/hosts
		HOSTS
	}
}
