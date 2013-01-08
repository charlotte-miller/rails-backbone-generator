# RailsBackboneGenerator
Inspired by ``rails generate`` - Generates Backbone.js models and collections with BackboneFactory and Jasmine tests.
``  
    $ rails generate backbone:collection Dashboard::Widget 
    
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
``
## Installation

Add this line to your application's Gemfile:

    gem 'rails_backbone_generator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_backbone_generator

## Usage
The gem has three generators:
``
$ rails g # for generate

  Backbone:
    backbone:collection
    backbone:model
    backbone:namespace
``
h2 backbone:namespace
Creates a namespaced directory structure
``
$ rails g backbone:namespace dashboard
  
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
``

h2 backbone:collection
Creates a model and plural-collection 
``
$ rails g backbone:collection Dashboard::Widgets

  app/assets/javascripts/dashboard
  ├── collections
  │   └── widgets.coffee
  └── models
      └── widget.coffee
  
  spec/javascripts/dashboard/
  ├── collections
  │   └── widgets_spec.coffee
  ├── factories
  │   └── widget_factory.coffee
  └── models
      └── widget_spec.coffee
``


h2. backbone:model
Creates a model w/out a collection
``
$ rails g backbone:model Dashboard::Widget
  create  app/assets/javascripts/dashboard/widget.coffee
  create  spec/javascripts/dashboard/factories/widget_factory.coffee
  create  spec/javascripts/dashboard/models/widget_spec.coffee
  
  app/assets/javascript/dashboard
  └── models
      └── widget.coffee
  
  spec/javascripts/dashboard
  ├── factories
  │   └── widget_factory.coffee
  └── models
      └── widget_spec.coffee
  
  
``
## Factories
Similar to ruby's FactoryGirl, BackboneFactory adds factories to Jasmine.js.  ``Factory.widget({ options:obj })  #=> Backbone.Model``
The generator adds ``Factory.model_name({optional:override})`` and Factory.collection_name({optional:override})
``
  # spec/javascripts/dashboard/factories/widget_factory.coffee
  
  BackboneFactory.define 'widget', Dashboard.Models.Widget, ->
    reminder:  'Remember to update with attributes'
        hint:  'attributes can be other factories'
``



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
