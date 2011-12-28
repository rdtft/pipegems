Fog.credentials_path = Rails.root.join('config/aws.yml')

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider => 'AWS'
  }
  config.fog_directory = "mikeg-bucket-test"
end
