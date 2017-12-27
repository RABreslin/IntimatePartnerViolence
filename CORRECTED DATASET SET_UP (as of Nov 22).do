*To Merge files:
1) Open the LEMAS Crosswalk and change the variable 'ORI9' to 'ORI'
2) Sort on the ORI variable and save the file as LEMAS Crosswalk vX
3) Open the NIBRs file.  Change the 'ORI9' to 'ORI' and sort on the ORI variable (if necessary).  Save the new file under a different name. 
4) use <"location of LEMAS Crosswalk vX file">, clear
4) merge 1:m ORI using <"location of the NIBRs file that was sorted">
4) Save the new merged file under a new name. 

*In order to do the second merge (to add the LEMAS data to the NIBRS data) it's easier/faster to do another 1:m merge.  To do this:
1) Open the file you just merge (the NIBRS and crosswalk) first. 
2) Sort on ORI and delete the "merge" column from the end.
3) Save the file. 
4) Open the LEMAS file.  Change the 'ORI9' to 'ORI' and sort on the ORI variable (if necessary).  Sort on the ORI variable and save. 
*Note that it's really important to make sure that you're using the correct ORI variable in all files and that you delete any rows with missing "-1" 
or "." values for ORI. 
5) use <"location of NIBRs file that was merged with LEMAS crosswalk">, clear
6) merge 1:m ORI using <"location of the LEMAS file that was sorted">

**Note--some of the older versions of LEMAS may need to be merged to the LEMAS crosswalk using the LEMAS ID, as they may not have included
the ORI variable at that time. 

*To shrink the file and speed processing: 

1) Delete the incidents (each line at this point is a NIBRS incdent) where FTSWORN is missing or equal to zero. 
2) My NBBIRS and LEMAS 2013 v2 file also deletes all incidents where the POP2012 is less than 100,000.  I may not wish to do this in 
the end, but I think narrowing the sample size to these large cities will make the coefficients more precise.  
3) I dropped cases where the gender of the victim was unknown...assuming that these are cases in which there was no evident victim at 
the scene. Note (4/25) I should also drop cases where the victim is recorded as male. 
4) Finally, I dropped all of the property related crime variables (V3000s) and offender variables (V2000s).    

drop if FTSWORN == . 
drop if FTSWORN == 0 
drop if POP2012 < 25000


drop PERS_SSW_FT PERS_SSW_PT PERS_UPSW PERS_DUT_NONE PERS_DUT_ADMN PERS_DUT_CLN PERS_DUT_LGL PERS_DUT_ACCT PERS_DUT_FSCI PERS_DUT_RSRCH PERS_DUT_HR PERS_DUT_IT 
PERS_DUT_VM PERS_DUT_CD PERS_DUT_CRT PERS_DUT_JAIL PERS_DUT_OTHR PERS_DUT_SPEC PAY_SAL_EXC_MIN PAY_SAL_EXC_MAX PAY_SAL_SGT_MIN PAY_SAL_SGT_MAX PAY_SAL_OFCR_MIN PAY_SAL_OFCR_MAX 
PAY_INCT_EDU PAY_INCT_VOC PAY_INCT_LANG PAY_INCT_SPCL PAY_INCT_HZRD PAY_INCT_SD PAY_INCT_RINC PAY_INCT_MRT PAY_INCT_OTHR PAY_INCT_SPEC PAY_OUT PAY_RST_NO 
PAY_RST_HRS PAY_RST_TYPE PAY_RST_OTHR PAY_RST_SPEC PAY_BARG PAY_SBARG PAY_RMB_TUIT PAY_RMB_UNF PAY_RMB_ARMR PAY_RMB_SFTY PAY_RMB_FIRE PAY_OVER_SW 
PAY_OVER_NSW PAY_FUNC_CRT PAY_FUNC_SHFT PAY_FUNC_PTRL PAY_FUNC_INVS PAY_FUNC_ADMN PAY_FUNC_EMRG PAY_FUNC_EVNT PAY_FUNC_OTHR PAY_FUNC_SPEC 
PAY_LMT PAY_VEH_MRK PAY_VEH_UMRK HIR_TRN_NO_L HIR_TRN_NO_P HIR_TRN_CRS_L HIR_TRN_CRS_P HIR_TRN_FLD_L HIR_TRN_FLD_P HIR_TRN_DIR_L HIR_TRN_DIR_P HIR_TRN_OLATS HIR_TRN_OPRES 
HIR_NSWT_NO HIR_NSWT_VAR_FT HIR_NSWT_VAR_PT HIR_EDU_NO HIR_EDU_HS HIR_EDU_SCOL HIR_EDU_AD HIR_EDU_BD HIR_EDU_OTHR HIR_EDU_SPEC HIR_MIL HIR_RTR_DB HIR_RTR_DC 
HIR_RTR_SS HIR_RTR_OTHR HIR_RTR_SPEC HIR_SEP_NMED HIR_SEP_MED HIR_SEP_VOL HIR_SEP_LAYOFF HIR_SEP_DIS HIR_SEP_OTHR HIR_SEP_TTL HIR_SEPNS_LAYOFF HIR_SEPNS_OTHR HIR_SEPNS_TTL
BDGT_SRC_MNC BDGT_SRC_CNTY BDGT_SRC_STATE BDGT_SRC_FED BDGT_SRC_CONT BDGT_SRC_ASST BDGT_SRC_FEE BDGT_SRC_OTHR BDGT_SRC_SPEC BDGT_RED BDGT_PCT_SW BDGT_PCT_NSW 
BDGT_FUR BDGT_FUR2_SW10 BDGT_FUR2_SW11 BDGT_FUR2_SW12 BDGT_FUR2_NSW10 BDGT_FUR2_NSW11 BDGT_FUR2_NSW12 TECH_TYP_GUN TECH_TYP_LIC TECH_TYP_SMRT TECH_TYP_VPUB 
TECH_TYP_VVEH TECH_TYP_VPAT TECH_TYP_VWPN TECH_TYP_VOTHR TECH_EAC_MREC TECH_EAC_DREC TECH_EAC_CRIM TECH_EAC_WARR TECH_CIR TECH_CIR_SPEC TECH_CRS TECH_CREC_INC 
TECH_CREC_SUM TECH_CREC_NAR TECH_CREC_OTHR TECH_CREC_SPEC TECH_REC_NAR TECH_REC_CODE TECH_REC_STAT TECH_REC_VIC TECH_REC_SUS TECH_REC_LOC TECH_REC_GEO TECH_REC_DATE 
TECH_WHO_NO TECH_WHO_STAFF TECH_WHO_EXTR TECH_MANY_FTS TECH_MANY_PTS TECH_MANY_FTNS TECH_MANY_PTNS TECH_OUT_LAW TECH_OUT_GOV TECH_OUT_UNIV TECH_OUT_VEND TECH_OUT_OTHR TECH_OUT_OTHR_SPEC TECH_WEB_NONE TECH_WEB_JUR 
TECH_WEB_BEAT TECH_WEB_MAP TECH_WEB_OFFND TECH_WEB_OTHR TECH_WEB_SPEC TECH_PUBL_REP TECH_PUBL_ASK TECH_PUBL_FILE TECH_PUBL_OTHR TECH_PUBL_SPEC 
TECH_REPT TECH_RECV TECH_MEDIA_TW TECH_MEDIA_FB TECH_MEDIA_BLOG TECH_MEDIA_YTBE TECH_MEDIA_MASS TECH_MEDIA_OTHR TECH_MEDIA_SPEC VEH_OPRT_MK VEH_OPRT_UNMK 
VEH_TYP_MTR VEH_TYP_ATV VEH_TYP_AIR VEH_TYP_HCOP VEH_TYP_BOAT VEH_TYP_DRONE VEH_TYP_OTHR VEH_TYP_SPEC VEH_WPUR VEH_WPUR_SPEC VEH_DOC
VEH_DOC_SPEC VEH_NPUR VEH_NPUR_EST VEH_NPUR_UNK VEH_REST_NO VEH_REST_ALN VEH_REST_VISL VEH_REST_SEPR VEH_REST_RADIO VEH_REST_ARM VEH_REST_OTHR
VEH_REST_SPEC VEH_CNTN SAFE_AUTH_HGN SAFE_AUTH_RFL SAFE_AUTH_SGN SAFE_AUTH_BTN SAFE_AUTH_IMP SAFE_AUTH_SOFT SAFE_AUTH_SPRAY SAFE_AUTH_CHEM SAFE_AUTH_TASR 
SAFE_AUTH_NECK SAFE_AUTH_TKDWN SAFE_AUTH_OHAND SAFE_AUTH_CHAND SAFE_AUTH_LEG SAFE_DOC_DISF SAFE_DOC_DCHF SAFE_DOC_BAT SAFE_DOC_IMP SAFE_DOC_SOFT SAFE_DOC_SPRAY 
SAFE_DOC_CHEM SAFE_DOC_DIST SAFE_DOC_DCHT SAFE_DOC_NECK SAFE_DOC_TKDWN SAFE_DOC_OHAND SAFE_DOC_CHAND SAFE_DOC_LEG SAFE_FINC SAFE_FINC_SPEC NO_RECORD_FORCE 
SAFE_FRC_INC SAFE_FRC_OFFC SAFE_FRC_OTHR SAFE_FRC_SPEC SAFE_FTTL_UNK SAFE_SEPR SAFE_SEPR_EST SAFE_SEPR_UNK SAFE_ARMR SAFE_ARMR_OTHRS SAFE_RQUR_ACC SAFE_RQUR_RSK SAFE_RQUR_ALL 
SAFE_RQUR_CSTM SAFE_RQUR_TRN SAFE_RQUR_COMP SAFE_RQUR_BLST NO_BODY_ARMOR SAFE_PAY_DPT SAFE_PAY_IND SAFE_PAY_GRNT SAFE_PAY_OTHR SAFE_PAY_SPEC ISSU_MULTI ISSU_TASK_SWAT ISSU_TASK_DRUG 
ISSU_TASK_GANG ISSU_TASK_TRAF ISSU_TASK_OTHR ISSU_TASK_SPEC


drop V30061 V30062 V30063 V30071 V30072 V30073 V30081 V30082 V30083 V30091 V30092 V30093 V30101 V30102 V30103 V30111 V30112 V30113 V30121 V30122 
drop V30123 V30131 V30132 V30133 V30141 V30142 V30143 V30151 V30152 V30153 V30161 V30162 V30163 V30171 V30172 V30173 V30181 V30182 V30183 V30191 V30192 
drop V30193 V30201 V30202 V30203 V30211 V30212 V30213 V30221 V30222 V30223 V30231 V30232 V30233

drop V20061 V20062 V20063 V20071 V20072 V20073 V20081 V20082 V20083 V20091 V20092 V20093 V20101 V20102 V20103 V20111 V20112 V20113 V20121 V20122 
drop V20123 V20131 V20132 V20133 V20141 V20142 V20143 V20151 V20152 V20153 V20161 V20162 V20163 V20171 V20172 V20173 V20181 V20182 V20183 V20191 
drop V20192 V20193 V20201 V20202 V20203

*TO SEE VALUES ASSIGNED TO A VARIABLE USE "label list"

*TO drop incidents with more than one offender...because these may be treated differently than IPV.  
drop if RECSOFR > 1


*Either an on-view arrest or the offender is taken into custody. 
gen Arrest= 0 
replace Arrest = 1 if V60091 == 1 | V60091 == 3


*Arrests "on view"; On-View Arrest - taken into custody without a warrant or previous incident report
gen Arrest_OV = 0
replace Arrest_OV = 1 if V60091 == 1


*Summons or citations only; not taken into custody
gen Arrest_Sum = 0
replace Arrest_Sum = 1 if V60091==2

*Taken into custody; Taken into Custody - based on warrant and/or previously submitted incident report
gen Arrest_Cust = 0
replace Arrest_Cust = 1 if V60091 == 3


*Violent Crimes here are defined according to the FBI and are limited to four crimes: 1) Murder and Nonnegligent Manslaughter; 2) Rape; 3) Robbery; and, 4) Aggravated assault
gen ViolentCrime = 0 

replace ViolentCrime = 1 if V4007 ==91 | V4007 ==111 | V4007 ==131 | V4007 == 120 

replace ViolentCrime = 1 if V4008 ==91 | V4008 ==111 | V4008 ==131 | V4008 == 120 

replace ViolentCrime = 1 if V4009 ==91 | V4009 ==111 | V4009 ==131 | V4009 == 120 

replace ViolentCrime = 1 if V4010 ==91 | V4010 ==111 | V4010 ==131 | V4010 == 120 


replace ViolentCrime = 1 if V4011 ==91 | V4011 ==111 | V4011 ==131 | V4011 == 120 

replace ViolentCrime = 1 if V4012 ==91 | V4012 ==111 | V4012 ==131 | V4012 == 120 

replace ViolentCrime = 1 if V4013 ==91 | V4013 ==111 | V4013 ==131 | V4013 == 120 

replace ViolentCrime = 1 if V4014 ==91 | V4014 ==111 | V4014 ==131 | V4014 == 120 

replace ViolentCrime = 1 if V4015 ==91 | V4015 ==111 | V4015 ==131 | V4015 == 120 

replace ViolentCrime = 1 if V4016 ==91 | V4016 ==111 | V4016 ==131 | V4016 == 120 

*Combines sexual assaults, forcible rape, forcible sodomy, forcible fondling, & statutory rape. 
gen SexAsslt = 0
replace SexAsslt = 1 if V4007 == 113 | V4007 == 111 | V4007 == 112 | V4007 == 114 | V4007 == 362


replace SexAsslt = 1 if V4008 == 113 | V4008 == 111 | V4008 == 112 | V4008 == 114 | V4008 == 362

replace SexAsslt = 1 if V4009 == 113 | V4009 == 111 | V4009 == 112 | V4009 == 114 | V4009 == 362

