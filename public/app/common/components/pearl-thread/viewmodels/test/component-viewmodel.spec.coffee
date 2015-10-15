PearlViewModel     = require '../pearl.viewmodel'
ComponentViewModel = require '../component.viewmodel'
{nx} = require 'nexus'

describe 'ComponentViewModel', ->

	view_model = null
	pearls = new nx.Collection items: [1, 2, 3]

	beforeEach ->
		view_model = new ComponentViewModel pearls

	describe 'constructor', ->

		it 'saves an array of PearlViewModel instances to `pearls`', ->
			view_model.length.value.should.equal pearls.length.value
			view_model.items.every (pearl) -> pearl instanceof PearlViewModel
				.should.equal true

		it 'uses custom view model if its constructor is passed as the second argument', ->
			FakePearlViewModel = ->
			view_model = new ComponentViewModel pearls, FakePearlViewModel
			view_model.items.every (pearl) -> pearl instanceof FakePearlViewModel
				.should.equal true
