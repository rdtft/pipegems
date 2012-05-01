class Framework.Controller extends Framework.Module

  @setControllerName: (@controllerName) -> @prototype.controllerName = @controllerName
  @setComponent: (@component) -> @prototype.component = @component

  @modules: (args...) ->
    @::attachedModules = if _(args[0]).isArray()
      args[0]
    else if /\s/.test(args[0])
      args[0].split(/\s/)
    else if /\n/.test(args[0])
      args[0].split(/\n/)
    else
      args


  constructor: ->
    @initializeModules()

    super


  destructor: ->
    module.destroy?() for own module of @modules

    destroy?()


  initializeModules: ->
    return unless @attachedModules?

    @modules ?= {}

    componentClass = _(@componentName).classify() + 'Component'

    for module in @attachedModules
      do (module) =>

        options    = {}
        moduleStr  = _(module).classify()
        moduleName = moduleStr + 'Module'

        if (initializeFn = @['initialize' + moduleStr])?
          canceled = false
          returned = initializeFn(cancel: -> canceled = true)

          options = returned if typeof returned == 'object'

          return if canceled

        if not (moduleClass = window[componentClass][moduleName])? and
           not (moduleClass = Shared[moduleName])?

          for key, namespace of Shared
            moduleClass = namespace[moduleName] if namespace[moduleName]?

        unless moduleClass?
          throw "Module \"#{moduleName}\" is not found"

        moduleAPI = @modules[_(module).camelize()] = moduleClass(options)

        @bindModuleEvents(moduleAPI, moduleStr)

        moduleAPI.afterBinds?()


  bindModuleEvents: (moduleAPI, moduleStr) ->
    re = new RegExp("on#{moduleStr}(.+)")

    for fnName, callback of @constructor.prototype

      continue if not _(callback).isFunction() or not re.test(fnName)

      event = _(fnName.match(re)[0]).underscored()
      moduleAPI.bind(event, _(callback).bind(@))


  pub: ->
    pub.apply(null, arguments)


  sub: (message, fn, priority = 10) ->
    sub(message, @, fn, priority)


  unsub: (message, fn) ->
    unsub(message, fn)
