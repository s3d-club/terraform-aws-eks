output "cluster" {
  value = aws_eks_cluster.this

  description = <<-END
		The EKS Cluster	
		https://go.s3d.com/aws/eks#cluster
		END	
}

output "role" {
  value = aws_iam_role.this

  description = <<-END
		The IAM Role
		https://go.s3d.com/aws/eks#role
		END	
}
