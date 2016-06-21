CarrierWave.configure do |config|

  config.storage = :fog

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJRDMCVGEUQFUR32A',
    :aws_secret_access_key  => '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',
    :region                 => 'eu-central-1',
    :path_style             => true
  }
  
  config.fog_directory  = 'bookmark-manager'
end