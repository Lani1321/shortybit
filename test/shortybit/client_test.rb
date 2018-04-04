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

  def test_link_history_returns_hash
    VCR.use_cassette('get_link_history') do  
      client = Shortybit::Client.new('664d80152194f99805a5979316e0f1af16416666')
      a = client.link_history(client)
      assert_equal "reddit: the front page of the internet", a[0]["title"]
    end
  end

  def test_link_history_returns_long_url
    VCR.use_cassette('get_link_history') do  
      client = Shortybit::Client.new('664d80152194f99805a5979316e0f1af16416666')
      a = client.link_history(client)
      assert_equal "https://www.reddit.com/", a[0]["long_url"]
    end
  end

  def test_link_history_returns_aggregate_link
    VCR.use_cassette('get_link_and_returns_agg_link') do  
      client = Shortybit::Client.new('664d80152194f99805a5979316e0f1af16416666')
      a = client.link_history(client)
      assert_equal "http://bit.ly/grRCQh", a[0]["aggregate_link"]
    end
  end

  def test_link_history_is_private
    VCR.use_cassette('get_link_and_is_private') do  
      client = Shortybit::Client.new('664d80152194f99805a5979316e0f1af16416666')
      a = client.link_history(client)
      assert_equal true, a[0]["private"]
    end
  end

  def test_link_save_returns_long_url
    VCR.use_cassette('save_link_and_returns_long_url') do  
      client = Shortybit::Client.new('664d80152194f99805a5979316e0f1af16416666')
      saved = client.link_save(client, "https://www.reddit.com/")
      assert_equal "https://www.reddit.com/", saved["long_url"]
    end
  end

  def test_link_save_returns_correct_user
    VCR.use_cassette('save_link_and_returns_correct_user') do  
      client = Shortybit::Client.new('664d80152194f99805a5979316e0f1af16416666')
      saved = client.link_save(client, "https://www.reddit.com/")
      assert_equal "2uNgpk4", saved["user_hash"]
    end
  end
end