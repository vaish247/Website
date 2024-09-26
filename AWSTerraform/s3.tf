# Create the S3 bucket
resource "aws_s3_bucket" "nextappbucket2" {
  bucket = "ezzysoftsolutions.com"

  tags = {
    "env" = "dev"
  }
}


# Configure the S3 bucket for website hosting
resource "aws_s3_bucket_website_configuration" "next_config" {
  bucket = aws_s3_bucket.nextappbucket2.id

  index_document {
    suffix = "index.html"
  }
}

# Set ownership controls for the S3 bucket
resource "aws_s3_bucket_ownership_controls" "bucket_ownership" {
  bucket = aws_s3_bucket.nextappbucket2.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Configure public access block settings
resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  bucket = aws_s3_bucket.nextappbucket2.id

  block_public_acls          = false
  block_public_policy        = false
  ignore_public_acls         = false
  restrict_public_buckets    = false
}

# Create a bucket policy to allow public read access
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.nextappbucket2.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action = "s3:GetObject",
        Resource = "${aws_s3_bucket.nextappbucket2.arn}/*"
      }
    ]
  })

  depends_on = [
    aws_s3_bucket_public_access_block.bucket_public_access
  ]
}

resource "aws_s3_bucket" "image_bucket" {
  bucket = "my-image-bucket-rando234"
  
  tags = {
    Name        = "image-storage-bucket"
    Environment = "dev"
  }

}
resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket.image_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "s3:GetObject"
        Effect    = "Allow"
        Resource  = "${aws_s3_bucket.image_bucket.arn}/*"
        Principal = "*"
      }
    ]
  })
}
