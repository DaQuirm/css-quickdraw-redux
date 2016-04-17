class PuzzlesProgressViewModel
	constructor: (@puzzles, @current_index) ->
		@complete_percentage = new nx.Cell
			'<-': [
					[ @puzzles, @current_index ],
					(puzzles, index) ->
						100 * index / (puzzles.length - 1) if puzzles? and index?
				]

module.exports = PuzzlesProgressViewModel