replace SexAsslt = 1 if V4010 == 113 | V4010 == 111 | V4010 == 112 | V4010 == 114 | V4010 == 362

replace SexAsslt = 1 if V4011 == 113 | V4011 == 111 | V4011 == 112 | V4011 == 114 | V4011 == 362

replace SexAsslt = 1 if V4012 == 113 | V4012 == 111 | V4012 == 112 | V4012 == 114 | V4012 == 362

replace SexAsslt = 1 if V4013 == 113 | V4013 == 111 | V4013 == 112 | V4013 == 114 | V4013 == 362

replace SexAsslt = 1 if V4014 == 113 | V4014 == 111 | V4014 == 112 | V4014 == 114 | V4014 == 362

replace SexAsslt = 1 if V4015 == 113 | V4015 == 111 | V4015 == 112 | V4015 == 114 | V4015 == 362

replace SexAsslt = 1 if V4016 == 113 | V4016 == 111 | V4016 == 112 | V4016 == 114 | V4016 == 362


*Combines simple assaults and intimidation.
gen Simple_Int = 0
replace Simple_Int = 1 if V4007 == 132 | V4007 == 133

replace Simple_Int = 1 if V4008 == 132 | V4008 == 133

replace Simple_Int = 1 if V4009 == 132 | V4009 == 133

replace Simple_Int = 1 if V4010 == 132 | V4010 == 133

replace Simple_Int = 1 if V4011 == 132 | V4011 == 133

replace Simple_Int = 1 if V4012 == 132 | V4012 == 133

replace Simple_Int = 1 if V4013 == 132 | V4013 == 133

replace Simple_Int = 1 if V4014 == 132 | V4014 == 133

replace Simple_Int = 1 if V4015 == 132 | V4015 == 133

replace Simple_Int = 1 if V4016 == 132 | V4016 == 133


*Combines Violent, Sex Crimes, Rape, Simple Assaults and Intimidation
gen SeriousCr = 0 
replace SeriousCr = 1 if ViolentCrime == 1 | SexAsslt == 1 | Simple_Int == 1


**Relationship of victim to offender defines the crime as a domestic violence (which encompasses intimate partner violence)
gen DV = 0 
replace DV = 1 if V4032 == 1 | V4032 == 2 | V4032 == 18 | V4032 == 20 | V4032 == 21


replace DV = 1 if V4034 == 1 | V4034 == 2 | V4034 == 18 | V4034 == 20 | V4034 == 21

replace DV = 1 if V4036 == 1 | V4036 == 2 | V4036 == 18 | V4036 == 20 | V4036 == 21

replace DV = 1 if V4038 == 1 | V4038 == 2 | V4038 == 18 | V4038 == 20 | V4038 == 21

replace DV = 1 if V4040 == 1 | V4040 == 2 | V4040 == 18 | V4040 == 20 | V4040 == 21

replace DV = 1 if V4042 == 1 | V4042 == 2 | V4042 == 18 | V4042 == 20 | V4042 == 21

replace DV = 1 if V4044 == 1 | V4044 == 2 | V4044 == 18 | V4044 == 20 | V4044 == 21

replace DV = 1 if V4046 == 1 | V4046 == 2 | V4046 == 18 | V4046 == 20 | V4046 == 21

replace DV = 1 if V4048 == 1 | V4048 == 2 | V4048 == 18 | V4048 == 20 | V4048 == 21

replace DV = 1 if V4050 == 1 | V4050 == 2 | V4050 == 18 | V4050 == 20 | V4050 == 21



*Combines DV (really intimate partner) variable with the type of crime
gen DV_Violent = 0 
replace DV_Violent = 1 if DV ==1 & ViolentCrime == 1


gen DV_SexAsslt = 0 
replace DV_SexAsslt = 1 if DV == 1 & SexAsslt == 1



gen DV_Simple_Int = 0
replace DV_Simple_Int = 1 if DV == 1 & Simple_Int == 1


gen DV_SeriousCr = 0   
replace DV_SeriousCr = 1 if DV == 1 & SeriousCr ==1 



*Sex & Race of Victim of crime. 
gen WomVic = 0
replace WomVic = 1 if V4019 == 0


gen H_WomVic = 0 
replace H_WomVic = 1 if V4021 == 1 & V4019 == 0

gen B_WomVic = 0
replace B_WomVic = 1 if V4020 == 2 & V4019 == 0 


gen W_WomVic = 0
replace W_WomVic = 1 if V4020 == 1 & V4019 == 0 


*NonHispanic Black
gen BNH_WomVic = 0
replace BNH_WomVic = 1 if V4020 == 2 & V4019 == 0 & V4021 == 0 



*NonHispanic White woman victim
gen WNH_WomVic = 0
replace WNH_WomVic = 1 if V4020 == 1 & V4019 == 0 & V4021 == 0



gen AmIn_WomVic = 0
replace AmIn_WomVic = 1 if V4020 == 3 & V4019 == 0 


gen A_WomVic = 0
replace A_WomVic = 1 if V4020 == 4 & V4019 == 0 


gen Pac_WomVic = 0
replace Pac_WomVic = 1 if V4020 == 5 & V4019 == 0 

 

 *Generates women victims of DV, by race/ethnicity, and then by specific crime types
gen WomVic_DV = 0
replace WomVic_DV = 1 if WomVic == 1 & DV == 1

 
gen H_WomVic_DV = 0 
replace H_WomVic_DV = 1 if H_WomVic == 1 & DV == 1


gen B_WomVic_DV = 0 
replace B_WomVic_DV = 1 if B_WomVic == 1 & DV == 1


gen BNH_WomVic_DV = 0 
replace BNH_WomVic_DV = 1 if BNH_WomVic == 1 & DV == 1


gen W_WomVic_DV = 0 
replace W_WomVic_DV = 1 if W_WomVic == 1 & DV == 1


gen WNH_WomVic_DV = 0 
replace WNH_WomVic_DV = 1 if WNH_WomVic == 1 & DV == 1


gen AmIn_WomVic_DV = 0 
replace AmIn_WomVic_DV = 1 if AmIn_WomVic == 1 & DV == 1


gen A_WomVic_DV = 0
replace A_WomVic_DV = 1 if A_WomVic == 1 & DV == 1


gen Pac_WomVic_DV = 0 
replace Pac_WomVic_DV = 1 if Pac_WomVic == 1 & DV == 1

 
 
gen WomVic_DV_V = 0
replace WomVic_DV_V = 1 if WomVic == 1 & DV_Violent == 1

 
gen H_WomVic_DV_V = 0 
replace H_WomVic_DV_V = 1 if H_WomVic == 1 & DV_Violent == 1


gen B_WomVic_DV_V = 0 
replace B_WomVic_DV_V = 1 if B_WomVic == 1 & DV_Violent == 1


gen BNH_WomVic_DV_V = 0 
replace BNH_WomVic_DV_V = 1 if BNH_WomVic == 1 & DV_Violent == 1


gen W_WomVic_DV_V = 0 
replace W_WomVic_DV_V = 1 if W_WomVic == 1 & DV_Violent == 1


gen WNH_WomVic_DV_V = 0 
replace WNH_WomVic_DV_V = 1 if WNH_WomVic == 1 & DV_Violent == 1


gen AmIn_WomVic_DV_V = 0 
replace AmIn_WomVic_DV_V = 1 if AmIn_WomVic == 1 & DV_Violent == 1


gen A_WomVic_DV_V = 0
replace A_WomVic_DV_V = 1 if A_WomVic == 1 & DV_Violent == 1


gen Pac_WomVic_DV_V = 0 
replace Pac_WomVic_DV_V = 1 if Pac_WomVic == 1 & DV_Violent == 1


gen WomVic_DV_SA = 0
replace WomVic_DV_SA = 1 if WomVic == 1 & DV_SexAsslt == 1

 
gen H_WomVic_DV_SA = 0 
replace H_WomVic_DV_SA = 1 if H_WomVic == 1 & DV_SexAsslt == 1


gen B_WomVic_DV_SA = 0 
replace B_WomVic_DV_SA = 1 if B_WomVic == 1 & DV_SexAsslt == 1


gen BNH_WomVic_DV_SA = 0 
replace BNH_WomVic_DV_SA = 1 if BNH_WomVic == 1 & DV_SexAsslt == 1


gen W_WomVic_DV_SA = 0 
replace W_WomVic_DV_SA = 1 if W_WomVic == 1 & DV_SexAsslt == 1


gen WNH_WomVic_DV_SA = 0 
replace WNH_WomVic_DV_SA = 1 if WNH_WomVic == 1 & DV_SexAsslt == 1


gen AmIn_WomVic_DV_SA = 0 
replace AmIn_WomVic_DV_SA = 1 if AmIn_WomVic == 1 & DV_SexAsslt == 1


gen A_WomVic_DV_SA = 0
replace A_WomVic_DV_SA = 1 if A_WomVic == 1 & DV_SexAsslt == 1


gen Pac_WomVic_DV_SA = 0 
replace Pac_WomVic_DV_SA = 1 if Pac_WomVic == 1 & DV_SexAsslt == 1



gen WomVic_DV_SI = 0
replace WomVic_DV_SI = 1 if WomVic == 1 & DV_Simple_Int == 1

 
gen H_WomVic_DV_SI = 0 
replace H_WomVic_DV_SI = 1 if H_WomVic == 1 & DV_Simple_Int == 1


gen B_WomVic_DV_SI = 0 
replace B_WomVic_DV_SI = 1 if B_WomVic == 1 & DV_Simple_Int == 1


gen BNH_WomVic_DV_SI = 0 
replace BNH_WomVic_DV_SI = 1 if BNH_WomVic == 1 & DV_Simple_Int == 1


gen W_WomVic_DV_SI = 0 
replace W_WomVic_DV_SI = 1 if W_WomVic == 1 & DV_Simple_Int == 1


gen WNH_WomVic_DV_SI = 0 
replace WNH_WomVic_DV_SI = 1 if WNH_WomVic == 1 & DV_Simple_Int == 1


gen AmIn_WomVic_DV_SI = 0 
replace AmIn_WomVic_DV_SI = 1 if AmIn_WomVic == 1 & DV_Simple_Int == 1


gen A_WomVic_DV_SI = 0
replace A_WomVic_DV_SI = 1 if A_WomVic == 1 & DV_Simple_Int == 1


gen Pac_WomVic_DV_SI = 0 
replace Pac_WomVic_DV_SI = 1 if Pac_WomVic == 1 & DV_Simple_Int == 1



gen WomVic_DV_SC = 0
replace WomVic_DV_SC = 1 if WomVic == 1 & DV_SeriousCr == 1


 
gen H_WomVic_DV_SC = 0 
replace H_WomVic_DV_SC = 1 if H_WomVic == 1 & DV_SeriousCr == 1


gen B_WomVic_DV_SC = 0 
replace B_WomVic_DV_SC = 1 if B_WomVic == 1 & DV_SeriousCr == 1


gen BNH_WomVic_DV_SC = 0 
replace BNH_WomVic_DV_SC = 1 if BNH_WomVic == 1 & DV_SeriousCr == 1


gen W_WomVic_DV_SC = 0 
replace W_WomVic_DV_SC = 1 if W_WomVic == 1 & DV_SeriousCr == 1


gen WNH_WomVic_DV_SC = 0 
replace WNH_WomVic_DV_SC = 1 if WNH_WomVic == 1 & DV_SeriousCr == 1


gen AmIn_WomVic_DV_SC = 0 
replace AmIn_WomVic_DV_SC = 1 if AmIn_WomVic == 1 & DV_SeriousCr == 1


gen A_WomVic_DV_SC = 0
replace A_WomVic_DV_SC = 1 if A_WomVic == 1 & DV_SeriousCr == 1


gen Pac_WomVic_DV_SC = 0 
replace Pac_WomVic_DV_SC = 1 if Pac_WomVic == 1 & DV_SeriousCr == 1



*Domestic violence cases ending in arrest (all victims). 
gen TotArrest_DV = 0
replace TotArrest_DV = 1 if Arrest == 1 & DV == 1 


gen TotArrest_OV_DV = 0
replace TotArrest_OV_DV = 1 if Arrest_OV == 1 & DV == 1 


gen TotArrest_Sum_DV = 0
replace TotArrest_Sum_DV = 1 if Arrest_Sum == 1 & DV == 1 


gen TotArrest_Cust_DV = 0
replace TotArrest_Cust_DV = 1 if Arrest_Cust == 1 & DV == 1 


gen TotArrest_DVV= 0 
replace TotArrest_DVV = 1 if Arrest == 1 & DV_Violent == 1 


gen TotArrest_OV_DVV= 0
replace TotArrest_OV_DVV= 1 if Arrest_OV == 1 & DV_Violent == 1 


gen TotArrest_Sum_DVV = 0
replace TotArrest_Sum_DVV = 1 if Arrest_Sum == 1 & DV_Violent == 1 


gen TotArrest_Cust_DVV = 0
replace TotArrest_Cust_DVV = 1 if Arrest_Cust == 1 & DV_Violent == 1 


gen TotArrest_DVSA= 0 
replace TotArrest_DVSA = 1 if Arrest == 1 & DV_SexAsslt == 1 


gen TotArrest_OV_DVSA = 0
replace TotArrest_OV_DVSA = 1 if Arrest_OV == 1 & DV_SexAsslt == 1 


gen TotArrest_Sum_DVSA = 0
replace TotArrest_Sum_DVSA = 1 if Arrest_Sum == 1 & DV_SexAsslt == 1 


gen TotArrest_Cust_DVSA = 0
replace TotArrest_Cust_DVSA = 1 if Arrest_Cust == 1 & DV_SexAsslt == 1 


gen TotArrest_DVSI = 0 
replace TotArrest_DVSI = 1 if Arrest == 1 & DV_Simple_Int == 1 


gen TotArrest_OV_DVSI = 0
replace TotArrest_OV_DVSI = 1 if Arrest_OV == 1 & DV_Simple_Int == 1 


