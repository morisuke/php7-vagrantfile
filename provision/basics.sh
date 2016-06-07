#!/bin/bash

: "Basics" && {

	yum install -y mlocate tree wget httpd nkf
	chkconfig httpd on
	service httpd start
	updatedb

	: "npm" && {
		yum -y install epel-release
		yum -y install nodejs npm --enablerepo=epel
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
