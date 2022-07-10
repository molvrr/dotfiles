#!/bin/bash
# Author: Winfried Dietmayer -==WDI==-, 12.07.2014
# Original version retrieved from https://gist.github.com/febuiles/1549991/download
# Precondition:
# In CMUS:
# ':set status_display_program=/path/to/program/cmus-artist-title.sh'
# To make this permanent, add the line above to your ~/.cmus/rc
#------------------------------------------------------------------------------
#  lyrics-cmus.sh is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.

#  lyrics-cmus.sh is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.

#  You should have received a copy of the GNU General Public License
#  along with lyrics-cmus.sh. If not, see <https://www.gnu.org/licenses/>.
# 
#  To summarize: This is *free* but copyrighted software,
#  *free* as in *free*dom or *free* will.
#------------------------------------------------------------------------------
# Pathes to commands - change appropriately for your system
perl=/usr/bin/perl           # Use the Apple version of perl
curl=/usr/bin/curl
say=/usr/bin/say             # speak command a la Apple
echo=/bin/echo
tail=/usr/bin/tail
cut=/usr/bin/cut
sed=/usr/bin/sed
#------------------------------------------------------------------------------
# Full qualified path to the cmus status file - change as appropriate
statusfile=~/.cmus/status.txt
# Static part of url to retrieve the lyrics
urlstatic=https://makeitpersonal.co/lyrics
#------------------------------------------------------------------------------
# Output the arguments to stderr instead of stdin
function echoerr() 
{
    echo=/bin/echo
    $echo "$@" 1>&2; 
}
#-----------------------------------------------------------------------------
# You name it
function usage
{
    echoerr "Usage: 'lyrics-cmus' [-v] [<artist> <title>]"
    echoerr "       'lyrics-cmus' retrieves the lyrics for a song from makeitpersonal.co."
    echoerr "                     If no parameter is given the artist and title"
    echoerr "                     of the current cmus song will be used."
    echoerr "          -v:  Additionally declaim artist and title using 'say' of OS X."
    echoerr "       If <artist> and <title> is provided use this data instead of the cmus data."
    echoerr "          -- <artist> - the name of the artist"
    echoerr "          -- <title>  - the title of the song"
    return 1
}
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
# Read artist name und song title from the cmus interface file
function get-cmus-metadata
{
    artist_name=`$tail -n 1 $statusfile  | $cut -d "-" -f 1 | $sed -E -e "s/^[[:blank:]]+//" -e "s/[[:blank:]]+$//"`
    song_title=`$tail  -n 1 $statusfile  | $cut -d "-" -f 2 | $sed -E -e "s/^[[:blank:]]+//" -e "s/[[:blank:]]+$//"`
}
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Read artist name und song title from the cmus interface file
function get-shell-metadata
{
    artist_name="$1"
    song_title="$2"
}
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Escape unusual chars with perl module escape.pm
function escape-chars
{
    artist=`$perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$artist_name"`
    title=`$perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$song_title"`
}
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Audio output of artist and title
# If you don't use Mac OS please adapt appropriately
function speak-metadata
{
    $say -v Alex artist $artist_name 
    $say -v Alex title  $song_title
}
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Output of artist and title to stdout
function print-metadata
{
    $echo  artist:  $artist_name 
    $echo "title :" $song_title
}
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Retrieve the lyrics from makeitpersonal.co
function get-lyrics
{
    $curl -s "${urlstatic}?artist=$artist&title=$title"
}
#------------------------------------------------------------------------------
#-----------------------------------------------------------------------------
if [ $# == 0 ]; then
    get-cmus-metadata
    escape-chars
    print-metadata
    get-lyrics
elif [ $# == 1 ] && [ "${1:0:2}" == "-v" ]; then
    get-cmus-metadata
    escape-chars
    speak-metadata
    print-metadata
    get-lyrics
elif [ $# == 2 ]; then
    artist_name="${1:0:245}"
    song_title="${2:0:245}"
    escape-chars
    print-metadata
    get-lyrics
elif [ $# == 3 ] && [ "$1" == "-v" ]; then
    artist_name="${2:0:245}"
    song_title="${3:0:245}"
    escape-chars
    speak-metadata
    print-metadata
    get-lyrics
else
    usage
fi
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
