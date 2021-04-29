
define exec_cmd
$(_@)( ( ( sh -c "$(1)" ) | tee $(2) )  3>&1 1>&2 2>&3 | tee $(3) ) $(_S) ;
endef

define exec_cmd_sets
$(_@)( ( ( sh -c $${$(1)} ) | tee $(2) )  3>&1 1>&2 2>&3 | tee $(3) ) $(_S) ;
endef

