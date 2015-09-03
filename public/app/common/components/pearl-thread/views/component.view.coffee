ListView    = (require '../../list').View
PearlView = require './pearl.view.coffee'

PearlsView = (context) ->
	nxt.Element 'div',
		nxt.Class 'qd-pearl-thread'
		ListView context, PearlView

module.exports = PearlsView
