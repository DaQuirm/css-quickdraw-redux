{ isNumeric } = require '../../../utils/data-type-utils'

class TimespanViewModel
	constructor: (remainingCell, format) ->
		@remaining = new nx.Cell
			'<<-': [ remainingCell, @selectFormatter(format) ]

	selectFormatter: (format) ->
		#there could be a super-duper DataTime formatter but not now
		switch format
			when TimespanViewModel.formats['s'] then @formatS
			when TimespanViewModel.formats['m:ss'] then @formatMSS
			else @formatDefault

	formatDefault: (value) ->
		if isNumeric value
			'' + value
		else
			''

	formatS: (value) ->
		if isNumeric(value)
			'' + ((value / 1000) | 0)
		else
			''

	formatMSS: (value) ->
		return '' if not isNumeric value

		seconds = (value / 1000) | 0

		minutes = if seconds >= 60 then (seconds / 60) | 0 else 0
		seconds = seconds - (60 * minutes)
		seconds = '0' + seconds if seconds < 10

		"#{minutes}:#{seconds}"

TimespanViewModel.formats = {
	's'
	'm:ss'
}

module.exports = TimespanViewModel