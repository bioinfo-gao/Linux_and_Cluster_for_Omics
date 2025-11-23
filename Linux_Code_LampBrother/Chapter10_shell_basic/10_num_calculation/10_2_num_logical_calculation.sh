
ff=$(( (11+3)*3/2 ))  
echo $ff

gg=$[ 14%3 ] 
echo $gg

hh=$((  1 && 0 ))  # logical and 
echo $hh

ii=$((  0 || 1 ))  # logical or
echo $ii

#Bash 的原生算术扩展支持乘方运算符 **，但只能处理整数。
# 示例：3 的 4 次方 (3^4)
result=$((3**4))
echo $result
# 输出: 81