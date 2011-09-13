AWS_CONFIG = YAML.load_file("#{Rails.root}/config/aws.yml")[Rails.env]

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:               'AWS',
    aws_access_key_id:      AWS_CONFIG['aws_access_key_id'],
    aws_secret_access_key:  AWS_CONFIG['aws_secret_access_key'],
    region:                 AWS_CONFIG['s3']['region']
  }

  config.fog_directory  = AWS_CONFIG['s3']['dir']
end
