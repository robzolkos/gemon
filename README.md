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

## Security

To secure your genom endpoint, create an initializer in your Rails app eg `config/initializers/genom.rb`

Add a Genom.api_key to config/initializer file.

```
Genom.api_key = "123456" # random string
```

Then when calling the endpoint add the key to the request.

```
/appstatus?key=123456
```

If the key isn't set then there is no security on the endpoint.

## Contributing

1. Fork it ( http://github.com/robzolkos/gemon/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## ToDo

1. More tests
2. A generator to generate the initializer file and fill it with a random key.
3. More documentation on what results are returned.
