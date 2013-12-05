# encoding: utf-8
require 'rails/generators'

module BackboneGenerator
  class ModelGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc "Creates a BackboneModel, Jasmine tests/factory"
    argument :raw_model_name, required: true, type: 'string'

    def create_model
      destination_dir = File.join( ['app/assets/javascripts', namespace, "models/#{model_name}.coffee"].compact )
      template 'app/assets/javascripts/%namespace%/models/%model_name%.coffee.tt', destination_dir
    end

    def create_specs
      destination_dir = File.join( ['spec/javascripts', namespace].compact )
      spec_paths = ['factories/%model_name%_factory.coffee', 'models/%model_name%_spec.coffee']
      spec_paths.each do |path|
        template "spec/javascripts/%namespace%/#{path}.tt", "spec/javascripts/%namespace%/#{path}"
      end
    end

    def print_tree
      tree =  <<-TREE

        app/assets/javascript/dashboard
        └── models
            └── widget.coffee

        spec/javascripts/dashboard
        ├── factories
        │   └── widget_factory.coffee
        └── models
            └── widget_spec.coffee
      TREE
      say tree.gsub(/\/dashboard/, namespace.to_s).gsub(/widget/, model_name)
    end

    # Helpers
    def namespace(classify=false)
      @model_name, @namespace = raw_model_name.split('::').reverse
      style = classify ?  :camelize : :underscore
      @namespace && @namespace.singularize.send(style)
    end

    def model_name(classify=false)
      @model_name, @namespace = raw_model_name.split('::').reverse
      style = classify ?  :camelize : :underscore
      @model_name.singularize.send(style)
    end

    def collection_name(classify=false)
    end

  end
end