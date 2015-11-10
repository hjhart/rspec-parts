# Rspec::Parts

[![Build Status](https://travis-ci.org/hjhart/rspec-parts.svg?branch=master)](https://travis-ci.org/hjhart/rspec-parts)

### Speed up your builds, fully utilize your Travis Pro capacity!

When using Travis Pro we had five available executors, of which only two were being used, one by [Jasmine][jasmine] and one by [Rspec][rspec].
This allows you to split your spec suite into multiple, but equal **parts**. We wanted to split our rspec suite into four parts to fully utilize our remaining executors.

This sped up our Travis Pro builds from running one travis process in **70 minutes** to running four processes in **15 minutes** each.

See the [blog post][blog-post] about how we went about configuring this gem for Travis.

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
rake spec:part[1,4]
```

This will divide your specs into four equal parts, then run the first part of the four. `rake spec:part[2,4]` will run the second part, and so on.

## Travis CI set up

See the file [.travis.example.yml](https://github.com/hjhart/rspec-parts/blob/master/.travis.example.yml) for an example on how to configure travis to run these builds.

## Configuration

This gem should work pretty well with rspec. If you need to configure something, however, you **must** create the file `spec/support/rspec-parts.rb`, and configure as below:

      Rspec::Parts.configure do |config|
        config.file_list_exclusions = ['spec/controllers/jasmine_fixture_generation/*.rb']
        config.spec_directory_glob = 'spec/*'
        config.rspec_opts = '--profile --tag ~nginx --format progress'
        config.default_number_of_parts = 2
      end

* `file_list_exclusions` will exclude the following files or directories from running.
* `spec_directory_glob` allows you to choose which directories to include
* `rspec_opts` allows you to tack on rspec options to the `rspec` command.
* `default_number_of_parts` defaults to 4. This gets overridden by the second parameter in the command `rake spec:part[1,4]` but can be useful if you want to run a shortened version of the command: `rake spec:part[1]`

See the `rspec_parts.rake` file for the usage of configuration variables.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/hjhart/rspec-parts][rspec-parts]. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License][mit-license].

[mit-license]: http://opensource.org/licenses/MIT
[jasmine]: https://github.com/jasmine/jasmine-gem
[rspec]: https://github.com/rspec/rspec
[rspec-parts]: https://github.com/hjhart/rspec-parts
[blog-post]: http://building.wanelo.com/2015/11/09/2015-11-9-fully-utilize-your-travis-pro-resources.html
