#!/bin/bash
# say.sh - speak text through the default speaker using Piper (Norman Voice)
# Usage: ./say.sh "Hello World!!"
VOICE_DIR="$HOME/piper-voices"
VOICE="en_US-norman-medium"
OUT="/tmp/say.wav"

"$HOME/piper-env/bin/python" -m piper --data-dir "$VOICE_DIR" -m "$VOICE" -f "$OUT" -- "$*"
paplay "$OUT"

