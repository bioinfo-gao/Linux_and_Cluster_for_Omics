Shift + Enter Run and Jump to Next Line
To achieve "Execute and move cursor down," follow these exact steps:

Press Ctrl + Shift + P and type "Preferences: Open Keyboard Shortcuts (JSON)".

In the keybindings.json file, add this block inside the square brackets []:

JSON
{
    "key": "shift+enter",
    "command": "runCommands",
    "args": {
        "commands": [
            "workbench.action.terminal.runSelectedText",
            "cursorDown"
        ]
    },
    "when": "editorTextFocus && editorLangId == 'shellscript'"
}