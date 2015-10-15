ComponentViewModel   = require '../component.viewmodel'
PatternViewModel     = require '../pattern.viewmodel'
{nx} = require 'nexus'

describe 'ComponentViewModel', ->

	view_model = null
	patterns = new nx.Collection items: ['this', 'is', 'test', 'data']

	beforeEach ->
		view_model = new ComponentViewModel patterns

	describe 'constructor', ->

		it 'saves passed array to `patterns`', ->
			view_model.length.value.should.equal patterns.length.value
			view_model.items.every (pattern) -> pattern instanceof PatternViewModel
				.should.equal yes

		it 'creates an nx.Cell property with empty string value', ->
			view_model.string.should.be.an.instanceof nx.Cell
			view_model.string.value.should.equal ''

	it 'updates the is_matched cell for every pattern', ->
		view_model.string.value = 'this data'
		view_model.items.map ({is_matched}) -> is_matched.value
			.should.deep.equal [yes, yes, no, yes]

		view_model.string.value = 'data'
		view_model.items.map ({is_matched}) -> is_matched.value
			.should.deep.equal [no, no, no, yes]
