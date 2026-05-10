#!/bin/sh

echo "Total CPU usage" && top -bn1 | grep "%Cpu(s)" | awk '{ print 100 - $8"%"}'

echo "Total memory usage" && df -h / | awk 'NR==2 print "Total size: " $2 " Used : " $3 " Available : " $4 " '

echo "Top 5 processes by CPU usage"
ps aux --sort=-%cpu | awk 'NR>1 && NR<=6 { print $3"% CPU  -  " $11 "  (PID: " $2 ")" }'

echo ""

echo "Top 5 processes by Memory usage"
ps aux --sort=-%mem | awk 'NR>1 && NR<=6 { print $4"% MEM  -  " $11 "  (PID: " $2 ")" }'
