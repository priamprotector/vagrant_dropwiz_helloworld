#!/usr/bin/env bash
#-------------------------------------------------------------------------------
# Boostrap for my centos box.
# 
# Ideally, this script will be lean and mean and all the configuration stuff
# would live inside ansible (or something similar).
#-------------------------------------------------------------------------------

# Go ahead and get the EPEL since that contains a ton of useful packages
sudo yum --assumeyes install epel-release
sudo yum --assumeyes update
sudo yum --assumeyes install maven
sudo yum --assumeyes install java-1.8.0-openjdk-devel

echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk" >> /etc/environment

echo "========================================================================="
echo "   Copy, build, and start the application."
echo "========================================================================="

su - vagrant -c 'cp -R /vagrant/hello-world/ . ; cd hello-world ; mvn clean install' 
su - vagrant -c "java -jar hello-world/target/hello-world-1.0-SNAPSHOT.jar server hello-world/config.yml >& app.log &"

echo "========================================================================="
echo "   Bootstrap script complete!"
echo "========================================================================="

