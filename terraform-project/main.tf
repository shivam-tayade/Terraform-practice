provider "aws" {
  region = "ap-south-1" 	# You can use your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-002f6e91abff6eb96"	 # Replace with actual AMI ID
  instance_type = "t2.micro"
}

