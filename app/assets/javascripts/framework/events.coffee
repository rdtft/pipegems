Framework.Events = ->

  events = []


  bind: (event, callback) ->
    events[event] ?= []
    events[event].push(callback)


  trigger: (event, args...) ->
    callback.apply(null, args) for callback in events[event]


  unbind: (event, callback) ->
    # TODO: Find better way to do this (coz _.without returns copy)
    events[event] = _(events[event]).without(callback)