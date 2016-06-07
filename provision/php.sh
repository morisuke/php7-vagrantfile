#!/bin/bash

: "PHP7" && {
	rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
	yum --enablerepo=remi,remi-php70 install -y php php-devel php-mbstring php-zip php-bcmath php-pcntl php-ftp php-exif php-intl php-calendar php-sysvmsg php-sysvsem php-sysvshm php-wddx php-curl php-mcrypt php-iconv php-gmp php-pspell php-gd php-gd-native-ttf php-gd-jis-conv php-openssl php-pdo-mysql php-gettext php-zlib php-bz2 php-mysqli php-apxs2

	: "composer" && {
		curl -sS https://getcomposer.org/installer | php
		php composer.phar config -g repositories.packagist composer https://packagist.jp
		php composer.phar global require hirak/prestissimo
		mv composer.phar /usr/local/bin/composer
	}
}
