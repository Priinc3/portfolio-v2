#!/bin/sh
# Double-click to preview the portfolio locally (with the F1 car).
# file:// can't fetch() the 3D model, so this serves the folder over http.
cd "$(dirname "$0")"
PORT=8123
lsof -ti tcp:$PORT | xargs kill -9 2>/dev/null
python3 -m http.server $PORT >/dev/null 2>&1 &
SRV=$!
sleep 1
open "http://127.0.0.1:$PORT/"
echo "Serving at http://127.0.0.1:$PORT/ (PID $SRV). Close this window to stop."
wait $SRV
