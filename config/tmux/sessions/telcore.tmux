new -A -s telcore
neww -n snmpcon -c "$HOME/src/Tel-core/snmpcon/"
neww -n PGW -c "$HOME/src/Tel-core/PGW/"
neww -n snmpcon -c "$HOME/src/Tel-core/snmpcon/" nvim .

swapw -s 0 -t 3
killw -t 3
selectw -t 0
