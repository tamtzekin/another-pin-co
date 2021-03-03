CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     Rails.application.credentials.aws[Rails.env.to_sym][:aws_public_key],                        # required unless using use_iam_profile
      aws_secret_access_key: Rails.application.credentials.aws[Rails.env.to_sym][:aws_secret_key],                        # required unless using use_iam_profile
      region:                'eu-west-2',                  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = Rails.application.credentials.aws[Rails.env.to_sym][:aws_bucket]                                      # required
  end