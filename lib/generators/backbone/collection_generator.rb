require 'rails/generators'

module Backbone
  class CollectionGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc "Creates a BackboneModel, BackboneCollection, & Jasmine tests/factory"

    def hello_world # :nodoc:
      say "We Found It!"
    end

  end
end