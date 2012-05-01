JQUERY_EVENTS = '''
  blur
  change
  click
  dblclick
  focus
  focusin
  focusout
  keydown
  keypress
  keyup
  load
  mousedown
  mouseenter
  mouseleave
  mousemove
  mouseout
  mouseover
  mouseup
  ready
  resize
  scroll
  select
  submit
  unload
'''.split("\n")

CALLBACK_REGEXP = /([a-z]+)(?:On|Of|To|From|In)([A-Z].*)/

class Framework.View extends Framework.Module

  @delegate('appendTo', 'append', 'prepend', 'prependTo', to: 'el')

  @setViewName: (@viewName) -> @prototype.viewName = @viewName
  @setComponent: (@component) -> @prototype.component = @component

  constructor: ->
    if not @componentName? and @component?
      @componentName = _(
        @component.componentName.replace('Component', '')
      ).underscored()

    @templatesPaths = @getTemplatesPaths()
    @buildHelpersObject()
    super


  # Returns paths to templates
  getTemplatesPaths: ->
    sharedPaths = _(JST)
      .chain()
      .map((v, k) ->
        k.match(/(.+\/).+$/)[1] if k.match('app/components/shared')
      )
      .uniq()
      .compact()
      .value()

    _.union(
      ["app/components/#{@componentName}/templates/"]
      sharedPaths
    )


  # Build helpers object
  buildHelpersObject: ->
    @helpersObject = {}

    _(@helpersObject).extend(@getPartialsHelper())

    for componentName, componentClass of App
      for className, klass of componentClass
        _(@helpersObject).extend(klass) if /^.+Helper$/.test(className)


  # Returns object with partials mechanism
  getPartialsHelper: ->
    render: (name, object) => @renderHTML('_' + name, object)


  # Render template
  renderHTML: (name, object = {}) ->
    for templatesPath in @templatesPaths
      if (jstTemplate = JST[templatesPath + name])?
        return jstTemplate(
          _.extend({}, object, @helpersObject)
        )

    throw "Template \"#{name}\" is not found"


  # Render template (returns jQuery object)
  renderTemplate: ->
    return $(@renderHTML.apply(@, arguments))


  # Delegate events
  delegateEvents: ->
    for fnName, callback of @constructor.prototype
      continue unless _(callback).isFunction()

      callbackMatch = fnName.match(CALLBACK_REGEXP)

      continue unless callbackMatch?

      [event, role] = _(callbackMatch).last(2)

      bindedCallback = _(callback).bind(@)

      if _(JQUERY_EVENTS).include(event)
        roleString = _(role).underscored()
        if roleString == 'this'
          @el.bind(event, bindedCallback)
        else
          @el.delegate('@' + roleString, event, bindedCallback)


  $: (selector) -> @el.find(selector)
