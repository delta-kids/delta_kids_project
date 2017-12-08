CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'

  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => ENV['AWSAccessKeyId'],
    :aws_secret_access_key => ENV['AWSSecretKey'],
    :region => ENV['S3_REGION']
  }
  config.fog_directory = ENV['S3_BUCKET']
end
