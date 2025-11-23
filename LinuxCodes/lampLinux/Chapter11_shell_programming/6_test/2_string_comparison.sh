#!/bon/bash
name1=zhen
name2=gao
[ -z $name1 ] && echo "it's not exist" || echo "it's exist"
[ $name1 == $name2 ] && echo "it's same" || echo "it's different"
[ $name1 == "passed" ] && echo "The string is passed" || echo "it's different"

# -z 不为空
# -n 为空 
# == means string same ,  different from   -gt etc
# !=
