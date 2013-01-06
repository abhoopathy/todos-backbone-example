({
    appDir: "../",

    baseUrl: "scripts",

    dir: "../../build",

    mainConfigFile: 'main.js',

    skipDirOptimize: true,

    pragmasOnSave: {
        excludeJade: true
    },

    modules: [
        {
            name: "main",
        }
    ]
})