gen TotArrest_Sum_DVSI = 0
replace TotArrest_Sum_DVSI = 1 if Arrest_Sum == 1 & DV_Simple_Int == 1 


gen TotArrest_Cust_DVSI = 0
replace TotArrest_Cust_DVSI = 1 if Arrest_Cust == 1 & DV_Simple_Int == 1 


gen TotArrest_DVSC = 0 
replace TotArrest_DVSC = 1 if Arrest == 1 & DV_SeriousCr == 1 


gen TotArrest_OV_DVSC = 0
replace TotArrest_OV_DVSC = 1 if Arrest_OV == 1 & DV_SeriousCr == 1 


gen TotArrest_Sum_DVSC = 0
replace TotArrest_Sum_DVSC = 1 if Arrest_Sum == 1 & DV_SeriousCr == 1 


gen TotArrest_Cust_DVSC = 0
replace TotArrest_Cust_DVSC = 1 if Arrest_Cust == 1 & DV_SeriousCr == 1 



*Domestic Violence cases ending in arrest for women victims. 
gen Arrest_DV = 0
replace Arrest_DV = 1 if Arrest == 1 & DV == 1 & WomVic == 1


gen Arrest_OV_DV = 0
replace Arrest_OV_DV = 1 if Arrest_OV == 1 & DV == 1 & WomVic == 1


gen Arrest_Sum_DV = 0
replace Arrest_Sum_DV = 1 if Arrest_Sum == 1 & DV == 1 & WomVic == 1


gen Arrest_Cust_DV = 0
replace Arrest_Cust_DV = 1 if Arrest_Cust == 1 & DV == 1 & WomVic == 1



gen Arrest_DVV= 0 
replace Arrest_DVV = 1 if Arrest == 1 & DV_Violent == 1 & WomVic == 1


gen Arrest_OV_DVV= 0
replace Arrest_OV_DVV= 1 if Arrest_OV == 1 & DV_Violent == 1 & WomVic == 1


gen Arrest_Sum_DVV = 0
replace Arrest_Sum_DVV = 1 if Arrest_Sum == 1 & DV_Violent == 1 & WomVic == 1


gen Arrest_Cust_DVV = 0
replace Arrest_Cust_DVV = 1 if Arrest_Cust == 1 & DV_Violent == 1 & WomVic == 1



gen Arrest_DVSA= 0 
replace Arrest_DVSA = 1 if Arrest == 1 & DV_SexAsslt == 1 & WomVic == 1


gen Arrest_OV_DVSA = 0
replace Arrest_OV_DVSA = 1 if Arrest_OV == 1 & DV_SexAsslt == 1 & WomVic == 1


gen Arrest_Sum_DVSA = 0
replace Arrest_Sum_DVSA = 1 if Arrest_Sum == 1 & DV_SexAsslt == 1 & WomVic == 1


gen Arrest_Cust_DVSA = 0
replace Arrest_Cust_DVSA = 1 if Arrest_Cust == 1 & DV_SexAsslt == 1 & WomVic == 1



gen Arrest_DVSI = 0 
replace Arrest_DVSI = 1 if Arrest == 1 & DV_Simple_Int == 1 & WomVic == 1


gen Arrest_OV_DVSI = 0
replace Arrest_OV_DVSI = 1 if Arrest_OV == 1 & DV_Simple_Int == 1 & WomVic == 1


gen Arrest_Sum_DVSI = 0
replace Arrest_Sum_DVSI = 1 if Arrest_Sum == 1 & DV_Simple_Int == 1 & WomVic == 1


gen Arrest_Cust_DVSI = 0
replace Arrest_Cust_DVSI = 1 if Arrest_Cust == 1 & DV_Simple_Int == 1 & WomVic == 1



gen Arrest_DVSC = 0 
replace Arrest_DVSC = 1 if Arrest == 1 & DV_SeriousCr == 1 & WomVic == 1


gen Arrest_OV_DVSC = 0
replace Arrest_OV_DVSC = 1 if Arrest_OV == 1 & DV_SeriousCr == 1 & WomVic == 1


gen Arrest_Sum_DVSC = 0
replace Arrest_Sum_DVSC = 1 if Arrest_Sum == 1 & DV_SeriousCr == 1 & WomVic == 1


gen Arrest_Cust_DVSC = 0
replace Arrest_Cust_DVSC = 1 if Arrest_Cust == 1 & DV_SeriousCr == 1 & WomVic == 1



*Domestic Violence cases ending in arrest by race/ethnicity of women victims. 

gen HWArrest_DV = 0 
replace HWArrest_DV = 1 if Arrest == 1 & DV ==1 & H_WomVic == 1


gen HWArrest_OV_DV = 0 
replace HWArrest_OV_DV = 1 if Arrest_OV ==1 & DV == 1 & H_WomVic == 1


gen HWArrest_Sum_DV = 0 
replace HWArrest_Sum_DV = 1 if Arrest_Sum ==1 & DV == 1 & H_WomVic == 1


gen HWArrest_Cust_DV = 0 
replace HWArrest_Cust_DV = 1 if Arrest_Cust ==1 & DV == 1 & H_WomVic == 1


gen HWArrest_DVV = 0 
replace HWArrest_DVV = 1 if Arrest == 1 & DV_Violent == 1 & H_WomVic == 1


gen HWArrest_OV_DVV = 0 
replace HWArrest_OV_DVV = 1 if Arrest_OV == 1 & DV_Violent == 1 & H_WomVic == 1


gen HWArrest_Sum_DVV = 0 
replace HWArrest_Sum_DVV = 1 if Arrest_Sum == 1 & DV_Violent == 1 & H_WomVic == 1


gen HWArrest_Cust_DVV = 0 
replace HWArrest_Cust_DVV = 1 if Arrest_Cust == 1 & DV_Violent == 1 & H_WomVic == 1


gen HWArrest_DVSA= 0 
replace HWArrest_DVSA = 1 if Arrest == 1 & DV_SexAsslt == 1 & H_WomVic == 1


gen HWArrest_OV_DVSA = 0
replace HWArrest_OV_DVSA = 1 if Arrest_OV == 1 & DV_SexAsslt == 1 & H_WomVic == 1


gen HWArrest_Sum_DVSA = 0
replace HWArrest_Sum_DVSA = 1 if Arrest_Sum == 1 & DV_SexAsslt == 1 & H_WomVic == 1


gen HWArrest_Cust_DVSA = 0
replace HWArrest_Cust_DVSA = 1 if Arrest_Cust == 1 & DV_SexAsslt == 1 & H_WomVic == 1


gen HWArrest_DVSI = 0 
replace HWArrest_DVSI = 1 if Arrest == 1 & DV_Simple_Int == 1 & H_WomVic == 1


gen HWArrest_OV_DVSI = 0
replace HWArrest_OV_DVSI = 1 if Arrest_OV == 1 & DV_Simple_Int == 1 & H_WomVic == 1


gen HWArrest_Sum_DVSI = 0
replace HWArrest_Sum_DVSI = 1 if Arrest_Sum == 1 & DV_Simple_Int == 1 & H_WomVic == 1


gen HWArrest_Cust_DVSI = 0
replace HWArrest_Cust_DVSI = 1 if Arrest_Cust == 1 & DV_Simple_Int == 1 & H_WomVic == 1
 

gen HWArrest_DVSC = 0 
replace HWArrest_DVSC = 1 if Arrest == 1 & DV_SeriousCr == 1 & H_WomVic == 1


gen HWArrest_OV_DVSC = 0
replace HWArrest_OV_DVSC = 1 if Arrest_OV == 1 & DV_SeriousCr == 1 & H_WomVic == 1


gen HWArrest_Sum_DVSC = 0
replace HWArrest_Sum_DVSC = 1 if Arrest_Sum == 1 & DV_SeriousCr == 1 & H_WomVic == 1


gen HWArrest_Cust_DVSC = 0
replace HWArrest_Cust_DVSC = 1 if Arrest_Cust == 1 & DV_SeriousCr == 1 & H_WomVic == 1


gen BWArrest_DV = 0 
replace BWArrest_DV = 1 if Arrest == 1 & DV == 1 & B_WomVic == 1


gen BWArrest_OV_DV = 0
replace BWArrest_OV_DV = 1 if Arrest_OV == 1 & DV == 1 & B_WomVic == 1


gen BWArrest_Sum_DV = 0
replace BWArrest_Sum_DV = 1 if Arrest_Sum == 1 & DV == 1 & B_WomVic == 1


gen BWArrest_Cust_DV = 0
replace BWArrest_Cust_DV = 1 if Arrest_Cust == 1 & DV == 1 & B_WomVic == 1


gen BWArrest_DVV= 0 
replace BWArrest_DVV = 1 if Arrest == 1 & DV_Violent == 1 & B_WomVic == 1


gen BWArrest_OV_DVV= 0
replace BWArrest_OV_DVV= 1 if Arrest_OV == 1 & DV_Violent == 1 & B_WomVic == 1


gen BWArrest_Sum_DVV = 0
replace BWArrest_Sum_DVV = 1 if Arrest_Sum == 1 & DV_Violent == 1 & B_WomVic == 1


gen BWArrest_Cust_DVV = 0
replace BWArrest_Cust_DVV = 1 if Arrest_Cust == 1 & DV_Violent == 1 & B_WomVic == 1



gen BWArrest_DVSA= 0 
replace BWArrest_DVSA = 1 if Arrest == 1 & DV_SexAsslt == 1 & B_WomVic == 1


gen BWArrest_OV_DVSA = 0
replace BWArrest_OV_DVSA = 1 if Arrest_OV == 1 & DV_SexAsslt == 1 & B_WomVic == 1


gen BWArrest_Sum_DVSA = 0
replace BWArrest_Sum_DVSA = 1 if Arrest_Sum == 1 & DV_SexAsslt == 1 & B_WomVic == 1


gen BWArrest_Cust_DVSA = 0
replace BWArrest_Cust_DVSA = 1 if Arrest_Cust == 1 & DV_SexAsslt == 1 & B_WomVic == 1



gen BWArrest_DVSI = 0 
replace BWArrest_DVSI = 1 if Arrest == 1 & DV_Simple_Int == 1 & B_WomVic == 1


gen BWArrest_OV_DVSI = 0
replace BWArrest_OV_DVSI = 1 if Arrest_OV == 1 & DV_Simple_Int == 1 & B_WomVic == 1


gen BWArrest_Sum_DVSI = 0
replace BWArrest_Sum_DVSI = 1 if Arrest_Sum == 1 & DV_Simple_Int == 1 & B_WomVic == 1


gen BWArrest_Cust_DVSI = 0
replace BWArrest_Cust_DVSI = 1 if Arrest_Cust == 1 & DV_Simple_Int == 1 & B_WomVic == 1



gen BWArrest_DVSC = 0 
replace BWArrest_DVSC = 1 if Arrest == 1 & DV_SeriousCr == 1 & B_WomVic == 1


gen BWArrest_OV_DVSC = 0
replace BWArrest_OV_DVSC = 1 if Arrest_OV == 1 & DV_SeriousCr == 1 & B_WomVic == 1


gen BWArrest_Sum_DVSC = 0
replace BWArrest_Sum_DVSC = 1 if Arrest_Sum == 1 & DV_SeriousCr == 1 & B_WomVic == 1


gen BWArrest_Cust_DVSC = 0
replace BWArrest_Cust_DVSC = 1 if Arrest_Cust == 1 & DV_SeriousCr == 1 & B_WomVic == 1
 


gen BNHWArrest_DV = 0 
replace BNHWArrest_DV = 1 if Arrest == 1 & DV == 1 & BNH_WomVic == 1


gen BNHWArrest_OV_DV = 0
replace BNHWArrest_OV_DV = 1 if Arrest_OV == 1 & DV == 1 & BNH_WomVic == 1


gen BNHWArrest_Sum_DV = 0
replace BNHWArrest_Sum_DV = 1 if Arrest_Sum == 1 & DV == 1 & BNH_WomVic == 1
 

gen BNHWArrest_Cust_DV = 0
replace BNHWArrest_Cust_DV = 1 if Arrest_Cust == 1 & DV == 1 & BNH_WomVic == 1



gen BNHWArrest_DVV= 0 
replace BNHWArrest_DVV = 1 if Arrest == 1 & DV_Violent == 1 & BNH_WomVic == 1


gen BNHWArrest_OV_DVV= 0
replace BNHWArrest_OV_DVV= 1 if Arrest_OV == 1 & DV_Violent == 1 & BNH_WomVic == 1


gen BNHWArrest_Sum_DVV = 0
replace BNHWArrest_Sum_DVV = 1 if Arrest_Sum == 1 & DV_Violent == 1 & BNH_WomVic == 1


gen BNHWArrest_Cust_DVV = 0
replace BNHWArrest_Cust_DVV = 1 if Arrest_Cust == 1 & DV_Violent == 1 & BNH_WomVic == 1



gen BNHWArrest_DVSA= 0 
replace BNHWArrest_DVSA = 1 if Arrest == 1 & DV_SexAsslt == 1 & BNH_WomVic == 1
 

gen BNHWArrest_OV_DVSA = 0
replace BNHWArrest_OV_DVSA = 1 if Arrest_OV == 1 & DV_SexAsslt == 1 & BNH_WomVic == 1


gen BNHWArrest_Sum_DVSA = 0
replace BNHWArrest_Sum_DVSA = 1 if Arrest_Sum == 1 & DV_SexAsslt == 1 & BNH_WomVic == 1


gen BNHWArrest_Cust_DVSA = 0
replace BNHWArrest_Cust_DVSA = 1 if Arrest_Cust == 1 & DV_SexAsslt == 1 & BNH_WomVic == 1



gen BNHWArrest_DVSI = 0 
replace BNHWArrest_DVSI = 1 if Arrest == 1 & DV_Simple_Int == 1 & BNH_WomVic == 1


