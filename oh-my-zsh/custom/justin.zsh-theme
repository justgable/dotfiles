function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function get_pwd() {
  print -D $PWD
}

function battery_charge() {
  if [ -e ~/bin/batcharge.py ]
  then
    echo `python ~/bin/batcharge.py`
  else
    echo ''
  fi
}

function put_spacing() {

  local git=$(git_prompt_info)
  if [ ${#git} != 0 ]; then
    ((git=${#git} - 14))
  else
    git=0
  fi

  local termwidth
  (( termwidth = ${COLUMNS} - 9 - ${#$(get_pwd)} - ${git} ))

  local spacing=""
  for i in {1..$termwidth}; do
    spacing="${spacing} " 
  done
  echo $spacing
}

function precmd() {
  print -rP '
$fg[magenta]JMG: $fg[yellow]$(get_pwd)$(put_spacing)$(git_prompt_info)'
}

PROMPT='%{$reset_color%}=> '

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"
