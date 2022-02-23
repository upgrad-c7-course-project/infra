resource "aws_ecr_repository" "foo" {
  name                 = "101-ecr-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "101-ecr-repo"
  }
}