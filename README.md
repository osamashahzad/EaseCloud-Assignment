# Project Structure
- The project contains a sample nodejs application that prints "Hello Node!"
- It contains a Dockerfile for containerizing the application and the necessary Terraform configuration required for the deployment of infrastructure.
- The Terraform directory contains two folders, one has all of the terraform config files the other folder contains required variables that have been used.


## Follow the following steps in order to deploy the complete infrastructure.

- First import your aws profile in the terminal.
- Now create the docker image using the command **docker build -t < image-name > .** and push the docker image to your ecr repository.

- Then in the **terraform-task/tf** directory run the command **terraform init**. Then run **terraform plan -var-file ../envs/prod.tfvars**
- In the **ecs.tf** file which is present in the directory mentioned in the above point, change the url of your ecr repository.
- After changing it run the command **terraform apply -var-file ../envs/prod.tfvars**
- When your infrastructure is completely deployed, verify the application by hitting the load balancer url.
- In order to test your application using postman, enter the url of your load balancer and select the GET method. In the responses if it returns the **200 OK response** in status then your application is working fine as in the my case.
- If you want to completely erase the whole infrastructure, then run the command **terraform destroy -var-file ../envs/prod.tfvars**. This command will take a few moments and will delete the complete infrastructure that we just deployed.

#### For reference I have also added a picture of the API response using Postman and also the API output.