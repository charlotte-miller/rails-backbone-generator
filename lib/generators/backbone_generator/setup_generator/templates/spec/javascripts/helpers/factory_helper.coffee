# =======================================================
# =  FactoryGirl Interface:                             =
# =  Factory.modelName( {overrides:here} )              =
# =======================================================
window.refreshFactoryInterface = ->
  _(window.Factory ||= {}).extend((->
    factories = [{}].concat _(BackboneFactory.factories).keys()
    _(factories).inject (memo, factory)->
      memo[factory]= (overrides)-> BackboneFactory.create factory, -> overrides
      memo
    )()
  )

refreshFactoryInterface()