# frozen_string_literal: true

class User::TweetItemService
  def initialize(item)
    @item = item
  end

  def execute
    tweet = <<-MSG
    MonoCabinet で #{@item.name} を失くさないように管理しています。
    http://localhost:3000 #MonoCabinet
    MSG
    @client.update_with_media(tweet)
  end

  private

  def client
    Twitter::REST::Client.new do |config|
      if Rails.env == 'production'
        config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token = ENV['TWITTER_TOKEN']
        config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
      else
        config.consumer_key = Settings.twitter.consumer_key
        config.consumer_secret = Settings.twitter.consumer_secret
        config.access_token = Settings.twitter.token
        config.access_token_secret = Settings.twitter.token_secret
      end
    end
  end
end
