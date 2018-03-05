# lychee
 For more information about the software see https://lychee.electerious.com/

 # Requirements
    Docker container infrastructure
    access to Mysql or mariaDB database

  # Usage
 docker run  -d \
 -p 80:80 \
 -v lychee-data:/var/www/html/data \
 -v lychee-uploads:/var/www/html/uploads \
 --name your_desired_name_here

 Please note, that you'll need to have the database login handy, as the first time you login to the website, it will ask to be pointed to the correct database.


   #Gotchas
   The php.ini file uses a memory_limit of 512M.  Make sure you adjust your memory/php.ini file appropriately to avoid OOM errors.
