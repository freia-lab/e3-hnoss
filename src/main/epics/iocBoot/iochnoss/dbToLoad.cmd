#############################################
## DB loading                              ##
#############################################

cd "$(TOP)/db"
#dbLoadRecords("xxx.db","user=konradHost")
#dbLoadTemplate(xxx.substitutions)
#dbLoadRecords("General.db","user=nicklasbpHost")
#dbLoadTemplate("hnoss.substitutions")

dbLoadRecords("2Kpumps.db", "SUBS=2Kpumps, DEV=Ctrl, OFFS=0, OFFS2=0")
dbLoadTemplate("2Kpumps.substitutions")

dbLoadRecords("Dwater.db", "INIT_EVNT=7")
dbLoadTemplate("Dwater.substitutions")
dbLoadTemplate("vac.substitutions")
dbLoadTemplate("ArcDet.substitutions")
dbLoadRecords("vac.db", "INIT_EVNT=7")

# PLC communication 
#cd "$(EPICS_MODULES)/s7plc/db"
#dbLoadRecords("s7plccom.db", "CBS1=XXXX, CBS2=XXXX, CTRLTYPE=P, IDX=XX, IOCTYPE=XXXX, FOOTER_OFFSET=XXXX")
#dbLoadRecords("s7plccmdcom.db", "CBS1=XXXX, CBS2=XXXX, CTRLTYPE=P, IDX=XX, IOCTYPE=XXXX, FOOTER_OFFSET=XXXX")

# IOC monitor
cd "$(EPICS_MODULES)/iocmon/db"
# The macro CTRLTYPE identifies the controller; P for (PLC), H for PSH and F for PCF and S for SERVER
# The macro IDX is the controller's index
# The macro IOCTYPE is IOCtype; CORE, SYSM, PLC
# Uncomment below statement if iocmon feature is required and substitue XXXX with proper values
#dbLoadRecords("iocmon.db","CBS1=XXXX, CBS2=XXXX, CTRLTYPE=X, IDX=X, IOCTYPE=XXXX")
