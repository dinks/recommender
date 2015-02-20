# Recommender

A Simple Recommender

[![Coverage Status](https://coveralls.io/repos/dinks/recommender/badge.svg)](https://coveralls.io/r/dinks/recommender)
[![Build Status](https://travis-ci.org/dinks/recommender.svg?branch=master)](https://travis-ci.org/dinks/recommender)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'recommender'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install recommender

## Usage

Add a `User` using

    u = ::Recommender::UserManager.find_or_create_user(1)
    u.add_product(1)
    u.add_product(2)
    u.add_product(3)

Once we have a bunch of `User`s, we could get the recommendations using

    ::Recommender::UserManager.recommendations_for(1) # Array with recommendation

### Example

In the `example` folder you could find an example for the code.

Run `./start.sh`. This will take the data from `sample.txt` and initialize the application. You could interact with the data using a CLI then.

Use `user USER_ID` and you will get the recommendations for the user with id **USER_ID**

## Contributing

1. Fork it ( https://github.com/[my-github-username]/recommender/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
