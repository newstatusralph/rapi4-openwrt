define clean_cmd
$(_@)rm -rf $(builddir)
$(_@)rm -rf $(topdir)/*.log
endef

.PHONY: clean
clean: 
	$(call clean_cmd)

