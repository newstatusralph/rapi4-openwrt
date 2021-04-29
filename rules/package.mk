

define package_rules
export package/$(1)/$(2)

.PHONY: package/$(1)/$(2)/depends
package/$(1)/$(2)/depends: 

.PHONY: package/$(1)/$(2)/start package/$(1)/$(2) package/$(1)/$(2)/end
package/$(1)/$(2): package/$(1)/$(2)/depends \
					package/$(1)/prepare \
					package/$(1)/$(2)/start \
					$(builddir) $(builddir)/$(1)/.$(2) \
					package/$(1)/$(2)/end

package/$(1)/$(2)/start: 
	$(_@) echo -ne "\n$(2) '$(1)'\n\n"

package/$(1)/$(2)/end: 
	$(_@) echo -ne "\n$(2) '$(1)' done\n"

$(builddir)/$(1)/.$(2): 
	$(_@) $(call package/$(1)/$(2))

package/$(1)/$(2)/info: 
	$(_@) echo "package/$(1)/$(2)='$(call package/$(1)/$(2))'"

endef

define deploy_package

.PHONY: package/$(1)/prepare
package/$(1)/prepare: $(builddir)/$(1)

.PHONY: package/$(1)/build/depends
package/$(1)/build/depends: $(foreach d,$(DEPENDS) $(RDEPENDS),package/$(d)/build)

$(builddir)/$(1): 
	$(_@) mkdir -p $$(@)

$(foreach t,$(strip fetch config compile install),$(call package_rules,$(1),$(t)))

.PHONY: package/$(1)/build
package/$(1)/build: package/$(1)/build/depends \
						package/$(1)/prepare \
						package/$(1)/fetch \
						package/$(1)/config \
						package/$(1)/compile
	$(_@) echo "build $(1) done"

package/$(1)/install/depends: $(foreach d,$(RDEPENDS),package/$(d)/install)

.PHONY: package/$(1)/clean
package/$(1)/clean: 
	$(_@) rm -rf $(builddir)/$(1)

.PHONY: package/$(1)/info
package/$(1)/info:
	$(_@) echo S=$(S)
	$(_@) echo B=$(B)
	$(_@) echo D=$(D)

endef

