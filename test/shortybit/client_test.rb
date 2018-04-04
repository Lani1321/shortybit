require './test/test_helper'

class ShortybitClientTest < Minitest::Test
  def test_it_creates_new_bitly_client_with_access_token
    b = Shortybit::Client.new('234234324')
    assert_equal Shortybit::Client, b.class
  end

  def test_get_clicks_returns_fixnum
    VCR.use_cassette('get_click_count') do  
      client = Shortybit::Client.new('664d80152194f99805a5979316e0f1af16416666')
      client.get_clicks(client, "http://bit.ly/2GQBVJn")
      assert_equal Shortybit::Client, client.class
    end
  end

  
end