variable "cidrs" {
  type = list(string)

  description = <<-END
    A list of addresses for `public_access_cidrs`.
    END
}

variable "cluster_version" {
  default = null
  type    = string

  description = <<-END
    The EKS cluster version.
    END
}

variable "kms_key_arn" {
  type = string

  description = <<-END
    The KMS ARN.
    END
}

variable "name_prefix" {
  type = string

  description = <<-END
    A name prefix for resources.
    END
}

variable "security_group_id" {
  type = string

  description = <<-END
    The Security Group ID for the cluster.
    END
}

variable "subnet_ids" {
  type = list(string)

  description = <<-END
    A list of subnet IDs for the cluster.
    END
}

variable "tags" {
  default = {}
  type    = map(string)

  description = <<-END
    Tags for resources.
    END
}
