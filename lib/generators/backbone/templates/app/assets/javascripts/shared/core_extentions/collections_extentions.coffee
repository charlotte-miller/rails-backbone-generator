class Backbone.ExtendedCollection extends Backbone.Collection
  
  # Backwards compatable interface update
  # Allows the Backbone.Collection#constructor to accept a single hash of attributes.
  # The 'models' attribute is used as the collection's enumerable
  #
  #   new Sample({
  #     models:[ model1, model2],
  #     title: 'great for factories'
  #   })
  #
  constructor: (models=[], other_options={})->
    unless models instanceof Array
      _(other_options).extend( _(models).tap (obj)-> 
        models = models.models
        delete obj.options 
      )
    
    # store attributes
    @attributes = _.clone @defaults || {}
    _.chain(@attributes).keys().each (attr)=>
      @attributes[attr]= other_options[attr] if other_options[attr]?
    
    # continue building obj
    super( models, other_options )
    
  
  toJSON: => { collection: @models }
  
  first: => @at(0)