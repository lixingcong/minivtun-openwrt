## minivtun-openwrt

A fast secure and reliable VPN service in non-standard protocol for rapidly deploying VPN servers/clients or getting through firewall. Created by [@rssnsj](https://github.com/rssnsj). 

It's a very simple point-to-point tunnel client/server. only less than 20kB size.

This repo is an unoffical port for openwrt, if you prefer the offical one, please visit [minivtun-tools](https://github.com/rssnsj/network-feeds/tree/master/minivtun-tools).

The default route and init.d files was copied from [openwrt-shadowvpn](https://github.com/aa65535/openwrt-shadowvpn). I am so lazy!

### For Linux (Server-side)

Show you the Offical guide below

Install devel libs

	# ubuntu
	sudo apt-get install build-essential libssl-dev
	# CentOS
	sudo yum install make gcc openssl-devel

Compile and install

    git clone https://github.com/rssnsj/minivtun.git minivtun
    cd minivtun/src
    make
    sudo make install

Run and listen

	# for ipv4
	minivtun -l 0.0.0.0:443 -a 10.7.0.1/24 -e password -n mv0 -d
	# for ipv6
	minivtun -l [::]:443 -a 10.7.0.1/24 -e password -n mv0 -d

Change Default Route

Download server_up.sh and server_down.sh from this repo

[server_up.sh](https://github.com/lixingcong/minivtun-openwrt/blob/master/files/server_up.sh)

[server_down.sh](https://github.com/lixingcong/minivtun-openwrt/blob/master/files/server_down.sh)
	
Then execute the script for enable or disable forwarding traffic.

	# export sys-enviorments, the script need it
	# please change paras according the command you launch minivtun
	export net=10.7.0.1/24
	export intf=mv0
	
	# enable FORWARD
	sh server_up.sh
	
	# disable FORWARD
	sh server_down.sh
	
Enjoy it!

### For Openwrt (Client-side)

	# ar71xx platform
	tar xjf OpenWrt-SDK-ar71xx-for-linux-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2.tar.bz2
	cd OpenWrt-SDK-ar71xx-*
	cd openwrt
	git clone https://github.com/lixingcong/minivtun-openwrt package/minivtun-openwrt
	# Select Network -> minivtun
	make menuconfig
	make package/minivtun-openwrt/compile V=99
	
### Configure

Change password or port

	vi /etc/config/minivtun
	# Switch: enable = 1 or 0

Restart service

	/etc/init.d/minivtun restart
	
Use Chnroute.txt

Same as ShadowVPN or Shadowsocks, the chnroute.txt is available for Chinese user to change route.

Please visit  [openwrt-shadowvpn](https://github.com/aa65535/openwrt-shadowvpn) for more details on route-mode.

	# update route file
	wget -O- 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | awk -F\| '/CN\|ipv4/ { printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > /tmp/chinadns_chnroute.txt
	cp /tmp/chinadns_chnroute.txt /etc/
	
	vi /etc/config/minivtun
	# set the route-mode to 1 (Domestic Mode)
	# set route-file to /etc/chinadns_chnroute.txt
	
	/etc/init.d/minivtun restart

### Luci-app

A luci-app-minivtun was available, please vist [openwrt-dist-luci](https://github.com/lixingcong/openwrt-dist-luci).

### Wiki

Please visit offical page [minivtun](https://github.com/rssnsj/minivtun).

### License

GPLv3
