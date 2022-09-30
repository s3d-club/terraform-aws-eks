# S3D EKS Module

## Additional Documents
Please read our [LICENSE][lice], [CONTRIBUTING][cont], [CODE-OF-CONDUCT][code],
and [CHANGES][chge] documents before working in this project and anytime they
are update.

## Overview
This module defines our EKS configuration.

Our module has the following attributes.
- Ressource naming and tagging managed by [S3D naming][name]
- IAM role and policy for `AmazonEKSClusterPolicy` and
  `AmazonEKSVPCResourceController`

The approach we are using is a response to modules we used in the past that
were overly complex and bloated with _"features"_ that we see as anit-patterns.

The module is [available on the Terraform Registry][tfrg] and has a club page
[HERE](https://go.s3d.club/eks).

### Required Inputs
#### <a name="cidrs"></a> IP4 CIDRs `list(string): cidrs` 
The `vpc_config.public_access_cidrs` as described [HERE][cidr].

#### <a name="name_prefix"></a> Name Prefix `string: name_prefix`[^1] 
The name prefix for AWS resources.

#### Security Group ID `string: security_group_id`[^1] 
An entry for the `security_group_ids` list described [HERE][sgrp]. It is a bad
idea to overcomplicate the configuration with multiple security groups on the
EKS and as such this is single item even though the downstream resource allows
a list.

#### <a name="subnet_ids"></a> Subnet IDs `string: subnet_ids`[^1] 
IDs for the subnets as described [HERE][subn].

#### <a name="cluster_version"></a> Cluster Version `string: cluster_version`[^1] 
The EKS version as described [HERE][cver] with the change that in our module it
is a required input.

### Optional Inputs
#### <a name="tags"></a> Tags for Resources `map(string): tags`
Resources managed by this module are tagged with the version of the module and
as well as any tags suppplied by this input.

### Outputs
#### <a name="cluster"></a> Cluster
The `aws_eks_cluster` attributes as described [HERE][attr].

#### <a name="role"></a> Role
The `aws_iam_role` attributes described [HERE][role].

[^1]: Required Input

<!-- LINKS -->
[attr]: https://go.s3d.club/hc/aws-/eks_cluster#attributes-reference
[chge]: ./CHANGES.md
[cidr]: https://go.s3d.club/hc/aws-/eks_cluster#public_access_cidrs
[code]: ./CODE-OF-CONDUCT.md
[cont]: ./CONTRIBUTING.md
[cver]: https://go.s3d.club/hc/aws-/eks_cluster#version
[lice]: ./LICENSE.md
[role]: https://go.s3d.club/hc/aws-/iam_role#attributes-reference
[sgrp]: https://go.s3d.club/hc/aws-/eks_cluster#security_group_ids
[subn]: https://go.s3d.club/hc/aws-/eks_cluster#subnet_ids
[tfrg]: https://registry.terraform.io/modules/s3d-club/eks/aws/latest?tab=readme
