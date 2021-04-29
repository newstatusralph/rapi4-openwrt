
define package/openwrt/compile
  cd $(S) && \
  ( tar -C $(topdir)/model/$(modelname)/openwrt --numeric-owner -zcpf - files | tar -C $(S) -zxpf - ) && \
  make -j1 V=s FORCE_UNSAFE_CONFIGURE=1
endef

