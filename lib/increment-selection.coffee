module.exports =
  activate: ->
    atom.workspaceView.command 'increment-selection:increment', '.editor', ->
      incrementSelection atom.workspaceView.getActivePaneItem()

incrementSelection = (editor) ->
  selections = editor.getSelections()

  if selections.length > 1
    start = +selections[0].getText() || 1

    selections.forEach (selection, index) ->
      selection.insertText (start + index).toString()
  else if !selections[0].isEmpty()
    lines = selections[0].getText().split('\n')

    if lines.length > 1
      start = +lines[0] || 1

      lines.forEach (line, index) ->
        lines[index] = start + index

      selections[0].insertText lines.join('\n')
