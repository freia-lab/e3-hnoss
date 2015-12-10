#############################################
## Autosave monitor post setup             ##
#############################################

cd "${TOP}/iocBoot/$(IOC)"
create_monitor_set("iochnoss-freia.req",30,"P=$(AUTOSAVE_SYSM_PV_PREFIX)")

