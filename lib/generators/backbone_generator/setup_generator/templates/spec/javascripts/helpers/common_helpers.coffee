beforeEach ->
  @addMatchers toBeEmpty: ->
    @message = -> "Expected #{_(@actual).value().constructor.name} to be empty"
    _(@actual).isEmpty()
  
  @addMatchers toBeA: (expected) ->
    value = _(@actual).value()
    @message = -> "Expected #{value.constructor.name} to be a #{expected.name}"
    switch expected  # handle inconsistent instanceof interface
      when String then value.constructor.name == "String"
      when Number then value.constructor.name == "Number"
      else value instanceof expected
  
  @addMatchers toBeValid: () ->
    @message = -> "Expected #{_(@actual).value().constructor.name} to be valid"
    @actual.isValid()
  
  # Non-recursive version of toContain()
  @addMatchers toInclude: (expected) ->
    @message = -> "Expected the collection to include #{_(@actual).value().constructor.name}"
    _(@actual).include(expected)
  
