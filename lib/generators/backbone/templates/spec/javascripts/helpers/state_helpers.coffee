beforeEach ->
  @addMatchers toHaveState: (expectedState) ->
    state = @actual.get('currentState')
    state is expectedState