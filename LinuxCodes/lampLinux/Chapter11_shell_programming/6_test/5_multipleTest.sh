#!/bon/bash
v=11

# -a 
# -o

[ -n $v -a $v -gt 23 ] && echo "both tests are true" || echo "not all tests are true"

[ -n "$v" -a "$v" -gt 23 ] && echo "both tests are true" || echo "not all tests are true"
