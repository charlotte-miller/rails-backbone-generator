beforeEach ->
  @addMatchers toBeEmpty: ->
    _(@actual).isEmpty()
  
  @addMatchers toBeA: (expeced) ->
    @actual instanceof expeced
  
  @addMatchers toBeValid: () ->
    @actual.isValid()

  # Non-recursive version of toContain()
  @addMatchers toInclude: (expeced) ->
    _(@actual).include(expeced)
