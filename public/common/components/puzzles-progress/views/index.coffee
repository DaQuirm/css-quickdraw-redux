require '../styles/puzzles-progress.styl'

RoundStatus = require 'cssqd-shared/models/round-status'

PuzzlesProgressView = (context) ->
	nxt.Element 'div',
		nxt.Class 'puzzles-progress'

		nxt.Element 'div',
			nxt.Class 'puzzles-progress-bar'
			nxt.Binding context.complete_percentage, (percent) ->
				nxt.Style width: "#{percent}%"

		nxt.Element 'div',
			nxt.Class 'puzzles-progress-indicators'
			nxt.Collection context.puzzles, (round, index) ->
				nxt.Element 'div',
					nxt.Class 'puzzles-progress-indicator'
					nxt.Class "-#{round.status.value}"
					nxt.Text (index + 1) if round.status.value is RoundStatus.SOLVING

module.exports = PuzzlesProgressView
