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

UPDATED 5/28/24: I think I am wrapping up the first stage by having the base code completed. The second stage in this project will be getting the details nailed down as far as VMs and network settings. The changes I made this time was getting ChatGPT to help me understand how to deploy to multiple instances of the same type of resource. This was applied to VMs, VNets, subnets, and VM Nics. It required making declarations in tfvars for each resource and in the main.tf using foreach and each to interate, or count, through the variables for each resource. Just commiting these changes for now and will revisit it later. 

## Second Stage
In this stage I worked through the different files, the main, variables, and tfvars, to understand what each of the did. This included learning more about the for_each and each functions to allow me to deploy multiple instances of the same resource. 

UPDATED 5/29/24: Entered the required information to create the resources. This ranged from the VM names, SKUs, and other pertinent information, along with information for the NICs, etc.. Ran Terraform FMT to help format what I have written. 