{nx} = require 'nexus'

class PatternViewModel

	constructor: (@pattern, string) ->
		@is_matched = new nx.Cell
		@is_matched['<<-'] string, (string = '') =>
			string.indexOf(@pattern) isnt -1

module.exports = PatternViewModel
