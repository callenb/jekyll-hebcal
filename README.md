# Jekyll Hebcal Tag

A simple tag for Jekyll sites that given a Gregorian date it renders text string of the Gregorian date followed by the Hebrew date in parenthesis like so:

10 June 1963 (18 Sivan 5723)

At the moment, it uses the REST api provided by the [Hebcal](https://www.hebcal.com/home/developer-apis) site to convert a Gregorian date to a Hebrew date.

## Installation

Add this line to your Gemfile:

```ruby
group :jekyll_plugins do
  gem 'jekyll-hebcal'
end
```

And then execute:

    $ bundle

Alternatively install the Gem yourself as:

    $ gem install jekyll-hebcal

and put this in your ``_config.yml``

```yaml
plugins: [jekyll-hebcal]
 # This will require each of these gems automatically
```

## Usage
```
{% hebcal "10 June 1963" %}
```

## Result

"10 June 1963 (18 Sivan 5723)"

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).