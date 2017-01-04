RakutenWebService.configure do |config|
  # config.application_id = Settings.rakuten.application_id
  config.application_id = ENV['RAKUTEN_APPLICATION_ID']
end
