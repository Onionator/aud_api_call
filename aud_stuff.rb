require 'rest_client'
require 'byebug'
require 'json'

# need to use rails .env file with api_token using dotenv_rails gem

user_input = "alice in chains"
token = ENV["api_token"]

lyrics = ""

response = RestClient::Request.execute(
  method: :get,
  url: "https://api.audd.io/findLyrics/?api_token=#{aud_token}&q=#{user_input}",
)

  parsed_response = JSON.parse(response)
  byebug

10.times do |i|
  lyrics += parsed_response["result"][i]["lyrics"].tr("\r\n", " ") + " "
end


p parsed_response["status"]
p lyrics
