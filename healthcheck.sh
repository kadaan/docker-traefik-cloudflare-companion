#!/bin/sh
set -e
if [ -f /.last_event ]; then
  last_event_timestamp="$(cat /.last_event)"
  current_timestamp="$(date +%s)"
  timestamp_difference="$((current_timestamp-last_event_timestamp))"
  if [ "$timestamp_difference" -lt "${1:-120}" ]; then
    exit 0
  fi
fi
exit 1

