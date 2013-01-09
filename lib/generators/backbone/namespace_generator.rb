# encoding: utf-8
require 'rails/generators'
require 'find'

module Backbone
  class NamespaceGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc "Setup a Backbone namespace"
    argument :raw_namespace, :type => :string, :required => true
    
    def setup_dir_structure
      Dir.glob(File.join(source_paths, "**/.gitkeep")) do |keep_path|  
        template keep_path, keep_path.gsub(/^.*backbone\/templates\//, "")
      end
      
      # build and require a namespace initializer
      template "app/assets/javascripts/%namespace%.coffee.tt", "app/assets/javascripts/%namespace%.coffee"
      path = File.join(destination_root, 'app/assets/javascripts/application.js')
      content =(
        if behavior == :revoke  # destroy
          File.read(path).sub(/\/\/= require \.\/#{namespace}\n/, '')
        else
          File.read(path).sub(/(^\/\/[\S| ]*\n)([^\/])/) do |match|
            "#{match.strip}\n//= require ./#{namespace}\n\n"
          end
        end  )
      File.open(path, 'wb') { |file| file.write(content) }
      say_status :gsub, 'app/assets/javascripts/application.js'
    end
    
    def ensure_namespaced_app_dir # :nodoc:
      # directory 'app/assets/javascripts'
      # add to application.js
            
    end
    
    # def ensure_namespaced_spec_dir # :nodoc:
    #   Dir.glob(File.join(source_paths, "app/assets/javascripts/**/.gitkeep")) do |keep_path|  
    #     template keep_path, keep_path.gsub(/^.*backbone\/templates\//, "")
    #   end
    #   directory 'spec/javascripts'
    # end
        
    def print_tree
      tree = <<-TREE
      
      app/assets/javascripts/dashboard
      │   ├── collections
      │   ├── models
      │   ├── routes
      │   ├── templates
      │   └── views
      └── dashboard.coffee


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