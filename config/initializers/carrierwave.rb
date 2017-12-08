CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'

  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    :provider =>'AWS',
    :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
    :region => 'us-west-2'
  }
  config.fog_directory = "delta-kids-2017"
end
