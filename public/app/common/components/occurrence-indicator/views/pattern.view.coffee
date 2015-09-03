module.exports = PatternView = (context) ->
	nxt.Element 'div',
		nxt.Class 'qd-pattern'
		nxt.Binding context.is_matched, (is_matched) ->
			if is_matched then nxt.Class '-matched'
		nxt.Text context.pattern
