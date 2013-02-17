# -*- coding: utf-8 -*-
require 'spec_helper'

describe Mikutter::PlugingBase do
  describe '.to_plugin_name' do
    it "should convert CamelCase class name to underscore symbol for plugin name" do
      Mikutter::PlugingBase.to_plugin_name("CamelCase").should == :camel_case
    end
  end
end
