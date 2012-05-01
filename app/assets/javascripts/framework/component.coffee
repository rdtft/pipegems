class Framework.Component extends Framework.Module

  @setComponentName: (@componentName) -> @prototype.componentName = @componentName

  controller: (controllerName, options...) ->
    throw "Controller name should be a string, #{typeof(controllerName)} given." unless typeof(controllerName) == 'string'

    # bring controllerName to 'SomeNameController' like
    controllerName += '_controller' unless !!/controller$/i.exec(controllerName)
    controllerName = _(controllerName).classify()

    # get controller object
    controllerObj = eval("App.#{@componentName}.#{controllerName}")

    controllerObj.setComponent(@)
    controllerObj.setControllerName(controllerName)

    # create, initialize and return controller
    new controllerObj(options...)

  view: (viewName, options...) ->
    throw "View name should be a string, #{typeof(viewName)} given." unless typeof(viewName) == 'string'
    viewName += '_view' unless !!/view$/i.exec(viewName)
    viewName = _(viewName).classify()
    viewObj = eval("App.#{@componentName}.#{viewName}")
    viewObj.setComponent(@)
    viewObj.setViewName(@viewName)
    new viewObj(options...)

  pub: ->
    pub.apply(null, arguments)


  sub: (message, fn, priority = 10) ->
    sub(message, @, fn, priority)


  unsub: (message, fn) ->
    unsub(message, fn)
