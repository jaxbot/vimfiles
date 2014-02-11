" =============================================================================
" Filename: autoload/calendar/view/month_4x1.vim
" Author: itchyny
" License: MIT License
" Last Change: 2013/11/23 12:08:10.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! calendar#view#month_4x1#new(source)
  return s:constructor.new(a:source)
endfunction

let s:self = {}
let s:self.x_months = 4
let s:self.y_months = 1

let s:constructor = calendar#constructor#view_months#new(s:self)

let &cpo = s:save_cpo
unlet s:save_cpo
