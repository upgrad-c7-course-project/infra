

resource "aws_iam_role" "ecr-ec2-iam-role" {
  name = "101-ecr-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "sts:AssumeRole"
        ],
        Principal = {
          Service = [
            "ec2.amazonaws.com"
          ]
        }
      }
    ]
  })

}

resource "aws_iam_role_policy_attachment" "ec2-ecr-access-policy" {
  role       = aws_iam_role.ecr-ec2-iam-role.name
  policy_arn = data.aws_iam_policy.Ec2EcrPolicy.arn
}


resource "aws_iam_instance_profile" "ec2-ecr-iam-profile" {
  name = "ec2_ecr_iam_profile"
  role = aws_iam_role.ecr-ec2-iam-role.name

  depends_on = [aws_iam_role_policy_attachment.ec2-ecr-access-policy]
}