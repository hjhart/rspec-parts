# Rspec::Parts

When using Travis Pro we had five available executors, of which only two were being used, one by jasmine and one by rspec.
This allows you to split your spec suite into multiple *parts*. We wanted to split our rspec suite into four parts and run each of them in one individual build.

This allowed us to go from running one in 70 minutes to running four in 15 minutes each.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-parts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-parts

## Usage

Now you can run the following:

```shell
be rake spec:part[1,4]
```

This will divide your spec directory into four equal parts, then run the first part.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rspec-parts. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

