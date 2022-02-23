data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}


data "aws_iam_policy" "Ec2EcrPolicy" {
  arn = "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
}
