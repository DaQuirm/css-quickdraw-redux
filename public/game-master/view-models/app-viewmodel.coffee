warp = require 'nexus-warp'

dateTimeFormats = (require 'common/utils/date-time-utils').formats
RoundPhase = require 'cssqd-shared/models/round-phase'

Player = require '../models/player'
UserPanelViewModel = (require 'common/components/user-panel').ViewModel
TimespanViewModel = (require 'common/components/timespan').ViewModel
ButtonViewModel = (require 'common/components/button').ViewModel
PlayersListViewModel = (require 'common/components/players-list').ViewModel

class AppViewModel
	constructor: (sessionId) ->

		@user_data = new nx.Cell
		@game_session_id = new nx.Cell
		@round_phase = new nx.Cell
		@puzzles = new nx.Cell
		@current_puzzle_index = new nx.Cell
		@node_list = new nx.Cell
		@countdown = new nx.Cell
		@role      = new nx.Cell
		@players = new nx.Collection

		@StartButtonViewModel = new ButtonViewModel 'Start'
		@StopButtonViewModel = new ButtonViewModel 'Stop'
		@NextButtonViewModel = new ButtonViewModel 'Next'

		@current_puzzle_index['<-'] @StartButtonViewModel.click, (evt) ->
			#replace with utils method
			if @target.value? then @target.value else 0
		@current_puzzle_index['<-'] @NextButtonViewModel.click, (evt) ->
			#replace with utils method
			#TODO: UNSAFE!!! check puzzles length
			if @target.value? then @target.value + 1 else 0

		@current_puzzle = new nx.Cell
			'<-': [
					[ @current_puzzle_index, @puzzles ],
					(index, puzzles) ->
						if 0 <= index < puzzles.length then puzzles[index] else null
				]

		@solution = new nx.Cell
			'->': [
				({player_id}) =>
					# obligatory apologetic comment
					{solution} = @players.items.find (player) -> player.id is player_id
					solution
			]

		@current_puzzle_visible_soultion = new nx.Cell
			'<-': [
					[ @current_puzzle, @round_phase ],
					(puzzle, phase) ->
						puzzle?.selector if phase is RoundPhase.FINISHED
				]

		new warp.Client
			transport: new warp.WebSocketTransport address:"ws://#{window.location.host}"
			entities:
				user_data:            @user_data
				game_session_id:      @game_session_id
				role:                 @role

				round_phase:          @round_phase
				puzzles:              @puzzles
				current_puzzle_index: @current_puzzle_index
				node_list:            @node_list
				countdown:            @countdown
				solution:             @solution
				players:
					link: @players
					item_from_json: (json) -> new Player json

		@userPanelViewModel = new UserPanelViewModel @user_data
		@remainingTimeViewModel = new TimespanViewModel @countdown, dateTimeFormats['m:ss']
		@playersListViewModel = new PlayersListViewModel @players

		#Keep session ID set as the last operation as it triggers the data flow
		@game_session_id.value = sessionId

module.exports = AppViewModel
