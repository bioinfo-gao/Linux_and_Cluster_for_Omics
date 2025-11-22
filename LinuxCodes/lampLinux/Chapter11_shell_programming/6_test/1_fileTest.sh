#!/bon/bash
test -e ../data/student.txt # 无显示值

echo $?  # 0 means no error


# test 有两种形式， 一种用 test 关键字， 一种用 []
test -e /etc/passwd 

[ -e /etc/passwd ]
[ -e /etc/passwd ] && echo "yes, it's exist" || echo no
[ -w student.txt ]
 && echo "yes, it's exist and writable" || echo no

