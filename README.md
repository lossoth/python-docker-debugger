# Debug Docker Python app with VS Code

## Local VS Code setup

Create `.vscode/launch.json`

```json
{
    "version": "0.2.0",
    "configurations": [
      {
        "name": "Python: Remote Attach",
        "type": "python",
        "request": "attach",
        "connect": {
          "host": "localhost",
          "port": 5678
        },
        "pathMappings": [
          {
            "localRoot": "${workspaceFolder}",
            "remoteRoot": "/app"
          }
        ]
      }
    ]
  }
```

## To debug the application

* Start the container in development mode with `make dev`.

* Open the project in VS Code.

* Open the Debug view (Ctrl+Shift+D).

* Select the "Python: Remote Attach" configuration.

* Click the green play button to start debugging.

* Set breakpoints in your code as needed.