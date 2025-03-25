#!/usr/bin/env bash

CURRENT_WORKING_DIRECTORY="$(swaymsg -t get_tree |
  jq '.. | (.nodes? // empty)[] | select(.focused == true).pid? // empty' |
  xargs pstree -p | grep "\<tmux\>\|\<fish\>\|\<bash\>\|\<zsh\>\|\<sh\>" |
  grep -o '[0-9]*' | xargs pwdx 2>/dev/null | cut -f2- -d' ' |
  sort | tail -n 1 | tr -d '\n')"

echo $CURRENT_WORKING_DIRECTORY

if [ -d "$CURRENT_WORKING_DIRECTORY" ]; then
  ghostty --working-directory="$CURRENT_WORKING_DIRECTORY" --command=/usr/bin/zellij &
  disown
else
  ghostty --command=/usr/bin/zellij &
  disown
fi
