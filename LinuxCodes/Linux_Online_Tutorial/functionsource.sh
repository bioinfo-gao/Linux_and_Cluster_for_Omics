#!/bin/bash
# load myfunctions.sh function file
source myfunctions.sh
 
# local variable
quote="He WHO Sees me in all things, and ALL things in me, is never far from me, and I am never far from him."
 
# invoke is_root()
is_root && echo "You are a superuser." || echo "You are not a superuser."
 
# call to_lower() with ${quote}
to_lower ${quote}
