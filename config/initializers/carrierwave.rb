CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_KEY'],
    region:                'ap-southeast-1'
  }
  
  config.storage = :fog
  config.fog_directory  = ENV['AWS_BUCKET_NAME']
end

