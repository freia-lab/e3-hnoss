require s7plc
require autosave

epicsEnvSet("AUTOSAVE_SYSM_PV_PREFIX","hnoss:")

#############################################
## Register all support components         ##
#############################################

requireSnippet(userPreDriverConf-hnoss-freia.cmd, IP_ADDR=$(PLC_IPADDR))
requireSnippet(dbToLoad-hnoss-freia.cmd)
#requireSnippet(hnoss-freia-preSaveRestore.cmd)

#############################################
## IOC initialization                      ##
#############################################

iocInit

#< "${TOP}/iocBoot/iochnoss-freia/iochnoss-freia-postSaveRestore.cmd"
< "${TOP}/iocBoot/iochnoss-freia/seqToLoad.cmd"
< "${TOP}/iocBoot/iochnoss-freia/userPostDriverConf.cmd"


