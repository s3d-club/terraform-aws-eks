data "aws_partition" "this" {}

locals {
  iam_prefix = (
    "arn:${data.aws_partition.this.partition}:iam::aws:policy"
  )
}

module "name" {
  source = "github.com/s3d-club/terraform-external-name?ref=v0.1.10"

  context = var.name_prefix
  path    = path.module
  tags    = var.tags
}

resource "aws_eks_cluster" "this" {
  name     = module.name.prefix
  role_arn = aws_iam_role.this.arn
  version  = var.cluster_version
  tags     = module.name.tags

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler",
  ]

  encryption_config {
    resources = ["secrets"]

    provider {
      key_arn = var.kms_key_arn
    }
  }

  vpc_config {
    endpoint_public_access = false
    public_access_cidrs    = var.cidrs
    security_group_ids     = [var.security_group_id]
    subnet_ids             = var.subnet_ids
  }
}

resource "aws_iam_role" "this" {
  name = module.name.prefix
  tags = module.name.tags

  assume_role_policy = jsonencode({
    Version = "2012-10-17",

    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = toset([
    "${local.iam_prefix}/AmazonEKSClusterPolicy",
    "${local.iam_prefix}/AmazonEKSVPCResourceController",
  ])

  policy_arn = each.value
  role       = aws_iam_role.this.name
}
