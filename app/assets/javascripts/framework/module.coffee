class Framework.Module

  ## Class functions

  @delegate: (args..., options) ->
    for fnName in args
      do (fnName) =>
        @::[fnName] = -> @[options.to][fnName].apply(@[options.to], arguments)


  @delegate('bind', 'unbind', 'trigger', to: 'events')

  ## Instance functions

  constructor: ->
    @uid = _.uniqueId('.')

    # TODO: Move creation of Events to @delegate:
    #       @delegate(..., to: -> Framework.Events())
    @events = Framework.Events()

    @initialize?.apply(@, arguments)
