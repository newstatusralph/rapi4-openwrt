
PACKAGE_NAME:=openwrt
S:=$(builddir)/$(PACKAGE_NAME)/S
B:=$(builddir)/$(PACKAGE_NAME)/B
D:=$(builddir)/$(PACKAGE_NAME)/D

define package/openwrt/fetch
  git clone https://git.openwrt.org/openwrt/openwrt.git $(S) && \
  cd $(S) && ./scripts/feeds update -a && \
  ./scripts/feeds install -a && \
  touch $$(@)
endef

define package/openwrt/config
  cp -a $(topdir)/model/$(modelname)/openwrt/config.openwrt $(S)/.config && \
  cd $(S) && make defconfig && \
  touch $$(@)
endef

define package/openwrt/compile
  cd $(S) && make -j1 V=s FORCE_UNSAFE_CONFIGURE=1
endef

-include $(topdir)/model/$(modelname)/openwrt/openwrt.mk

$(eval $(call deploy_package,openwrt))

