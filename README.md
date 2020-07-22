# IP Reflector Service in AWS
1. With ```packer build .\main.json```, an AMI image is created into your AWS account with all the dependencies to be able to run the Flask application using Packer.io (main.json) & Ansible (playbook.yml).
2. Finally, using ```terraform apply```, an EC2 intance is deployed with its security groups (security.tf) using the previously created AMI image and the Flask application is started which retrieves the remote client address when connecting to that instance (main.tf).
3. Connect to your AWS EC2 instance and you will get your IP address.

