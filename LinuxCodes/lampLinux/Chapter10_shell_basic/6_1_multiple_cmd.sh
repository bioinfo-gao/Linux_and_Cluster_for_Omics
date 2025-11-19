data ; cmd ; cmd2 # no relation

cmd1 && cmd2  # cmd2 run only when cmd1 runs correctly
cmd1 || cmd2  # cmd2 will NOT run unless cmd1 get error 

# Useful case 
cmd && echo yes || echo no # echo the cmd result 
lsad && echo yes || echo no # echo the cmd result 

# WRONG way 
lsad  || echo no && echo yes # echo the cmd result 