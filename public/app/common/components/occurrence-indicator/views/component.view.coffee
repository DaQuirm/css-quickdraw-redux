module.exports = ComponentView = (patterns) ->
	nxt.Element 'div',
		nxt.Class 'qd-occurrence-indicator'
		nxt.Collection patterns, ({pattern, is_matched}) ->
			nxt.Element 'div',
				nxt.Class 'qd-pattern'
				nxt.Binding is_matched, (is_matched) ->
					if is_matched then nxt.Class '-matched'
				nxt.Text pattern
