require 'rails/generators'

module Backbone
  class CollectionGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc "Creates a BackboneModel, BackboneCollection, & Jasmine tests/factory"
    argument :raw_collection_name, required: true, type: 'string'

    def parse_and_ensure_namespace
      # Namespace::Object
      
    end
    
    def collection_name(classify=false)
      style = classify ?  :classify : :underscore
      raw_collection_name.pluralize.send(style)
    end
  end
end