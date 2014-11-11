# Yelpify

Yelpify is a Ruby gem that facilitates the use of the Yelp API's business and search functions for collecting data on local businesses.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yelpify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yelpify

## Usage

### Setup

To begin use of Yelpify, you must first instantiate a new client by passing in a hash of the API keys acquired from Yelp (http://www.yelp.com/developers).

	oauth_creds = {
	consumer_key:    <YELP KEY>,
	consumer_secret: <YELP SECRET>,
	token:           <YELP TOKEN>,
	token_secret:    <YELP TOKEN SECRET>
	}
	client = Yelpify.create_new(oauth_creds)

Your new client is equipped with both search and business functionality.

## Queries

### Search

All search requests can be made simply by using the #search method available through the Yelpify module and passing in a hash of search parameters:

	search_params = {
		location: 'austin',
		category_filter: 'bars',
		radius: 1610
	}
	client.search(search_params)

### Business

All business requests can also be made using the #business method available through Yelpify by passing in a business ID and optional search parameters:

	client.business('firehouse-lounge-austin-3')

### RESPONSES

All query responses are parsed and returned as an OpenStruct. The information within that OpenStruct is accessable to you through dot-notation. Using the example query from earlier:

	search_params = {
		location: 'austin',
		category_filter: 'bars',
		radius: 1610
	}
	response = client.search(search_params)

	response.businesses[0].name
	# "Firehouse Lounge"

And an example using our previous business query:

	client.business('firehouse-lounge-austin-3')

	response.name
	# "Firehouse Lounge"


## Contributing

1. Fork it ( https://github.com/[my-github-username]/yelpify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
