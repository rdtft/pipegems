Fog.mock!
Fog.credentials_path = Rails.root.join('config/aws.yml')
connection = Fog::Storage.new(:provider => 'AWS')
connection.directories.create(:key => 'mikeg-bucket-test')
