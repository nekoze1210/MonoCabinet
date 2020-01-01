class TweetPostedItemService
  def initialize
    @client = Twitter::REST::Client.new do |config|
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

  def post_to_twitter(text, image)
    message = <<-MSG
    MonoCabinet で #{item} を失くさないように管理しています。
    #MonoCabinet'
    #{}
    MSG
    link_to_monocabi = 'https://localhost:3000'
    media = open(image)
    tweet_text = message1 + "「#{text}」" + message2 + kaigyo + message3 + space + hash_tag + kaigyo + link_to_monocabi
    @client.update_with_media(tweet_text, media)
  end
end