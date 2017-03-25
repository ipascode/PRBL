# README

This README is for the PRBL Maintenance Application developed by Bandwidth. 

* Rails version 5.0.1

* Ruby version 2.2.5

* System dependencies

* Configuration

* On Server Timezones:

for Windows
download timezone_2017a_posix_sql.zip (under 5.7+ since this uses InnoDB) from https://dev.mysql.com/downloads/timezones.html

Unzip the file and add it to bitnami>rubystack2.2.6>mysql>data>mysql

In your bitnami rubystack environment, go to C:/Bitnami/rubystack2.2.6/mysql/data/mysql and run the following command:
mysql -u root -p mysql < timezone_posix.mysql
input your password

restart your server

for Mac/Linux
In your bitnami rubystack environment, run the following command: 
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root -p mysql

* Requirements
ImageMagick must be installed and Paperclip must have access to it.

For wicked_pdf gem:
Download https://wkhtmltopdf.org/downloads.html

* Database creation

	maintainapp_development
	maintainapp_test
	maintainapp_production

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