gen BNHWArrest_OV_DVSI = 0
replace BNHWArrest_OV_DVSI = 1 if Arrest_OV == 1 & DV_Simple_Int == 1 & BNH_WomVic == 1


gen BNHWArrest_Sum_DVSI = 0
replace BNHWArrest_Sum_DVSI = 1 if Arrest_Sum == 1 & DV_Simple_Int == 1 & BNH_WomVic == 1


gen BNHWArrest_Cust_DVSI = 0
replace BNHWArrest_Cust_DVSI = 1 if Arrest_Cust == 1 & DV_Simple_Int == 1 & BNH_WomVic == 1
  


gen BNHWArrest_DVSC = 0 
replace BNHWArrest_DVSC = 1 if Arrest == 1 & DV_SeriousCr == 1 & BNH_WomVic == 1


gen BNHWArrest_OV_DVSC = 0
replace BNHWArrest_OV_DVSC = 1 if Arrest_OV == 1 & DV_SeriousCr == 1 & BNH_WomVic == 1


gen BNHWArrest_Sum_DVSC = 0
replace BNHWArrest_Sum_DVSC = 1 if Arrest_Sum == 1 & DV_SeriousCr == 1 & BNH_WomVic == 1


gen BNHWArrest_Cust_DVSC = 0
replace BNHWArrest_Cust_DVSC = 1 if Arrest_Cust == 1 & DV_SeriousCr == 1 & BNH_WomVic == 1


gen WWArrest_DV = 0 
replace WWArrest_DV = 1 if Arrest == 1 & DV == 1 & W_WomVic == 1


gen WWArrest_OV_DV = 0
replace WWArrest_OV_DV = 1 if Arrest_OV == 1 & DV == 1 & W_WomVic == 1


gen WWArrest_Sum_DV = 0
replace WWArrest_Sum_DV = 1 if Arrest_Sum == 1 & DV == 1 & W_WomVic == 1


gen WWArrest_Cust_DV = 0
replace WWArrest_Cust_DV = 1 if Arrest_Cust == 1 & DV == 1 & W_WomVic == 1



gen WWArrest_DVV= 0 
replace WWArrest_DVV = 1 if Arrest == 1 & DV_Violent == 1 & W_WomVic == 1


gen WWArrest_OV_DVV= 0
replace WWArrest_OV_DVV= 1 if Arrest_OV == 1 & DV_Violent == 1 & W_WomVic == 1


gen WWArrest_Sum_DVV = 0
replace WWArrest_Sum_DVV = 1 if Arrest_Sum == 1 & DV_Violent == 1 & W_WomVic == 1


gen WWArrest_Cust_DVV = 0
replace WWArrest_Cust_DVV = 1 if Arrest_Cust == 1 & DV_Violent == 1 & W_WomVic == 1


gen WWArrest_DVSA= 0 
replace WWArrest_DVSA = 1 if Arrest == 1 & DV_SexAsslt == 1 & W_WomVic == 1


gen WWArrest_OV_DVSA = 0
replace WWArrest_OV_DVSA = 1 if Arrest_OV == 1 & DV_SexAsslt == 1 & W_WomVic == 1


gen WWArrest_Sum_DVSA = 0
replace WWArrest_Sum_DVSA = 1 if Arrest_Sum == 1 & DV_SexAsslt == 1 & W_WomVic == 1


gen WWArrest_Cust_DVSA = 0
replace WWArrest_Cust_DVSA = 1 if Arrest_Cust == 1 & DV_SexAsslt == 1 & W_WomVic == 1


gen WWArrest_DVSI = 0 
replace WWArrest_DVSI = 1 if Arrest == 1 & DV_Simple_Int == 1 & W_WomVic == 1


gen WWArrest_OV_DVSI = 0
replace WWArrest_OV_DVSI = 1 if Arrest_OV == 1 & DV_Simple_Int == 1 & W_WomVic == 1


gen WWArrest_Sum_DVSI = 0
replace WWArrest_Sum_DVSI = 1 if Arrest_Sum == 1 & DV_Simple_Int == 1 & W_WomVic == 1


gen WWArrest_Cust_DVSI = 0
replace WWArrest_Cust_DVSI = 1 if Arrest_Cust == 1 & DV_Simple_Int == 1 & W_WomVic == 1



gen WWArrest_DVSC = 0 
replace WWArrest_DVSC = 1 if Arrest == 1 & DV_SeriousCr == 1 & W_WomVic == 1


gen WWArrest_OV_DVSC = 0
replace WWArrest_OV_DVSC = 1 if Arrest_OV == 1 & DV_SeriousCr == 1 & W_WomVic == 1


gen WWArrest_Sum_DVSC = 0
replace WWArrest_Sum_DVSC = 1 if Arrest_Sum == 1 & DV_SeriousCr == 1 & W_WomVic == 1


gen WWArrest_Cust_DVSC = 0
replace WWArrest_Cust_DVSC = 1 if Arrest_Cust == 1 & DV_SeriousCr == 1 & W_WomVic == 1


gen WNHWArrest_DV = 0 
replace WNHWArrest_DV = 1 if Arrest == 1 & DV == 1 & WNH_WomVic == 1


gen WNHWArrest_OV_DV = 0
replace WNHWArrest_OV_DV = 1 if Arrest_OV == 1 & DV == 1 & WNH_WomVic == 1


gen WNHWArrest_Sum_DV = 0
replace WNHWArrest_Sum_DV = 1 if Arrest_Sum == 1 & DV == 1 & WNH_WomVic == 1


gen WNHWArrest_Cust_DV = 0
replace WNHWArrest_Cust_DV = 1 if Arrest_Cust == 1 & DV == 1 & WNH_WomVic == 1



gen WNHWArrest_DVV= 0 
replace WNHWArrest_DVV = 1 if Arrest == 1 & DV_Violent == 1 & WNH_WomVic == 1


gen WNHWArrest_OV_DVV= 0
replace WNHWArrest_OV_DVV= 1 if Arrest_OV == 1 & DV_Violent == 1 & WNH_WomVic == 1



gen WNHWArrest_Sum_DVV = 0
replace WNHWArrest_Sum_DVV = 1 if Arrest_Sum == 1 & DV_Violent == 1 & WNH_WomVic == 1


gen WNHWArrest_Cust_DVV = 0
replace WNHWArrest_Cust_DVV = 1 if Arrest_Cust == 1 & DV_Violent == 1 & WNH_WomVic == 1



gen WNHWArrest_DVSA= 0 
replace WNHWArrest_DVSA = 1 if Arrest == 1 & DV_SexAsslt == 1 & WNH_WomVic == 1


gen WNHWArrest_OV_DVSA = 0
replace WNHWArrest_OV_DVSA = 1 if Arrest_OV == 1 & DV_SexAsslt == 1 & WNH_WomVic == 1


gen WNHWArrest_Sum_DVSA = 0
replace WNHWArrest_Sum_DVSA = 1 if Arrest_Sum == 1 & DV_SexAsslt == 1 & WNH_WomVic == 1


gen WNHWArrest_Cust_DVSA = 0
replace WNHWArrest_Cust_DVSA = 1 if Arrest_Cust == 1 & DV_SexAsslt == 1 & WNH_WomVic == 1



gen WNHWArrest_DVSI = 0 
replace WNHWArrest_DVSI = 1 if Arrest == 1 & DV_Simple_Int == 1 & WNH_WomVic == 1


gen WNHWArrest_OV_DVSI = 0
replace WNHWArrest_OV_DVSI = 1 if Arrest_OV == 1 & DV_Simple_Int == 1 & WNH_WomVic == 1


gen WNHWArrest_Sum_DVSI = 0
replace WNHWArrest_Sum_DVSI = 1 if Arrest_Sum == 1 & DV_Simple_Int == 1 & WNH_WomVic == 1


gen WNHWArrest_Cust_DVSI = 0
replace WNHWArrest_Cust_DVSI = 1 if Arrest_Cust == 1 & DV_Simple_Int == 1 & WNH_WomVic == 1


gen WNHWArrest_DVSC = 0 
replace WNHWArrest_DVSC = 1 if Arrest == 1 & DV_SeriousCr == 1 & WNH_WomVic == 1


gen WNHWArrest_OV_DVSC = 0
replace WNHWArrest_OV_DVSC = 1 if Arrest_OV == 1 & DV_SeriousCr == 1 & WNH_WomVic == 1


gen WNHWArrest_Sum_DVSC = 0
replace WNHWArrest_Sum_DVSC = 1 if Arrest_Sum == 1 & DV_SeriousCr == 1 & WNH_WomVic == 1


gen WNHWArrest_Cust_DVSC = 0
replace WNHWArrest_Cust_DVSC = 1 if Arrest_Cust == 1 & DV_SeriousCr == 1 & WNH_WomVic == 1



*Injury associated with incident
gen Injury = 0 
replace Injury = 1 if V4026 > 1



*For the arrestee
gen Armed = 0 
replace Armed = 1 if V60121  >= 110


