
# EC2 Instance Provisioning using Terraform

## Step 1: Create a Directory for Your Terraform Project
Create a folder for your Terraform configuration, and inside it, create the file `main.tf` which will hold the configuration.

Example:
```bash
mkdir terraform-project
cd terraform-project
touch main.tf
```

## Step 2: Write the Terraform Configuration
In your `main.tf` file, write the following configuration:
```hcl
provider "aws" {
  region = "ap-south-1"  # Use your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-002f6e91abff6eb96"  # Replace with actual AMI ID
  instance_type = "t2.micro"
}
```

## Step 3: Initialize Terraform
Run the following command to initialize your Terraform configuration. This will set up the working directory and download required provider plugins.
```bash
terraform init
```
![Terraform Init](WhatsApp%20Image%202025-04-15%20at%2012.58.09%20PM.jpeg)

## Step 4: Create an Execution Plan
Run the command below to preview the execution plan.
```bash
terraform plan
```
![Terraform Plan](WhatsApp%20Image%202025-04-15%20at%2012.58.09%20PM%20(1).jpeg)

## Step 5: Apply the Configuration
To apply the configuration and provision the resources, run:
```bash
terraform apply
```
Terraform will ask for confirmation. Type `yes` to proceed.
![Terraform Apply](WhatsApp%20Image%202025-04-15%20at%2012.58.09%20PM%20(2).jpeg)

## Step 6: Verify the EC2 Instance
Verify that the EC2 instance has been created.
```bash
aws ec2 describe-instances
```
![Verify Instance](WhatsApp%20Image%202025-04-15%20at%2012.58.09%20PM%20(3).jpeg)

## Step 7: Destroy the Resources
Once you're done, you can destroy the EC2 instance and clean up by running:
```bash
terraform destroy
```
![Terraform Destroy](WhatsApp%20Image%202025-04-15%20at%2012.58.09%20PM%20(4).jpeg)
