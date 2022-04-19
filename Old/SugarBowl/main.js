const {app, BrowserWindow} = require('electron')
const path = require('path')

function CreateWindow () {
    // Create the browser window.
    const AppWindow = new BrowserWindow({
        width: 800,
        height: 600,
        webPreferences: {
        }
    })
    AppWindow.loadFile('./App/index.html')

    // Open the DevTools.
    // mainWindow.webContents.openDevTools()
}

app.whenReady().then(() => {
    CreateWindow()
})

app.on('window-all-closed', function () {
    app.quit()
})