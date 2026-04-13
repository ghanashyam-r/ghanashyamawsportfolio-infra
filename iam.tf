# Phase 2 — uncomment when building chatbot

# resource "aws_iam_role" "lambda_exec" {
#   name = "${var.project}-lambda-role-${var.env}"
#
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Action    = "sts:AssumeRole"
#       Effect    = "Allow"
#       Principal = { Service = "lambda.amazonaws.com" }
#     }]
#   })
#
#   tags = local.common_tags
# }
#
# resource "aws_iam_role_policy" "lambda_permissions" {
#   name = "${var.project}-lambda-policy-${var.env}"
#   role = aws_iam_role.lambda_exec.id
#
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Sid    = "ReadDocs"
#         Effect = "Allow"
#         Action = ["s3:GetObject", "s3:ListBucket"]
#         Resource = [
#           aws_s3_bucket.docs.arn,
#           "${aws_s3_bucket.docs.arn}/*"
#         ]
#       },
#       {
#         Sid      = "InvokeBedrock"
#         Effect   = "Allow"
#         Action   = ["bedrock:InvokeModel"]
#         Resource = "arn:aws:bedrock:${var.aws_region}::foundation-model/${var.bedrock_model_id}"
#       },
#       {
#         Sid    = "WriteLogs"
#         Effect = "Allow"
#         Action = [
#           "logs:CreateLogGroup",
#           "logs:CreateLogStream",
#           "logs:PutLogEvents"
#         ]
#         Resource = "arn:aws:logs:*:*:*"
#       }
#     ]
#   })
# }