currdir=$(shell pwd)
topdir=$(currdir)
builddir=${currdir}/build
export SHELL=/bin/bash
modelname:=default
ifneq ($(S),)
_S=>/dev/null 2>&1
endif
ifneq ($(V),)
_@=
else
_@=@
endif
.PHONY: $(builddir)
$(builddir): 
	$(_@)mkdir -p $@
