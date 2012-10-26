bash_prompt_cmd() {
  local RC=$?
  local CY="\[\e[1;36m\]" # Each is 12 chars long
  local BL="\[\e[1;34m\]"
  local WH="\[\e[1;37m\]"
  local BR="\[\e[0;33m\]"
  local RE="\[\e[1;31m\]"
  local GR="\[\e[1;32m\]"
  local RST="\[\e[0;37m\]"

  local SMILEY="${GR}:)"
  if [ $RC -ne 0 ] ; then
    SMILEY="${RE}:("
  fi

  # UserColor red for root, cyan for everyone else.
  local UC="${CY}"
  [ $UID -eq "0" ] && UC="${RE}"
  
  # Add the first part of the prompt: username,host, and time
  local PS1_L1="$BL.:[ $UC$(whoami)@$(hostname -s) $BL: $WH\t $BL:$BR "
  local PS_LEN=$(( ${#PS1_L1} - 12 * 6 + 6 + 4 )) #Len adjust for colors, time and var
  local PS1_L1_TAIL=" $BL]:.\n"

  local STARTPOS=""
  local PROMPT_PWD="${PWD/#$HOME/~}"
  local OVERFLOW_PREFIX="..."
  local PWDLEN=${#PROMPT_PWD}
  local MAXPWDLEN=$(( COLUMNS - PS_LEN ))
  # Sometimes COLUMNS isn't initiliased, if it isn't, fall back on 80
  [ $MAXPWDLEN -lt 0 ] && MAXPWDLEN=$(( 80 - PS_LEN ))
  
  if [ $PWDLEN -gt $MAXPWDLEN ] ; then
    STARTPOS=$(( $PWDLEN - MAXPWDLEN + ${#OVERFLOW_PREFIX} ))
    PROMPT_PWD="${OVERFLOW_PREFIX}${PROMPT_PWD:$STARTPOS:$MAXPWDLEN}"
  fi
  PS1_L1="${PS1_L1}${PROMPT_PWD}${PS1_L1_TAIL}"

  PS1_L2="${SMILEY}${RST} "

  export PS1="${PS1_L1}${PS1_L2}"
}
PROMPT_COMMAND=bash_prompt_cmd
