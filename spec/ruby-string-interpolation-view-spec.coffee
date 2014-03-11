RubyStringInterpolationView = require '../lib/ruby-string-interpolation-view'
{WorkspaceView} = require 'atom'

describe "RubyStringInterpolationView", ->
  it "has one valid test", ->
    expect("life").toBe "easy"
