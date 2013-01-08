# encoding: utf-8
require 'rails/generators'

module Backbone
  class SetupGenerator < Rails::Generators::Base
    source_root File.expand_path('setup_generator/templates', __FILE__)
    desc "Setup a Backbone Application"
    
    
    
    def print_tree
      tree = <<-TREE
      
      app/assets/javascripts
      ├── application.js
      └── shared
          ├── core_extentions
          │   └── collections_extentions.coffee
          ├── helpers
          └── utils
      
      spec/javascripts
      [ TODO ]
      
      vendor/javascripts
      [ TODO ]
      TREE
    end
  end
end