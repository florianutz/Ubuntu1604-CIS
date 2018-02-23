#!/bin/bash
sudopath=($(grep secure_path /etc/sudoers | cut -f2 -d= |cut -f2 -d\"|tr ":" " "))
for i in ${sudopath[@]}
do
  if [ -d "$i" ]
   then newsudopath+=($i)
  fi
done
echo $(IFS=:; echo "${newsudopath[*]}")
