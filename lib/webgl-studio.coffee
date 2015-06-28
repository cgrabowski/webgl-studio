esprima = require('esprima')
fs = require('fs')

module.exports =
  class WebGLStudio
    constructor: ->
      packageRoot = atom.packages.resolvePackagePath('webgl-studio')
      fs.readFile packageRoot + '/node_modules/three/three.js', (err, data) ->
        throw err if err?
        tree = esprima.parse data
        console.log tree
