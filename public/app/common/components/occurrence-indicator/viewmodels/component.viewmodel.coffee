PatternViewModel = require './pattern.viewmodel'

class ComponentViewModel extends nx.RefinedCollection
	constructor: (patterns) ->
		@string = new nx.Cell value: ''

		refinement = new nx.MapRefinement
			source: patterns
			map: (pattern) => new PatternViewModel pattern, @string

		super patterns, refinement

module.exports = ComponentViewModel
