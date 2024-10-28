data "aws_iam_policy_document" "boudary_describe_instances" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:DescribeInstances"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "iam:GetUser",
      "iam:CreateAccessKey",
      "iam:DeleteAccessKey"
    ]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/boundary"]
  }
}

####################################################################################################
### IAM AMIS
####################################################################################################
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
