#!/bin/bash
#
# Bash script to create caput commands to load the CERNOX calibration data for a given PV
# using a given sensor id
#
# Usage: should be started in the e3-gersemi/doc/CERNOX directory

# for example:
#  ../../generate_calibr_cmds.sh TT353 X79174
#
# It will generate the commands and send them to the standard output.

P="CstatV-Ctrl:"

# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`

# Help awk programs (must be in the same directory as this script)
AWKPR1=$SCRIPTPATH/get_coeff.awk
AWKPR2=$SCRIPTPATH/get_switchpoints.awk

if [ -d calibrations ]
then
    cd calibrations
else
    echo " calibration directory missing!"
    exit
fi

#### 1.5..4.5 K ####

cmd="caput -a $P$1:cPolyA 5"
f=CX_LS_$2\(1.5K...4.5K
cf=($f*)
#echo $cf
val=`awk -f $AWKPR1 < $cf`
echo $cmd$val
rlist1=(`awk -f $AWKPR2 < $cf`)
#echo rlist1=${rlist1[@]}

if [ ${rlist1[0]} == 1 ]
then
    r0=${rlist1[1]}
fi

#### 4.5..20.0 K ####

cmd="caput -a $P$1:cPolyB 5"
f=CX_LS_$2\(4.5K...20.0K
cf=($f*)
val=`awk -f $AWKPR1 < $cf`
echo $cmd$val
rlist2=(`awk -f $AWKPR2 < $cf`)
#echo rlist2=${rlist2[@]}
if [  ${rlist2[0]} == 0 ]
then
    r0=${rlist2[1]}
else
    r1=${rlist2[1]}
    err_r1=${rlist2[2]}
fi

#r0=`tail -1 $cf | awk '{printf " %13.7f", $1}'`

#### 20.0..100.0 K ####

cmd="caput -a $P$1:cPolyC 5"
f=CX_LS_$2\(20.0K...100.0K
cf=($f*)
val=`awk -f $AWKPR1 < $cf`
echo $cmd$val
rlist3=(`awk -f $AWKPR2 < $cf`)
#echo rlist3=${rlist3[@]}
if [ ${rlist3[0]} == 0 ]
then
    r1=${rlist3[1]}
else
    err_tmp=${rlist3[2]}
    cmp=$err_tmp" < "$err_r1
    res=`echo "$cmp" |bc -l`
    if [ $res -eq 1 ]
    then
	r1=${rlist3[1]}
    fi
fi
#r1=`tail -1 $cf | awk '{printf " %13.7f", $1}'`

#### 100.0..310.0 K ####

cmd="caput -a $P$1:cPolyD 5"
f=CX_LS_$2\(100.0K...310.0K
cf=($f*)
val=`awk -f $AWKPR1 < $cf`
echo $cmd$val
rlist=(`awk -f $AWKPR2 < $cf`)
#echo rlist=${rlist[@]}
if [ ${rlist[0]} == 0 ]
then
    r2=${rlist[1]}
else
    r2=${rlist[1]}
fi
#r2=`tail -1 $cf | awk '{printf " %13.7f", $1}'`

# Switching values

cmd="caput -a $P$1:cSwitchR 3"
echo $cmd $r0 $r1 $r2

