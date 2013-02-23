# -*- coding: utf-8 -*-
require 'active_support/inflector'
require 'mikutter_plugin_base/version'

module Mikutter
  class PluginBase
    class << self
      def register!
        instance = new
        procedure = lambda do |plugin|
          instance.method(:run).to_proc.call(
            instance.method(:add_events).to_proc.call(plugin)
          )
        end
        ::Plugin.create to_plugin_name(self.class.to_s), &procedure
      end

      def to_plugin_name(class_name)
        class_name.underscore.to_sym
      end
    end

    def add_events(plugin)
      methods.each do |name|
        case name.to_s
        when /^on_?(.+)$/
          plugin.add_event $1, &method(name).to_proc
        when /^filter_?(.+)$/
          plugin.add_event_filter $1, &method(name).to_proc
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
