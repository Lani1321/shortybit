# Shortybit

Ruby Library for accessing Bitly's API for these specific endpoints:
  - /v3/user/link_save
  - /v3/user/link_history
  - /v3/user/clicks

To use this gem, you need a bit.ly access token.  To register go to [bitly.com](https://bitly.com/a/sign_up?utm_content=site-free-button&utm_source=organic&utm_medium=website&utm_campaign=null&utm_cta=site-free-button).  
If you already have a bit.ly account:
  - Navigate to the collapsable hamburger menu(your account) at the top right corner of the page
  - Click on 'Settings'
  - Click on 'Advanced Settings'
  - Click on 'API Support' or 'OAuth'
  - If you clicked on 'API support' then click on 'Generic Access Tokens' in blue
  - If you clicked on 'OAuth' then click on 'Generic Access Token'
  - Put in your password then click the orange 'Generate Token' button at the bottom

## Dependencies
  - [bundler](http://bundler.io/)
  - [RubyGems](https://github.com/rubygems/rubygems)
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shortybit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shortybit

## Usage

Create a client using your access token as follows:
```
  # Create a client
  client = Shortybit::Client.new('your_bitly_access_token')

  # Result 
  #<Shortybit::Client:0x007fee034de178 @access_token="your_bitly_access_token">

```

You can now use that client to expose the data from the API:
```
  # Get the entries from your link history in reverse chronological order
  client.link_history(client) #=> Returns a hash of the specific user link history data from Bitly

  # Result
    {
      "has_link_deeplinks": false,
      "archived": false,
      "user_ts": 1522824170,
      "title": "reddit: the front page of the internet",
      "created_at": 1522824170,
      "tags": [],
      "modified_at": 1522824170,
      "campaign_ids": [],
      "private": true,
      "aggregate_link": "http://bit.ly/grRCQh",
      "long_url": "https://www.reddit.com/",
      "client_id": "a5e8cebb233c5d07e5c553e917dffb92fec5264d",
      "link": "http://bit.ly/2uNgpk4",
      "is_domain_deeplink": false,
      "encoding_user": {
          "login": "o_k9q7gj1kj",
          "display_name": "Lani Berry",
          "full_name": "Lani Berry"
      }
    },
    {
      "has_link_deeplinks": false,
      "archived": false,
      "user_ts": 1522816641,
      "title": "Google",
      "created_at": 1522816641,
      "tags": [],
      "modified_at": 1522816641,
      "campaign_ids": [],
      "private": true,
      "aggregate_link": "http://bit.ly/2V6CFi",
      "long_url": "http://www.google.com/",
      "client_id": "",
      "link": "http://bit.ly/2Gvv58L",
      "is_domain_deeplink": false,
      "encoding_user": {
          "login": "o_k9q7gj1kj",
          "display_name": "Lani Berry",
          "full_name": "Lani Berry"
      }
    }
```

```
  # Get amount of clicks for a specific link
  client.get_clicks(client, "http://bit.ly/2GQBVJn") #=> Returns a Fixnum

  # Result 
  2
```

```
  # Save a long URL as a Bitlink in a user's history. Also returns a short URL for that link.
  client.link_save(client, "https://www.reddit.com/") #=> Returns a hash with the original URL and short URL 

  # Result
    {
      "link"=>"http://bit.ly/2uNgpk4", 
      "aggregate_link"=>"http://bit.ly/grRCQh", 
      "long_url"=>"https://www.reddit.com/", 
      "new_link"=>1, "user_hash"=>"2uNgpk4"
    }
```
## Tests

Tests can be run with this command:
  $bundle exec ruby test/shortybit/client_test.rb

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## That's a wrap
![Alt Text](https://i.imgur.com/XeOpXai.gif)
