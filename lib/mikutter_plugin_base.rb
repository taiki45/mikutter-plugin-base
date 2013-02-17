require "mikutter_plugin_base/version"

module Mikutter
  class PlugingBase
    class << self
      def register!
        name = self.class.to_s.downcase.to_sym
        instance = new
        procedure = lambda do |plugin|
          instance.method(:run).to_proc.call(
            instance.method(:add_events).to_proc.call(plugin)
          )
        end
        ::Plugin.create name, &procedure
      end
    end

    def add_events(plugin)
      methods.each do |name|
        case name.to_s
        when /^on_?(.+)$/
          plugin.add_event $1, &method(name).to_proc
        when /^filter_?(.+)$/
          plugin.add_filter $1, &method(name).to_proc
        when /^hook_?(.+)$/
          plugin.add_event_hook $1, &method(name).to_proc
        end
      end
      plugin
    end

    def run(plugin)
      raise NotImplementedError
    end
  end
end
