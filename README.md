# Hebcal

This gem uses the REST api developed by the [Hebcal][hebcal] site to convert a Gregorian date to a Hebrew date.  It returns a text string of the Gregorian date followed by the Hebrew date in parenthesis like so:

10 June 1963 (18 Sivan 5723)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hebcal'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hebcal

## Usage

Basic usage:

```ruby
require 'hebcal'

HebCal.g2h(date) 

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hebcal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hebcal/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Hebcal project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hebcal/blob/master/CODE_OF_CONDUCT.md).
