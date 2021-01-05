#!/usr/bin/env bash
i3-msg 'workspace 2: ; append_layout /home/psarakisz89/.config/i3/4terminals.json'
sleep 1.5
kitty --name "term1" &
kitty --name "term2" &
kitty --name "term3" &
kitty --name "term4" &
