CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => "YOUR AMAZON ACCESS KEY",
      :aws_secret_access_key  => "YOUR AMAZON SECRET KEY",
      :region                 => 'us-west-1'
  }
  config.fog_directory  = "bucket-name"
end
