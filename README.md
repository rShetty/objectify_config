# ObjectifyConfig   [![Build Status](https://travis-ci.org/rShetty/objectify_config.svg?branch=master)](https://travis-ci.org/rShetty/objectify_config)

ObjectifyConfig wraps your configuration file keys into a Object.
The keys in the configuration files become callable methods.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'objectify_config'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install objectify_config

## Usage

Add this in your initializer file

```ruby
ObjectifyConfig.configuration_files('/path/to/*.yml')
ObjectifyConfig.run
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/objectify_config/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
