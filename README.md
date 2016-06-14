## minivtun-openwrt

A fast secure and reliable VPN service in non-standard protocol for rapidly deploying VPN servers/clients or getting through firewall. Created by [@rssnsj](https://github.com/rssnsj). 

It's a very simple point-to-point tunnel client/server. only 10kB size.

This repo is an unoffical openwrt-dist, if you prefer the offical one, please visit [minivtun-tools](https://github.com/rssnsj/network-feeds/tree/master/minivtun-tools).

The way default route and init.d files was inspired by [openwrt-shadowvpn](https://github.com/aa65535/openwrt-shadowvpn).

### 依赖包

	libopenssl
	ip
	kmod-tun


### 编译

	# 以 ar71xx 平台为例
	tar xjf OpenWrt-SDK-ar71xx-for-linux-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2.tar.bz2
	cd OpenWrt-SDK-ar71xx-*
	# 获取 Makefile
	cd openwrt
	git clone https://github.com/lixingcong/minivtun-openwrt package/minivtun-openwrt
	# 选择要编译的包 Network -> minivtun
	make menuconfig
	# 开始编译
	make package/minivtun/compile V=99
	
### 配置

详见[minivtun](https://github.com/rssnsj/minivtun)主页，可以修改config

	vi /etc/config/minivtun
	# 总开关 enable=1 表示开启
	# 填上ip、端口、密码等
	/etc/init.d/minivtun restart
