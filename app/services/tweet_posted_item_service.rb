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
    message1 = 'モノキャビで'
    message2 = 'を管理しているよ！'
    message3 = 'みんなでモノを管理しよう！！'
    kaigyo = "\n"
    space = ' '
    hash_tag = '#モノキャビ'
    link_to_monocabi = 'https://localhost:3000'
    media = open(image)
    tweet_text = message1 + "「#{text}」" + message2 + kaigyo + message3 + space + hash_tag + kaigyo + link_to_monocabi
    @client.update_with_media(tweet_text, media)
  end
end
