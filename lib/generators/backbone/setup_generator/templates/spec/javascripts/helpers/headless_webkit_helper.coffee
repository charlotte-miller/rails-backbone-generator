is_headless = ->
  /jasmine-headless-webkit/.test(navigator.userAgent)


if is_headless()
  # Things that need to change here

else
  jasmine.getFixtures().fixturesPath = 'assets/javascripts/fixtures'