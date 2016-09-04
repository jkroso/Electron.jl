const {app, BrowserWindow} = require('electron')

app.on('window-all-closed', () => {
  if (process.platform != 'darwin') app.quit()
})

app.on('ready', () => {
  const window = new BrowserWindow({width: 800, height: 600})
  window.loadURL('file://' + __dirname + '/index.html')
})
