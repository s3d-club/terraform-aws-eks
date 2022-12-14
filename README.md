# EKS Module
A Terraform module for EKS configuration.

## Associated Documents
Please read our [LICENSE][lice], [CONTRIBUTING][cont], and [CHANGES][chge]
documents before working in this project and anytime they are updated.

## Overview
This module defines our EKS configuration.

Our module has the following attributes.
- Ressource naming and tagging managed by the [name][name] module
- IAM role and policy for `AmazonEKSClusterPolicy` and
  `AmazonEKSVPCResourceController`

This module focused on EKS functionality with a minimum of "extra" resources.

<!-- LINKS -->
[chge]: ./CHANGES.md
[cont]: ./CONTRIBUTING.md
[lice]: ./LICENSE.md
[name]: https://www.s3d.club/docs/source/name/overview
