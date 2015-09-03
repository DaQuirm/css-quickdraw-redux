{nx} = require 'nexus'

class ComponentViewModel extends nx.Collection
	constructor: (options) ->
		super items:options.items.map options.map

module.exports = ComponentViewModel
