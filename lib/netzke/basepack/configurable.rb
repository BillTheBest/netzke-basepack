module Netzke
  module Basepack
    module Configurable
      extend ActiveSupport::Concern

      included do
        plugin :config_tool, :class_name => "Netzke::Basepack::ConfigTool"
      end

      module ClassMethods
        def configurable(config)
          items = config[:with].size.times.map{ |i| "panel_#{i}" }.map{ |i| i.to_sym.component }
          components = config[:with].each_with_index.inject({}){ |r,(p,i)| r.merge("panel_#{i}" => p) }

          component :config_window,
            :class_name => "Netzke::Basepack::Window",
            :width => 500,
            :layout => :accordion,
            :layout_config => {:animate => true},
            :items => items,
            :components => components
        end
      end
    end
  end
end