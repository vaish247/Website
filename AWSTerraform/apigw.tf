# resource "aws_apigatewayv2_api" "ezzy" {
#   name          = "EZZY_APIGateway_CSharpWebApiLambda"
#   protocol_type = "HTTP"
#   description   = "HTTP API Gateway for CSharpWebApiLambda"

#   cors_configuration {
#     allow_origins = ["*"]
#     allow_methods = ["*"]
#     allow_headers = ["*"]
#     expose_headers = ["*"]
#     max_age = 360

#   }
# }



# resource "aws_apigatewayv2_integration" "post_csharp_web_api_lambda" {
#   api_id              = aws_apigatewayv2_api.ezzy.id
#   integration_type    = "AWS_PROXY"
#   integration_uri     = "arn:aws:lambda:ap-southeast-2:809071700479:function:EZZY_Lambda_WebAPI"
#   integration_method  = "POST"
#   payload_format_version = "2.0"
# }

# resource "aws_apigatewayv2_route" "post_csharp_web_api_lambda" {
#   api_id    = aws_apigatewayv2_api.ezzy.id
#   route_key = "POST /Post"
#   target    = "integrations/${aws_apigatewayv2_integration.post_csharp_web_api_lambda.id}"
# }
# resource "aws_api_gateway_method" "cors_method" {
#     rest_api_id   = aws_api_gateway_rest_api.cors_api.id
#     resource_id   = aws_api_gateway_resource.cors_resource.id
#     http_method   = "POST"  # or "POST", depending on your use case
#     authorization = "NONE"     # or specify an authorization type if needed
# }

# resource "aws_api_gateway_method_response" "cors_method_response_200" {
#     rest_api_id   = aws_api_gateway_rest_api.cors_api.id
#     resource_id   = aws_api_gateway_resource.cors_resource.id
#     http_method   = aws_api_gateway_method.cors_method.http_method
#     status_code   = "200"
    
#     response_parameters = {
#         "method.response.header.Access-Control-Allow-Origin"      = true
#         "method.response.header.Access-Control-Allow-Methods"     = true
#         "method.response.header.Access-Control-Allow-Headers"     = true
#     }

#     depends_on = [aws_api_gateway_method.cors_method]
# }


# resource "aws_lambda_permission" "allow_api_gateway" {
#   action        = "lambda:InvokeFunction"
#   function_name = "EZZY_Lambda_WebAPI"
#   principal     = "apigateway.amazonaws.com"
#   statement_id  = "AllowExecutionFromApiGateway"
# }

# resource "aws_apigatewayv2_stage" "deployment" {
#   api_id      = aws_apigatewayv2_api.ezzy.id
#   name        = "default"
#   auto_deploy = true
# }
