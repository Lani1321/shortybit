require 'faraday'
require 'json'

BASE_URL = "https://api-ssl.bitly.com"
END_POINT = { link_save: '/v3/user/link_save', link_history: '/v3/user/link_history', clicks: '/v3/link/clicks' }

module Shortybit
  class Client
    attr_accessor :access_token

    def initialize(access_token)
      @access_token = access_token
    end

    # Returns number of clicks
    def get_clicks(client, bit_link)
      response = Faraday.get("#{BASE_URL}#{END_POINT[:clicks]}?access_token=#{client.access_token}&link=#{bit_link}")

      # Parse JSON
      parsed_response = JSON.parse(response.body)
      clicks = parsed_response["data"]["link_clicks"]
    end    
  end
end