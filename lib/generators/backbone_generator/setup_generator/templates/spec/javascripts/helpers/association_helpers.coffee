beforeEach ->
  @addMatchers toHaveAssociated: (expectedAssociation) ->
    @message = -> "Expected #{_(@actual).value().constructor.name} to have the association #{expectedAssociation}"
    @actual.get(expectedAssociation)?
