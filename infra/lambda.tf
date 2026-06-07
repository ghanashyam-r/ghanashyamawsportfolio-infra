data "archive_file" "chatbot_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda/lambda_function.py"
  output_path = "${path.module}/lambda/chatbot.zip"
}

resource "aws_lambda_function" "chatbot" {
  function_name = local.lambda_name

  filename         = data.archive_file.chatbot_zip.output_path
  source_code_hash = data.archive_file.chatbot_zip.output_base64sha256

  role    = aws_iam_role.lambda_exec.arn
  handler = "lambda_function.lambda_handler"
  runtime = "python3.13"

  timeout = 10

  tags = local.common_tags
}