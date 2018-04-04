require './test/test_helper'

class ShortybitClientTest < Minitest::Test
  def test_it_creates_new_bitly_client_with_access_token
    b = Shortybit::Client.new('234234324')
    assert_equal Shortybit::Client, b.class
  end
end