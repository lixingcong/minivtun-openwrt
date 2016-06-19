include $(TOPDIR)/rules.mk

PKG_NAME:=minivtun
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/lixingcong/minivtun-openwrt/releases/download/v$(PKG_VERSION)
PKG_MD5SUM:=f6946685916e2dd039e7d65708dcd8b0

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=COPYING
PKG_MAINTAINER:=lixingcong<lixingcong@live.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_USE_MIPS16:=0
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/minivtun
	SECTION:=net
	CATEGORY:=Network
	TITLE:=A simple tun based on openssl
	URL:=https://github.com/rssnsj/minivtun
	DEPENDS:=+kmod-tun +ip +libopenssl
endef

define Package/minivtun/description
A simple tun based on openssl
endef

define Package/minivtun/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_DIR) $(1)/etc/minivtun

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/minivtun $(1)/usr/sbin/
	$(INSTALL_DATA) ./files/shadowvpn.config $(1)/etc/config/minivtun
	$(INSTALL_BIN) ./files/shadowvpn.init $(1)/etc/init.d/minivtun
	$(INSTALL_DATA) ./files/shadowvpn.hotplug $(1)/etc/hotplug.d/iface/30-minivtun
	$(INSTALL_DATA) ./files/client_up.sh $(1)/etc/minivtun/
	$(INSTALL_DATA) ./files/client_down.sh $(1)/etc/minivtun/
endef


$(eval $(call BuildPackage,minivtun))
