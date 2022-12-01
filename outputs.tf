output "cluster" {
  value = aws_eks_cluster.this

  description = <<-EOT
    The EKS cluster.
    EOT  
}

output "role" {
  value = aws_iam_role.this

  description = <<-EOT
    The IAM Role.
    EOT  
}
