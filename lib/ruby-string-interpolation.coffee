# Shamelessly based on the sample package - ascii-art
# https://atom.io/docs/v0.60.0/your-first-package

module.exports =
  activate: (state) ->
    atom.workspaceView.command "ruby-string-interpolation:insert", => @insert()

  deactivate: ->
    @rubyStringInterpolationView.destroy()

  serialize: ->
    rubyStringInterpolationViewState: @rubyStringInterpolationView.serialize()

  insert: ->
    editor = atom.workspace.activePaneItem
    if editor.getCursorScopes().indexOf("string.quoted.double.interpolated.ruby") != -1
      selection = editor.getSelection()
      selection.insertText("\#{#{selection.getText()}}")
      if selection.getText().length == 0
        editor.moveCursorLeft()
    else
      editor.insertText('#')
