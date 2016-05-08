ButtonView = (require 'common/components/button').View

DisconnectedView = (context) ->
	nxt.Element 'div',
		nxt.Class 'game-disconnected-screen-container'

		nxt.Element 'h1',
			nxt.Class 'disconnected-message'
			nxt.Text 'Seems you`ve gone offline. Please try refresh the page'

		nxt.Element 'div',
			nxt.Class 'refresh-button-container'
			nxt.Attr 'title', 'Refresh'

			ButtonView context.RefreshButtonViewModel

module.exports = DisconnectedView
