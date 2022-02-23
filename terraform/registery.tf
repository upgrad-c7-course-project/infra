resource "aws_ecr_repository" "docker-images" {
  name                 = "101-docker-images"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "101-docker-images"
  }
}


