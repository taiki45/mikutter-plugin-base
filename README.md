# MikutterPluginBase

Add new way to write mikutter plugin.

## Installation

Add this line to your application's Gemfile:

    gem 'mikutter_plugin_base'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mikutter_plugin_base

## Usage

```ruby
#path/to/mikutter/plugin/dir/sample.rb
class Sample < Mikutter::PluginBase
  def run(plugin)
    "write your code here."
    "you can access mikutter plugin api via `plugin`."
  end

  def on_update(service, messages)
    "define mikutter event callbacks, hooks, filters as method."
    "plugin base will automatically add them."
  end
end

# at last of your plugin script do `resister!`
Sample.register!
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
