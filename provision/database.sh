#!/bin/bash

: "MariaDB" && {

	: "install" && {
		cat <<-EOS > /etc/yum.repos.d/mariadb.repo
		[mariadb]
		name = MariaDB
		baseurl = http://yum.mariadb.org/10.1/centos6-amd64
		gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
		gpgcheck=1
		enabled=1
		EOS

		yum -y install MariaDB-client MariaDB-server
		chkconfig mysql on
	}

	: "configure" && {
		mv /etc/my.cnf.d/server.cnf /etc/my.cnf.d/server.cnf.bak

		cat <<-EOS > /etc/my.cnf.d/server.cnf
		[server]

		[mysqld]
		character-set-server = utf8
		plugin-load = handlersocket.so

		symbolic-links=0
		max_allowed_packet=500M
		innodb_buffer_pool_size=100M
		innodb_additional_mem_pool_size=100M
		query_cache_size =100M

		innodb_file_per_table
		innodb_file_format = Barracuda
		innodb_file_format_max = Barracuda

		[galera]

		[embedded]

		[mariadb]

		[mariadb-10.1]
		EOS
	}

	: "initialize" && {
		/etc/init.d/mysql start
		/usr/bin/mysqladmin -u root password 'passwordx'
		mysql -u root -ppasswordx -e "create database itto;"
	}
}
