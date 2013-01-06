define [
    'jquery',
    'underscore',
    'backbone',
    'jade!templates/task',

], ($, _, Backbone, TaskTemplate) ->

    TaskView = Backbone.View.extend

        el: '<li class="task"></li>'

        initialize: (taskModel) ->
            @model = taskModel
            @model.view = this
            @render()

        render: () ->
            compiledTemplate = TaskTemplate({task:@model.toJSON()})
            @$el.html compiledTemplate

        events:
            'click .task-close' : 'taskCloseClicked'
            'click .task-checkbox' : 'checkboxClicked'

        taskCloseClicked: ->
            @model.collection.remove(@model)
            @model.destroy
            @remove()

        checkboxClicked: (e) ->

            # when task is checked
            if $(e.target).attr('checked')
                @model.set('completed', true)
                @$el.addClass('completed')

            # when task is unchecked
            else
                @model.set('completed', false)
                @$el.removeClass('completed')

    return TaskView

