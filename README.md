# CryptoVal

CryptoVal is a Ruby gem that fetches the latest value of a Cryptocurrency. In addition, it also provides exchange rate conversion for several currencies.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crypto_val'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crypto_val

## Usage

### Basic Usage

The basic usage of this gem is to get the latest USD value of Bitcoin (BTC):

`CryptoVal::Latest.fetch`

This will return a Hash similar to:

`{:symbol=>"BTC", :currency=>"USD", :value=>4121.19}`

Additional options can be provided:

* symbol - the symbol of the Cryptocurrency (e.g. "LTC", "XRP")
* currency - the fiat currency that will be used

For example, to get the PHP value of Ripple (XRP):

`CryptoVal::Latest.fetch(symbol: "XRP", currency: "PHP")`

This returns the following:

`{:symbol=>"XRP", :currency=>"PHP", :value=>12.03}`

### Exchange Rate

It is possible to just get the current exchange rate for different currencies. This method can be used for a more performant code by fetching the current exchange rate only once for all of the Cryptocurrency values.

`CryptoVal::FiatExchange.fetch(source_currency: "USD", target_currency: "PHP")`

* source_currency - the fiat symbol of the source currency (defaults to "USD")
* target_currency - the fiat symbol of the target currency

This returns the date and the current exchange rate:

`{:source_currency=>"USD", :target_currency=>"PHP", :date=>#<Date: 2017-08-24 ((2457990j,0s,0n),+0s,2299161j)>, :rate=>51.08}`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cryptoval. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

