#!/bin/bash

for i in {0..9}; do
	test -S $XDG_RUNTIME_DIR/discord-ipc-$i || ln -sf {app/com.discordapp.Discord,$XDG_RUNTIME_DIR}/discord-ipc-$i;
done

export PATH="/app/utils/gamescope/bin:$PATH"
export SRB2WADDIR=/app/extra

if [ -z "$GAMESCOPE_ARGS" ]; then
	GAMESCOPE_ARGS="-h 1080 -C 1000 -i"
fi

if [[ -n $(command -v gamescope) && -n "$GAMESCOPE_ENABLE" ]]; then
	echo "$GAMESCOPE_ARGS" -- srb2kart "$@" | xargs gamescope
else
	srb2kart "$@"
fi
