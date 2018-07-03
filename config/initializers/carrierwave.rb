require 'carrierwave/orm/activerecord'


CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'

  config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
      :region                => 'us-east-2'
  }


  if Rails.env.test? || Rails.env.development?
    config.enable_processing = true
    config.storage = :file
  else
    config.fog_directory    = ENV['S3_BUCKET_NAME']
    config.storage = :fog
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end


 end