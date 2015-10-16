List = require '../../list'
PatternViewModel = require './pattern.viewmodel'

class ComponentViewModel extends List.ViewModel
	constructor: (patterns) ->
		@string = new nx.Cell value: ''

		super
			items: patterns
			map: (pattern) => new PatternViewModel pattern, @string

module.exports = ComponentViewModel
