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