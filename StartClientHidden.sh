printf "sh -c '$PWD/StartClient.sh; killall Terminal;'; sleep 1; killall Terminal" > "$TMPDIR/Sugar.command"

chmod +x "$TMPDIR/Sugar.command"
"$TMPDIR/Sugar.command"