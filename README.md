# Jenkins-server-with-packer

Pre-requisites:
- IAM user with AmazonEC2FullAccess role.
- [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed on your local machine (preferaly, version awscli v2
- aws cli configured with IAM user.
- [packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli) installed on your local machine.

N\B: I used us-west-2 as my region. Feel free to change it to what suits you.

Step 1: Clone this repository
```
git clone https://github.com/Wach-E/jenkins-server-with-packer.git
```

Step 2: Build Jenkins server backed image with packer
```
packer build template.json
```

Step 3: Create an EC2 instance with the custom ami and upload the `start-jenkins.sh` script as a user data
N\B: port 8080 must be opened on your security group for access to Jenkins

Step 4: Navigate to `http:server_ip:8080` to access your Jenkins server

## TODO:
- Add a branch with the latest syntax for Packer with HCL. [This article should help](https://devopscube.com/packer-tutorial-for-beginners/)
