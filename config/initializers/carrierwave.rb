CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     Rails.application.credentials.aws.aws_public_key,                        # required unless using use_iam_profile
      aws_secret_access_key: Rails.application.credentials.aws.aws_secret_key,                        # required unless using use_iam_profile
      use_iam_profile:       true,                         # optional, defaults to false
      region:                'eu-west-1',                  # optional, defaults to 'us-east-1'
      host:                  's3.example.com',             # optional, defaults to nil
      endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory  = Rails.application.credentials.aws.aws_bucket                                      # required
  end