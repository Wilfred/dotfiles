#!/bin/bash
input=$(cat)
session_name=$(echo "$input" | jq -r '.session_name // empty')
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
model=$(echo "$input" | jq -r '.model.display_name')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

parts=()
[ -n "$session_name" ] && parts+=("$session_name")
parts+=("$(hostname -s)")
parts+=("$(basename "$cwd")")
parts+=("$model")
if [ -n "$used_pct" ]; then
  parts+=("ctx: $(printf '%.0f' "$used_pct")%")
fi

five=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
rl=""
[ -n "$five" ] && rl="5h:$(printf '%.0f' "$five")%"
[ -n "$week" ] && rl="$rl 7d:$(printf '%.0f' "$week")%"
[ -n "$rl" ] && parts+=("$(echo $rl | xargs)")

result=""
for i in "${!parts[@]}"; do
  [ "$i" -gt 0 ] && result="$result - "
  result="$result${parts[$i]}"
done
echo "$result"
