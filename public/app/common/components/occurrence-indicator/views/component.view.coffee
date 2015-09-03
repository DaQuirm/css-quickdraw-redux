ListView    = (require '../../list').View
PatternView = require './pattern.view.coffee'

module.exports = ComponentView = (context) ->
	nxt.Element 'div',
		nxt.Class 'qd-occurrence-indicator'
		ListView context, PatternView
