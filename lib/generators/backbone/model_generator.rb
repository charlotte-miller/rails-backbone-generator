require 'rails/generators'

module Backbone
  class ModelGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc "Creates a BackboneModel, Jasmine tests/factory"
    argument :raw_model_name, required: true, type: 'string'
      
    def create_model
      destination_dir = File.join( ['app/assets/javascripts', namespace, "#{model_name}.coffee"].compact )
      template 'app/assets/javascripts/%namespace%/models/%model_name%.coffee.tt', destination_dir
    end
    
    def create_specs
      destination_dir = File.join( ['spec/javascripts', namespace].compact )
      directory 'spec/javascripts/%namespace%', destination_dir
    end
    
    # removes %un-namespaced% files
    def cleanup
      ['app/assets/javascripts', 'spec/javascripts'].each do |base|
        Dir.glob("#{base}/**/*%*").each do |file|
          remove_file( file )
        end
      end
    end
    
    # Helpers
    def namespace(classify=false)
      @model_name, @namespace = raw_model_name.split('::').reverse
      style = classify ?  :classify : :underscore
      @namespace.singularize.send(style)
    end

    def model_name(classify=false)
      @model_name, @namespace = raw_model_name.split('::').reverse
      style = classify ?  :classify : :underscore
      @model_name.singularize.send(style)
    end
    
    def collection_name(classify=false)      
    end
        
  end
end