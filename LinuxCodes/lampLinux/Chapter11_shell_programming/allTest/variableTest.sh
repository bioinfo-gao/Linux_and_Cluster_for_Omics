#!/bon/bash
name1=zhen
name2=gao
[ -z $name1 ] && echo "it's not exist" || echo "it's exist"
[ $name1 == $name2 ] && echo "it's same" || echo "it's different"


