define ['backbone',], (Backbone) ->

    class Router extends Backbone.Router

        routes:
            '*actions': 'defaultAction'

    initialize = ->
        router = new Router
        Backbone.history.start()

    return {
        initialize: initialize
    }
