data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "hcp_organization" "current" {}
data "hcp_project" "current" {}

data "tls_certificate" "tfc_certificate" {
  url = "https://${var.tfc_hostname}"
}

data "aws_iam_openid_connect_provider" "tfc" {
  url =  "https://${var.tfc_hostname}"
}

data "aws_iam_policy_document" "stacks_assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "Federated"
      identifiers = [data.aws_iam_openid_connect_provider.tfc.arn]
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition {
      test     = "StringEquals"
      variable = "${var.tfc_hostname}:aud"
      values   = ["aws.workload.identity"]
    }
    condition {
      test     = "StringLike"
      variable = "${var.tfc_hostname}:sub"
      values = ["organization:${local.tfc_organization}:project:${local.tfc_project}:stack:*:*"]
    }
  }
}

data "aws_iam_policy_document" "stacks_role_policy" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:DescribeVpcAttribute"
    ]

    resources = [
      "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:vpc/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "ec2:DescribeVpcs",
      "ec2:DescribeInternetGateways",
      "ec2:DescribeRouteTables",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeAddresses",
      "ec2:DescribeNatGateways",
      "ec2:DescribeAddressesAttribute"
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "ec2:CreateVpc",
      "ec2:CreateTags",
      "ec2:DeleteVpc",
      "ec2:ModifyVpcAttribute",
      "ec2:DescribeVpcAttribute",
      "ec2:CreateSubnet",
      "ec2:CreateRouteTable",
      "ec2:CreateSecurityGroup",
      "ec2:CreateInternetGateway",
      "ec2:CreateTags",
      "ec2:AttachInternetGateway",
      "ec2:DeleteInternetGateway",
      "ec2:DetachInternetGateway",
      "ec2:DeleteSecurityGroup",
      "ec2:DeleteSubnet",
      "ec2:AllocateAddress",
      "ec2:AssociateRouteTable",
      "ec2:RevokeSecurityGroupEgress",
      "ec2:CreateRoute",
      "ec2:ReleaseAddress",
      "ec2:CreateNatGateway",
      "ec2:DeleteNatGateway",
      "ec2:DisassociateRouteTable",
      "ec2:DeleteRoute",
      "ec2:DeleteRouteTable"
    ]

    resources = [
      "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:vpc/*",
      "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:subnet/*",
      "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:security-group/*",
      "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:route-table/*",
      "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:internet-gateway/*",
      "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:elastic-ip/*",
      "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:natgateway/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "ec2:DisassociateAddress"
    ]

    resources = [
      "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "ec2:DescribeVpcs",
      "ec2:DescribeRouteTables",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribeSubnets",
      "ec2:DescribeInternetGateways",
      "ec2:DescribeAddresses",
      "ec2:DescribeNatGateways"
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "ec2:DescribeVpcPeeringConnections",
      "ec2:DescribeRouteTables"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "ec2:DescribeVpcPeeringConnections",
      "ec2:DescribeRouteTables"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "ec2:AcceptVpcPeeringConnection",
      "ec2:CreateTags"
    ]
    resources = [
      "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:vpc-peering-connection/*",
      "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:vpc/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "ec2:CreateRoute",
      "ec2:DeleteRoute"
    ]
    resources = [
      "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:route-table/*"
    ]
  }
}
