beforeEach ->
  @addMatchers toHaveAssociated: (expectedAssociation) ->
    @actual.get(expectedAssociation)?
