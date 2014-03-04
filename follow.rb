require 'tweetstream'
require 'twitter'
cli = Twitter::REST::Client.new do |config|
  config.consumer_key       = 'P5huEHBWxdwd11ijdEg5RA'
  config.consumer_secret    = 'PmXQxojf1kcPwJ5Mt4s7Zqhrs45rebjjwD4rmx5FK8'
  config.access_token        = '2202801997-yfLS4OdYiWBtDQh1x8ppkfk5cTgZLtTtb0FGtd8'
  config.access_token_secret = '0mFMUUsMYFuAOhT8e7LkrArqt9Kq7XPwJPhItPye5RpjZ'
end
TweetStream.configure do |config|
  config.consumer_key       = 'P5huEHBWxdwd11ijdEg5RA'
  config.consumer_secret    = 'PmXQxojf1kcPwJ5Mt4s7Zqhrs45rebjjwD4rmx5FK8'
  config.oauth_token        = '2202801997-yfLS4OdYiWBtDQh1x8ppkfk5cTgZLtTtb0FGtd8'
  config.oauth_token_secret = '0mFMUUsMYFuAOhT8e7LkrArqt9Kq7XPwJPhItPye5RpjZ'
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