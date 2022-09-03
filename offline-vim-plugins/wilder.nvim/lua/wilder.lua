local _M = {}

for _, f in pairs({
  'in_context',
  'enable_cmdline_enter',
  'enable',
  'disable',
  'toggle',
  'set_option',
  'next',
  'previous',
  'resolve',
  'reject',
  'on_finish',
  'on_error',
  'wait',
  'can_reject_completion',
  'reject_completion',
  'can_accept_completion',
  'accept_completion',
  'start_from_normal_mode',
  'make_hl',
  'make_temp_hl',
  'hl_with_attr',
  'query_highlighter',
  'query_common_subsequence_spans',
  'basic_highlighter',
  'vim_basic_highlighter',
  'python_basic_highlighter',
  'pcre2_highlighter',
  'python_pcre2_highlighter',
  'lua_pcre2_highlighter',
  'pcre2_capture_spans',
  'cpsm_highlighter',
  'python_cpsm_highlighter',
  'lua_fzy_highlighter',
  'highlighter_with_gradient',
  '_sleep',
  'branch',
  'map',
  'subpipeline',
  'check',
  'if',
  'debounce',
  'result',
  'result_output_escape',
  'vim_substring',
  'vim_substring_pattern',
  'vim_search',
  'escape_python',
  'python_substring',
  'python_substring_pattern',
  'python_fuzzy_match',
  'python_fuzzy_pattern',
  'python_fuzzy_delimiter',
  'python_fuzzy_delimiter_pattern',
  'python_search',
  '_python_sleep',
  'history',
  'vim_sort',
  'lexical_sorter',
  'lexical_sort',
  'python_sort',
  'python_lexical_sorter',
  'python_lexical_sort',
  'python_sorter_difflib',
  'python_difflib_sorter',
  'python_difflib_sort',
  'python_sorter_fuzzywuzzy',
  'python_fuzzywuzzy_sorter',
  'python_fuzzywuzzy',
  'python_fuzzywuzzy_sort',
  'uniq',
  'uniq_filter',
  'uniq_filt',
  'python_uniq',
  'python_uniq_filter',
  'python_uniq_filt',
  'filter_fuzzy',
  'fuzzy_filter',
  'fuzzy_filt',
  'vim_fuzzy_filter',
  'vim_fuzzy_filt',
  'python_filter_fuzzy',
  'python_fuzzy_filter',
  'python_fuzzy_filt',
  'python_filter_fruzzy',
  'python_fruzzy_filter',
  'python_fruzzy_filt',
  'python_filter_cpsm',
  'python_cpsm_filter',
  'python_cpsm_filt',
  'python_clap_filter',
  'python_clap_filt',
  'lua_fzy_filter',
  'lua_fzy_filt',
  'search_pipeline',
  'vim_search_pipeline',
  'python_search_pipeline',
  'cmdline_pipeline',
  'substitute_pipeline',
  'python_file_finder_pipeline',
  'index',
  'wildmenu_index',
  'string',
  'wildmenu_string',
  'previous_arrow',
  'wildmenu_previous_arrow',
  'next_arrow',
  'wildmenu_next_arrow',
  'separator',
  'powerline_separator',
  'wildmenu_powerline_separator',
  'spinner',
  'wildmenu_spinner',
  'condition',
  'wildmenu_condition',
  'popupmenu_scrollbar',
  'popupmenu_spinner',
  'popupmenu_devicons',
  'popupmenu_buffer_flags',
  'popupmenu_empty_message',
  'popupmenu_empty_message_with_spinner',
  'renderer_mux',
  'statusline_renderer',
  'float_renderer',
  'wildmenu_renderer',
  'popupmenu_renderer',
  'airline_theme',
  'wildmenu_airline_theme',
  'lightline_theme',
  'wildmenu_lightline_theme',
  'popupmenu_border_theme',
  'popupmenu_palette_theme',
  'findfile',
  'fruzzy_path',
  'cpsm_path',
  'clap_path',
  'clear_module_path_cache',
  'project_root',
  'clear_project_root_cache',
  'result_draw_devicons',
  'draw_devicons',
  'devicons_get_icon_from_vim_devicons',
  'devicons_get_icon_from_nerdfont_vim',
  'devicons_get_icon_from_nvim_web_devicons',
  'devicons_get_hl_from_glyph_palette_vim',
  'devicons_get_hl_from_nvim_web_devicons',
  'setup',
}) do
  _M[f] = function(...)
    return require('wilder.shim').call('wilder#' .. f, ...)
  end
end

_M['lua_fzy_filter'] = function()
  return function(ctx, xs, q)
    return require('wilder.internal').fzy_filter(xs, q)
  end
end

_M['lua_fzy_filt'] = function(ctx, opts, xs, query)
  return require('wilder.internal').fzy_filter(xs, q)
end

return _M
