PearlViewModel = require './pearl.viewmodel'

class ComponentViewModel extends nx.RefinedCollection
	constructor: (items, view_model = PearlViewModel) ->
		refinement = new nx.MapRefinement
			source: items
			map: (item) -> new view_model item

		super items, refinement

module.exports = ComponentViewModel
