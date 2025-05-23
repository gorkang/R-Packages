#!/bin/sh

# Get the procs sorted by the number of inotify watchers
#
# From `man find`: 
#    %h     Leading directories of file's name (all but the last element).  If the file name contains no slashes  (since  it
#           is in the current directory) the %h specifier expands to `.'.
#    %f     File's name with any leading directories removed (only the last element).
lines=$(
    find /proc/*/fd \
    -lname anon_inode:inotify \
    -printf '%hinfo/%f\n' 2>/dev/null \
    \
    | xargs grep -c '^inotify'  \
    | sort -n -t: -k2 -r \
    )

printf "\n%10s\n" "INOTIFY"
printf "%10s\n" "WATCHER"
printf "%10s  %5s     %s\n" " COUNT " "PID" "CMD"
printf -- "----------------------------------------\n"
for line in $lines; do
    watcher_count=$(echo $line | sed -e 's/.*://')
    pid=$(echo $line | sed -e 's/\/proc\/\([0-9]*\)\/.*/\1/')
    cmdline=$(ps --columns 120 -o command -h -p $pid) 
    printf "%8d  %7d  %s\n" "$watcher_count" "$pid" "$cmdline"
done


