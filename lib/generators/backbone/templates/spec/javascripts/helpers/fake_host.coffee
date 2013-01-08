#= require_tree ../fixtures
#= require ../../../vendor/assets/javascripts/testing/sinon-1.4.2

# FakeHost.respond() to complete request
beforeEach ->
  
  localStorage.clear()
  window.FakeHost = sinon.fakeServer.create();
  #window.FakeHost.respondWith("GET", ShopCompare.routes.course_search_path(),   [200, { "Content-Type": "application/json" }, JSON.stringify( Fixtures.courses )] )
  window.FakeHost.respondWith("GET", new RegExp(ShopCompare.routes.section_books_path("[\\d]+$")), [200, { "Content-Type": "application/json" }, JSON.stringify( Fixtures.section )] )
  window.FakeHost.respondWith("GET", new RegExp(ShopCompare.routes.book_info_path({isbn : "[\\d]+$"})), [200, { "Content-Type": "application/json" }, JSON.stringify( Fixtures.book )] )
  window.FakeHost.respondWith("GET", ShopCompare.escapeRegExp(ShopCompare.offer_route("REG"), "REG", "[\\d]+"), [200, { "Content-Type": "application/json" }, JSON.stringify( Fixtures.offers )] )
  # window.FakeHost.respondWith("GET", /\/applications.json/,   [200, { "Content-Type": "application/json" }, JSON.stringify( Fixtures.rafter_apps )] )
  # window.FakeHost.respondWith("GET", new RegExp(ShopCompare.routes.sections_path() + "\\?keywords=[^&]*$"), [200, { "Content-Type": "application/json" }, JSON.stringify( Fixtures.courses )])
  # window.FakeHost.respondWith("GET", new RegExp(ShopCompare.routes.sections_path()), [200, { "Content-Type": "application/json" }, JSON.stringify( Fixtures.sections )])
  
afterEach ->
  window.FakeHost.restore()
