# from funky theme

local blue_op="%{$fg[blue]%}[%{$reset_color%}"
local blue_cp="%{$fg[blue]%}]%{$reset_color%}"
local path_p="${blue_op}%~${blue_cp}"
local user_host="${blue_op}%n@%m${blue_cp}"
local host="${blue_op}%{$fg_bold[red]%}%m%{$reset_color%}${blue_cp}"
local ret_status="${blue_op}%?${blue_cp}"
local ret_status2="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%{$reset_color%}"
local hist_no="${blue_op}%h${blue_cp}"
local smiley="%(?,%{$fg[green]%}:%)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-staged-changes true
zstyle ':vcs_info:*' stagedstr s
zstyle ':vcs_info:*' formats "$fg_bold[blue]%s%{$reset_color%}:(%{$fg_bold[red]%}%b%{$reset_color%})%a.%m%u%c"

autoload -Uz vcs_info
precmd() {
    vcs_info
}

setopt prompt_subst
PROMPT='╭─${host}-${path_p}─${vcs_info_msg_0_}─${hist_no}-${ret_status}
╰─${blue_op}${smiley}${blue_cp} ${ret_status2} '
local cur_cmd="${blue_op}%_${blue_cp}"
