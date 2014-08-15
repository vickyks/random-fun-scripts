#!/usr/bin/env ruby

# Take all the tweets from Norwegian10 and turn it
# into a list of norwegian words.

require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key = 'ozAO9XYagmDHnDxHqfm7FPWfc'
  config.consumer_secret = 'cueMVj3zXGC7blO7bK5LJaMnj98SBBKd36gas6a4ITcGXYnKql'
  config.access_token = '23338207-GgGuavRD1nagj0RDbJ9FKeO90DhZ7vOaBmE7rHLUB'
  config.access_token_secret = 'rK8v1JWoaeTbpNCr2G7JhzdwAtEJAXvNZB9WI0rrOt9O8'
end

def client.get_all_tweets(user)
  collect_with_max_id do |max_id|
    options = { :count => 200, :include_rts => true }
    options[:max_id] = max_id unless max_id.nil?
    user_timeline(user, options)
  end
end

words = []

client.get_all_tweets('norwegianlearn').each do |tweet|
  tweet.text.split(', ').each do |definition|
    words << definition
  end
end

puts words

File.open('norwegianwords.txt', 'w') { |f| f.write(words) }
