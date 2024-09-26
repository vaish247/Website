resource "aws_dynamodb_table" "test" {
  name           = "EZZY_DynamoDBTable_ContactTableStore"  # Name of the DynamoDB table
  billing_mode    = "PROVISIONED"  # Options are "PROVISIONED" or "PAY_PER_REQUEST"
  hash_key        = "id"  # Partition key (hash key)

  attribute {
    name = "id"
    type = "S"  # S stands for String
  }

  read_capacity  = 5  # Adjust as needed
  write_capacity = 5  # Adjust as needed

  tags = {
    Name = "test-table"
  }
}
