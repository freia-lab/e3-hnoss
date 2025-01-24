program AutoStart2KPumps

// Variables for 2K pumps startup sequence
int startupStep;
int SQ9_state;
int autoStartUp_SQ9;
int PumpsRdy;
int cmdPumpRst;
int cmdAccept_SQ9;
int cPumpOn;
int sPumpOn;
int holdState;
int sPBcomOK;
float pumpSpeed;
float cSetV_DV;
float cSetV_WH;
float final_WH_SQ9;
float sCV551;
string startupStepStr;


// Global PVs
assign SQ9_state to "{p1}-Ctrl:SQ9:sStep";
assign PumpsRdy to "{p1}-2Kpumps:Ctrl:sRdy2Start";
assign cmdPumpRst to "{p1}-2Kpumps:Ctrl:cmdReset";
assign cmdAccept_SQ9 to "{p1}-Ctrl:SQ9:cmdAccept";
assign pumpSpeed to "{p1}-2Kpumps:AllPumps:sFreq";
assign cSetV_DV to "{p1}-2Kpumps:Ctrl-DV:cSetV";
assign cSetV_WH to "{p1}-2Kpumps:Ctrl-WH:cSetV";
assign cPumpOn to "{p1}-2Kpumps:Ctrl:cOn";
assign sPumpOn to "{p1}-2Kpumps:Ctrl:sOn";
assign sPBcomOK "{p1}-2Kpumps:Ctrl:sPBcomOK";
assign sCV551 to "{p1}-RHtr:CV551:sRdV";


// PVs for the sequence
assign startupStep to "{p1}-Ctrl:SQ9:cStep2KstartUp";
assign autoStartUp_SQ9 to "{p1}-Ctrl:SQ9:sP_s2KpumpsAuto";
assign holdState to "{p1}-Ctrl:SQ9:c2KpumpsHold";
assign final_WH_SQ9 to "{p1}-Ctrl:SQ9:cP_WHfinal";
assign startupStepStr to "{p1}-Ctrl:SQ9:sStep2KstartUpStr";

monitor PumpsRdy;
monitor pumpSpeed;
monitor holdState;
monitor startupStep;

monitor SQ9_state;
monitor autoStartUp_SQ9;
monitor final_WH_SQ9;
monitor sPBcomOK;
monitor sCV551;
monitor sPumpOn;

ss Pumps_startup {

int time_out = 1800;
int full_speed = 90;
float kWH = 0.25;

  state idle_2K {
   entry {
      startupStep = 0;
      pvPut(startupStep);
      sprintf (startupStepStr, "Idle");	
      pvPut(startupStepStr);
      printf ("Entered idle_2K state\n");	
   }

   when ((SQ9_state == 6) && autoStartUp_SQ9 && PumpsRdy && !holdState) {
   } state start_full_speed
   when ((SQ9_state == 6) && autoStartUp_SQ9 && !PumpsRdy && !holdState) {
   } state pumps_reset
   when ((SQ9_state == 14) && (sCV551 == 0) && (sPumpOn == 1) &&
   	(sPBcomOK == 1) && autoStartUp_SQ9 && !holdState) {
   } state stopping
  } 


  state pumps_reset {
     entry {
      	startupStep = 1;
        pvPut(startupStep);
      	printf ("Entered pumps_reset state\n");
        sprintf (startupStepStr, "Resetting the 2K pumps");	
        pvPut(startupStepStr);
	printf ("Send reset command to the pumps\n");
	cmdPumpRst = 1;
	pvPut (cmdPumpRst);
     }
     when (startupStep == 0) {} state idle_2K
     when (delay (5)) {} state idle_2K
  }

  state start_full_speed {
     entry {
        startupStep = 2;
      	pvPut(startupStep);
        sprintf (startupStepStr, "Waiting for achieving the full speed");	
        pvPut(startupStepStr);
      	printf ("Entered start_full_speed state\n");
 	printf ("Set the full speed and send start command to the pumps\n");
        cSetV_WH = 100;
     	cSetV_DV = 100;
     	pvPut(cSetV_WH);
     	pvPut(cSetV_DV);
	cPumpOn = 1;
    	pvPut(cPumpOn);	
    }
     when (startupStep == 0) {} state idle_2K
     when ((pumpSpeed > full_speed) && !holdState) {} state  warm_up
     when (delay(time_out) && !holdState) {} state idle_2K
  }

  state warm_up {
     entry {
        startupStep = 3;
      	pvPut(startupStep);
        sprintf (startupStepStr, "Warming-up at full speed");	
        pvPut(startupStepStr);
      	printf ("Entered warm_up state\n");
    }
     when (startupStep == 0) {} state idle_2K
     when (delay(600) && !holdState) {
     	printf("Warm-up ready - set the WH to 0 and DV to 10\n");
        cSetV_WH = final_WH_SQ9;
     	pvPut(cSetV_WH);
     } state ramping_down
  }

  state ramping_down {
     entry {
        startupStep = 4;
        pvPut(startupStep);
        sprintf (startupStepStr, "Waiting for pumps to slow down");	
        pvPut(startupStepStr);
        printf ("Entered ramping_down state\n");
     }
     when (startupStep == 0) {} state idle_2K
     when (pumpSpeed < (95.0 - (100.0 - final_WH_SQ9) * kWH)) {
     	  if (SQ9_state != 0) {
     	    printf("Ramping-down ready - sent Yes command to SQ9\n");
	    cmdAccept_SQ9 = 1;
     	    pvPut(cmdAccept_SQ9);
	  }
       } state awaiting_Step8
  }

  state awaiting_Step8 {
     entry {
        startupStep = 5;
        pvPut(startupStep);
        sprintf (startupStepStr, "Waiting for step 10");	
        pvPut(startupStepStr);
        printf ("Entered awaiting_Step10 state\n");
     }
     when ((startupStep == 0) || (SQ9_state == 8)) {} state idle_2K
  }

  state stopping {
     entry {
        startupStep = 6;
        pvPut(startupStep);
        sprintf (startupStepStr, "Stopping the pumps");	
        pvPut(startupStepStr);
        printf ("Entered stopping state\n");
     }
     when (delay(10)) {
        cPumpOn = 0;
    	pvPut(cPumpOn);
     } state idle_2K
  }
  
}  

