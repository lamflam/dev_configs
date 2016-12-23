
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \([a-z]\).*\/[0-9]\{2\}\([0-9]\{4\}\)\/\(.*\)/[\1\/\2\/\3]/' -e 's/* \(.*\)/[\1]/'
}

parse_venv() {
  if [ -n "$VIRTUAL_ENV" ]; then
    VENV_DIR=$(dirname "$VIRTUAL_ENV")
    VENV=$(basename $VENV_DIR)
    VENV_PATH=$(pwd | sed -ne 's|'"$VENV_DIR"'\(.*\)|'"$VENV"'\1|p')
    if [ "$VENV_PATH" == "" ]; then
      echo "($VENV)"
      # pwd | sed -e 's|'"$HOME"'\(.*\)|~\1|' -e 's|\(.*\)|('"$VENV"')\1|'
    else
      pwd | sed -e 's|'"$VENV_DIR"'\(.*\)|('"$VENV"'\1)|' 
    fi
  fi
}

parse_dir() {
  if [ -n "$VIRTUAL_ENV" ]; then
    VENV_DIR=$(dirname "$VIRTUAL_ENV")
    VENV=$(basename $VENV_DIR)
    VENV_PATH=$(pwd | sed -ne 's|'"$VENV_DIR"'\(.*\)|'"$VENV"'\1|p')
  else
    VENV_PATH=""
  fi
  if [ "$VENV_PATH" == "" ]; then
    pwd | sed -e 's|'"$HOME"'\(.*\)|~\1|'
  fi
}

GREEN="\[\033[032m\]"
CYAN="\[\033[036m\]"
YELLOW="\[\033[033m\]"
WHITE="\[\033[00m\]"

export PS1="$GREEN\$(parse_venv)$CYAN\$(parse_dir)$YELLOW\$(parse_git_branch)$WHITE: "
export VIRTUAL_ENV_DISABLE_PROMPT=1
