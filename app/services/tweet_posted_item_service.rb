class TweetPostedItemService

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = Settings.twitter.consumer_key
      config.consumer_secret = Settings.twitter.consumer_secret
      config.access_token = Settings.twitter.token
      config.access_token_secret = Settings.twitter.token_secret
    end
  end

  def post_to_twitter(text, image)
    media = open(image)
    @client.update_with_media(text, media)
  end
end
