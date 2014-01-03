unless console? && console.log? # Bugfix for browsers without console.log
  console.log = ->

class Shared.Utils.Logger

  constructor: (@environment) ->
    @noisy = localStorage['logger_noisy']?
    @silentModes = _(['production', 'test'])
    @alwaysPrint = _(['error', 'debug'])

    if @noisy
      dashes = ('-' for each in [1..@environment.length]).join('')
      console.log("----------------------#{dashes}-----")
      console.log("Logger initialized in #{@environment} mode")
      console.log("----------------------#{dashes}-----")

  log: (type, input) ->
    return if @silentModes.include(@environment) && !@alwaysPrint.include(type)

    output = for msg in _.toArray(input)
      prefix = [type.toUpperCase()]
      prefix.push('RAW') if typeof(msg) == 'object'
      if typeof(msg) is 'function'
        msg.call()
      else
        console.log("#{prefix.join(' ')}:", msg)
    undefined

  verbose: ->
    @log('verbose', arguments) if @noisy

  info: ->
    @log('info', arguments)

  fixme: ->
    @log('fixme', arguments)

  debug: ->
    @log('debug', arguments)

  warn: ->
    @log('warn', arguments)

  error: ->
    @log('error', arguments)

  verbose_mode: (on_off) ->
    if on_off
      localStorage['logger_env']= 'development'
      localStorage['logger_noisy'] = true
      'Verbose Mode ON'
    else
      localStorage.removeItem('logger_env')
      localStorage.removeItem('logger_noisy')
      'Verbose Mode OFF'