*Summing by ORI
egen TotArrest_DV_T = total(TotArrest_DV), by (ORI)
egen TotArrest_OV_DV_T = total(TotArrest_OV_DV), by (ORI)
egen TotArrest_Cust_DV_T = total(TotArrest_Cust_DV), by (ORI) 
egen TotArrest_DVV_T = total(TotArrest_DVV), by (ORI)
egen TotArrest_OV_DVV_T = total(TotArrest_OV_DVV), by (ORI)
egen TotArrest_Sum_DVV_T = total(TotArrest_Sum_DVV), by (ORI) 
egen TotArrest_Cust_DVV_T = total(TotArrest_Cust_DVV), by (ORI)
egen TotArrest_DVSA_T = total(TotArrest_DVSA), by (ORI)
egen TotArrest_OV_DVSA_T = total(TotArrest_OV_DVSA), by (ORI)
egen TotArrest_Sum_DVSA_T = total(TotArrest_Sum_DVSA), by (ORI)
egen TotArrest_Cust_DVSA_T = total(TotArrest_Cust_DVSA), by (ORI)
egen TotArrest_DVSI_T = total(TotArrest_DVSI), by (ORI)
egen TotArrest_OV_DVSI_T = total(TotArrest_OV_DVSI), by (ORI)
egen TotArrest_Sum_DVSI_T = total(TotArrest_Sum_DVSI), by (ORI)
egen TotArrest_Cust_DVSI_T = total(TotArrest_Cust_DVSI), by (ORI)
egen TotArrest_DVSC_T = total(TotArrest_DVSC), by (ORI)
egen TotArrest_OV_DVSC_T = total(TotArrest_OV_DVSC), by (ORI)
egen TotArrest_Sum_DVSC_T = total(TotArrest_Sum_DVSC), by (ORI)
egen TotArrest_Cust_DVSC_T = total(TotArrest_Cust_DVSC), by (ORI) 
egen DV_T = total(DV), by (ORI)
egen DV_Violent_T = total(DV_Violent), by (ORI)
egen DV_SexAsslt_T = total(DV_SexAsslt), by (ORI)
egen DV_Simple_Int_T = total(DV_Simple_Int), by (ORI)
egen DV_SeriousCr_T = total(DV_SeriousCr), by (ORI)
egen WomVic_DV_T = total(WomVic_DV), by (ORI) 
egen H_WomVic_DV_T = total(H_WomVic_DV), by (ORI) 
egen B_WomVic_DV_T = total(B_WomVic_DV), by (ORI) 
egen BNH_WomVic_DV_T = total(BNH_WomVic_DV), by (ORI)
egen W_WomVic_DV_T = total(W_WomVic_DV), by (ORI) 
egen WNH_WomVic_DV_T = total(WNH_WomVic_DV), by (ORI) 
egen AmIn_WomVic_DV_T = total(AmIn_WomVic_DV), by (ORI) 
egen A_WomVic_DV_T = total(A_WomVic_DV), by (ORI)  
egen Pac_WomVic_DV_T = total(Pac_WomVic_DV), by (ORI) 
egen WomVic_DV_V_T = total(WomVic_DV_V), by (ORI) 
egen H_WomVic_DV_V_T = total(H_WomVic_DV_V), by (ORI)
egen B_WomVic_DV_V_T = total(B_WomVic_DV_V), by (ORI) 
egen BNH_WomVic_DV_V_T = total(BNH_WomVic_DV_V), by (ORI)
egen W_WomVic_DV_V_T = total(W_WomVic_DV_V), by (ORI) 
egen WNH_WomVic_DV_V_T = total(WNH_WomVic_DV_V), by (ORI)  
egen AmIn_WomVic_DV_V_T = total(AmIn_WomVic_DV_V), by (ORI)  
egen A_WomVic_DV_V_T = total(A_WomVic_DV_V), by (ORI) 
egen Pac_WomVic_DV_V_T = total(Pac_WomVic_DV_V), by (ORI) 
egen WomVic_DV_SA_T = total(WomVic_DV_SA), by (ORI) 
egen H_WomVic_DV_SA_T = total(H_WomVic_DV_SA), by (ORI) 
egen B_WomVic_DV_SA_T = total(B_WomVic_DV_SA), by (ORI) 
egen BNH_WomVic_DV_SA_T = total(BNH_WomVic_DV_SA), by (ORI)
egen W_WomVic_DV_SA_T = total(W_WomVic_DV_SA), by (ORI)
egen WNH_WomVic_DV_SA_T = total(WNH_WomVic_DV_SA), by (ORI) 
egen AmIn_WomVic_DV_SA_T = total(AmIn_WomVic_DV_SA), by (ORI) 
egen A_WomVic_DV_SA_T = total(A_WomVic_DV_SA), by (ORI) 
egen Pac_WomVic_DV_SA_T = total(Pac_WomVic_DV_SA), by (ORI) 
egen WomVic_DV_SI_T = total(WomVic_DV_SI), by (ORI) 
egen H_WomVic_DV_SI_T = total(H_WomVic_DV_SI), by (ORI) 
egen B_WomVic_DV_SI_T = total(B_WomVic_DV_SI), by (ORI) 
egen BNH_WomVic_DV_SI_T = total(BNH_WomVic_DV_SI), by (ORI) 
egen W_WomVic_DV_SI_T = total(W_WomVic_DV_SI), by (ORI) 
egen WNH_WomVic_DV_SI_T = total(WNH_WomVic_DV_SI), by (ORI) 
egen AmIn_WomVic_DV_SI_T = total(AmIn_WomVic_DV_SI), by (ORI) 
egen A_WomVic_DV_SI_T = total(A_WomVic_DV_SI), by (ORI) 
egen Pac_WomVic_DV_SI_T = total(Pac_WomVic_DV_SI), by (ORI) 
egen WomVic_DV_SC_T = total(WomVic_DV_SC), by (ORI) 
egen H_WomVic_DV_SC_T = total(H_WomVic_DV_SC), by (ORI) 
egen B_WomVic_DV_SC_T = total(B_WomVic_DV_SC), by (ORI) 
egen BNH_WomVic_DV_SC_T = total(BNH_WomVic_DV_SC), by (ORI) 
egen W_WomVic_DV_SC_T = total(W_WomVic_DV_SC), by (ORI) 
egen WNH_WomVic_DV_SC_T = total(WNH_WomVic_DV_SC), by (ORI) 
egen AmIn_WomVic_DV_SC_T = total(AmIn_WomVic_DV_SC), by (ORI) 
egen A_WomVic_DV_SC_T = total(A_WomVic_DV_SC), by (ORI) 
egen Pac_WomVic_DV_SC_T = total(Pac_WomVic_DV_SC), by (ORI) 
egen Arrest_DV_T = total(Arrest_DV), by (ORI) 
egen Arrest_OV_DV_T = total(Arrest_OV_DV), by (ORI) 
egen Arrest_Sum_DV_T = total(Arrest_Sum_DV), by (ORI) 
egen Arrest_Cust_DV_T = total(Arrest_Cust_DV), by (ORI) 
egen Arrest_DVV_T = total(Arrest_DVV), by (ORI)
egen Arrest_OV_DVV_T = total(Arrest_OV_DVV), by (ORI)
egen Arrest_Sum_DVV_T = total(Arrest_Sum_DVV), by (ORI) 
egen Arrest_Cust_DVV_T = total(Arrest_Cust_DVV), by (ORI) 
egen Arrest_DVSA_T = total(Arrest_DVSA), by (ORI)
egen Arrest_OV_DVSA_T = total(Arrest_OV_DVSA), by (ORI)
egen Arrest_Sum_DVSA_T = total(Arrest_Sum_DVSA), by (ORI) 
egen Arrest_Cust_DVSA_T = total(Arrest_Cust_DVSA), by (ORI) 
egen Arrest_DVSI_T = total(Arrest_DVSI), by (ORI) 
egen Arrest_OV_DVSI_T = total(Arrest_OV_DVSI), by (ORI) 
egen Arrest_Sum_DVSI_T = total(Arrest_Sum_DVSI), by (ORI) 
egen Arrest_Cust_DVSI_T = total(Arrest_Cust_DVSI), by (ORI) 
egen Arrest_DVSC_T = total(Arrest_DVSC), by (ORI) 
egen Arrest_OV_DVSC_T = total(Arrest_OV_DVSC), by (ORI) 
egen Arrest_Sum_DVSC_T = total(Arrest_Sum_DVSC), by (ORI)
egen Arrest_Cust_DVSC_T = total(Arrest_Cust_DVSC), by (ORI)  
egen BWArrest_DV_T = total(BWArrest_DV), by (ORI) 
egen BWArrest_OV_DV_T = total(BWArrest_OV_DV), by (ORI) 
egen BWArrest_Sum_DV_T = total(BWArrest_Sum_DV), by (ORI)  
egen BWArrest_Cust_DV_T = total(BWArrest_Cust_DV), by (ORI)
egen BWArrest_DVV_T = total(BWArrest_DVV), by (ORI)
egen BWArrest_OV_DVV_T = total(BWArrest_OV_DVV), by (ORI)
egen BWArrest_Sum_DVV_T = total(BWArrest_Sum_DVV), by (ORI) 
egen BWArrest_Cust_DVV_T = total(BWArrest_Cust_DVV), by (ORI) 
egen BWArrest_DVSA_T = total(BWArrest_DVSA), by (ORI)
egen BWArrest_OV_DVSA_T = total(BWArrest_OV_DVSA), by (ORI) 
egen BWArrest_Sum_DVSA_T = total(BWArrest_Sum_DVSA), by (ORI) 
egen BWArrest_Cust_DVSA_T = total(BWArrest_Cust_DVSA), by (ORI) 
egen BWArrest_DVSI_T = total(BWArrest_DVSI), by (ORI) 
egen BWArrest_OV_DVSI_T = total(BWArrest_OV_DVSI), by (ORI) 
egen BWArrest_Sum_DVSI_T = total(BWArrest_Sum_DVSI), by (ORI)
egen BWArrest_Cust_DVSI_T = total(BWArrest_Cust_DVSI), by (ORI) 
egen BWArrest_DVSC_T = total(BWArrest_DVSC), by (ORI)
egen BWArrest_OV_DVSC_T = total(BWArrest_OV_DVSC), by (ORI) 
egen BWArrest_Sum_DVSC_T = total(BWArrest_Sum_DVSC), by (ORI) 
egen BWArrest_Cust_DVSC_T = total(BWArrest_Cust_DVSC), by (ORI) 
egen BNHWArrest_DV_T = total(BNHWArrest_DV), by (ORI)  
egen BNHWArrest_OV_DV_T = total(BNHWArrest_OV_DV), by (ORI) 
egen BNHWArrest_Sum_DV_T = total(BNHWArrest_Sum_DV), by (ORI) 
egen BNHWArrest_Cust_DV_T = total(BNHWArrest_Cust_DV), by (ORI)   
egen BNHWArrest_DVV_T = total(BNHWArrest_DVV), by (ORI)
egen BNHWArrest_OV_DVV_T = total(BNHWArrest_OV_DVV), by (ORI)
egen BNHWArrest_Sum_DVV_T = total(BNHWArrest_Sum_DVV), by (ORI)
egen BNHWArrest_Cust_DVV_T = total(BNHWArrest_Cust_DVV), by (ORI) 
egen BNHWArrest_DVSA_T = total(BNHWArrest_DVSA), by (ORI)
egen BNHWArrest_OV_DVSA_T = total(BNHWArrest_OV_DVSA), by (ORI) 
egen BNHWArrest_Sum_DVSA_T = total(BNHWArrest_Sum_DVSA), by (ORI) 
egen BNHWArrest_Cust_DVSA_T = total(BNHWArrest_Cust_DVSA), by (ORI) 
egen BNHWArrest_DVSI_T = total(BNHWArrest_DVSI), by (ORI) 
egen BNHWArrest_OV_DVSI_T = total(BNHWArrest_OV_DVSI), by (ORI)
egen BNHWArrest_Sum_DVSI_T = total(BNHWArrest_Sum_DVSI), by (ORI)
egen BNHWArrest_Cust_DVSI_T = total(BNHWArrest_Cust_DVSI), by (ORI)
egen BNHWArrest_DVSC_T = total(BNHWArrest_DVSC), by (ORI) 
egen BNHWArrest_OV_DVSC_T = total(BNHWArrest_OV_DVSC), by (ORI) 
egen BNHWArrest_Sum_DVSC_T = total(BNHWArrest_Sum_DVSC), by (ORI) 
egen BNHWArrest_Cust_DVSC_T = total(BNHWArrest_Cust_DVSC), by (ORI) 
egen WWArrest_DV_T = total(WWArrest_DV), by (ORI) 
egen WWArrest_OV_DV_T = total(WWArrest_OV_DV) , by (ORI)
egen WWArrest_Sum_DV_T = total(WWArrest_Sum_DV), by (ORI) 
egen WWArrest_Cust_DV_T = total(WWArrest_Cust_DV), by (ORI)
egen WWArrest_DVV_T = total(WWArrest_DVV), by (ORI)
egen WWArrest_OV_DVV_T = total(WWArrest_OV_DVV), by (ORI)
egen WWArrest_Sum_DVV_T = total(WWArrest_Sum_DVV), by (ORI) 
egen WWArrest_Cust_DVV_T = total(WWArrest_Cust_DVV), by (ORI) 
egen WWArrest_DVSA_T = total(WWArrest_DVSA), by (ORI)
egen WWArrest_OV_DVSA_T = total(WWArrest_OV_DVSA), by (ORI) 
egen WWArrest_Sum_DVSA_T = total(WWArrest_Sum_DVSA), by (ORI) 
egen WWArrest_Cust_DVSA_T = total(WWArrest_Cust_DVSA), by (ORI) 
egen WWArrest_DVSI_T = total(WWArrest_DVSI), by (ORI) 
egen WWArrest_OV_DVSI_T = total(WWArrest_OV_DVSI), by (ORI) 
egen WWArrest_Sum_DVSI_T = total(WWArrest_Sum_DVSI), by (ORI) 
egen WWArrest_Cust_DVSI_T = total(WWArrest_Cust_DVSI), by (ORI) 
egen WWArrest_DVSC_T = total(WWArrest_DVSC), by (ORI) 
egen WWArrest_OV_DVSC_T = total(WWArrest_OV_DVSC), by (ORI) 
egen WWArrest_Sum_DVSC_T = total(WWArrest_Sum_DVSC), by (ORI) 
egen WWArrest_Cust_DVSC_T = total(WWArrest_Cust_DVSC), by (ORI) 
egen WNHWArrest_DV_T = total(WNHWArrest_DV), by (ORI) 
egen WNHWArrest_OV_DV_T = total(WNHWArrest_OV_DV), by (ORI) 
egen WNHWArrest_Sum_DV_T = total(WNHWArrest_Sum_DV), by (ORI) 
egen WNHWArrest_Cust_DV_T = total(WNHWArrest_Cust_DV), by (ORI)
egen WNHWArrest_DVV_T = total(WNHWArrest_DVV), by (ORI)
egen WNHWArrest_OV_DVV_T = total(WNHWArrest_OV_DVV), by (ORI)
egen WNHWArrest_Sum_DVV_T = total(WNHWArrest_Sum_DVV), by (ORI) 
egen WNHWArrest_Cust_DVV_T = total(WNHWArrest_Cust_DVV), by (ORI) 
egen WNHWArrest_DVSA_T = total(WNHWArrest_DVSA), by (ORI)
egen WNHWArrest_OV_DVSA_T = total(WNHWArrest_OV_DVSA), by (ORI) 
egen WNHWArrest_Sum_DVSA_T = total(WNHWArrest_Sum_DVSA), by (ORI)
egen WNHWArrest_Cust_DVSA_T = total(WNHWArrest_Cust_DVSA), by (ORI)
egen WNHWArrest_DVSI_T = total(WNHWArrest_DVSI), by (ORI) 
egen WNHWArrest_OV_DVSI_T = total(WNHWArrest_OV_DVSI), by (ORI) 
egen WNHWArrest_Sum_DVSI_T = total(WNHWArrest_Sum_DVSI), by (ORI) 
egen WNHWArrest_Cust_DVSI_T = total(WNHWArrest_Cust_DVSI), by (ORI) 
egen WNHWArrest_DVSC_T = total(WNHWArrest_DVSC), by (ORI) 
egen WNHWArrest_OV_DVSC_T = total(WNHWArrest_OV_DVSC), by (ORI) 
egen WNHWArrest_Sum_DVSC_T = total(WNHWArrest_Sum_DVSC), by (ORI) 
egen WNHWArrest_Cust_DVSC_T = total(WNHWArrest_Cust_DVSC), by (ORI)
egen HWArrest_DV_T = total(HWArrest_DV), by (ORI)
egen HWArrest_OV_DV_T = total(HWArrest_OV_DV), by (ORI) 
egen HWArrest_Sum_DV_T = total(HWArrest_Sum_DV), by (ORI) 
egen HWArrest_Cust_DV_T = total(HWArrest_Cust_DV), by (ORI)
egen HWArrest_DVV_T = total(HWArrest_DVV), by (ORI) 
egen HWArrest_OV_DVV_T = total(HWArrest_OV_DVV), by (ORI)
egen HWArrest_Sum_DVV_T = total(HWArrest_Sum_DVV), by (ORI) 
egen HWArrest_Cust_DVV_T = total(HWArrest_Cust_DVV), by (ORI) 
egen HWArrest_DVSA_T = total(HWArrest_DVSA), by (ORI)
egen HWArrest_OV_DVSA_T = total(HWArrest_OV_DVSA), by (ORI) 
egen HWArrest_Sum_DVSA_T = total(HWArrest_Sum_DVSA), by (ORI) 
egen HWArrest_Cust_DVSA_T = total(HWArrest_Cust_DVSA), by (ORI) 
egen HWArrest_DVSI_T = total(HWArrest_DVSI), by (ORI) 
egen HWArrest_OV_DVSI_T = total(HWArrest_OV_DVSI), by (ORI)
egen HWArrest_Sum_DVSI_T = total(HWArrest_Sum_DVSI), by (ORI)
egen HWArrest_Cust_DVSI_T = total(HWArrest_Cust_DVSI), by (ORI) 
egen HWArrest_DVSC_T = total(HWArrest_DVSC), by (ORI) 
egen HWArrest_OV_DVSC_T = total(HWArrest_OV_DVSC), by (ORI) 
egen HWArrest_Sum_DVSC_T = total(HWArrest_Sum_DVSC), by (ORI) 
egen HWArrest_Cust_DVSC_T = total(HWArrest_Cust_DVSC), by (ORI)

*For Violent Crime Rate
gen ViolentCrimeRate = (ViolentCrime/B2005)*1000


*To drop all of the incident-level victim data (and keep the agency level victim data). 
sort ORI
by ORI: keep if _n==1

