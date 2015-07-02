fs = require 'fs'
path = require 'path'

if atom?
  module.exports = wgls =
    projects: []

    deactivate: ->

    activate: (@state) ->
      for projectDir in atom.project.rootDirectories
        wglsProjectSearch projectDir.path

else
  module.exports = require './api/wgls-api-main.coffee'

wglsProjectSearch =  (projectPath) ->
  fs.readdir projectPath, (err, files) =>
    console.log projectPath
    for file in files when file is 'package.json'
      fs.readFile path.join(projectPath, file), {encoding: 'utf8'}, (err, data) =>
        json = JSON.parse(data)
        if Object.keys(json.dependencies).indexOf('wgls') is not -1
          wgls.projects.push
            name: json.name,
            path: projectPath,
            main: main
