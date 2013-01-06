{exec} = require 'child_process'

task 'build', 'build the source dir', ->
    exec 'node r.js -o source/scripts/app.build.js', (err, stdout, stderr) ->
        throw err if err
        console.log stdout + stderr

task 'deploy', 'deploy to somehwere!', ->
    console.log "deploy the app"
    #exec 'scp -r build/* user@hostname:path/to/remote/project/dir', (err, stdout, stderr) ->
        #throw err if err
        #console.log stdout + stderr
