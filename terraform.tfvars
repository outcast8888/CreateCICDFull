region = "us-east-1"
aws_account_id = "your-account-id"
vpc_cidr = "10.0.0.0/16"

subnet_cidr_a = "10.0.1.0/24"
subnet_cidr_b = "10.0.2.0/24"
availability_zone_a = "us-east-1a"
availability_zone_b = "us-east-1b"
cluster_name = "homeFullSys"
iam_role_name = "eks-role"
bucket_name = "my-bucket-cli-full"
queue_name = "my-sqs-queue-cli-full"
subnets = ["subnet-092402575fc909008", "subnet-093ed58e27ad23376"]
vpc_id = "vpc-0b5c321ca9b992223"
# "subnet-092402575fc909008", # "ID": "subnet-092402575fc909008", "AZ": "us-east-1c" # "subnet-12345678",  # Subnet in AZ1
# "subnet-093ed58e27ad23376", # "ID": "subnet-093ed58e27ad23376", "AZ": "us-east-1a" # "subnet-87654321",  # Subnet in AZ2
# vpc_id = "vpc-0b5c321ca9b992223"