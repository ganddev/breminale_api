require 'aws-sdk'

Aws.config.update({
  region: ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY'], ENV['AWS_SECRET_KEY']),
})

s3 = Aws::S3::Resource.new

S3_BUCKET = s3.bucket(ENV['S3_BUCKET'])