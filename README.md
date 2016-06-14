## minivtun-openwrt

A fast secure and reliable VPN service in non-standard protocol for rapidly deploying VPN servers/clients or getting through firewall. Created by [@rssnsj](https://github.com/rssnsj). 

It's a very simple point-to-point tunnel client/server. only 10kB size.

This repo is an unoffical openwrt-dist, if you prefer the offical one, please visit [minivtun-tools](https://github.com/rssnsj/network-feeds/tree/master/minivtun-tools).

The way default route and init.d files was inspired by [openwrt-shadowvpn](https://github.com/aa65535/openwrt-shadowvpn).

### For Linux

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
	
### For Openwrt

	# ar71xx platform
	tar xjf OpenWrt-SDK-ar71xx-for-linux-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2.tar.bz2
	cd OpenWrt-SDK-ar71xx-*
	cd openwrt
	git clone https://github.com/lixingcong/minivtun-openwrt package/minivtun-openwrt
	# Select Network -> minivtun
	make menuconfig
	make package/minivtun/compile V=99
	
### Configure

Change password or port

	vi /etc/config/minivtun
	# Switch: enable = 1 or 0

Restart service

	/etc/init.d/minivtun restart
	
See also Offical page [minivtun](https://github.com/rssnsj/minivtun)


### License

GPLv3
