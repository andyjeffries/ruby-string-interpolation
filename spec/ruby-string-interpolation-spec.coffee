RubyStringInterpolation = require '../lib/ruby-string-interpolation'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "RubyStringInterpolation", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('rubyStringInterpolation')

  describe "when the ruby-string-interpolation:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.ruby-string-interpolation')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'ruby-string-interpolation:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.ruby-string-interpolation')).toExist()
        atom.workspaceView.trigger 'ruby-string-interpolation:toggle'
        expect(atom.workspaceView.find('.ruby-string-interpolation')).not.toExist()
