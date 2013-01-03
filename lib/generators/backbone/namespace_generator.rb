require 'rails/generators'
require 'find'

module Backbone
  class NamespaceGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc "Setup a Backbone namespace"
    argument :raw_namespace, :type => :string, :required => true
    
    def ensure_namespaced_app_dir # :nodoc:
      directory 'app/assets/javascripts'
      
      # add to application.js
      append_to_file 'app/assets/javascripts/application.js', "\n\n"
      gsub_file 'app/assets/javascripts/application.js', /\/\/.*\n\s/ do |match|
        match.sub /\n\s/, "\n//= require ./#{namespace}\n\n"
      end
    end
    
    def ensure_namespaced_spec_dir # :nodoc:
      directory 'spec/javascripts'
    end
    
    # removes %un-namespaced% files
    def cleanup
      ['app/assets/javascripts', 'spec/javascripts'].each do |base|
        Dir.glob("#{base}/**/*%*").each do |file|
          remove_file( file )
        end
      end
    end
    
    def namespace(classify=false)
      style = classify ?  :camelize : :underscore
      raw_namespace.send(style)
    end
    
    # [:model_name, :collection_name].each {|m| define_method m }
    def model_name(classify=false)
    end
    
    def collection_name(classify=false)
    end
  end
end