variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy in"
  type        = string
  default     = "il-central-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"        # Free‑tier friendly
}

variable "key_name" {
  description = "kolhai-laptop-key.pem"
  type        = string
}

variable "allowed_cidr" {
  description = "Who can reach port 80 (0.0.0.0/0 opens to everyone)"
  type        = string
  default     = "0.0.0.0/0"
}

