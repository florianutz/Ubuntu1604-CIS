#!/bin/bash
sudopath=($(grep secure_path /etc/sudoers | cut -f2 -d= |cut -f2 -d\"))
IFS=:
for i in ${sudopath[*]}
do
  if [ -d "$i" ]
   then newsudopath+=($i)
  fi
done
echo "${newsudopath[*]}"

if [ "$1" == "debug" ]
  then
    echo
    echo "Debug secure_path: $(grep secure_path /etc/sudoers)"
    echo "Debug sudopath: $sudopath"
    echo "Debug result: ${newsudopath[*]}"
fi
