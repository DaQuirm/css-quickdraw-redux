{nx} = require 'nexus-node'

class Sandbox

	constructor: ->
		@memory = new Map

		@remote =
			selector: new nx.Cell
			match:    new nx.Cell

		@selector = new nx.Cell
			'->': [
				({selector, player_id}) =>
					if @memory.has selector
						match = @memory.get selector
						match = @cloneMatch match, player_id
						@match.value = match
						[]
					else
						@remote.selector
			]

		@match = new nx.Cell
			'<-': [@remote.match]
			action: (match) =>
				@memory.set match.selector, match

		@puzzle_data = new nx.Cell
		@node_list = new nx.Cell
			action: => do @memory.clear

	cloneMatch: (match, player_id) ->
		matchClone =
			selector: match.selector
			result: match.result
			ids: do match.ids.slice
			player_id: player_id

		if match.banned
			matchClone.banned =
				character: match.banned.character
				at: match.banned.at

		matchClone

module.exports = Sandbox
