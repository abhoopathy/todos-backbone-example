define [
    'underscore'
    'backbone'
    'cs!router'
    'cs!views/taskList'
], ( _, Backbone, Router, TaskListView) ->

        initialize: ->
            router = Router.initialize()

            taskListView = new TaskListView()
