#!/bin/bash
echo $1;
drush sql-query  "insert into variable (name, value) values ('islandora_base_url', 's:32:\"http://192.168.33.53:8080/fedora\";');" -r $1;
exit 0;
