#!/bin/bash

# Setup docker
sudo yum update -y && sudo yum install -y docker
sudo systemctl start docker 
sudo usermod -aG docker ec2-user
sudo systemctl enable docker
# Give the jenkins user permission on docker by changing its permission
sudo chmod 666 /var/run/docker.sock 

# pull jenkins container and attach volumes
docker run -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker --name jenkins-server jenkins/jenkins:2.319.3

# sudo yum update -y
# yum remove -y java
# # sudo yum install java-1.8.0-openjdk -y
# sudo yum install openjdk-8-jre -y
# sudo amazon-linux-extras install epel -y
# sudo yum update -y
# sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
# sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
# yum install -y jenkins
# sudo tee /etc/init.d/jenkins<<EOF
# PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/lib/jvm/java-8-openjdk-amd64/bin/
# EOF
# chkconfig jenkins on
# sudo systemctl start jenkins 


# sudo yum update -y
# sudo yum install -y default-jdk
# wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
# sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
# sudo yum update -y
# sudo yum install -y jenkins

# sudo su -
# systemctl start jenkins

# sudo yum -y update
# sudo systemctl reboot
# sudo amazon-linux-extras install java-openjdk11
# java --version
# sudo tee /etc/yum.repos.d/jenkins.repo<<EOF
# [jenkins]
# name=Jenkins
# baseurl=http://pkg.jenkins.io/redhat
# gpgcheck=0
# EOF
# sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
# sudo yum install jenkins
# chkconfig jenkins on
# sudo systemctl start jenkins