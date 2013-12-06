# Gemon

Securely report your production Rails server settings.

## Installation

Add this line to your application's Gemfile:

    gem 'gemon'

And then execute:

    $ bundle

## Usage

Mount the Gemon server in your `config/routes.rb` file.

```
mount Gemon::Server, at: "/appstatus"
```

In the above example the json data will be available on /appstatus in your Rails app.


## Contributing

1. Fork it ( http://github.com/robzolkos/gemon/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
