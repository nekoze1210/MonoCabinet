RakutenWebService.configure do |config|
  if Rails.env == 'production'
    config.application_id = ENV['RAKUTEN_APPLICATION_ID']
  else
    config.application_id = Settings.rakuten.application_id
  end
end
