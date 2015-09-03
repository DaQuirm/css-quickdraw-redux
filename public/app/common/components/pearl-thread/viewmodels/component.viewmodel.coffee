List           = require '../../list'
PearlViewModel = require './pearl.viewmodel'

class ComponentViewModel extends List.ViewModel
	constructor: (items, view_model = PearlViewModel) ->
		super
			items: items
			map: (item) -> new view_model item

module.exports = ComponentViewModel
