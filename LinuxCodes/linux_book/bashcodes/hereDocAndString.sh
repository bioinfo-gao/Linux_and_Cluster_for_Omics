#!/bin/bash
wc -w <<EOF
 This is a test.
 Apple juice.
 100% fruit juice and no added sugar, colour or preservative.
EOF

wc -w <<< "This is a test."

var="Neither in this world nor elsewhere is there any happiness in store for him who always doubts."

# Usually, you can not grep into a $var.
# For example, try to grep word "nor" using $var:
grep "nor" $var

# However, with here string you can grep into $var:
grep "nor" <<<$var >/dev/null && echo "use here string method: Found" || echo "Not found"

# Another way is use shell pipes:
echo $var | grep -q "nor"  && echo "use pipes method: Found" || echo "Not found"

# The following command counts the total active network interfaces:
wc -w <<<$(netstat -i | cut -d" " -f1 | egrep -v "^Kernel|Iface|lo")
