output "api_endpoint" {
  description = "Base HTTP API endpoint. POST to /contact."
  value       = aws_apigatewayv2_stage.default.invoke_url
}

output "contact_endpoint" {
  description = "Contact form POST endpoint."
  value       = "${aws_apigatewayv2_stage.default.invoke_url}/contact"
}

output "lambda_name" {
  value = aws_lambda_function.contact_form.function_name
}

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.lambda.name
}
