# RailsBackboneGenerator [![Gem Version](https://badge.fury.io/rb/rails-backbone-generator.png)](http://badge.fury.io/rb/rails-backbone-generator)  
Inspired by ``rails generate`` - Generates [Backbone.js](/documentcloud/backbone) models and collections with [BackboneFactory](/SupportBee/Backbone-Factory) and [Jasmine](/pivotal/jasmine) tests.  
The gem adds Backbone: [Setup](#backbonesetup) | [Namespace](#backbonenamespace) | [Model](#backbonemodel) | [Collection](#backbonecollection)


```  
    $ rails generate backbone_generator:collection Dashboard::Widget 
    
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
```
## Installation
Add this line to your application's Gemfile:

    gem 'rails-backbone-generator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails-backbone-generator




## Usage
The gem has three main generators (and one for setup):  
[backbone:setup](#backbonesetup) | [backbone:namespace](#backbonenamespace) | [backbone:model](#backbonemodel) | [backbone:collection](#backbonecollection)
```
$ rails g # for generate

  BackboneGenerator:
    backbone_generator:collection
    backbone_generator:model
    backbone_generator:namespace
    backbone_generator:setup
```


##  backbone:namespace
Creates a namespaced directory structure
```
$ rails g backbone_generator:namespace dashboard
  
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
```


##  backbone:collection
Creates a model and plural-collection 
```
$ rails g backbone_generator:collection Dashboard::Widgets

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
```


##  backbone:model
Creates a model w/out a collection
```
$ rails g backbone_generator:model Dashboard::Widget
  
  app/assets/javascript/dashboard
  └── models
      └── widget.coffee
  
  spec/javascripts/dashboard
  ├── factories
  │   └── widget_factory.coffee
  └── models
      └── widget_spec.coffee
```


##  backbone:setup
__[ Optional ]__: Prepares the app for Backbone/Jasmine development.
 * Vendors and requires core frameworks
 * Adds common plugins and Jasmine helpers 
 * Configures Jasmine and adds a Guard file.   Run ``bundle exec guard`` to run tests.
 
__Runtime Dependency__  
  ``brew install qt --build-from-source`` [\[ Details \]](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit)
  * required to run Jasmine specs with guard-jasmine-headless-webkit
  * other generators do not require this option

```
$ rails g backbone_generator:setup
      
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
      
```
## Factories
Similar to ruby's FactoryGirl, [BackboneFactory](/SupportBee/Backbone-Factory) adds factories to Jasmine.js.  
The generator adds ``Factory.model_name({optional:override})`` and ``Factory.collection_name({optional:override})``  
```
  # spec/javascripts/dashboard/factories/widget_factory.coffee
  
  BackboneFactory.define 'widget', Dashboard.Models.Widget, ->
    reminder:  'Remember to update with attributes'
        hint:  'attributes can be other factories'
```

## External Docs
**[Backbone.js](http://backbonejs.org/)** and it's foundation **[Underscore.js](http://underscorejs.org/)**
* [Backbone Relational](http://backbonerelational.org/): Associations for Backbone Models <tt>Bundle.get('books')</tt>
* [Backbone Query](https://github.com/davidgtonge/backbone_query#usage): A query DSL inspired by MongoDB. Includes matchers, logical operators, sorting, and paging.
* [Backbone BindTo](https://github.com/RStankov/backbone-bind-to#backbonebindto): Cleans-up the pattern of adding and *removing* event listeners to <tt>Backbone.Views</tt>
* [Backbone Handlebars](https://github.com/RStankov/backbone-handlebars/blob/master/README.md#backbonehandlebars): Extension for better integration with [Handlebars.js](http://handlebarsjs.com/) including nested views  

**[Handlebars JS Templates](http://handlebarsjs.com/)**
* [Handlebars TextMate Bundle](https://github.com/drnic/Handlebars.tmbundle)

**[Jasmine.js](http://pivotal.github.com/jasmine/)** | [Cheat Sheat](https://github.com/mattfysh/cheat-sinon-jasmine)
* [Backbone Factory](https://github.com/SupportBee/Backbone-Factory#backbone-factory)
* [Jasmine Jquery](https://github.com/velesin/jasmine-jquery/)
* [Sinon](http://sinonjs.org/): Spies, stubs, mock ajax, and time/animation
* [Sinon-Jasmine](https://github.com/froots/jasmine-sinon#sinonjs-matchers): Test expectations for mocks and stubs

**Best Practices**: [Backbone Patterns](http://ricostacruz.com/backbone-patterns/)  
**Testing Backbone**: [Part 1: Introduction](http://tinnedfruit.com/2011/03/03/testing-backbone-apps-with-jasmine-sinon.html) | [Part 2: Models & Collections](http://tinnedfruit.com/2011/03/25/testing-backbone-apps-with-jasmine-sinon-2.html) | [Part 3: Routers & Views](http://tinnedfruit.com/2011/04/26/testing-backbone-apps-with-jasmine-sinon-3.html)  
**Hackers Guide to Backbone**: [Part 1: Models & Events](http://dailyjs.com/2012/07/19/mvstar-2/) | [Part 2: Collections](http://dailyjs.com/2012/07/26/mvstar-3/) | [Part 3: Router and History](http://dailyjs.com/2012/08/02/mvstar-4/) | [Part 4: Sync](http://dailyjs.com/2012/08/09/mvstar-5/)



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO
add jasmine to config/routes.rb  # mount JasmineRails::Engine => "/specs" unless Rails.env.production?

<hr/>
[![Rafter.com Logo](https://raw.github.com/chip-miller/rails-backbone-generator/images/images/rafter.png "Rafter.com")](http://http://www.rafter.com/)
RailsBackboneGenerator is maintained by [Chip Miller](/chip-miller) and and funded by [Rafter](http://http://www.rafter.com/)

