provider "aws" {
  region = "us-east-1"
}


resource "aws_sns_topic" "cloudbuzz_sns" {
  name = "CloudBuzz-SNS"

  tags = {
    Project = "CloudBuzz"
  }
}


resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.cloudbuzz_sns.arn
  protocol  = "email"
  endpoint  = var.notification_email
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Project = "CloudBuzz"
  }
}

resource "aws_iam_role_policy" "lambda_policy" {
  name   = "lambda_policy"
  role   = aws_iam_role.lambda_execution_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "sns:Publish"
        ]
        Resource = aws_sns_topic.cloudbuzz_sns.arn
      }
    ]
  })
}

resource "aws_lambda_function" "sum_calculator" {
  function_name = "SumCalculator"
  runtime       = "python3.13"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "lambda_func_sum.lambda_handler"
  filename      = "lambda.zip"

  environment {
    variables = {
      SNS_TOPIC_ARN = aws_sns_topic.cloudbuzz_sns.arn
    }
  }

  source_code_hash = filebase64sha256("lambda.zip")

  tags = {
    Project = "CloudBuzz"
  }
}

resource "aws_apigatewayv2_api" "api" {
  name          = "SumCalculatorAPI"
  protocol_type = "HTTP"

  tags = {
    Project = "CloudBuzz"
  }
}

resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id           = aws_apigatewayv2_api.api.id
  integration_type = "AWS_PROXY"
  integration_uri  = aws_lambda_function.sum_calculator.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "default_route" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /calculate"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

resource "aws_apigatewayv2_stage" "default_stage" {
  api_id      = aws_apigatewayv2_api.api.id
  name        = "prod"
  auto_deploy = true

}

resource "aws_lambda_permission" "apigw_invoke" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.sum_calculator.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.api.execution_arn}/*"
}
