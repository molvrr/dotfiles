#!/bin/sh
#
# cmus-status-display
#
# Usage:
#   in cmus command ":set status_display_program=cmus-status-display"
#
# This scripts is executed by cmus when status changes:
#   cmus-status-display key1 val1 key2 val2 ...
#
# All keys contain only chars a-z. Values are UTF-8 strings.
#
# Keys: status file url artist album discnumber tracknumber title date
#   - status (stopped, playing, paused) is always given
#   - file or url is given only if track is 'loaded' in cmus
#   - other keys/values are given only if they are available
#  

output()
{
	# write status to ~/cmus-status.txt (not very useful though)
	echo "$*" >> ~/.cmus/status.txt 2>&1

	# WMI (https://wmi.modprobe.de/)
	#wmiremote -t "$*" &> /dev/null
}

while test $# -ge 2
do
	eval _$1='$2'
	shift
	shift
done

if test -n "$_file"; then
    output "$_artist - $_title"
elif test -n "$_url"; then
    output "$_title"
else
    output "[$_status]"
fi

