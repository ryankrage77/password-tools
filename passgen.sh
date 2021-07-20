# pull printable characters from /dev/urandom, excluding characters often not allowed in passwords, truncated to a length of 8.
< /dev/urandom tr -cd "[:print:]" | tr -d '[]<>(),~.\;\: \\/\`\|\{\}\'\"\' | head -c 8; echo
