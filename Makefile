
include toplevel.mk
include .config
include rules/*.mk

ifdef _REALRUN

include package/*/*.mk
include model/*.mk

.PHONY: all
all: 

else

export _REALRUN=1
.DEFAULT_GOAL:=usage
_MAKEFILE=$(currdir)/$(word 1,$(MAKEFILE_LIST))
_MAKEFLAGS=$(filter-out --,$(MAKEFLAGS))

%:
	$(call exec_cmd,make -f $(_MAKEFILE) $@ $(filter-out --,$(_MAKEFLAGS)),$(topdir)/build.log,$(topdir)/build_err.log)
#	@[ -e "/usr/bin/time" ] && time make -f $(_MAKEFILE) $@ $(filter-out --,$(_MAKEFLAGS)) || make -f $(_MAKEFILE) $@ $(filter-out --,$(_MAKEFLAGS)) 

endif

