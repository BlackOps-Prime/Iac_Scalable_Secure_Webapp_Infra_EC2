# Scalable and Secure Web Application Architecture & Infrastructure

# Project Synopsis
This project is designed to create a an AWS environment that will host a new web application with an auto-scaling EC2 setup
behind a load balancer, and an RDS instance, ensuring secure communication
between them.

The architecture is designed with resiliency in mind. It makes use of Multi-AZs for redundancy autoscalling for scaling and loadbalancing for load management.

The project makes heavy use of modules and has been dynamically designed to make it easy to replicate across environments.

This project also makes use of Terraform workspaces to simplify the creation of multiple environments. Some key modules of this project are listed below:

```bash
Virtual Private Cloud [VPC]
Security Groups
Relational Database Service [RDS]
LoadBalancing
Identity & Access Management
Elastic Compute Cloud [EC2]
Route 53 [DNS]
Autoscalling
```
-------------------------------------------------------
<!-- # How to run
Open your terminal at the root of the project and initialize terraform:
```bash
terraform init
``` -->

## Communication And Architecture
The setup is made out of three layers. The database layer, application or business logic layer and the public layer which serves the nat gateway, load balancers and the bastian host.

To ensure secure commnuication between layers, security groups are used to define traffic rules. For instance, the Database subnets only allow traffic from the application subnet's security group and the bastian host to ensure only the appropriate entities can connect to perform operations.

------------------------------------------

## Terraform Permisions
To successfully run this project, your profile should have enough permissions to perform CRUD operations to the services listed above.

## Workspaces & Environemts
Workspaces help to manage environments like `production`, `staging`, `test` and `DR` without making too many changes to the code base.

After terraform initializes, the default workspace is created. To run a test, create and swtich to a development workspace. Run:
```bash
terraform workspace new development
terraform workspace select development
```


## Variables and TFVars
A sample `development.tfvars` file has been provided for you to begin. It contains values to all variables defined in the `main.tf` file.

## How To Run
---------------------------------
The steps listed here indicate how to run a test for a development environment.

To run for other environments, kindly add it's entry in the `var_vpc_cidr_block_prefixes` variable block and define it's IP CIDR in the `locals` section of the variables.tf of the main module.

Update the `global_var_aws_profile` variable with the profile name you've setup for your AWS account.


It is important to note that you need to switch to the workspace named after the environment as the code uses the `terraform.workspace` variable across a number of modules.

From the root module, run:
* ```bash
    terraform init   # To initialize the terraform project

    terraform workspace new development   # Create a workspace for development environment

    terraform workspace select development   # Switch to development workspsace

    terraform plan -var-file=development.tfvars  # Generate a plan for your infrastructure

    terraform apply -var-file=development.tfvars -auto-approve   #Apply plan and auto approve apply action.
    ```

*NOTE:*  If you encounter an error regarding duplicate security group rules, you will need to identify and manually remove the offending/missing security group rules from the Security Group, and re-plan and apply with Terraform. This is an issue identified by terraform and will likely be included in an upcoming fix. Please track issue [here](https://github.com/hashicorp/terraform/pull/2376)


## Clean Up
To cleanup after running tests, run:
```bash
terraform destroy -var-file=development.tfvars -auto-approve
```

# Modules
## VPC
Serves as the base networking for the infrastructure. It creates the main network, subnetworks, routes, gateways and other relevant items in the network.

## Security
The security module is all about network policies that determine the flow of traffic to and from intances and the network

## RDS
This is just a simple module to create a Multi-AZ RDS cluster for the application with other related settings.

## LoadBalancing
This module creates load balancers and target groups.
A simple note here: The target groups attachment have been commented out because I believe it is rather best to let the deployment method control the target group attachment. However, you can tweak it to your liking.

## Roles & IAM
The IAM module grants Session manager access to the instances for session management as well as S3 and ECR for operational activities [That is, assuming the web application runs in docker and stores files in s3 to avoid data loss from ephemeral docker storage].

## EC2
The EC2 module creates servers that would run the application and well as bastian and eventually proxies.

## DNS
The DNS creates a hosted zone in route 53 and maps the zone to the application load balancer which eventually distributes the traffic to the application servers.

## Autoscalling
This module creates an autoscalling group and ensures that the service scales when the traffic is high and vice versa.