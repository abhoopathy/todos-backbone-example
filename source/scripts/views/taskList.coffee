define [
    'jquery',
    'underscore',
    'backbone',
    'cs!collections/tasks'
    'cs!views/task'

], ($, _, Backbone, TasksCollection, TaskView) ->

    TaskListView = Backbone.View.extend


        el: $('#todo-list-wrapper')

        initialize: () ->
            _.bindAll(this)

            # Initialize a new collection of tasks, add
            # a handler for models being added to it
            @tasks = new TasksCollection
            @tasks.on('add', @taskAdded)
            @tasks.on('change', @taskChanged)
            @tasks.on('remove', @taskRemoved)

            # JQ Assignments
            @$input = @$el.find('input.todo-list-input')

            @$todoList = @$el.find('ul.todo-list.not-completed')
            @$doneList = @$el.find('ul.todo-list.completed')

            @$numCompleted = @$el.find('.number-completed')
            @$numTotal = @$el.find('.number-done')

            # Update the numbers at the bottom
            @updateNumbers()

            # Make sure the input has keyboard focus
            @$input.focus()

            # TODO: remove these test tasks
            #@tasks.add({name: "Take out the trash!"})
            #@tasks.add({name: "Eat some fruit"})
            #@tasks.add({name: "Eat some fruit"})
            #@tasks.add({name: "Eat some fruit"})



        taskAdded: (taskModel) ->
            taskView = new TaskView(taskModel)
            @$todoList.append taskView.$el
            @$numTotal.text @tasks.length


        taskRemoved: (taskModel) -> @updateNumbers()


        taskChanged: (taskModel) ->
            if taskModel.changed.completed
                @$doneList.prepend taskModel.view.$el
            else
                @$todoList.append taskModel.view.$el

            @updateNumbers()


        updateNumbers: (m) ->
            @$numCompleted.text @tasks.numCompleted
            @$numTotal.text @tasks.length


        events:
            'keypress .todo-list-input' : 'submitOnEnterPressed'


        submitOnEnterPressed: (e) ->
            # if enter is pressed
            if (e.which == 13)

                # add a task model to collection
                @tasks.add({name: @$input.attr('value')})
                @$input.attr('value','')



    return TaskListView
