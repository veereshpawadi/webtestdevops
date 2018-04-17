http_installed=`sudo rpm -qa|grep http|wc -l`
if [ $http_installed -eq 0 ]
then
   sudo yum install -y httpd
fi
git_installed=`sudo rpm -qa|grep git-|wc -l`
if [ $git_installed -eq 0 ]
then
   sudo yum install -y git
fi
sudo rm -rf /var/www/html/* /var/www/html/.[a-z]*
sudo git clone https://github.com/veereshpawadi/webtestdevops.git /var/www/html
systemctl status httpd
if [ $? -ne 0 ]
then
	systemctl restart httpd
fi
