a=(apache2 libapache2-mod-php5 curl mysql-server php5-mysql phpmyadmin php5-mcrypt)

# libapache2-mod-auth-mysql no more needed

sudo apt-get install ${a[*]} --fix-missing

sudo php5enmod mcrypt

sudo find /etc/php5/ap*/php.ini -type f -exec sed -i 's/display_errors = Off/display_errors = On/g' {} \;

sudo find /etc/php5/cl*/php.ini -type f -exec sed -i 's/display_errors = Off/display_errors = On/g' {} \;

sudo find /etc/php5/cl*/php.ini -type f -exec sed -i 's/\;date.timezone =/date.timezone = Asia\/Kolkata/g' {} \;

sudo find /etc/php5/ap*/php.ini -type f -exec sed -i 's/\;date.timezone =/date.timezone = Asia\/Kolkata/g' {} \;

sudo find /etc/apache2/apache2.conf -type f -exec sed -i 's/AllowOverride None/AllowOverride All/g' {} \;

sudo find /etc/apache2/apache2.conf -type f -exec sed -i 's/<Directory \/var\/www\/>/<Directory \/home\/garvitdelhi\/dev\/php\/www\/>/g' {} \;

sudo find /etc/apache2/sites-available/000-default.conf -type f -exec sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/home\/garvitdelhi\/dev\/php\/www\/html/g' {} \;

sudo service apache2 restart
