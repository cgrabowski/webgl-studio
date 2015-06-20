{View} = require 'space-pen'

module.exports =
  class RenderView extends View

    @content: ->
      @div =>
        @div class:'render-view-container', style:'height:100%', =>
          @tag 'webview', class:'render-view-webview', style:'height:100%;', outlet:'htmlv'

    setModel: (@model) ->
      @.setWebViewSrc(@model.path)
      atom.workspace.getActivePane().activateItem(@)

    setWebViewSrc: (path) ->
      @.find('.render-view-container')
        .on('contextmenu', -> false)
      @htmlv.attr('src', path)
      @htmlv[0].addEventListener 'did-start-loading', =>
        @htmlv[0].openDevTools()

    getTitle: ->
      "WebGL Studio"
