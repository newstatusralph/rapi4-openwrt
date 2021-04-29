
PACKAGE_NAME:=test
S:=$(builddir)/$(PACKAGE_NAME)/S
B:=$(builddir)/$(PACKAGE_NAME)/B
D:=$(builddir)/$(PACKAGE_NAME)/D

DEPENDS:=openwrt
RDEPENDS:=libtest

define package/test/fetch
echo source downloading... && \
sleep 1 && \
echo done!!! && \
touch $$(@)
endef

define package/test/compile
echo compiling $(S)....
endef

$(eval $(call deploy_package,test))

define test_cmds
ls && 
sleep 1 && 
cmd  &&
echo done!!! 
endef

export test_cmds

.PHONY: test
test: 
	@ls 
	@cmd
	@echo $@ done

