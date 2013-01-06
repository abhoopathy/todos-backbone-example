define [
    'underscore',
    'backbone'
], ( _, Backbone) ->

    NodeModel = Backbone.Model.extend

        defaults:
            name: ''
            completed: false

        initialize: ->

    return NodeModel
