
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

@shivam-tayade ->/workspaces/Terraform-practice/terraform-project (main) $ terraform init  
- Finding latest version of hashicorp/aws...  
- Installing hashicorp/aws v5.94.1.  
- Installed hashicorp/aws v5.94.1 (signed by HashiCorp)  
Terraform has created a lock file .terraform.lock.hcl to record the provider selections it made above. Include this file in your version control...
```

## Step 4: Create an Execution Plan
Run the command below to preview the execution plan.
```bash
terraform plan

@shivam-tayade ->/workspaces/Terraform-practice/terraform-project (main) $ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:  
+ create

Terraform will perform the following actions:

# aws_instance.example will be created
```

## Step 5: Apply the Configuration
To apply the configuration and provision the resources, run:
```bash
terraform apply

Plan: 1 to add, 0 to change, 0 to destroy.  
Do you want to perform these actions?  
Terraform will perform the actions described above.  
Only ‘yes’ will be accepted to approve.

Enter a value: yes  
aws_instance.example:

aws_instance.example:  
aws_instance.example:

Creating.  
Still creating... [10s elapsed]  
Creation complete after 12s [id=i-e54bc769bSe99dc1a]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.  
@shivam-tayade ->/workspaces/Terraform-practice/terraform-project (main) $
```

## Step 6: Verify the EC2 Instance
Verify that the EC2 instance has been created.
```bash
aws ec2 describe-instances

@shivam-tayade ->/workspaces/Terraform-practice/terraform-project (main) $ aws ec2 describe-instances  
{
  "Reservations": [
    {
      "ReservationId": "r-03893a36478ce15d4",
      "OwnerId": "211125762338",
      "Groups": [],
      "Instances": [
        {
          "Architecture": "x86_64",
          "BlockDeviceMappings": [
            {
              "DeviceName": "/dev/xvda",
              "Ebs": {
                "AttachTime": "2025-04-07T16:50:14+00:00",
                "DeleteOnTermination": true,
                "Status": "attached",
                "VolumeId": "vol-02056d5eab981e84"
              }
            }
          ],
          "ClientToken": "13adae85-01dc-4e12-9880-7e43167b2205",
          "EbsOptimized": false,
          "EnaSupport": true,
          "Hypervisor": "xen",
          "NetworkInterfaces": [
            {
              "Attachment": {
                "AttachTime": "2025-04-07T16:50:13+00:00",
                "AttachmentId": "eni-attach-03ed4230a77fdcd9b",
                "DeleteOnTermination": true,
                "DeviceIndex": 0,
                "Status": "attached",
                "NetworkCardIndex": 0
              }
            }
          ]
        }
      ]
    }
  ]
}
```

## Step 7: Destroy the Resources
Once you're done, you can destroy the EC2 instance and clean up by running:
```bash
terraform destroy

Do you really want to destroy all resources?  
Terraform will destroy all your managed infrastructure, as shown.  
There is no undo. Only ‘yes’ will be accepted to confirm.  

Destroying... [id-i-e54bc769b5e99dc1a]  
Still destroying... [id-i-e54bc769b5e99dcia,  
Still destroying... [id-i-e54bc769b5e99dcia,  
Still destroying... [id-i-e54bc769b5e99dcia,  
Still destroying... [id-i-e54bc769b5e99dcia,  
Still destroying... [id-i-e54bc769b5e99dcia,  
Still destroying... [id-i-e54bc769b5e99dcia,  
Still destroying... [id-i-e54bc769b5e99dcia,  

Destruction complete after 1m20s  

Destroy complete! Resources: 1 destroyed.  
@shivam-tayade ->/workspaces/Terraform-practice/terraform-project (main) $
```
 
