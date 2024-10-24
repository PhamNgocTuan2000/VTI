output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = module.ecr.repository_url
}

output "s3_website_endpoint" {
  description = "The website endpoint of the S3 bucket"
  value       = module.s3.website_endpoint
}

output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.postgresql.db_endpoint
}