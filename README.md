# MikutterPluginBase

Add new way to write mikutter plugin.

## Installation

Add this line to your mikutter's Gemfile:

    gem 'mikutter_plugin_base'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mikutter_plugin_base

Finally execute mikkuter with bundled gems:

    $ bundle exec ruby mikkuter.rb

## Usage

```ruby
# path/to/mikutter/plugin/dir/sample.rb
require 'mikutter_plugin_base'

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

## Detail
This gem just convert your plugin code.

Plugin like this code goes...
```ruby
class SamplePlugin < Mikutter::PluginBase
  def run(plugin)
    @data_store = setup
  end

  def on_update(service, messages)
    messages.each do |msg|
      @data_store.save msg
    end
  end
end

SamplePlugin.register!
```

like this.
```ruby
Plugin.create :sample_plugin do |plugin|
  @data_store = setup

  on_update do |service, messages|
    messages.each do |msg|
      @data_store.save msg
    end
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
