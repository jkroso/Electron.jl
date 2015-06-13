var Window = require('browser-window')
var app = require('app')

app.on('window-all-closed', function() { app.quit() })

app.on('ready', function() {
  var mainWindow = new Window({width: 800, height: 600})
  mainWindow.loadUrl('file://' + __dirname + '/index.html')
})