**Agency level summary stats (*Need to redo the reporting rate data by making the denominator the proportion of that race in the population)
*Arrest rate is the total arrests/total incidents; then total arrest for women victims/by total women victims; then total arrest by race/total victims by race

*All DV Arrests, regardless of the gender of the victim. 
gen DVArrest_R = TotArrest_DV_T/DV_T 
gen DVArrest_OV_R = TotArrest_OV_DV_T/DV_T
gen DVArrest_Cust_R = TotArrest_Cust_DV_T/DV_T
gen DVArrest_V_R = TotArrest_DVV_T/DV_Violent_T 
gen DVArrest_OVV_R = TotArrest_OV_DVV_T/DV_Violent_T
gen DVArrest_SumV_R = TotArrest_Sum_DVV_T/DV_Violent_T 
gen DVArrest_CustV_R = TotArrest_Cust_DVV_T/DV_Violent_T 
gen DVArrest_DVSA_R = TotArrest_DVSA_T/DV_SexAsslt_T 
gen DVArrest_OVSA_R = TotArrest_OV_DVSA_T/DV_SexAsslt_T 
gen DVArrest_SumSA_R = TotArrest_Sum_DVSA_T/DV_SexAsslt_T 
gen DVArrest_CustSA_R = TotArrest_Cust_DVSA_T/DV_SexAsslt_T
gen DVArrest_DVSI_R = TotArrest_DVSI_T/DV_Simple_Int_T 
gen DVArrest_OVSI_R = TotArrest_OV_DVSI_T/DV_Simple_Int_T
gen DVArrest_SumSI_R = TotArrest_Sum_DVSI_T/DV_Simple_Int_T 
gen DVArrest_CustSI_R = TotArrest_Cust_DVSI_T/DV_Simple_Int_T
gen DVArrest_DVSC_R = TotArrest_DVSC_T/DV_SeriousCr_T 
gen DVArrest_OVSC_R = TotArrest_OV_DVSC_T/DV_SeriousCr_T 
gen DVArrest_SumSC_R = TotArrest_Sum_DVSC_T/DV_SeriousCr_T 
gen DVArrest_CustSC_R = TotArrest_Cust_DVSC_T/DV_SeriousCr_T 

*DV Arrests involving women victims. 
gen WDVArrest_DV_R = Arrest_DV_T/WomVic_DV_T 
gen WDVArrest_OV_R = Arrest_OV_DV_T/WomVic_DV_T 
gen WDVArrest_Sum_R = Arrest_Sum_DV_T/WomVic_DV_T 
gen WDVArrest_Cust_R = Arrest_Cust_DV_T/WomVic_DV_T
gen WDVArrest_V_R = Arrest_DVV_T/WomVic_DV_V_T 
gen WDVArrest_OVV_R = Arrest_OV_DVV_T/WomVic_DV_V_T
gen WDVArrest_SumDV_R = Arrest_Sum_DVV_T/WomVic_DV_V_T 
gen WDVArrest_CustDV_R = Arrest_Cust_DVV_T/WomVic_DV_V_T 
gen WDVArrest_DVSA_R = Arrest_DVSA_T/WomVic_DV_SA_T 
gen WDVArrest_OVSA_R = Arrest_OV_DVSA_T/WomVic_DV_SA_T 
gen WDVArrest_SumSA_R = Arrest_Sum_DVSA_T/WomVic_DV_SA_T 
gen WDVArrest_CustSA_R = Arrest_Cust_DVSA_T/WomVic_DV_SA_T 
gen WDVArrest_DVSI_R = Arrest_DVSI_T/WomVic_DV_SI_T 
gen WDVArrest_OVSI_R = Arrest_OV_DVSI_T/WomVic_DV_SI_T 
gen WDVArrest_SumSI_R = Arrest_Sum_DVSI_T/WomVic_DV_SI_T 
gen WDVArrest_CustSI_R = Arrest_Cust_DVSI_T/WomVic_DV_SI_T 
gen WDVArrest_DVSC_R = Arrest_DVSC_T/WomVic_DV_SC_T 
gen WDVArrest_OVSC_R = Arrest_OV_DVSC_T/WomVic_DV_SC_T 
gen WDVArrest_SumSC_R = Arrest_Sum_DVSC_T/WomVic_DV_SC_T 
gen WDVArrest_CustSC_R = Arrest_Cust_DVSC_T/WomVic_DV_SC_T 
gen BWDVArrest_DV_R = BWArrest_DV_T/B_WomVic_DV_T 
gen BWDVArrest_OV_R = BWArrest_OV_DV_T/B_WomVic_DV_T 
gen BWDVArrest_Sum_R = BWArrest_Sum_DV_T/B_WomVic_DV_T 
gen BWDVArrest_Cust_R = BWArrest_Cust_DV_T/B_WomVic_DV_T 
gen BWDVArrest_V_R = BWArrest_DVV_T/B_WomVic_DV_V_T 
gen BWDVArrest_OVV_R = BWArrest_OV_DVV_T/B_WomVic_DV_V_T 
gen BWDVArrest_SumV_R = BWArrest_Sum_DVV_T/B_WomVic_DV_V_T
gen BWDVArrest_CustV_R = BWArrest_Cust_DVV_T/B_WomVic_DV_V_T 
gen BWDVArrest_DVSA_R = BWArrest_DVSA_T/B_WomVic_DV_SA_T 
gen BWDVArrest_OVSA_R = BWArrest_OV_DVSA_T/B_WomVic_DV_SA_T 
gen BWDVArrest_SumSA_R = BWArrest_Sum_DVSA_T/B_WomVic_DV_SA_T 
gen BWDVArrest_CustSA_R = BWArrest_Cust_DVSA_T/B_WomVic_DV_SA_T 
gen BWDVArrest_DVSI_R = BWArrest_DVSI_T/B_WomVic_DV_SI_T 
gen BWDVArrest_OVSI_R = BWArrest_OV_DVSI_T/B_WomVic_DV_SI_T 
gen BWDVArrest_SumSI_R = BWArrest_Sum_DVSI_T/B_WomVic_DV_SI_T 
gen BWDVArrest_CustSI_R = BWArrest_Cust_DVSI_T/B_WomVic_DV_SI_T 
gen BWDVArrest_DVSC_R = BWArrest_DVSC_T/B_WomVic_DV_SC_T 
gen BWDVArrest_OVSC_R = BWArrest_OV_DVSC_T/B_WomVic_DV_SC_T
gen BWDVArrest_SumSC_R = BWArrest_Sum_DVSC_T/B_WomVic_DV_SC_T 
gen BWDVArrest_CustSC_R = BWArrest_Cust_DVSC_T/B_WomVic_DV_SC_T 
gen BNHDVArrest_DV_R = BNHWArrest_DV_T/BNH_WomVic_DV_T
gen BNHDVArrest_OV_R = BNHWArrest_OV_DV_T/BNH_WomVic_DV_T 
gen BNHDVArrest_Sum_R = BNHWArrest_Sum_DV_T/BNH_WomVic_DV_T 
gen BNHDVArrest_Cust_R = BNHWArrest_Cust_DV_T/BNH_WomVic_DV_T 
gen BNHDVARrest_V_R = BNHWArrest_DVV_T/BNH_WomVic_DV_V_T
gen BNHDVArrest_OVV_R = BNHWArrest_OV_DVV_T/BNH_WomVic_DV_V_T 
gen BNHDVArrest_SumV_R = BNHWArrest_Sum_DVV_T/BNH_WomVic_DV_V_T 
gen BNHDVArrest_CustV_R = BNHWArrest_Cust_DVV_T/BNH_WomVic_DV_V_T 
gen BNHDVArrest_DVSA_R = BNHWArrest_DVSA_T/BNH_WomVic_DV_SA_T 
gen BNHDVArrest_OVSA_R = BNHWArrest_OV_DVSA_T/BNH_WomVic_DV_SA_T 
gen BNHDVArrest_SumSA_R = BNHWArrest_Sum_DVSA_T/BNH_WomVic_DV_SA_T 
gen BNHDVArrest_CustSA_R = BNHWArrest_Cust_DVSA_T/BNH_WomVic_DV_SA_T 
gen BNHDVArrest_DVSI_R =BNHWArrest_DVSI_T/BNH_WomVic_DV_SI_T
gen BNHDVArrest_OVSI_R = BNHWArrest_OV_DVSI_T/BNH_WomVic_DV_SI_T
gen BNHDVArrest_SumSI_R = BNHWArrest_Sum_DVSI_T/BNH_WomVic_DV_SI_T 
gen BNHDVArrest_CustSI_R = BNHWArrest_Cust_DVSI_T/BNH_WomVic_DV_SI_T 
gen BNHDVArrest_DVSC_R = BNHWArrest_DVSC_T/BNH_WomVic_DV_SC_T 
gen BNHDVArrest_OVSC_R = BNHWArrest_OV_DVSC_T/BNH_WomVic_DV_SC_T 
gen BNHDVArrest_SumSC_R = BNHWArrest_Sum_DVSC_T/BNH_WomVic_DV_SC_T 
gen BNHDVArrest_CustSC_R = BNHWArrest_Cust_DVSC_T/BNH_WomVic_DV_SC_T 
gen WWDVArrest_DV_R = WWArrest_DV_T/W_WomVic_DV_T 
gen WWDVArrest_OV_R = WWArrest_OV_DV_T/W_WomVic_DV_T 
gen WWDVArrest_Sum_R = WWArrest_Sum_DV_T/W_WomVic_DV_T 
gen WWDVArrest_Cust_R = WWArrest_Cust_DV_T/W_WomVic_DV_T 
gen WWDVArrest_V_R = WWArrest_DVV_T/W_WomVic_DV_V_T 
gen WWDVArrest_OVV_R = WWArrest_OV_DVV_T/W_WomVic_DV_V_T 
gen WWDVArrest_SumV_R = WWArrest_Sum_DVV_T/W_WomVic_DV_V_T 
gen WWDVARrest_CustV_R = WWArrest_Cust_DVV_T/W_WomVic_DV_V_T 
gen WWDVArrest_DVSA_R = WWArrest_DVSA_T/W_WomVic_DV_SA_T 
gen WWDVArrest_OVSA_R = WWArrest_OV_DVSA_T/W_WomVic_DV_SA_T 
gen WWDVArrest_SumSA_R = WWArrest_Sum_DVSA_T/W_WomVic_DV_SA_T 
gen WWDVArrest_CustSA_R = WWArrest_Cust_DVSA_T/W_WomVic_DV_SA_T
gen WWDVArrest_DVSI_R = WWArrest_DVSI_T/W_WomVic_DV_SI_T 
gen WWDVArrest_OVSI_R = WWArrest_OV_DVSI_T/W_WomVic_DV_SI_T 
gen WWDVArrest_SumSI_R = WWArrest_Sum_DVSI_T/W_WomVic_DV_SI_T 
gen WWDVArrest_CustSI_R = WWArrest_Cust_DVSI_T/W_WomVic_DV_SI_T 
gen WWDVArrest_DVSC_R = WWArrest_DVSC_T/W_WomVic_DV_SC_T 
gen WWDVArrest_OVSC_R = WWArrest_OV_DVSC_T/W_WomVic_DV_SC_T  
gen WWDVArrest_SumSC_R = WWArrest_Sum_DVSC_T/W_WomVic_DV_SC_T
gen WWDVArrest_CustSC_R = WWArrest_Cust_DVSC_T/W_WomVic_DV_SC_T 
gen WNHDVArrest_DV_R = WNHWArrest_DV_T/WNH_WomVic_DV_T 
gen WNHDVArrest_OV_R = WNHWArrest_OV_DV_T/WNH_WomVic_DV_T 
gen WNHDVArrest_Sum_R = WNHWArrest_Sum_DV_T/WNH_WomVic_DV_T 
gen WNHDVArrest_Cust_R = WNHWArrest_Cust_DV_T/WNH_WomVic_DV_T 
gen WNHDVArrest_V_R = WNHWArrest_DVV_T/WNH_WomVic_DV_V_T 
gen WNHDVArrest_OVV_R = WNHWArrest_OV_DVV_T/WNH_WomVic_DV_V_T 
gen WNHDVArrest_SumV_R = WNHWArrest_Sum_DVV_T/WNH_WomVic_DV_V_T 
gen WNHDVArrest_CustV_R = WNHWArrest_Cust_DVV_T/WNH_WomVic_DV_V_T 
gen WNHDVArrest_DVSA_R = WNHWArrest_DVSA_T/WNH_WomVic_DV_SA_T 
gen WNHDVArrest_OVSA_R = WNHWArrest_OV_DVSA_T/WNH_WomVic_DV_SA_T 
gen WNHDVArrest_SumSA_R = WNHWArrest_Sum_DVSA_T/WNH_WomVic_DV_SA_T 
gen WNHDVArrest_CustSA_R = WNHWArrest_Cust_DVSA_T/WNH_WomVic_DV_SA_T 
gen WNHDVArrest_DVSI_R = WNHWArrest_DVSI_T/WNH_WomVic_DV_SI_T 
gen WNHDVArrest_OVSI_R = WNHWArrest_OV_DVSI_T/WNH_WomVic_DV_SI_T
gen WNHDVArrest_SumSI_R = WNHWArrest_Sum_DVSI_T/WNH_WomVic_DV_SI_T 
gen WNHDVArrest_CustSI_R = WNHWArrest_Cust_DVSI_T/WNH_WomVic_DV_SI_T 
gen WNHDVArrest_DVSC_R = WNHWArrest_DVSC_T/WNH_WomVic_DV_SC_T
gen WNHDVArrest_OVSC_R = WNHWArrest_OV_DVSC_T/WNH_WomVic_DV_SC_T
gen WNHDVArrest_SumSC_R = WNHWArrest_Sum_DVSC_T/WNH_WomVic_DV_SC_T 
gen WNHDVArrest_CustSC_R = WNHWArrest_Cust_DVSC_T/WNH_WomVic_DV_SC_T 
gen HWDVArrest_DV_R = HWArrest_DV_T/H_WomVic_DV_T  
gen HWDVArrest_OV_R = HWArrest_OV_DV_T/H_WomVic_DV_T  
gen HWDVArrest_Sum_R = HWArrest_Sum_DV_T/H_WomVic_DV_T  
gen HWDVArrest_Cust_R = HWArrest_Cust_DV_T/H_WomVic_DV_T  
gen HWDVArrest_V_R = HWArrest_DVV_T/H_WomVic_DV_V_T 
gen HWDVArrest_OVV_R = HWArrest_OV_DVV_T/H_WomVic_DV_V_T 
gen HWDVArrest_SumV_R = HWArrest_Sum_DVV_T/H_WomVic_DV_V_T
gen HWDVArrest_CustV_R = HWArrest_Cust_DVV_T/H_WomVic_DV_V_T
gen HWDVArrest_DVSA_R = HWArrest_DVSA_T/H_WomVic_DV_SA_T 
gen HWDVArrest_OVSA_R = HWArrest_OV_DVSA_T/H_WomVic_DV_SA_T 
gen HWDVArrest_SumSA_R = HWArrest_Sum_DVSA_T/H_WomVic_DV_SA_T 
gen HWDVArrest_CustSA_R = HWArrest_Cust_DVSA_T/H_WomVic_DV_SA_T
gen HWDVArrest_DVSI_R = HWArrest_DVSI_T/H_WomVic_DV_SI_T 
gen HWDVArrest_OVSI_R = HWArrest_OV_DVSI_T/H_WomVic_DV_SI_T 
gen HWDVArrest_SumSI_R = HWArrest_Sum_DVSI_T/H_WomVic_DV_SI_T
gen HWDVArrest_CustSI_R = HWArrest_Cust_DVSI_T/H_WomVic_DV_SI_T
gen HWDVArrest_DVSC_R = HWArrest_DVSC_T/H_WomVic_DV_SC_T 
gen HWDVArrest_OVSC_R = HWArrest_OV_DVSC_T/H_WomVic_DV_SC_T 
gen HWDVArrest_SumSC_R = HWArrest_Sum_DVSC_T/H_WomVic_DV_SC_T
gen HWDVArrest_CustSC_R = HWArrest_Cust_DVSC_T/H_WomVic_DV_SC_T


