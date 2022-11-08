# Use extended color palette if available
if [[ $TERM = (*256color|*rxvt*) ]]; then
    turquoise="%{${(%):-"%F{81}"}%}"
    orange="%{${(%):-"%F{166}"}%}"
    purple="%{${(%):-"%F{135}"}%}"
    limegreen="%{${(%):-"%F{118}"}%}"
else
    turquoise="%{${(%):-"%F{cyan}"}%}"
    orange="%{${(%):-"%F{yellow}"}%}"
    purple="%{${(%):-"%F{magenta}"}%}"
    limegreen="%{${(%):-"%F{green}"}%}"
fi

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$turquoise%}git:(%{$orange%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$turquoise%}) %{$fg[yellow]%}✗%{$reset_color%}"

git_branch() {
    local cb=$(git_current_branch)
    if [ -n "$cb" ]; then
        echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
}

PROMPT='%{$purple%}%n%{$reset_color%} in %{$limegreen%}%~%{$reset_color%}$(git_branch)
$ '
