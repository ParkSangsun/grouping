CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJX3VKSWMAWP6XG5Q',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'
  }
  config.fog_directory  = 'junpark'                          # required
end