**LEOKA data setup

*If already a dta file, then can read in only the variables that are necessary. 
use V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 V20 V21 V22 V23 V24 using "directory and file name", clear

*Prepare for later merges

rename V7 ORI

sort ORI

**LEOKA 1997 and NIBRS 1998

gen FTSWORN = V16+V19
gen PctFemale = V19/FTSWORN  
drop if _merge == 1

gen viol = . 
replace viol = 1 if V4007 >= 111 & V4007 <= 133 
replace viol = 0 if V4007 < 111 | V4007 > 133

gen partner = . 
replace partner = 0 if V4032 < 1 | V4032 ==3 | V4032 ==4 | V4032 ==5 | V4032 ==6 | V4032 ==7 | V4032 ==8 | V4032 ==9 | V4032 ==10 | V4032 ==11 | V4032==12 | V4032 ==13 | V4032 ==14 | V4032 ==15 | V4032 ==16 | V4032 ==17 | V4032 ==19 | V4032 > 21
replace partner = 1 if V4032 == 1 | V4032 ==2 | V4032 ==18 | V4032 ==20 | V4032 ==21

gen IPV = .
replace IPV = 0 if viol == 0 | partner == 0
replace IPV = 1 if viol == 1 & partner == 1

gen FemVicIPV = . 
replace FemVicIPV = 0 if IPV == 0 | V4019 ==1
replace FemVicIPV = 1 if IPV ==1 & V4019 == 0

gen whiteNHWom = . 
replace whiteNHWom = 0 if V4019 == 1 | V4020 > 1 | V4021 ==1 | V4021 == .  
replace whiteNHWom = 1 if V4019 == 0 & V4020 == 1 & V4021 == 0 

gen blkNHWom  = . 
replace blkNHWom = 0 if V4019 == 1 | V4020 < 2 | V4020 > 2 | V4021 ==1 | V4021 == . 
replace blkNHWom = 1 if V4019 == 0 & V4020 == 2 & V4021 == 0 

gen HispWom = . 
replace HispWom = 0 if V4019 == 1 | V4021 == 0 | V4021 ==.
replace HispWom = 1 if V4019 == 0 & V4021 == 1

gen whiteNHWom_vic = . 
replace whiteNHWom_vic = 0 if whiteNHWom == 0 | IPV == 0
replace whiteNHWom_vic = 1 if whiteNHWom == 1 & IPV == 1

gen blkNHWom_vic = . 
replace blkNHWom_vic = 0 if blkNHWom == 0 | IPV == 0
replace blkNHWom_vic =1 if blkNHWom == 1 & IPV == 1

gen hispWom_vic = . 
replace hispWom_vic = 0 if HispWom == 0 | IPV == 0
replace hispWom_vic = 1 if HispWom == 1 & IPV ==1

**FOR MERGING THE POLICE DEMOGRAPHICS DATA WITH THE NIBRS CRIME DATA
use "/Volumes/Rachel's 2nd HD/DISSERTATION/POLICE PROJECT LITERATURE/DATA/FINAL_POLICE_1998_2014_ORI Sorted.dta", clear
merge 1:1 ORI YEAR using "/Volumes/Rachel's 2nd HD/DISSERTATION/POLICE PROJECT LITERATURE/DATA/FINAL_NIBRS_1996_2015.dta"
save "/Volumes/Rachel's 2nd HD/DISSERTATION/POLICE PROJECT LITERATURE/DATA/POLICE NIBRS MERGED DATASET_vFinal_v2.dta", replace
drop if _merge < 3
drop if TOT_EMP == 0 
drop SUBTYPE1 SUBTYPE2 GOVID
drop ADDRESS_NAME
drop ADDRESS_STR1
drop ADDRESS_STR2
drop REPORT_FLAG
drop CSLLEA_SUB
drop IDCODE

egen ORIb = group(ORI)
xtset ORIb YEAR


