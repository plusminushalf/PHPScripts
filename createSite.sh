if [[ $EUID -ne 0 ]]; then
 echo "This script must be run as root" 1>&2
 exit 1
fi

cd /etc/apache2/si*
echo 'Enter site name: ';
read name;
name=$name'.conf';
echo 'Enter path to site(relative to /home/garvitdelhi/dev/php/www/): ';
read path;
echo 'Enter ServerName: ';
read serverName

path='/home/garvitdelhi/dev/php/www/'$path;

echo 'creating file '$name;
sudo printf '<VirtualHost *:80>\nServerName %s \nServerAdmin webmaster@localhost\nDocumentRoot %s\nErrorLog ${APACHE_LOG_DIR}/error.log\nCustomLog ${APACHE_LOG_DIR}/access.log combined\n</VirtualHost>\n' "$serverName" "$path" > $name;
echo 'Adding '$serverName' to hosts';
sudo printf '\n127.0.0.1	%s' "$serverName" >> /etc/hosts;
cd /etc/apache2/si*
echo 'Enabling site';
sudo a2ensite $name
echo 'Restarting apache2 server';
sudo service apache2 restart