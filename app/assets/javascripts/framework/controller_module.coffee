Framework.ControllerModule = (moduleFn) ->

  # Return controller module constructor
  (options = {}) =>
    api       = new Framework.Module()
    moduleApi = moduleFn(api, options)

    # Return module public API extended with Framework.Module
    _.extend({}, api, moduleApi)
