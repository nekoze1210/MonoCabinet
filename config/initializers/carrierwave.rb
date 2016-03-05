CarrierWave.configure do |config|
    config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'Oregon'
  }

    case Rails.env
    when 'development'
        config.fog_directory  = 'otoshimonno-image'
        config.asset_host = 'https://s3.amazonaws.com/otoshimonno-image'
    when 'production'
        config.fog_directory  = 'ここにバケット名を入れます'
        config.asset_host = 'https://s3.amazonaws.com/otoshimonno-image'
    end
end