define [
    'underscore',
    'jquery',
    'backbone',
    'cs!models/task'

], (_, $, Backbone, TaskModel) ->

    TasksCollection = Backbone.Collection.extend

        model: TaskModel

        numCompleted: -> @where({completed: true}).length

        initialize: ->
            _.bindAll(this)


    return TasksCollection
