warp = require 'nexus-warp'

class AppViewModel
	constructor: ->

		@selector = new nx.Cell
		@match = new nx.Cell
		@game_session_id = new nx.Cell
		@round_phase = new nx.Cell

		new warp.Client
			transport: new warp.WebSocketTransport address:"ws://#{window.location.host}"
			entities:
				selector:        @selector
				match:           @match
				game_session_id: @game_session_id
				round_phase:     @round_phase

		@game_session_id.value = '563e67b5e3177999a8406ac4'

module.exports = AppViewModel
