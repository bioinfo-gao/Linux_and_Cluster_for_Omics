# (1) =============
Internet:
The 3 most freqently used internet service
1) WWW
2) FTP
3) Email
# (2) =============
URL: 统一资源定位
协议+ 域名/IP:端口+网页路径+网页名

（协议+ 端口+网页名都有默认值）

http://www.lampbrother.net:80/index



.net           一级域名
lampbrother    二级域名
www            三级域名

组织一级域名：.edu
地区一级域名: .cn

只要一级和二级域名都准确，则不是钓鱼网站，因为二级域名是经过申请之后全球唯一
但钓鱼网站经常在三级域名的位置标识正确公司，所以必须查看一二级网站
比如 login_microsoft.login_fishing.com
比如 login.ta0bao.com, o==> 0

其二级域名实际上是log_fishing

第二使用https
第三看chrome Edge有没有报警这是钓鱼网站


# (3) ============= DOS : 地址解析协议命令 IP  Mac Address  ARP -A
Loading personal and system profiles took 3669ms.
(base) PS C:\Users\zhen-> ARP -A

Interface: 192.168.1.171 --- 0x11
  Internet Address      Physical Address      Type
  192.168.1.1           e8-9f-80-8f-a5-09     dynamic
  192.168.1.73          48-f1-7f-75-3f-3c     dynamic
  192.168.1.255         ff-ff-ff-ff-ff-ff     static
  224.0.0.22            01-00-5e-00-00-16     static
  224.0.0.251           01-00-5e-00-00-fb     static
  224.0.0.252           01-00-5e-00-00-fc     static
  239.255.255.250       01-00-5e-7f-ff-fa     static
  255.255.255.255       ff-ff-ff-ff-ff-ff     static

Interface: 172.21.16.1 --- 0x2d
  Internet Address      Physical Address      Type
  172.21.22.209         00-15-5d-20-ef-98     dynamic
  172.21.31.255         ff-ff-ff-ff-ff-ff     static
  224.0.0.2             01-00-5e-00-00-02     static
  224.0.0.22            01-00-5e-00-00-16     static
  224.0.0.251           01-00-5e-00-00-fb     static
  224.0.0.252           01-00-5e-00-00-fc     static
  239.255.255.250       01-00-5e-7f-ff-fa     static
# (4) ============= in Linux  : arp -a
HP7EA50E (192.168.1.48) at f8:b4:6a:7e:a5:0e [ether] on wlp3s0
DESKTOP-C8OKE65 (192.168.1.171) at dc:21:48:ab:01:12 [ether] on wlp3s0
Linksys00717 (192.168.1.1) at e8:9f:80:8f:a5:09 [ether] on wlp3s0

实际上两者等价，因为DOS 命令不区分大小写

# linux and DOS same as following 
# (5) ============= netstat -an 


# (6) ============= DNS 

# (7) =============  windows linux same 
(base) PS C:\Users\zhen-> ping www.google.com

