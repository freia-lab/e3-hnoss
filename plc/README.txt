PLC_Cryostat_2015_03_10 - KG - Added interlock for the FV000 and FV001 valves (changes only in FC556).
PLC_Cryostat_2015_05_13 - KG - Adrien's changes as described below:

1.Menu buttons: Change spelling S�quence to Sequence

3.When a sensor is out of range it would be nice to show UR (under range) or OR (over range). Even *** is better than an arbitrary number.

4.In all sequence windows: Indicate to which sensor the values refer to, if possible.

6.In all graphs: It would be nice if the unit could be displayed for the value axis.(The word procedure)

8.Add the new valves (FV551 to FV555) to the corresponding sequences.

9.In sequence 8, add the possibility to choose where to send the gas: either to the gasbag or to the Kaeser.(point 8 & 9 : FV550 to FV558 are reprogrammed with news buttons in pumping system window)

10.Check polynomial functions of TT103, TT104, TT113 and TT117. These sensors are switching temperatures. Maybe the ranges are not well defined?

Done. Checked all calibration curves in the control system and they are OK

This values were wrong : TT103.Switch01 / TT104.Switch01 / TT104.A00 / TT104.A01 / TT104.A02 / TT104.A03 / TT113.Switch01 / TT113.A00 / TT113.A01 / TT113.A02 / TT113.A03 / TT117.Switch01 / TT117.A00 / TT117.A01 / TT117.A02 / TT117.A03

 

11.PT101 and PT102 do not give correct readings. Bad conversion?

These pressure sensors are OK now, but after tests in January 2015 still there is a problem when switching gauges within the MKS controller: when the controller switches from one to the other the value the control system receives is not a real value and it creates havoc in the sequences.

12.Clear alarms in the control system: mostly MKS alarms.

13.In the user interface, make the level probe LT101 more realistic by placing it outside the 2K tank and between the 2K tank and the cavity.

15.Add more measuring points for all variables, not only when the value changes. All points are archived all 2 seconds..

PLC_Cryostat_2015_05_19 - KG - Changed the function for handling analog input from MKS's pressure gauges in order to get full precision. Changed FC450 to call FC308 instead of FC304. Added new FC308.

PLC_Cryostat_2015_06_23_before_intervention - KG - Added epics interface to the bits controling the return He path (Baloon/Compressor)

PLC_Cryostat_2015_06_24_ok - AJ - Fixed sNC status bit updates for FV011 and generally for all other FV valves. Made cleanup of the code (removed unused blocks, added blocke that are referenced but not used) to compile without errors.

PLC_Cryostat_2015_06_26_tested_saturday_evening - tested by Adrien

PLC_Cryostat_2015_06_26_end - last version left by AJ.

PLC_Cryostat_2016_03_08 - Changed the scale factor for FT550. Changed only FC480 Network 1. KG

PLC_Cryostat_2016_05_12 - Changed the FT550 from the pulse interface to 4-20 mA interface. Changes in DB304, DB321, DB380, DB400 and FC206, FC208, FC217, FC480, FC400, FC404.
	Never downloaded to the PLC (16-05-13). KG

PLC_Cryostat_2016_05_27 - Archive created on HNOSS PC after copying the blocks DB304, DB321, DB380, DB400 and FC206, FC208, FC217, FC480, FC400, FC404 from PLC_Cryostat_2016_05_12.
	Downloaded to the PLC only the new blocks (in STOP mode). KG

PLC_Cryostat_2016_09_19 - KG - Archive created on HNOSS PC after copying the blocks DB100, DB101, DB360, DB400, FC101 & FC461 and source code S7PLC_PSI_CodacStruct122 from PLC_Cryostat_2016_09_19 on phy-clota.
	Downloaded to the PLC only the new blocks (in STOP mode). Changelog: Added spare Cernox channels as TT01x,TT02x,.. ,TT09x

PLC_Cryostat_2016_11_23_End.zip - AJ, A lot of changes. See PLC_Cryostat_2016_11_23_End.doc

