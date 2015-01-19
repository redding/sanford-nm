# Sanford::Nm

[Sanford](https://github.com/redding/sanford) template engine for rendering [Nm](https://github.com/redding/nm) templates

## Usage

Register the engine:

```ruby
require 'sanford'
require 'sanford-nm'

Sanford.configure do |c|

  c.template_source "/path/to/templates" do |s|
    s.engine 'nm', Sanford::Nm::TemplateEngine
  end

end
```

Add `.nm` to any template files in your template source path.  Sanford will render their content using Nm when they are rendered.

### Notes

Nm doesn't allow overriding the template scope but instead allows you to pass in data that binds to the template scope as methods.  By default, the service handler will be bound to Nm's scope via the `view` method in templates.  If you want to change this, provide a `'handler_local'` option when registering:

```ruby
  c.template_source "/path/to/templates" do |s|
    s.engine 'nm', Sanford::Nm::TemplateEngine, 'handler_local' => 'service_handler'
  end
```

Nm doesn't cache templates by default.  To enable caching, pass a `'cache'` option when registering:

```ruby
  c.template_source "/path/to/templates" do |s|
    s.engine 'nm', Sanford::Nm::TemplateEngine, 'cache' => true
  end
```

## Installation

Add this line to your application's Gemfile:

    gem 'sanford-nm'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sanford-nm

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
