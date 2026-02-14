#!/usr/bin/fish

set command     {{colors.secondary.default.hex_stripped}}
set args        {{colors.on_background.default.hex_stripped}}
set paths       {{colors.on_surface_variant.default.hex_stripped}}
set whiteish    {{colors.on_background.default.hex_stripped}}
set grayed      {{colors.on_secondary.default.hex_stripped}}
set danger      {{colors.error.default.hex_stripped}}
set bgcolor     {{colors.background.default.hex_stripped}}
set pinkish     {{colors.on_error_container.default.hex_stripped}}
set quotes      {{colors.tertiary.default.hex_stripped}}
set warnining   {{colors.error.default.hex_stripped}}


set -U fish_color_normal $whiteish # default color
set -U fish_color_command $command # commands like echo
set -U fish_color_keyword $danger --bold # keywords like if - this falls back on the command color if unset

set -U fish_color_quote $quotes # quoted text like "abc"
set -U fish_color_redirection $paths --bold # IO redirections like >/dev/null
set -U fish_color_end $grayed # process separators like ; and &

set -U fish_color_error $danger # syntax errors
set -U fish_color_param $args # ordinary command parameters

set -U fish_color_comment $grayed # comments like ‘# important’
set -U fish_color_match --background=brblue
set -U fish_color_selection $bgcolor --bold --background=$whiteish # selected text in vi visual mode
set -U fish_color_search_match dbb26c --background=$bgcolor # history search matches and selected pager items (background only)
set -U fish_color_history_current $args --bold # the current position in the history for commands like dirh and cdh
set -U fish_color_operator $grayed # parameter expansion operators like * and ~
set -U fish_color_escape $pinkish # character escapes like \n and \x70
# set -U fish_color_cwd green # the current working directory in the default prompt
# set -U fish_color_cwd_root red # the current working directory in the default prompt for the root user
set -U fish_color_option $args # options starting with “-”, up to the first “--” parameter
set -U fish_color_valid_path $paths --underline # parameters that are filenames (if the file exists)
set -U fish_color_autosuggestion $grayed # autosuggestions (the proposed rest of a command)
# set -U fish_color_user brgreen # the username in the default prompt
# set -U fish_color_host normal # the hostname in the default prompt
# set -U fish_color_host_remote yellow # the hostname in the default prompt for remote sessions (like ssh)
set -U fish_color_history_current --bold
# set -U fish_color_status $danger # the last command’s nonzero exit code in the default prompt
set -U fish_color_cancel --reverse # the ‘^C’ indicator on a canceled command

set -U fish_pager_color_prefix $args --underline # the prefix string, i.e. the string that is to be completed
set -U fish_pager_color_secondary_prefix # prefix of every second unselected completion
set -U fish_pager_color_selected_prefix # prefix of the selected completion

set -U fish_pager_color_completion $args # the completion itself, i.e. the proposed rest of the string
set -U fish_pager_color_secondary_completion # suffix of every second unselected completion
set -U fish_pager_color_selected_completion # suffix of the selected completion

set -U fish_pager_color_description $command --italics # the completion description
set -U fish_pager_color_secondary_description # description of every second unselected completion
set -U fish_pager_color_selected_description # description of the selected completion

set -U fish_pager_color_background # the background color of a line
set -U fish_pager_color_secondary_background # background of every second unselected completion
set -U fish_pager_color_selected_background --reverse # background of the selected completion

set -U fish_pager_color_progress $command # the progress bar at the bottom left corner
