
PACKAGE_NAME:=libtest
S:=$(builddir)/$(PACKAGE_NAME)/S
B:=$(builddir)/$(PACKAGE_NAME)/B
D:=$(builddir)/$(PACKAGE_NAME)/D

define package/libtest/fetch
endef

$(eval $(call deploy_package,libtest))

