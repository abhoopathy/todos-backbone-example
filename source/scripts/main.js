//Define shortcut aliases

require.config({
    paths: {
        // dependencies
        jquery: 'libs/jquery/jquery-1.8.3.min',
        underscore: 'libs/lodash/lodash-min',
        backbone: 'libs/backbone/backbone-min',

        // require js plugins
        cs: 'libs/require/plugins/cs',
        'coffee-script': 'libs/require/plugins/coffee-script',
        jade: 'libs/require/plugins/jade'
    },

    shim: {
        backbone: {
            deps: ['underscore', 'jquery'],
            exports: 'Backbone'
        },
        underscore: {
            exports: '_'
        },
        jquery: {
            exports: '$'
        }
    }
});

require(['cs!app'], function(App) {
    App.initialize();
});

