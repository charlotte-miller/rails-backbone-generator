# encoding: utf-8
require 'rails/generators'

module Backbone
  class CollectionGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc "Creates a BackboneModel, BackboneCollection, & Jasmine tests/factory\nrails g backbone:collection Navigation::Buttons"
    argument :raw_collection_name, required: true, type: 'string'

    def create_collection
      destination_dir = File.join( ['app/assets/javascripts', namespace, 'collections', "#{collection_name}.coffee"].compact )
      template 'app/assets/javascripts/%namespace%/collections/%collection_name%.coffee.tt', destination_dir
    end
    
    def create_model
      destination_dir = File.join( ['app/assets/javascripts', namespace, 'models', "#{model_name}.coffee"].compact )
      template 'app/assets/javascripts/%namespace%/models/%model_name%.coffee.tt', destination_dir
    end
    
    def create_specs
      destination_dir = File.join( ['spec/javascripts', namespace].compact )
      spec_paths = ['collections/%collection_name%_spec.coffee', 'factories/%model_name%_factory.coffee', 'models/%model_name%_spec.coffee']
      spec_paths.each do |path|
        template "spec/javascripts/%namespace%/#{path}.tt", "spec/javascripts/%namespace%/#{path}"
      end
    end
    
    def print_tree
      tree =  <<-TREE
        
        app/assets/javascripts/dashboard
        ├── collections
        │   └── widgets.coffee
        └── models
            └── widget.coffee

        spec/javascripts/dashboard
        ├── collections
        │   └── widgets_spec.coffee
        ├── factories
        │   └── widget_factory.coffee
        └── models
            └── widget_spec.coffee
      TREE
      say tree.gsub(/dashboard/, namespace.to_s).gsub(/widget/, model_name)
    end
    
    # Helpers
    def collection_name(classify=false)
      style = classify ?  :camelize : :underscore
      _collection_name, _namespace = raw_collection_name.split('::').reverse
      _collection_name.pluralize.send(style)
    end
    
    def namespace(classify=false)
      style = classify ?  :camelize : :underscore
      _collection_name, _namespace = raw_collection_name.split('::').reverse
      _namespace && _namespace.singularize.send(style)
    end

    def model_name(classify=false)
      collection_name(classify).singularize
    end
  end
end