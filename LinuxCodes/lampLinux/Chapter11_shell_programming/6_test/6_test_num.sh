#!/bin/bash
#Author Zhen Gao (Email: zhen.gao@yahoo.com)
aa=2
bb=895

[ "$aa" == 2 ] && echo "same"|| echo "not same" # == for string compare

aa=2
ee=2

[ "$aa" == "$ee" ] && echo "same"|| echo "not same" # == for string compare, 2 var

cc=2
bb=895

[ "$cc" -lt "$bb" ] && echo "less"|| echo "not less" # == for num compare


[ "$aa" == "$bb" -o "$cc" -lt "$bb" ] && echo "satisfy at least one"|| echo "noneare meet" # -o : or; -a :and

