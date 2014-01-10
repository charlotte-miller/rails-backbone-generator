# $('form').serializeObject()
# => {name:'Craig', hobby:'Pro Pogo'}

$.fn.serializeObject = ->
  o = {}
  a = @serializeArray()
  $.each a, ->
    if o[@name] isnt `undefined`
      o[@name] = [o[@name]]  unless o[@name].push
      o[@name].push @value or ""
    else
      o[@name] = @value or ""

  o