rwx 

chmod 

# chmod ugoa +-= rwx file/dir -R  mode=421 -R # recursive 

ls ~/tmp

mkdir -p ~/tmp/Japan/longze ~/tmp/Japan/cangjin  ~/tmp/Japan/dagui  ~/tmp/Japan/daqiao 
touch ~/tmp/Japan/story.list
touch ~/tmp/Japan/story.list2
touch ~/tmp/Japan/story.list3
touch ~/tmp/Japan/story.list4
touch ~/tmp/Japan/story.list51


chmod u+x ~/tmp/Japan/story.list 
chmod g+w ~/tmp/Japan/story.list 
chmod o-r ~/tmp/Japan/story.list 

chmod g=rwx ~/tmp/Japan/story.list2 

ll ~/tmp/Japan/story.list 

r ---- 4 
w ---- 2 
x ---- 1 

rwxrw-r--
 7  6  4
r-x-wx-w-
 5  3  2
rw-r-----
640 

chmod 644  ~/tmp/Japan/story.list3
chmod 640  ~/tmp/Japan/story.list4
chmod 777  ~/tmp/Japan/story.list5

cp -r ~/tmp/Japan ~/tmp/Japan2
chmod -R 777  ~/tmp/Japan2



# permssion for folder:
r  ls 
w  touch/mkdir/rmdir/rm
x  cd 

chown #change owner

sudo chown zhen daqiao # only root can do that 
sudo chown zhen daqiao # only root can do that 

cd ~/tmp/Japan2 :  
touch fengjie 

sudo useradd shencao
sudo passwd shencao

ll fengjie
sudo chown shencao fengjie

sudo groupadd lampbrother
sudo chgrp lampbrother fengjie

sudo chmod g+w fengjie


touch liuyifei
ll liuyifei

mkdir meinv
ls -ld meinv






