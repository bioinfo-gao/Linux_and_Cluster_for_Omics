#!/bon/bash
test -e student.txt
[ -e /etc/passwd ]
[ -e /etc/passwd ] && echo "yes, it's exist" || echo no
[ -w student.txt ] && echo "yes, it's exist and writable" || echo no

