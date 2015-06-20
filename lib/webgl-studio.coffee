RenderModel = require './render-model'
RenderView = require './render-view'

module.exports =
  deactivate: ->

  activate: ->
    atom.views.addViewProvider {modelConstructor: RenderModel, viewConstructor: RenderView}

    packageRoot = atom.packages.resolvePackagePath('webgl-studio')
    path = packageRoot + "/static/new-rendering.html"
    createNewRendering(path)

createNewRendering = (path) ->
  model = new RenderModel(path)
  view = atom.views.getView(model)
