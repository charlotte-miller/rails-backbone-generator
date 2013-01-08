# encoding: utf-8
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
        Dir.glob("#{base}/**/__delte__*").each do |file|
          remove_file( file )
        end
      end
    end
    
    def print_tree
      tree = <<-TREE
      
      app/assets/javascripts/dashboard
      │   ├── collections
      │   ├── models
      │   ├── routes
      │   ├── templates
      │   └── views
      ├── dashboard.coffee
      ├── application.js
      └── shared
          ├── core_extentions
          │   └── collections_extentions.coffee
          ├── helpers
          └── utils

      spec/javascripts/dashboard/
      ├── collections
      ├── factories
      ├── models
      └── views
      TREE
      say tree.gsub(/dashboard/, namespace).gsub(/widget/, model_name)
    end
    
    def namespace(classify=false)
      style = classify ?  :camelize : :underscore
      raw_namespace.send(style)
    end
    
    def model_name(classify=false); '__delte__' ;end
    def collection_name(classify=false); '__delte__' ;end
  end
end