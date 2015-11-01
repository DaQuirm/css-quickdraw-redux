require 'nexus'

GameViewModel = require './view-models/game-viewmodel'
GameView = require './views/game-view'

window.addEventListener 'load', ->
	game = new GameViewModel
	document.body.appendChild GameView(game).data.node
