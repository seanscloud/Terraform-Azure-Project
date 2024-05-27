# Terraform-Azure-Project
This is a beginner project to practice deployment to Azure using Terraform in VS Code. 

## First Stage
In this stage I used ChatGPT to help plan a beginner project. This project will contain two VNets, multiple VMs, and possibly a couple of other resources including an app gateway and load balancer. The initial git push included me beginning the setup in my Terraform file. This included the main.tf and .gitignore. 

UPDATED: I added the following directories and tf files:
            Modules:
                VM directory: main.tf and variables.tf
                VNET directory: main.tf and variables.tf
            ROOT directory: outputs.tf, variables.tf, and terraform.tfvars
        I added the code suggested by ChatGPT to facilitate this project and now I will be going through each addition getting an explanation of the purpose and use. 

UPDATED 5/27/24: I decided to dial it back a bit and remove the modules. That seemed a little more advanced than I was ready to get into. I will be using only variables for now until I get an understanding of them. 