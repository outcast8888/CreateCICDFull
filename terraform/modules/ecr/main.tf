resource "aws_ecr_repository" "service1" {
  name = "service1"
}

resource "aws_ecr_repository" "service2" {
  name = "service2"
}

output "repository_urls" {
  value = [
    aws_ecr_repository.service1.repository_url,
    aws_ecr_repository.service2.repository_url
  ]
}