**Set the order of the variables
order FSTATE FCOUNTY FPLACE FIPS_ST FIPS_COUNTY FIPS ORI ORI7 NAME UA STATENAME COUNTYNAME UANAME AGCYTYPE GOVID CENSUSNAME 
CSLLEA08_ID LEMAS_ID U_STATENO U_CNTY LG_POPULATION STATE YEAR POP AGCYNAME MAL_OFCR MAL_CIV MAL_TTL FEM_OFCR FEM_CIV FEM_TTL 
TOT_EMP OFCR_RATE EMP_RATE Pct_Fem_Ofcr Pct_Fem_Civ Pct_Fem_Ttl FemOfcr PoliceTtl FemOfcrLevel B1007 B1008 B1009 B1010 B1011 
B1013 B2005 B2006 B2007 B3024 B3025 B3026 B3027 B3028 Arrest Arrest_OV Arrest_Sum Arrest_Cust ViolentCrime SexAsslt Simple_Int 
SeriousCr DV DV_Violent DV_SexAsslt DV_Simple_Int DV_SeriousCr WomVic H_WomVic B_WomVic W_WomVic BNH_WomVic WNH_WomVic AmIn_WomVic 
A_WomVic Pac_WomVic WomVic_DV H_WomVic_DV B_WomVic_DV BNH_WomVic_DV W_WomVic_DV WNH_WomVic_DV AmIn_WomVic_DV A_WomVic_DV Pac_WomVic_DV 
WomVic_DV_V H_WomVic_DV_V B_WomVic_DV_V BNH_WomVic_DV_V W_WomVic_DV_V WNH_WomVic_DV_V AmIn_WomVic_DV_V A_WomVic_DV_V Pac_WomVic_DV_V 
WomVic_DV_SA H_WomVic_DV_SA B_WomVic_DV_SA BNH_WomVic_DV_SA W_WomVic_DV_SA WNH_WomVic_DV_SA AmIn_WomVic_DV_SA A_WomVic_DV_SA Pac_WomVic_DV_SA 
WomVic_DV_SI H_WomVic_DV_SI B_WomVic_DV_SI BNH_WomVic_DV_SI W_WomVic_DV_SI WNH_WomVic_DV_SI AmIn_WomVic_DV_SI A_WomVic_DV_SI Pac_WomVic_DV_SI 
WomVic_DV_SC H_WomVic_DV_SC B_WomVic_DV_SC BNH_WomVic_DV_SC W_WomVic_DV_SC WNH_WomVic_DV_SC AmIn_WomVic_DV_SC A_WomVic_DV_SC Pac_WomVic_DV_SC 
TotArrest_DV TotArrest_OV_DV TotArrest_Sum_DV TotArrest_Cust_DV TotArrest_DVV TotArrest_OV_DVV TotArrest_Sum_DVV TotArrest_Cust_DVV 
TotArrest_DVSA TotArrest_OV_DVSA TotArrest_Sum_DVSA TotArrest_Cust_DVSA TotArrest_DVSI TotArrest_OV_DVSI TotArrest_Sum_DVSI 
TotArrest_Cust_DVSI TotArrest_DVSC TotArrest_OV_DVSC TotArrest_Sum_DVSC TotArrest_Cust_DVSC Arrest_DV Arrest_OV_DV Arrest_Sum_DV 
Arrest_Cust_DV Arrest_DVV Arrest_OV_DVV Arrest_Sum_DVV Arrest_Cust_DVV Arrest_DVSA Arrest_OV_DVSA Arrest_Sum_DVSA Arrest_Cust_DVSA 
Arrest_DVSI Arrest_OV_DVSI Arrest_Sum_DVSI Arrest_Cust_DVSI Arrest_DVSC Arrest_OV_DVSC Arrest_Sum_DVSC Arrest_Cust_DVSC HWArrest_DV 
HWArrest_OV_DV HWArrest_Sum_DV HWArrest_Cust_DV HWArrest_DVV HWArrest_OV_DVV HWArrest_Sum_DVV HWArrest_Cust_DVV HWArrest_DVSA 
HWArrest_OV_DVSA HWArrest_Sum_DVSA HWArrest_Cust_DVSA HWArrest_DVSI HWArrest_OV_DVSI HWArrest_Sum_DVSI HWArrest_Cust_DVSI 
HWArrest_DVSC HWArrest_OV_DVSC HWArrest_Sum_DVSC HWArrest_Cust_DVSC BWArrest_DV BWArrest_OV_DV BWArrest_Sum_DV BWArrest_Cust_DV 
BWArrest_DVV BWArrest_OV_DVV BWArrest_Sum_DVV BWArrest_Cust_DVV BWArrest_DVSA BWArrest_OV_DVSA BWArrest_Sum_DVSA BWArrest_Cust_DVSA 
BWArrest_DVSI BWArrest_OV_DVSI BWArrest_Sum_DVSI BWArrest_Cust_DVSI BWArrest_DVSC BWArrest_OV_DVSC BWArrest_Sum_DVSC BWArrest_Cust_DVSC 
BNHWArrest_DV BNHWArrest_OV_DV BNHWArrest_Sum_DV BNHWArrest_Cust_DV BNHWArrest_DVV BNHWArrest_OV_DVV BNHWArrest_Sum_DVV BNHWArrest_Cust_DVV 
BNHWArrest_DVSA BNHWArrest_OV_DVSA BNHWArrest_Sum_DVSA BNHWArrest_Cust_DVSA BNHWArrest_DVSI BNHWArrest_OV_DVSI BNHWArrest_Sum_DVSI 
BNHWArrest_Cust_DVSI BNHWArrest_DVSC BNHWArrest_OV_DVSC BNHWArrest_Sum_DVSC BNHWArrest_Cust_DVSC WWArrest_DV WWArrest_OV_DV 
WWArrest_Sum_DV WWArrest_Cust_DV WWArrest_DVV WWArrest_OV_DVV WWArrest_Sum_DVV WWArrest_Cust_DVV WWArrest_DVSA WWArrest_OV_DVSA 
WWArrest_Sum_DVSA WWArrest_Cust_DVSA WWArrest_DVSI WWArrest_OV_DVSI WWArrest_Sum_DVSI WWArrest_Cust_DVSI WWArrest_DVSC WWArrest_OV_DVSC 
WWArrest_Sum_DVSC WWArrest_Cust_DVSC WNHWArrest_DV WNHWArrest_OV_DV WNHWArrest_Sum_DV WNHWArrest_Cust_DV WNHWArrest_DVV WNHWArrest_OV_DVV 
WNHWArrest_Sum_DVV WNHWArrest_Cust_DVV WNHWArrest_DVSA WNHWArrest_OV_DVSA WNHWArrest_Sum_DVSA WNHWArrest_Cust_DVSA WNHWArrest_DVSI 
WNHWArrest_OV_DVSI WNHWArrest_Sum_DVSI WNHWArrest_Cust_DVSI WNHWArrest_DVSC WNHWArrest_OV_DVSC WNHWArrest_Sum_DVSC WNHWArrest_Cust_DVSC 
Injury Armed TotArrest_DV_T TotArrest_OV_DV_T TotArrest_Cust_DV_T TotArrest_DVV_T TotArrest_OV_DVV_T TotArrest_Sum_DVV_T 
TotArrest_Cust_DVV_T TotArrest_DVSA_T TotArrest_OV_DVSA_T TotArrest_Sum_DVSA_T TotArrest_Cust_DVSA_T TotArrest_DVSI_T TotArrest_OV_DVSI_T 
TotArrest_Sum_DVSI_T TotArrest_Cust_DVSI_T TotArrest_DVSC_T TotArrest_OV_DVSC_T TotArrest_Sum_DVSC_T TotArrest_Cust_DVSC_T DV_T 
DV_Violent_T DV_SexAsslt_T DV_Simple_Int_T DV_SeriousCr_T WomVic_DV_T H_WomVic_DV_T B_WomVic_DV_T BNH_WomVic_DV_T W_WomVic_DV_T 
WNH_WomVic_DV_T AmIn_WomVic_DV_T A_WomVic_DV_T Pac_WomVic_DV_T WomVic_DV_V_T H_WomVic_DV_V_T B_WomVic_DV_V_T BNH_WomVic_DV_V_T 
W_WomVic_DV_V_T WNH_WomVic_DV_V_T AmIn_WomVic_DV_V_T A_WomVic_DV_V_T Pac_WomVic_DV_V_T WomVic_DV_SA_T H_WomVic_DV_SA_T B_WomVic_DV_SA_T 
BNH_WomVic_DV_SA_T W_WomVic_DV_SA_T WNH_WomVic_DV_SA_T AmIn_WomVic_DV_SA_T A_WomVic_DV_SA_T Pac_WomVic_DV_SA_T WomVic_DV_SI_T 
H_WomVic_DV_SI_T B_WomVic_DV_SI_T BNH_WomVic_DV_SI_T W_WomVic_DV_SI_T WNH_WomVic_DV_SI_T AmIn_WomVic_DV_SI_T A_WomVic_DV_SI_T 
Pac_WomVic_DV_SI_T WomVic_DV_SC_T H_WomVic_DV_SC_T B_WomVic_DV_SC_T BNH_WomVic_DV_SC_T W_WomVic_DV_SC_T WNH_WomVic_DV_SC_T AmIn_WomVic_DV_SC_T 
A_WomVic_DV_SC_T Pac_WomVic_DV_SC_T Arrest_DV_T Arrest_OV_DV_T Arrest_Sum_DV_T Arrest_Cust_DV_T Arrest_DVV_T Arrest_OV_DVV_T 
Arrest_Sum_DVV_T Arrest_Cust_DVV_T Arrest_DVSA_T Arrest_OV_DVSA_T Arrest_Sum_DVSA_T Arrest_Cust_DVSA_T Arrest_DVSI_T Arrest_OV_DVSI_T 
Arrest_Sum_DVSI_T Arrest_Cust_DVSI_T Arrest_DVSC_T Arrest_OV_DVSC_T Arrest_Sum_DVSC_T Arrest_Cust_DVSC_T BWArrest_DV_T BWArrest_OV_DV_T 
BWArrest_Sum_DV_T BWArrest_Cust_DV_T BWArrest_DVV_T BWArrest_OV_DVV_T BWArrest_Sum_DVV_T BWArrest_Cust_DVV_T BWArrest_DVSA_T 
BWArrest_OV_DVSA_T BWArrest_Sum_DVSA_T BWArrest_Cust_DVSA_T BWArrest_DVSI_T BWArrest_OV_DVSI_T BWArrest_Sum_DVSI_T BWArrest_Cust_DVSI_T 
BWArrest_DVSC_T BWArrest_OV_DVSC_T BWArrest_Sum_DVSC_T BWArrest_Cust_DVSC_T BNHWArrest_DV_T BNHWArrest_OV_DV_T BNHWArrest_Sum_DV_T 
BNHWArrest_Cust_DV_T BNHWArrest_DVV_T BNHWArrest_OV_DVV_T BNHWArrest_Sum_DVV_T BNHWArrest_Cust_DVV_T BNHWArrest_DVSA_T BNHWArrest_OV_DVSA_T 
BNHWArrest_Sum_DVSA_T BNHWArrest_Cust_DVSA_T BNHWArrest_DVSI_T BNHWArrest_OV_DVSI_T BNHWArrest_Sum_DVSI_T BNHWArrest_Cust_DVSI_T 
BNHWArrest_DVSC_T BNHWArrest_OV_DVSC_T BNHWArrest_Sum_DVSC_T BNHWArrest_Cust_DVSC_T WWArrest_DV_T WWArrest_OV_DV_T WWArrest_Sum_DV_T 
WWArrest_Cust_DV_T WWArrest_DVV_T WWArrest_OV_DVV_T WWArrest_Sum_DVV_T WWArrest_Cust_DVV_T WWArrest_DVSA_T WWArrest_OV_DVSA_T 
WWArrest_Sum_DVSA_T WWArrest_Cust_DVSA_T WWArrest_DVSI_T WWArrest_OV_DVSI_T WWArrest_Sum_DVSI_T WWArrest_Cust_DVSI_T WWArrest_DVSC_T 
WWArrest_OV_DVSC_T WWArrest_Sum_DVSC_T WWArrest_Cust_DVSC_T WNHWArrest_DV_T WNHWArrest_OV_DV_T WNHWArrest_Sum_DV_T WNHWArrest_Cust_DV_T 
WNHWArrest_DVV_T WNHWArrest_OV_DVV_T WNHWArrest_Sum_DVV_T WNHWArrest_Cust_DVV_T WNHWArrest_DVSA_T WNHWArrest_OV_DVSA_T WNHWArrest_Sum_DVSA_T 
WNHWArrest_Cust_DVSA_T WNHWArrest_DVSI_T WNHWArrest_OV_DVSI_T WNHWArrest_Sum_DVSI_T WNHWArrest_Cust_DVSI_T WNHWArrest_DVSC_T 
WNHWArrest_OV_DVSC_T WNHWArrest_Sum_DVSC_T WNHWArrest_Cust_DVSC_T HWArrest_DV_T HWArrest_OV_DV_T HWArrest_Sum_DV_T HWArrest_Cust_DV_T 
HWArrest_DVV_T HWArrest_OV_DVV_T HWArrest_Sum_DVV_T HWArrest_Cust_DVV_T HWArrest_DVSA_T HWArrest_OV_DVSA_T HWArrest_Sum_DVSA_T 
HWArrest_Cust_DVSA_T HWArrest_DVSI_T HWArrest_OV_DVSI_T HWArrest_Sum_DVSI_T HWArrest_Cust_DVSI_T HWArrest_DVSC_T HWArrest_OV_DVSC_T 
HWArrest_Sum_DVSC_T HWArrest_Cust_DVSC_T ViolentCrimeRate DVArrest_R DVArrest_OV_R DVArrest_Cust_R DVArrest_V_R DVArrest_OVV_R 
DVArrest_SumV_R DVArrest_CustV_R DVArrest_DVSA_R DVArrest_OVSA_R DVArrest_SumSA_R DVArrest_CustSA_R DVArrest_DVSI_R DVArrest_OVSI_R 
DVArrest_SumSI_R DVArrest_CustSI_R DVArrest_DVSC_R DVArrest_OVSC_R DVArrest_SumSC_R DVArrest_CustSC_R WDVArrest_DV_R WDVArrest_OV_R 
WDVArrest_Sum_R WDVArrest_Cust_R WDVArrest_V_R WDVArrest_OVV_R WDVArrest_SumDV_R WDVArrest_CustDV_R WDVArrest_DVSA_R WDVArrest_OVSA_R 
WDVArrest_SumSA_R WDVArrest_CustSA_R WDVArrest_DVSI_R WDVArrest_OVSI_R WDVArrest_SumSI_R WDVArrest_CustSI_R WDVArrest_DVSC_R 
WDVArrest_OVSC_R WDVArrest_SumSC_R WDVArrest_CustSC_R BWDVArrest_DV_R BWDVArrest_OV_R BWDVArrest_Sum_R BWDVArrest_Cust_R BWDVArrest_V_R 
BWDVArrest_OVV_R BWDVArrest_SumV_R BWDVArrest_CustV_R BWDVArrest_DVSA_R BWDVArrest_OVSA_R BWDVArrest_SumSA_R BWDVArrest_CustSA_R 
BWDVArrest_DVSI_R BWDVArrest_OVSI_R BWDVArrest_SumSI_R BWDVArrest_CustSI_R BWDVArrest_DVSC_R BWDVArrest_OVSC_R BWDVArrest_SumSC_R 
BWDVArrest_CustSC_R BNHDVArrest_DV_R BNHDVArrest_OV_R BNHDVArrest_Sum_R BNHDVArrest_Cust_R BNHDVARrest_V_R BNHDVArrest_OVV_R 
BNHDVArrest_SumV_R BNHDVArrest_CustV_R BNHDVArrest_DVSA_R BNHDVArrest_OVSA_R BNHDVArrest_SumSA_R BNHDVArrest_CustSA_R BNHDVArrest_DVSI_R 
BNHDVArrest_OVSI_R BNHDVArrest_SumSI_R BNHDVArrest_CustSI_R BNHDVArrest_DVSC_R BNHDVArrest_OVSC_R BNHDVArrest_SumSC_R BNHDVArrest_CustSC_R 
WWDVArrest_DV_R WWDVArrest_OV_R WWDVArrest_Sum_R WWDVArrest_Cust_R WWDVArrest_V_R WWDVArrest_OVV_R WWDVArrest_SumV_R WWDVARrest_CustV_R 
WWDVArrest_DVSA_R WWDVArrest_OVSA_R WWDVArrest_SumSA_R WWDVArrest_CustSA_R WWDVArrest_DVSI_R WWDVArrest_OVSI_R WWDVArrest_SumSI_R 
WWDVArrest_CustSI_R WWDVArrest_DVSC_R WWDVArrest_OVSC_R WWDVArrest_SumSC_R WWDVArrest_CustSC_R WNHDVArrest_DV_R WNHDVArrest_OV_R 
WNHDVArrest_Sum_R WNHDVArrest_Cust_R WNHDVArrest_V_R WNHDVArrest_OVV_R WNHDVArrest_SumV_R WNHDVArrest_CustV_R WNHDVArrest_DVSA_R 
WNHDVArrest_OVSA_R WNHDVArrest_SumSA_R WNHDVArrest_CustSA_R WNHDVArrest_DVSI_R WNHDVArrest_OVSI_R WNHDVArrest_SumSI_R WNHDVArrest_CustSI_R 
WNHDVArrest_DVSC_R WNHDVArrest_OVSC_R WNHDVArrest_SumSC_R WNHDVArrest_CustSC_R HWDVArrest_DV_R HWDVArrest_OV_R HWDVArrest_Sum_R 
HWDVArrest_Cust_R HWDVArrest_V_R HWDVArrest_OVV_R HWDVArrest_SumV_R HWDVArrest_CustV_R HWDVArrest_DVSA_R HWDVArrest_OVSA_R 
HWDVArrest_SumSA_R HWDVArrest_CustSA_R HWDVArrest_DVSI_R HWDVArrest_OVSI_R HWDVArrest_SumSI_R HWDVArrest_CustSI_R HWDVArrest_DVSC_R 
HWDVArrest_OVSC_R 


**Generate the alternative measure of gender diversity within police agencies, the Blau Index.    
**where k is gender and p is the proportion of each group (k) squared. 

gen PropWom_Ofcr = [(FEM_OFCR/Ttl_Ofcr)*(FEM_OFCR/Ttl_Ofcr)]
gen PropMen_Ofcr = [(MAL_OFCR/Ttl_Ofcr)*(MAL_OFCR/Ttl_Ofcr)]
gen Ttl_Prop = PropWom_Ofcr + PropMen_Ofcr
gen Blau = 1-Ttl_Prop


**Hausman Test for Fixed or Random Effects
xtreg y x1, fe
estimates store fixed
xtreg y x1, re
estimates store random
hausman fixed random

*Plotting the quadratic of a predictor variable after you've run a regression with that variable
twoway qfit WNHDVArrest_DV_R Pct_Fem_Ofcr if e(sample)

*Plotting the correlation matrix
graph matrix csatexpense percent income high college, half maxis(ylabel(none) xlabel(none))

pwcorr WDVArrest_DV_R WNHDVArrest_DV_R BNHDVArrest_DV_R HWDVArrest_DV_R l.Pct_Fem_Ofcr l.Blau l.ViolentCrimeRate l.Ofcr_PC, sig star(.05)


**Summary statistics
estpost summarize LG_POPULATION Ttl_Ofcr Ofcr_PC Pct_Fem_Civ Pct_Fem_Ofcr Blau ViolentCrimeRate DVArrest_R WDVArrest_DV_R WNHDVArrest_DV_R BNHDVArrest_DV_R HWDVArrest_DV_R 
esttab, cells("count mean sd min max") nomtitle nonumber noobs varlabels(`e(labels)') varwidth(20)

estpost correlate Pct_Fem_Ofcr Blau ViolentCrimeRate DVArrest_R WDVArrest_DV_R WNHDVArrest_DV_R BNHDVArrest_DV_R HWDVArrest_DV_R, matrix listwise
esttab, unstack not noobs compress


**Looks like I landed on using areg for the R-squared and Adjusted R-Squared values. See here for the difference
**between xtreg and areg: https://economics.mit.edu/faculty/acemoglu/data/aj2007 and 
**here: https://www.stata.com/support/faqs/statistics/areg-versus-xtreg-fe/

xtset ORIb YEAR

areg DVArrest_R PropWom_Ofcr Police_PC, absorb(ORIb) robust
areg WDVArrest_DV_R PropWom_Ofcr Police_PC, absorb(ORIb) robust
areg WNHDVArrest_R PropWom_Ofcr Police_PC, absorb(ORIb) robust
areg BNHDVArrest_R PropWom_Ofcr Police_PC, absorb(ORIb) robust
areg HWDVArrest_R PropWom_Ofcr Police_PC, absorb(ORIb) robust

**I think I messed up when I was created the PctFemSq variable...it appears to be the same as the proportion of women
**variable. Need to reconstruct this. 

**Another error: Not sure what the problem is, but when I go back and re-run the do file, the arrest rate data get correct. More specifically,
**the arrest rates for on-view versus taken into custody add up (as they should) to the total arrest rate. 


**To calculate the tipping point
nlcom-_b[PropWom_Ofcr]/(2*_b[PropWomsq])

**To eliminate duplicates in an programmatic way...below is just an example.
sort YEAR ORI
quietly by YEAR ORI:  gen dup = cond(_N==1,0,_n)
tabulate dup 
drop if dup>1

