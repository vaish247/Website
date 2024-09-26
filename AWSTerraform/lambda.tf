# resource "aws_iam_role" "lambda_execution_role" {
#   name = "lambda_execution_role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Action = "sts:AssumeRole"
#       Effect = "Allow"
#       Sid    = ""
#       Principal = {
#         Service = "lambda.amazonaws.com"
#       }
#     }]
#   })

#   managed_policy_arns = [
#     "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
#   ]
# }
# resource "aws_lambda_function" "webapi_lambda" {
#   function_name = "CSharpWebApiLambda"
#   role          = aws_iam_role.lambda_execution_role.arn
#   handler       = "Testing::Testing.Function::FunctionHandler"  # Your specified handler
#   runtime       = "dotnet8"  # Using .NET 8.0 runtime
#   timeout       = 15
#   memory_size   = 512

#   filename         = "C:\\Users\\ajith\\test\\VJWebSite\\Gateway.zip"  # Path to your compiled ZIP file
#   source_code_hash = filebase64sha256("C:\\Users\\ajith\\test\\VJWebSite\\Gateway.zip")

#   environment {
#     variables = {
#       ASPNETCORE_ENVIRONMENT = "Production"  # Change to your environment variable
#     }
#   }
# }

# resource "aws_lambda_permission" "apigw" {
#   statement_id  = "AllowAPIGatewayInvoke"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.webapi_lambda.function_name
#   principal     = "apigateway.amazonaws.com"
# }
