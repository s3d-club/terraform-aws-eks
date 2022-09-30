variable "cidrs" {
  type = list(string)

  description = <<-END
		CIDRS
    https://go.s3d.club/eks#cidrs
    END
}

variable "name_prefix" {
  type = string

  description = <<-END
		Name Prefix
    https://go.s3d.club/eks#name_prefix
    END
}

variable "security_group_id" {
  type = string

  description = <<-END
		Security Group ID
    https://go.s3d.club/eks#security_group_id
    END
}

variable "subnet_ids" {
  type = list(string)

  description = <<-END
		Subnet IDs
    https://go.s3d.club/eks#subnet_ids
    END
}

variable "cluster_version" {
  default = null
  type    = string

  description = <<-END
		Cluster Version
    https://go.s3d.club/eks#cluster_version
    END
}

variable "tags" {
  default = {}
  type    = map(string)

  description = <<-END
		Tags for Resources
    https://go.s3d.club/eks#tags
    END
}
