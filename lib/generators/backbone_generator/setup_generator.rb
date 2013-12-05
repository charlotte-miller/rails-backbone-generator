# encoding: utf-8
require 'rails/generators'

module BackboneGenerator
  class SetupGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../setup_generator/templates', __FILE__)
    desc "Setup a Backbone Application"

    def setup_app
      directory '.'
    end

    def add_development_gems
      testing_gems = <<-TESTING_GEMS

group :development, :test do

  # Jasmine
  gem 'jasmine-rails'
  gem 'jasmine-headless-webkit', '~> 0.8.4'

  # Guard
  gem 'growl'
  gem 'rb-fsevent'
  gem 'guard-rspec'
  gem 'guard-jasmine-headless-webkit'  # brew install qt --build-from-source
end

group :test do
  gem 'therubyracer', :platform => :ruby
end
TESTING_GEMS

      append_to_file 'Gemfile', testing_gems
      say testing_gems
      run 'bundle'# in_root { `bundle` }
    end

    def print_tree
      tree = <<-TREE
      Gemfile (updated)
      Guardfile

      app/assets/javascripts
      ├── application.js
      └── shared
          ├── core_extentions
          │   └── collections_extentions.coffee
          ├── helpers
          └── utils

      spec/javascripts/
      ├── fixtures
      ├── helpers
      │   ├── association_helpers.coffee
      │   ├── common_helpers.coffee
      │   ├── fake_host.coffee
      │   └── headless_webkit_helper.coffee
      └── support
          └── jasmine.yml

      vendor/javascripts/
      ├── backbone
      │   ├── backbone-1.1.0.js
      │   ├── backbone-bind-to-1.1.0.coffee
      │   ├── backbone-handlebars-1.0.0.coffee
      │   ├── backbone-query-0.2.3.coffee
      │   ├── backbone-relational-0.8.6.js
      │   ├── handlebars-1.1.2.js
      │   └── underscore-1.5.2.js
      ├── browser_compatibility
      │   ├── json2.js
      │   └── localstorage-polyfill.js
      ├── jquery
      │   ├── jquery-1.10.2.js
      │   ├── jquery-ui-1.10.3.js
      │   ├── jquery.easing-1.3.js
      │   └── jquery_ujs.js
      └── testing
          ├── backbone-factory.js
          ├── jasmine-jquery-1.5.93.js
          ├── jasmine-sinon-0.2.1.js
          ├── mock-ajax-2.0.0.js
          └── sinon-1.7.3.js
      TREE
      say tree
    end


  end
end