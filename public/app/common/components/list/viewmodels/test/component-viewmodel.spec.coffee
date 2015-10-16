ComponentViewModel = require '../component.viewmodel'
{nx} = require 'nexus'


describe 'ComponentViewModel', ->

	view_model = null
	items = [ 1, 2, 3]
	map = (item) -> item * 2


	beforeEach ->
		view_model = new ComponentViewModel
			items: items
			map: map

	describe 'constructor', ->
		it 'should be inherited from nx.Collection', ->
			view_model.should.be.an.instanceof nx.Collection

		it 'should transform a passed items', ->
			view_model.items.length.should.equal items.length
			view_model.items.should.deep.equal items.map map
