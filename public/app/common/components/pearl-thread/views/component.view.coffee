PearlView = require './pearl.view.coffee'

PearlsView = (pearls) ->
	nxt.Element 'div',
		nxt.Class 'qd-pearl-thread'
		nxt.Collection pearls, PearlView

module.exports = PearlsView
