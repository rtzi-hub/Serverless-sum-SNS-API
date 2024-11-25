output "api_url" {
  value = aws_apigatewayv2_api.api.api_endpoint
  description = "API Gateway URL for the Lambda function"
}

output "sns_topic_arn" {
  value = aws_sns_topic.cloudbuzz_sns.arn
  description = "SNS Topic ARN"
}
