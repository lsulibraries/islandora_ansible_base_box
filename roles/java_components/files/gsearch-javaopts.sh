#!/bin/bash

sed -i 's#JAVA_OPTS="-Djava.awt.headless=true -Xmx128m -XX:+UseConcMarkSweepGC"#JAVA_OPTS="-Djava.awt.headless=true -Xmx1024m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC -Dkakadu.home=/usr/local/djatoka/bin/Linux-x86-64 -Djava.library.path=/usr/local/djatoka/lib/Linux-x86-64 -DLD_LIBRARY_PATH=/usr/local/djatoka/lib/Linux-x86-64"#g' /etc/default/tomcat7
