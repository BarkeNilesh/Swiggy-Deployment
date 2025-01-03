# Swiggy-Deployment
Deployment of Swiggy App on AWS EC2 Instance with the help of Docker Containerization 


=============================================================================================================

# Terraform
Creating AWS EC2 Instance using Terraform.

1. In Provider Block
--> Take AWS as a provider in a block.
--> Mention region in which u have to create instance
--> provide access and secret key of IAM user which has admin access

2. In Instance Block
--> Provide which instance we have to create
--> with AMI ID, istance type, tags, other infomation

3. Create ssh-key 
--> create ssh-key (terraform-key)
    ssh-keygen -t rsa (should be in current working directory "./id_rsa")
    file("${path.module}/file-name")
--> assign this key (terraform-key) to instance.

4. Create Security group
--> create a security group
--> assign security group to instance

5. Give Resource info if needed.
--> Refer to resource.shs
--> refer to user_data in main.tf

6. create 1 variable.tf file 
--> add all the variable in this file soo it will make code more structured way.
--> we can again create "terraform.tfvars" file where we can only store variable 

7. Security
--> For security purpose we can add "access key" & "Secret key" as environment (env) variable 

In Terraform Root Directory

1. terraform init --> This command helps in Backend Initialization, Plugins installation, child module installation.
2. terraform plan --> This command is used to review all the configuration files.
3. terraform fmt --> This command helps to improve identation eroror.
4. terraform validate --> This command is used to validate code, catch syntax error 
5. terraform apply --> This command helps to create real world infrastructure.
6. terraform destroy --> This command helps to destroy all the infra which we have created with terraform.

=============================================================================================================

Configure Jenkins

1. Complete Jenkins Setup (set up username and Password)
2. Install required plugins
    eg: Docker, NodeJS, jenkins pipeline, sonar-scanner, OWASP
3. configuration of required tools
    eg: jdk, git, Sonar Scanner, nodejs


Configure SonarQube 
1. Complete SonarQube setup (set up username and Password)
2. Integrate SonarQube and Jenkins with the help of token
    Sonarqube--> Administration--> Security--> users--> select user/new user (Token section)-->
    --> give name and expiration days limit --> generate --> copy
    Jenkins--> Manage Jenkins --> security --> credentials --> global --> Add credentials-->
    --> give kind (as per req) --> secret ( paste token) --> Give id and describtion (Same as mention in Jenkins file).

3. To create a SonarQube Webhook
    Sonarqube--> Administration--> Configuration--> Webhooks --> create --> 
    --> Name(jenkins) --> URL(jenkins-url) --> Secret()

4. Attached webhook to jenkins
    Jenkins--> Manage Jenkins--> System --> SonarQube servers--> Add Sonarqube --> 
    --> Name --> Server URL (Sonarqube URL) --> Server authentication token (select token)

5. Add Docker credentials to Jenkins
    Jenkins--> Manage Jenkins--> Security--> credentials--> global --> Add credentials
    --> Kind: Username & Password --> Give id and describtion (Same as mention in Jenkins file).
=============================================================================================================