CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'Google',
    google_storage_access_key_id:     ENV['google_storage_access_key'],
    google_storage_secret_access_key: ENV['google_storage_secret']
  }
  
  config.storage = :fog
  config.fog_directory  = ENV['google_bucket_name']
end

