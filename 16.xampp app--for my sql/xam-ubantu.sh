apt-get remove apache2
sudo apt autoremove
sudo apt remove apache2.*


chmod +x xampp-linux-x64-8.1.6-0-installer.run
./xampp-linux-x64-8.1.6-0-installer.run
# sudo apt install build-essential 
sudo chmod 777 /opt/lampp/htdocs
sudo apt install net-tools -y
/etc/init.d/mysql stop
/opt/lampp/lampp stop
/opt/lampp/lampp start
/opt/lampp/lampp restart
vim /opt/lampp/etc/extra/httpd-xampp.conf
paste:

<Directory "/opt/lampp/phpmyadmin">
    AllowOverride AuthConfig Limit
    Require all granted
    ErrorDocument 403 /error/XAMPP_FORBIDDEN.html.var
</Directory>

or basicall changr require local -> Require all granted

  /opt/lampp/lampp restart

accss sql using cli :
/opt/lampp/bin/mysql -h localhost -u root -p
// default password is nothing just press enter
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

sudo apt-get install -y nodejs
node --version && npm --version
sudo npm install pm2 -g

pkill nodejs
if port in use
sudo fuser -k port_no/tcp

pm2 stop static-page-server-3002
pm2 serve /home/sachin/OpendataBase 3002


//npm install -g http-server   (to host static html website)
http-server -p 8000



How to host static site using pm2
pm2 is a process manager for node.js applications. You can use pm2 to host static websites.

To host a static website, create a folder, put your files inside.

mkdir /home/website
1
mkdir /home/website
Let’s create a static file, say index.html

echo "Welcome" > /home/website/index.html
1
echo "Welcome" > /home/website/index.html
Now you can make the site live using the following pm2 command

pm2 serve /home/website 8082
1
pm2 serve /home/website 8082
Now the static site will be available at

http://localhost:8082
1
http://localhost:8082
If you have a Single Page Application (SPA) like Angular, React, you can use the option –spa with pm2 command so all non-existent pages get routed to index.html internally.

pm2 serve --spa
1
pm2 serve --spa