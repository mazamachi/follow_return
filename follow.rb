require 'tweetstream'
require 'twitter'
cli = Twitter::REST::Client.new do |config|
  config.consumer_key       = '********************'
  config.consumer_secret    = '********************'
  config.access_token        = '********************'
  config.access_token_secret = '********************'
end
TweetStream.configure do |config|
  config.consumer_key       = '********************'
  config.consumer_secret    = '********************'
  config.oauth_token        = '********************'
  config.oauth_token_secret = '********************'
  config.auth_method        = :oauth
end

client = TweetStream::Client.new

client.on_event(:favorite) do |event|
	fan = event[:source][:screen_name]
	cli.follow(fan)
end
client.on_event(:follow) do |event|
	fan = event[:source][:screen_name]
	cli.follow(fan)
end
client.userstream