PLC_Cryostat_2017_01_19_NewADC.zip - KG - Added a new ADC in the configuration (for read-out of pressure gauges connected to the MKSs

PLC_Cryostat_2017_01_27.zip - KG - Corrected the value of #L_Unit for MKS-3 in FC450. Fixed a bug in displaying the state time in sequence 1 (FC201). (archive created on phy-clota).
PLC_Cryostat_2017_01_30.zip - KG - Added a new function FC328 for converting the ascii strings from MKS (better resolution for small values). Modified FC350 to use the new function. (archive created on phy-clota).

PLC_Cryostat_2017_02_02.zip - KG - Corrected the value of #L_Unit and #H_Unit for MKS-3 in FC450. (archive created on phy-clota). The MKS-3 is set locally as H: 1000 mbar, L: 50 mbar, Sensor voltage: 5 V.
	The readouts are consitent on the instrument and in the remote displays. 

PLC_Cryostat_2017_02_28.zip - KG - Fixed missing code for Epics controlling the change of GHe exhaust from Kaeser to the balloon and vice versa.
PLC_Cryostat_2017_09_21.zip - KG - Added a new heater EH131, thermal switch TS131 and pt100 TT131 
	(for details see http://freia.physics.uu.se/Cntrlelog/show.jsp?dir=/2017/09&pos=2017-09-19T16:43:55 and
	http://freia.physics.uu.se/Cntrlelog/show.jsp?dir=/2017/09&pos=2017-09-21T10:31:00 )
PLC_Cryostat_2017_09_22.zip - KG - Added command state sCmd and changed name of the old sCmd bit to SHtrOn for Heater type 1. Added state of the command
	in Auto mode for Electrovalvaes (EV), Valves (FV) and heaters type 1. See http://freia.physics.uu.se/Cntrlelog/show.jsp?dir=/2017/09&pos=2017-09-22T11:12:22
PLC_Cryostat_2017_10_19.zip - KG - Fixed an error in reading MKS (PT102 steps). Increased the read period for FT551 & FT552 from 0.5 to 1 s.
	See http://freia.physics.uu.se/Cntrlelog/show.jsp?dir=/2017/10&pos=2017-10-19T17:11:56
PLC_Cryostat_2017_10_24.zip - KG - Added automatic control for EH131. See http://freia.physics.uu.se/Cntrlelog/show.jsp?dir=/2017/10&pos=2017-10-24T13:50:50
PLC_Cryostat_2017_10_25.zip - KG - Fixed closing CV552 in Seq_13. See http://freia.physics.uu.se/Cntrlelog/show.jsp?dir=/2017/10&pos=2017-10-30T17:23:20
PLC_Cryostat_2017_11_10.zip - KG - Added PT103 pressure meter in 2K vessel. See http://freia.physics.uu.se/Cntrlelog/show.jsp?dir=/2017/11&pos=2017-11-09T14:58:29. 
	Fixed bug: sRealRdV was not copied to Epics buffer for analog inputs. 

PLC_Cryostat_2017_11_24.zip - KG - Fixed bug: sAutoRdV was not updated for analog valves. Change only in FC307 (#FC_ANALOG_VALVES) Network 13.
PLC_Cryostat_2017_11_27.zip - KG - Fixed bug: sAutoRdV was not updated for CERNOX and EDWARDS. Added a new Pirani gauge PT005. Changed the usnit and scaling
	factors for FT301,FT302. See deatails: http://freia.physics.uu.se/Cntrlelog/show.jsp?dir=/2017/11&pos=2017-11-27T10:22:24
PLC_Cryostat_2017_11_28.zip - KG - Fixed bug: Sequence 11 can start without checking table or magnetic screen. If bot are deselected the TIC101 regulator is off and the set value for CV101 is 0.
	Changes in FC562 Network 33 and FC212 Network 9.

PLC_Cryostat_2018_01_04.zip - KG - Partially prepared for the communication to Gersemi PLC. Change in the system block (new network connection definition)
PLC_Cryostat_2018_01_24.zip - KG - Added FT131. Modified DB100, DB101, DB400, DB304 & FC404
PLC_Cryostat_2018_01_26.zip - KG - Added OR and UR bits to Epics status buffer. Changed conditions for OR and UR from >= to > and <= to < accordingly.
	Changes in DB100, FC303 & FC304.
PLC_Cryostat_2018_01_29.zip - KG - Added OR and UR bits to Epics status buffer. Changed conditions for OR and UR from >= to > and <= to < accordingly for Cernox and MKS.
	Changed the UR condition limit from 1.0 to 1.25 K. For MKS changed the limit condition for OR from #Scale_out.max (10000) to 2500. Changes in FC361 & FC308.
PLC_Cryostat_2018_02_06.zip - KG - Added copying sRealRdv for MKS analog data (pressures) to the Epics buffer. Fixed ISII-Tech's bug in FC308.
PLC_Cryostat_2018_02_27.zip - KG - Added control of the Coupler 2 temperature TT148 with the help of EH108 in seq 10. Changed only Network 19 in FC563. 
	See http://freia.physics.uu.se/Cntrlelog/show.jsp?dir=/2018/02&pos=2018-02-27T16:26:46
	!!!!!!!!!!!!!!!! NOTE: This modification should be removed. If we want to make this feature permanent we should do it for both couplers and must add a new parameter to the
	sequence 10 panel with the couplers' temperature. !!!!!!!!!!!!!!!
PLC_Cryostat_2018_06_05.zip - KG - Adrien J fixed the communication HNOSS-Gersemi.
PLC_Cryostat_2018_06_08.zip - KG - Added data to be used by Gersemi (HeartBeat, CV5201) Used Epics Dialog V126.
PLC_Cryostat_2018_06_15.zip - KG - Added data to be used by Gersemi (Freq_2K_pumps) Used Epics Dialog V126. Edited Com_PLC_Vertical source file and compiled. Loade DBs and FC130.
PLC_Cryostat_2018_06_19.zip - KG - Added EH131 on in Seq9 step 6 (FC413)
PLC_Cryostat_2018_06_20.zip - KG - Added more information that is sent to Gersemi. Added communication status for the 2K pumps and the HNOS ioc in order to reliably use the information
	from EPICS in the PLC program (in case there is a communication problem and the EPICS data can be not accurate). So far this information is not used yesy by the PLC program
	but I plan to use it for sequences that rely on the information on 2K pumps.
PLC_Cryostat_2018_08_28.zip - KG - Changed the valve to be used by the vertical cryostat from CV5201 to CV5203 (it was wrong label on the valve). In principle this update 
	does not change the program - only the symbol names.

PLC_Cryostat_2018_10_01.zip - AJ - Changed the control of the valves FV554-FV556 to be also controlled from Gersemi (FC556). Fixed the old bug - fault status of Heater2 type not copied to Epics.(FC314)
PLC_Cryostat_2018_11_12.zip - KG - Intermediate version in preparation for integrating of the cryo-module (before starting changes in MKS related stuff (UDT350, DB350, FC350, FC450).
PLC_Cryostat_2018_11_15.zip - KG - the first version of cryomodule support. Changes in DB100, DB101, DB350, DB301, FC251, FC252, FC312, FC350, FC450. There is support for the CM mode - at the moment only changes
	the range of MKS sensors. Added support for manual selection of MKS's setpoint between setpoint A and Analog setpoint.
PLC_Cryostat_2018_11_20.zip - KG - Added switching 4K exhaust in the CM mode. Added possibility to change between WinCC/Epics control from Epics. 
	Fixed MKS communications error by increasing the character delay time to 12 ms. Added extra status in Epics for grafcet SQ-ChangCircuit.
PLC_Cryostat_2018_11_27.zip - KG - Added option that the when switching the He exhaust in CM mode the MKS will not be set back to analog control. 
	For detail see http://freia.physics.uu.se/Cntrlelog/show.jsp?dir=/2018/11&pos=2018-11-28T08:56:28
PLC_Cryostat_2018_11_30.zip - KG - Changed the scaling factor for MKS2 Hi pressure gauge (PT01, 2000 Torr) in the CM mode. Changes only in FC450.
PLC_Cryostat_2018_12_18.zip - KG - Added the S7 connection to the cryomodule PLC (192.168.1.11). It uses GET/PUT functions to write/read data from 
	CM PLC. No changes are needed on the CM PLC side to establish the communications - only reading/writing the appropriate data blocks is required.
	At the momnet only the test data is exchanged between HNOSS and CM (FC132 on HNOSS).
PLC_Cryostat_2018_12_19.zip - KG - Changed the default position of CV550 to closed (from open) when there is no any sequence requesting other setting.
PLC_Cryostat_2019_02_08.zip - KG - Modified the communication to the CM PLC - fixed HeartBeat. Changed only FC132, DB132 & DB133


PLC_Cryostat_2019_02_08.zip - KG - Added data to Data_from_CM (comm status, state machine states). Modified seq9: disabled a lot of actions 
	when HNOSS control is in CMmode ("#PLC".CM_mode = 1) FC557/N6 FC208/N6. Changes in FC210 (G7_SQ9):
					Changed initial condtions (Network1), added cond 3 & 4, 
					automatic start (Network5),
	Added code for managing FV401.

PLC_Cryostat_2019_04_15.zip - KG - Added data sent to the CM (Status of CV5202 and FV401)
	Added code for managing FV501
PLC_Cryostat_2019_05_02.zip - KG - Added data sent to the CM (Status of FV55*, acquisition value of CV550-551 and FT550-FT551)
	Added parameter SQ7.cParR15/SQ7.sParR15 - set point for PT550 (CM:PT01) in step 5: cryomodule cool-down
	Added parameter SQ8.cParR10/SQ8.sParR10 - set point for PT550 (CM:PT01) in step 6: cryomodule 4K operation
	Added setting the MKS2 PID regulator ON/OFF based on CM PLC variable m141.0

PLC_Cryostat_2019_05_03.zip - KG - Preparations for using Seq9 for the cryomodule. Went through all the blocks containing SQ9 steps. The following 
	blocks are ready for 2K operation: FC208 -SQ8 (no need for changes), FC556 - valves (no need for changes), 
	FC557 - Analog valves: CV101 - modified to disable in CM mode
	FC563 - Heaters. control of EH131 - modified to disable in CM mode
	FC562 - PID for level LHe controllers - modified to disable in CM mode

===============================================
DB_SQ9.G7.X is used in the following blocks:
FC208 - used for stopping the sequence 8 - not relevant - sequence 8 is not running when we run the CM
FC210 - SQ9
FC600 - MKS
FC556 - Valves
FC557 - Analog valves: CV101 - modified to disable in CM mode - All done
FC563 - Heaters. control of EH131 - modified to disable in CM mode - All done
FC562 - PID for level LHe controllers - modified to disable in CM mode - All done

_______________
FC556 - Valves (all FV55* valves are controlled by SQ9, switching sequence and Gersemi)

FV551 - no need to change
FV552 - no need to change
FV555 - no need to change (this valve is also controled by Gersemi - check the compatibility !!!!!)
FV556 - no need to change (this valve is also controled by Gersemi - check the compatibility !!!!!)
FV557 - no need to change (manual valve)

===============================================

PLC_Cryostat_2019_05_06.zip - KG - FC251 - added parameter for the CM in SQ9 (MKS2 PID SP)
	FC600 - Added PID SP for MKS2 for 2K mode.
	Fc210 - Changed initial conditions, disabled SQ9_Fault (controlling the valves CV101-CV105) in the CM mode. Maybe we should set another
	bit for the control of the CM valves.
	FC251 - Added extra parameter in SQ9 for the CM mode (MKS2 set-point)

PLC_Cryostat_2019_05_10.zip - KG - FC251 - added state steps in the data from CM structure.
	Modified control of MKS2 for the CM LHe cooling down step (only missing operation of CV5202) - NOT TESTED!
	Added support for switching the GHe to gasbag/compressor when MKS2 has the PID reg On in CM mode - NOT TESTED!

PLC_Cryostat_2019_05_16.zip - KG - Added control of FV501 in CM's standby state. Added control of CV550 (MKS2) in CM's standby state.

PLC_Cryostat_2019_05_28.zip - KG - Fixed bug in Network 10 of FC600 (CV550 manual control was used also for the PID set-point).

PLC_Cryostat_2019_06_20.zip - KG - Added sending state of SQ9 to the CM PLC (change in db132 and FC132 - Added network 23.
	Added automatic starting and finishing (state 30 -> state 0) sequence 9 from CM PLC.

PLC_Cryostat_2019_06_26.zip - KG - Added starting of sequence 9 from the CM only after detection of transition to step6 (FC210 Network 6)
PLC_Cryostat_2019_06_27.zip - KG - Finally fixed automatic starting/stopping of SQ9 (FC210 Network 6). 2K operation with CM tested succesfully.
PLC_Cryostat_2019_10_03.zip - KG - Prepared to fully automatize CM warm-up (not completed). Added Transfer of CV5202 related data to the CM PLC.
	Changes only in FC132.
PLC_Cryostat_2020_11_04.zip - KG - Added initial conditions in SQ1 when in CM's mode - CM must be in S2 (Conditioning) state (FC201).
	Added condition for closing FV550 when the Sequence 1 is running (FC556)
PLC_Cryostat_2020_11_05.zip - KG - Made CV552 closed in the purging sequence (sequence 1) to avoid pumping the oil from FT552 (FC600).
	Made CV101, CV102 and CV103 closed in sequence 1 when in cryomodule mode.
PLC_Cryostat_2020_12_08.zip - KG - Added tranfer of PVs for the magnet current to Gersemi PLC. (new S7PLC_PSI_CodacStruc130 source file, changes
	in FC130. NOTE - did not updated source file Com_PLC_Vertical but added the new entries directly into db131.
PLC_Cryostat_2020_12_17.zip - KG - Removed setting MKS2 (CV550) from the CM's parameter CM-RHtr:CV550:sSetV during the CM's warm-up sequence.
PLC_Cryostat_2021_01_07.zip - KG - Improved #FC_MKS function - added check if the valve position set point has been written correctly (by comparing the
	value in S1 command to the value received in R1 command) and in case of mis-match forcing to resend the S1 command.
PLC_Cryostat_2021_03_24.zip - KG - Enabled the set-point for MKS2 set by CstatH-Ctrl:SQ9:cP_CM_SP_MKS2 parameter (CM's alias CM-Ctrl:S8:cP_SP_PT01) in
	cryomodule's 2K operation (S8). Changed only in FC600.
PLC_Cryostat_2021_03_31.zip - KG - Added possibility to set the PID parameters from Epics. New source file S7PLC_PSI_CodacStruc131 compiled. The Epics
	buffers sizes did not change (removed some of the reserve heater2 sturctures). Added handling of data from Epics in FC251 (EPICS_Commands).
PLC_Cryostat_2025_01_03.zip - KG - Added control of CV5202 from the PLC. It requests opening of CV5202 when SQ5 is in states 6, 8 or 10. 
  One problem remains to be solved: CV5202 and FV500 are closed at the same time when SQ5 stops leaving the cold Helium in the transfer line.
  There is a safety valve there but it would be better to keep FV500 open for some time until the temperature of the He (TT500) will almost reach the 
  ambient temperature. 
PLC_Cryostat_2025_01_03-1.zip - KG - Added logic for keeping FV500 open under the condition that CV5202 is closed and TT500 < 200 K
PLC_Cryostat_2025_01_03-2.zip - KG - Added logic for transferring accumulated volume from FT551 and FT552 to Epics. Added also automatic
  reset of the accumulated volume every time SQ0 is started (to keep the total volume small enough in order to preserve the accuracy of about 1-e-4 m3).
  Modified funtion blocks FC380 and FC480. The accumulated volume is returned in sRealRdV field of the FT55* structure.
PLC_Cryostat_2025_01_10.zip - KG - A number of changes:
   1. Updated DB100 to hold new Epics PVs
   2. FV560-FV563: Added them to #DATA_VALVES, added sFV560*_sOpenReq in the General structure of DB100. 
      Added logic for opening and closing them (INST_VALVES, Manage_VALVES)
   3. Copied the heaters' ExtCmd bit to the Epics status buffer
   4. Changed the logic of ExtCmd for EH103 and EH104 (cavity heaters) to avoid burning them again.
   5. Copied the "hidden" sequence flags from MB300+<seq-no> to sParI8 for SQ5, SQ7, SQ8 and SQ9 (for SQ7 combined with MB407 in the high order byte).
PLC_Cryostat_2025_01_13.zip - KG - Changed the step in which the sequence number is changed for SQ0-SQ2. From step 8 moved it to the entering 
   the step 4. Change only in FC200-202.
PLC_Cryostat_2025_01_15.zip - KG - Fixed small bugs in FC208, NW13 (bit M307.5 was not reset) and in FC413 NW6 (TT115 used instead of TT116).
  Both errors where typical "cut and paste errors" (forgetting to change the name of the symbol in the pasted text).
PLC_Cryostat_2025_01_16.zip - KG - In SQ8 step 6 bypassed the condition not filling 2K tank to activate TIC101 (bypassed SQ8_2K flag)
PLC_Cryostat_2025_01_23.zip - KG - Modified condition for transition from step 18 to 20 in SQ9 (2K pumps stopped). It reads the mean revolution
  frequency of the 2K pumps and if data is valid SQ9 proceeds from step 18 to 20 without waiting for Accept from the operator. When the data
  is not valid the transition requires Accept command from the operator. The data valid status bit is returned to Epics as HiddenFlags bit 0x0010.
  Added hidden bit Freq_2K_p_valid in SQ9.
PLC_Cryostat_2025_01_23.zip - KG - Added controlling of parameter bit 4 in SQ9 from Epics.
PLC_Cryostat_2025_01_24.zip - KG - Temporary modified the control of FV101 valve (FC556 NW8)- it's kept open during SQ5 step 8 when SQ4 Table
  check box is checked.
PLC_Cryostat_2025_01_27.zip - KG - Changed behaviour of EH106AB due to changed position from the magnetic shield to Cavity2A. 
PLC_Cryostat_2025_01_27.zip - KG - Created a new S7PLC_PCI_CodacStruc133 for the new parameters in General part. Not compiled yet.
  Added FC and DB (INST_CERNOX_SWITCH and #DATA_CERNOX_PARAM) for handling of the alternative CERNOX sensors connected to the cavities. 
  Not called yet from the main program and not downloaded to the PLC.
PLC_Cryostat_2025_02_03.zip - KG -  Compiled source file S7PLC_PSI_CodacStruct133. Added switching CERNOX sets.
PLC_Cryostat_2025_02_04.zip - KG -  Added automatic start of SQ8.
PLC_Cryostat_2025_02_04_1.zip - KG -  Added automatic stop of SQ7 when automatic start of SQ8 was enabled.
PLC_Cryostat_2025_02_05.zip - KG -  Added automatic transition in SQ9 step 20 -> 30 based on the PT552 sent from the 2K system (via wtrvac IOC).
  Works only if the pressure could be reliably read from the 2K system. Transition is done when PT552 > 990 mbar for at least 35 s.
PLC_Cryostat_2025_02_06.zip - KG -  Changed rules for opening FV556 (venting 2K pumps). This valve will be open already in SQ9 steps 14 - 18 
  under the condition that the 2K pumps are stopped (mean frequency = 0 and the communication (Profibus DP, IOC) works ok.
PLC_Cryostat_2025_03_05.zip - KG -  !!!!!!!!!!! DO NOT USE THIS ARCHIVE - ERROR IN DB400 !!!!!!!!!!!!!!!!!!!! (all data after 8.0 are shifted by 2 bytes)
                                  Added reading status of GV001 and GV002 (cavity vacuum gate valves).
PLC_Cryostat_2025_03_06.zip - KG - Fixed error in DB400
PLC_Cryostat_2025_03_17.zip - KG - Changed SQ3B: Transition from step 4 to 6 is now based not only on TT403 (broken sensor) but also on TT205 and TT206.
  If any of those temperatures drops below "Cool down temperature" the sequence will go from step 4 to step 6 (it will open EV200 and EV201 and start the
  heaters EH200 and EH201).
PLC_Cryostat_2025_03_31.zip - KG - Changed SQ8: Added transition from state 20 to 0 when SQ12B is activated (cryostat warm-up)
PLC_Cryostat_2025_04_03.zip - KG - Added new hardware (32 DI module). Prepared for moving FV560-FV563 to HNOSS PLC from wtrvac PLC. In principle it's
  ready to disconnect the valves from wtrvac PLC and connect it to HNOSS. There must be done changes in the EPICS database on wtrvac and hnoss IOCs
PLC_Cryostat_2025_06_19.zip - KG - Modified FC350 (#FC_MKS) and UDT_MKS to work with the new valves (the communication to MKSs worked unacceptably poorly 
  after adding instances of FV560-FV563). Changin the delay time for triggering P_SEND function from 200 ms to 500 ms made that the MKS communication
  worked ok even with the new valves. During the tests found iut that R7 request in step 26 was sent twice. Devided step 26 to 26+27 and it fixed the 
  ddouble sending of request R7. Added new error bits Act_sensor_R7 in UDT_MKS for Flt_write and Flt_Verif - not copied to Epics yet.
  There is still something that should be done about setting the send request bit triggering the P_SEND function - the delay of 500 ms seconds should be 
  unnecessary if one can set this trigger bit only after receiving the reply (or tmine-out). Now this bit is reset directly after receiving SEND_DONE or 
  SEMD_ERROR. This is ok for SEND_ERROR but for SEND_DONE it is ok only for the commands not getting any reply. For the requests waiting for the response 
  this bit should be reset only after receiving the reply or the time-out.
  
============================================================================================================
SCADA

WinCC_Cryostat_afterISII_modification - masked alarams from the MKSs - done by Nicolas Poisson (2016-05-06) 
Cryostat_2016_06_03 - modifications made to use the new FT550 flowmeter (changed WinCC views and archive configuration). Works with PLC_Cryostat_2016_05_27 or later.
Cryostat_2016_09_21 - Added spare CERNOX channels
