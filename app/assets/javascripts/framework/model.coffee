class Framework.Model extends Framework.Module

  @create: (data) ->
    @ensureCollectionExist()

    new @(data)


  @ensureCollectionExist: ->
    @collection ?= {}


  constructor: (data) ->
    _.extend(@, data)
