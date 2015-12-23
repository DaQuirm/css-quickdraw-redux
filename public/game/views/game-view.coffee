MatchRendererView       = (require 'common/components/match-renderer').View
UserPanelView           = (require 'common/components/user-panel').View
TimespanView            = (require 'common/components/timespan').View
OccurrenceIndicatorView = (require 'common/components/occurrence-indicator').View

GameView = (context) ->
	nxt.Element 'div',
		nxt.Class 'game-screen'

		UserPanelView context.userPanelViewModel

		nxt.Element 'div',
			nxt.Class 'game-screen-container'

			nxt.Element 'div',
				nxt.Class 'controls'

				nxt.Element 'div',
					nxt.Class 'qd-pearl-thread'
					nxt.Text 'pear thread'

				nxt.Binding context.puzzle, (puzzle) ->
					if puzzle.banned_characters.length
						nxt.Element 'div',
							nxt.Class 'controls-selector-banned-container'
							nxt.Text 'Banned characters'
							nxt.Binding context.occurrenceIndicatorVMCell, (vm) ->
								OccurrenceIndicatorView vm

				nxt.Element 'input',
					nxt.Class 'controls-selector-input'
					nxt.ValueBinding context.selector
					nxt.Attr 'placeholder', 'Enter your selector here...'

				TimespanView context.roundTimerViewModel

			MatchRendererView context.matchRendererViewModel

module.exports = GameView
