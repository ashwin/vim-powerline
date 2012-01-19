function! Pl#Match#Add(pat, expr) " {{{
	return [a:pat, a:expr]
endfunction " }}}
function! Pl#Match#Any(...) " {{{
	let matches = []

	for match_name in a:000
		call add(matches, g:Powerline#Matches#matches[match_name])
	endfor

	return ['match', 'any', matches]
endfunction " }}}
function! Pl#Match#Validate(match) " {{{
	let [m, match, matches] = a:match

	if ! len(matches)
		" Empty match array matches everything
		return 1
	endif

	if match == 'any'
		for [eval, re] in matches
			if match(eval(eval), '\v'. re) != -1
				return 1
			endif
		endfor

		return 0
	endif
endfunction " }}}
