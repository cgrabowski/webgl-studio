{Model} = require 'theorist'

module.exports =
  class RenderModel extends Model
    @models = []

    constructor: (@path) -> RenderModel.models.push(@)

    getViewClass: -> require './render-view'

    getTitle: -> "WebGL Studio"
