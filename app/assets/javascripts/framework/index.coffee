#= require_self
#= require ./module
#= require_tree ./

@Framework = {}

@Framework.component = (componentName, options...) ->
  @components = {} unless @components?

  throw "Component name should be a string, #{typeof(componentName)} given." unless typeof(componentName) == 'string'

  componentName += '_component' unless !!/component$/i.exec(componentName)
  componentName = _(componentName).classify()

  # if we already create this component, just return it
  return @components[componentName] if @components[componentName]?

  # get component object
  componentObj = eval("App.#{componentName}")

  componentObj.setComponentName(componentName)

  # create, initialize and return component
  @components[componentName] = new componentObj(options...)