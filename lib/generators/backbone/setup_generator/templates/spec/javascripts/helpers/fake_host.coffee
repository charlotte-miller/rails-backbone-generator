#= require_tree ../fixtures
#= require ../../../vendor/assets/javascripts/testing/sinon-1.4.2

# FakeHost.respond() to complete request
beforeEach ->
  
  localStorage.clear()
  window.FakeHost = sinon.fakeServer.create();
  # window.FakeHost.respondWith("GET", Dashboard.Routes.widget_search_path(),   [200, { "Content-Type": "application/json" }, JSON.stringify( Fixtures.search_results )] )
  # window.FakeHost.respondWith("GET", new RegExp(Dashboard.Routes.widget_search_path("[\\d]+$")), [200, { "Content-Type": "application/json" }, JSON.stringify( Fixtures.search_results )] )

  
afterEach ->
  window.FakeHost.restore()
