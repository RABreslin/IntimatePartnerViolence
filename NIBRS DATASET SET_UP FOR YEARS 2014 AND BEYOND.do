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
gen Arrest= . 
replace Arrest = 1 if V60091 == 1 | V60091 == 3
replace Arrest = 0 if V60091 == 2


*Arrests "on view"; On-View Arrest - taken into custody without a warrant or previous incident report
gen Arrest_OV = .
replace Arrest_OV = 1 if V60091 == 1
replace Arrest_OV = 0 if V60091 >=2

*Summons or citations only; not taken into custody
gen Arrest_Sum = .
replace Arrest_Sum = 1 if V60091==2
replace Arrest_Sum = 0 if V60091 == 1 | V60091 ==3

*Taken into custody; Taken into Custody - based on warrant and/or previously submitted incident report
gen Arrest_Cust = .
replace Arrest_Cust = 1 if V60091 == 3
replace Arrest_Cust = 0 if V60091 == 1 | V60091 == 2


*Violent Crimes here are defined according to the FBI and are limited to four crimes: 1) Murder and Nonnegligent Manslaughter; 2) Rape; 3) Robbery; and, 4) Aggravated assault
gen ViolentCrime = . 

replace ViolentCrime = 1 if V4007 ==91 | V4007 ==111 | V4007 ==131 | V4007 == 120 
replace ViolentCrime = 0 if V4007 ==92 | V4007 ==93| V4007 ==100 | V4007 == 112 | V4007 == 113 | V4007 == 114 | V4007 >= 132

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
gen SexAsslt = .
replace SexAsslt = 1 if V4007 == 113 | V4007 == 111 | V4007 == 112 | V4007 == 114 | V4007 == 362
replace SexAsslt = 0 if V4007 >= 91 & V4007 < 111
replace SexAsslt = 0 if V4007 >114 & V4007 < 362
replace SexAsslt = 0 if V4007 >=370

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
gen Simple_Int = .
replace Simple_Int = 1 if V4007 == 132 | V4007 == 133
replace Simple_Int = 0 if V4007 >= 91 & V4007 < 132
replace Simple_Int = 0 if V4007 >=200

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
gen SeriousCr = . 
replace SeriousCr = 1 if ViolentCrime == 1 | SexAsslt == 1 | Simple_Int == 1.
replace SeriousCr = 0 if ViolentCrime == 0 & SexAsslt == 0 & Simple_Int ==0

**Relationship of victim to offender defines the crime as a domestic violence (which encompasses intimate partner violence)
gen DV = . 
replace DV = 1 if V4032 == 1 | V4032 == 2 | V4032 == 18 | V4032 == 20 | V4032 == 21
replace DV = 0 if V4032 == 0 
replace DV = 0 if V4032 >= 3 & V4032 < 18
replace DV = 0 if V4032 == 19
replace DV = 0 if V4032 >= 22

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
gen DV_Violent = . 
replace DV_Violent = 1 if DV ==1 & ViolentCrime == 1
replace DV_Violent = 0 if DV == 0 | ViolentCrime == 0


gen DV_SexAsslt = . 
replace DV_SexAsslt = 1 if DV == 1 & SexAsslt == 1
replace DV_SexAsslt = 0 if DV == 0 | SexAsslt == 0


gen DV_Simple_Int = .
replace DV_Simple_Int = 1 if DV == 1 & Simple_Int == 1
replace DV_Simple_Int = 0 if DV == 0 | Simple_Int == 0


gen DV_SeriousCr = .   
replace DV_SeriousCr = 1 if DV == 1 & SeriousCr ==1 
replace DV_SeriousCr = 0 if DV == 0 | SeriousCr ==0


*Sex & Race of Victim of crime. 
gen WomVic = .
replace WomVic = 1 if V4019 == 0
replace WomVic = 0 if V4019 ==1

gen H_WomVic = . 
replace H_WomVic = 1 if V4021 == 1 & V4019 == 0
replace H_WomVic = 0 if V4021 == 0 | V4019 == 1 

gen B_WomVic = .
replace B_WomVic = 1 if V4020 == 2 & V4019 == 0 
replace B_WomVic = 0 if V4020 == 1 | V4020 >= 3 | V4019 == 1 

gen W_WomVic = .
replace W_WomVic = 1 if V4020 == 1 & V4019 == 0 
replace W_WomVic = 0 if V4020 >= 2 | V4019 == 1 

*NonHispanic Black
gen BNH_WomVic = .
replace BNH_WomVic = 1 if V4020 == 2 & V4019 == 0 & V4021 == 0 
replace BNH_WomVic = 0 if V4020 == 1 | V4020 >= 3 | V4021 == 1


*NonHispanic White woman victim
gen WNH_WomVic = .
replace WNH_WomVic = 1 if V4020 == 1 & V4019 == 0 & V4021 == 0
replace WNH_WomVic = 0 if V4020 >= 2 | V4019 == 1 | V4021 == 1


gen AmIn_WomVic = .
replace AmIn_WomVic = 1 if V4020 == 3 & V4019 == 0 
replace AmIn_WomVic = 0 if V4020 == 1 | V4020 == 2 | V4020 >= 4 | V4019 == 1 

gen A_WomVic = .
replace A_WomVic = 1 if V4020 == 4 & V4019 == 0 
replace A_WomVic = 0 if V4020 == 1 | V4020 == 2 | V4020 == 3 | V4020 == 5 | V4019 == 1 

gen Pac_WomVic = .
replace Pac_WomVic = 1 if V4020 == 5 & V4019 == 0 
replace Pac_WomVic = 0 if V4020 == 1 | V4020 == 2 | V4020 == 3 | V4020 == 4 | V4019 == 1 
 

 *Generates women victims of DV, by race/ethnicity, and then by specific crime types
gen WomVic_DV = .
replace WomVic_DV = 1 if WomVic == 1 & DV == 1
replace WomVic_DV = 0 if WomVic == 0 | DV == 0
 
gen H_WomVic_DV = . 
replace H_WomVic_DV = 1 if H_WomVic == 1 & DV == 1
replace H_WomVic_DV = 0 if H_WomVic ==0 | DV == 0

gen B_WomVic_DV = . 
replace B_WomVic_DV = 1 if B_WomVic == 1 & DV == 1
replace B_WomVic_DV  = 0 if B_WomVic ==0 | DV == 0

gen BNH_WomVic_DV = . 
replace BNH_WomVic_DV = 1 if BNH_WomVic == 1 & DV == 1
replace BNH_WomVic_DV = 0 if BNH_WomVic == 0 | DV == 0

gen W_WomVic_DV = . 
replace W_WomVic_DV = 1 if W_WomVic == 1 & DV == 1
replace W_WomVic_DV = 0 if W_WomVic ==0 | DV == 0 

gen WNH_WomVic_DV = . 
replace WNH_WomVic_DV = 1 if WNH_WomVic == 1 & DV == 1
replace WNH_WomVic_DV = 0 if WNH_WomVic == 0 | DV == 0

gen AmIn_WomVic_DV = . 
replace AmIn_WomVic_DV = 1 if AmIn_WomVic == 1 & DV == 1
replace AmIn_WomVic_DV = 0 if AmIn_WomVic == 0 | DV == 0

gen A_WomVic_DV = .
replace A_WomVic_DV = 1 if A_WomVic == 1 & DV == 1
replace A_WomVic_DV = 0 if A_WomVic == 0 | DV == 0

gen Pac_WomVic_DV = . 
replace Pac_WomVic_DV = 1 if Pac_WomVic == 1 & DV == 1
replace Pac_WomVic_DV = 0 if Pac_WomVic ==0  | DV == 0
 
 
gen WomVic_DV_V = .
replace WomVic_DV_V = 1 if WomVic == 1 & DV_Violent == 1
replace WomVic_DV_V = 0 if WomVic == 0 | DV_Violent == 0
 
gen H_WomVic_DV_V = . 
replace H_WomVic_DV_V = 1 if H_WomVic == 1 & DV_Violent == 1
replace H_WomVic_DV_V = 0 if H_WomVic ==0 | DV_Violent == 0

gen B_WomVic_DV_V = . 
replace B_WomVic_DV_V = 1 if B_WomVic == 1 & DV_Violent == 1
replace B_WomVic_DV_V  = 0 if B_WomVic ==0 | DV_Violent == 0

gen BNH_WomVic_DV_V = . 
replace BNH_WomVic_DV_V = 1 if BNH_WomVic == 1 & DV_Violent == 1
replace BNH_WomVic_DV_V = 0 if BNH_WomVic == 0 | DV_Violent == 0

gen W_WomVic_DV_V = . 
replace W_WomVic_DV_V = 1 if W_WomVic == 1 & DV_Violent == 1
replace W_WomVic_DV_V = 0 if W_WomVic ==0 | DV_Violent == 0 

gen WNH_WomVic_DV_V = . 
replace WNH_WomVic_DV_V = 1 if WNH_WomVic == 1 & DV_Violent == 1
replace WNH_WomVic_DV_V = 0 if WNH_WomVic == 0 | DV_Violent == 0

gen AmIn_WomVic_DV_V = . 
replace AmIn_WomVic_DV_V = 1 if AmIn_WomVic == 1 & DV_Violent == 1
replace AmIn_WomVic_DV_V = 0 if AmIn_WomVic == 0 | DV_Violent == 0

gen A_WomVic_DV_V = .
replace A_WomVic_DV_V = 1 if A_WomVic == 1 & DV_Violent == 1
replace A_WomVic_DV_V = 0 if A_WomVic == 0 | DV_Violent == 0

gen Pac_WomVic_DV_V = . 
replace Pac_WomVic_DV_V = 1 if Pac_WomVic == 1 & DV_Violent == 1
replace Pac_WomVic_DV_V = 0 if Pac_WomVic ==0  | DV_Violent == 0



gen WomVic_DV_SA = .
replace WomVic_DV_SA = 1 if WomVic == 1 & DV_SexAsslt == 1
replace WomVic_DV_SA = 0 if WomVic == 0 | DV_SexAsslt == 0
 
gen H_WomVic_DV_SA = . 
replace H_WomVic_DV_SA = 1 if H_WomVic == 1 & DV_SexAsslt == 1
replace H_WomVic_DV_SA = 0 if H_WomVic ==0 | DV_SexAsslt == 0

gen B_WomVic_DV_SA = . 
replace B_WomVic_DV_SA = 1 if B_WomVic == 1 & DV_SexAsslt == 1
replace B_WomVic_DV_SA  = 0 if B_WomVic ==0 | DV_SexAsslt == 0

gen BNH_WomVic_DV_SA = . 
replace BNH_WomVic_DV_SA = 1 if BNH_WomVic == 1 & DV_SexAsslt == 1
replace BNH_WomVic_DV_SA = 0 if BNH_WomVic == 0 | DV_SexAsslt == 0

gen W_WomVic_DV_SA = . 
replace W_WomVic_DV_SA = 1 if W_WomVic == 1 & DV_SexAsslt == 1
replace W_WomVic_DV_SA = 0 if W_WomVic ==0 | DV_SexAsslt == 0 


gen WNH_WomVic_DV_SA = . 
replace WNH_WomVic_DV_SA = 1 if WNH_WomVic == 1 & DV_SexAsslt == 1
replace WNH_WomVic_DV_SA = 0 if WNH_WomVic == 0 | DV_SexAsslt == 0

gen AmIn_WomVic_DV_SA = . 
replace AmIn_WomVic_DV_SA = 1 if AmIn_WomVic == 1 & DV_SexAsslt == 1
replace AmIn_WomVic_DV_SA = 0 if AmIn_WomVic == 0 | DV_SexAsslt == 0

gen A_WomVic_DV_SA = .
replace A_WomVic_DV_SA = 1 if A_WomVic == 1 & DV_SexAsslt == 1
replace A_WomVic_DV_SA = 0 if A_WomVic == 0 | DV_SexAsslt == 0

gen Pac_WomVic_DV_SA = . 
replace Pac_WomVic_DV_SA = 1 if Pac_WomVic == 1 & DV_SexAsslt == 1
replace Pac_WomVic_DV_SA = 0 if Pac_WomVic ==0 | DV_SexAsslt == 0



gen WomVic_DV_SI = .
replace WomVic_DV_SI = 1 if WomVic == 1 & DV_Simple_Int == 1
replace WomVic_DV_SI = 0 if WomVic == 0 | DV_Simple_Int == 0
 
gen H_WomVic_DV_SI = . 
replace H_WomVic_DV_SI = 1 if H_WomVic == 1 & DV_Simple_Int == 1
replace H_WomVic_DV_SI = 0 if H_WomVic ==0 | DV_Simple_Int == 0

gen B_WomVic_DV_SI = . 
replace B_WomVic_DV_SI = 1 if B_WomVic == 1 & DV_Simple_Int == 1
replace B_WomVic_DV_SI  = 0 if B_WomVic ==0 | DV_Simple_Int == 0

gen BNH_WomVic_DV_SI = . 
replace BNH_WomVic_DV_SI = 1 if BNH_WomVic == 1 & DV_Simple_Int == 1
replace BNH_WomVic_DV_SI = 0 if BNH_WomVic == 0 | DV_Simple_Int == 0

gen W_WomVic_DV_SI = . 
replace W_WomVic_DV_SI = 1 if W_WomVic == 1 & DV_Simple_Int == 1
replace W_WomVic_DV_SI = 0 if W_WomVic ==0 | DV_Simple_Int == 0 


gen WNH_WomVic_DV_SI = . 
replace WNH_WomVic_DV_SI = 1 if WNH_WomVic == 1 & DV_Simple_Int == 1
replace WNH_WomVic_DV_SI = 0 if WNH_WomVic == 0 | DV_Simple_Int == 0

gen AmIn_WomVic_DV_SI = . 
replace AmIn_WomVic_DV_SI = 1 if AmIn_WomVic == 1 & DV_Simple_Int == 1
replace AmIn_WomVic_DV_SI = 0 if AmIn_WomVic == 0 | DV_Simple_Int == 0

gen A_WomVic_DV_SI = .
replace A_WomVic_DV_SI = 1 if A_WomVic == 1 & DV_Simple_Int == 1
replace A_WomVic_DV_SI = 0 if A_WomVic == 0 | DV_Simple_Int == 0

gen Pac_WomVic_DV_SI = . 
replace Pac_WomVic_DV_SI = 1 if Pac_WomVic == 1 & DV_Simple_Int == 1
replace Pac_WomVic_DV_SI = 0 if Pac_WomVic ==0 | DV_Simple_Int == 0



gen WomVic_DV_SC = .
replace WomVic_DV_SC = 1 if WomVic == 1 & DV_SeriousCr == 1
replace WomVic_DV_SC = 0 if WomVic == 0 | DV_SeriousCr == 0
 
gen H_WomVic_DV_SC = . 
replace H_WomVic_DV_SC = 1 if H_WomVic == 1 & DV_SeriousCr == 1
replace H_WomVic_DV_SC = 0 if H_WomVic ==0 | DV_SeriousCr == 0

gen B_WomVic_DV_SC = . 
replace B_WomVic_DV_SC = 1 if B_WomVic == 1 & DV_SeriousCr == 1
replace B_WomVic_DV_SC  = 0 if B_WomVic ==0 | DV_SeriousCr == 0

gen BNH_WomVic_DV_SC = . 
replace BNH_WomVic_DV_SC = 1 if BNH_WomVic == 1 & DV_SeriousCr == 1
replace BNH_WomVic_DV_SC = 0 if BNH_WomVic == 0 | DV_SeriousCr == 0

gen W_WomVic_DV_SC = . 
replace W_WomVic_DV_SC = 1 if W_WomVic == 1 & DV_SeriousCr == 1
replace W_WomVic_DV_SC = 0 if W_WomVic ==0 | DV_SeriousCr == 0 

gen WNH_WomVic_DV_SC = . 
replace WNH_WomVic_DV_SC = 1 if WNH_WomVic == 1 & DV_SeriousCr == 1
replace WNH_WomVic_DV_SC = 0 if WNH_WomVic == 0 | DV_SeriousCr == 0

gen AmIn_WomVic_DV_SC = . 
replace AmIn_WomVic_DV_SC = 1 if AmIn_WomVic == 1 & DV_SeriousCr == 1
replace AmIn_WomVic_DV_SC = 0 if AmIn_WomVic == 0 | DV_SeriousCr == 0

gen A_WomVic_DV_SC = .
replace A_WomVic_DV_SC = 1 if A_WomVic == 1 & DV_SeriousCr == 1
replace A_WomVic_DV_SC = 0 if A_WomVic == 0 | DV_SeriousCr == 0

gen Pac_WomVic_DV_SC = . 
replace Pac_WomVic_DV_SC = 1 if Pac_WomVic == 1 & DV_SeriousCr == 1
replace Pac_WomVic_DV_SC = 0 if Pac_WomVic ==0 | DV_SeriousCr == 0


*Domestic violence cases ending in arrest (all victims). 
gen TotArrest_DV = .
replace TotArrest_DV = 1 if Arrest == 1 & DV == 1 
replace TotArrest_DV = 0 if Arrest == 0 | DV == 0 

gen TotArrest_OV_DV = .
replace TotArrest_OV_DV = 1 if Arrest_OV == 1 & DV == 1 
replace TotArrest_OV_DV = 0 if Arrest_OV ==0 | DV == 0 

gen TotArrest_Sum_DV = .
replace TotArrest_Sum_DV = 1 if Arrest_Sum == 1 & DV == 1 
replace TotArrest_Sum_DV = 0 if Arrest_Sum == 0 | DV == 0 

gen TotArrest_Cust_DV = .
replace TotArrest_Cust_DV = 1 if Arrest_Cust == 1 & DV == 1 
replace TotArrest_Cust_DV = 0 if Arrest_Cust == 0 | DV == 0 

gen TotArrest_DVV= . 
replace TotArrest_DVV = 1 if Arrest == 1 & DV_Violent == 1 
replace TotArrest_DVV = 0 if Arrest == 0 | DV_Violent == 0 

gen TotArrest_OV_DVV= .
replace TotArrest_OV_DVV= 1 if Arrest_OV == 1 & DV_Violent == 1 
replace TotArrest_OV_DV = 0 if Arrest_OV ==0 | DV_Violent == 0 

gen TotArrest_Sum_DVV = .
replace TotArrest_Sum_DVV = 1 if Arrest_Sum == 1 & DV_Violent == 1 
replace TotArrest_Sum_DVV = 0 if Arrest_Sum == 0 | DV_Violent == 0 

gen TotArrest_Cust_DVV = .
replace TotArrest_Cust_DVV = 1 if Arrest_Cust == 1 & DV_Violent == 1 
replace TotArrest_Cust_DVV = 0 if Arrest_Cust == 0 | DV_Violent == 0 

gen TotArrest_DVSA= . 
replace TotArrest_DVSA = 1 if Arrest == 1 & DV_SexAsslt == 1 
replace TotArrest_DVSA = 0 if Arrest == 0 | DV_SexAsslt == 0 

gen TotArrest_OV_DVSA = .
replace TotArrest_OV_DVSA = 1 if Arrest_OV == 1 & DV_SexAsslt == 1 
replace TotArrest_OV_DVSA = 0 if Arrest_OV ==0 | DV_SexAsslt == 0 

gen TotArrest_Sum_DVSA = .
replace TotArrest_Sum_DVSA = 1 if Arrest_Sum == 1 & DV_SexAsslt == 1 
replace TotArrest_Sum_DVSA = 0 if Arrest_Sum == 0 | DV_SexAsslt == 0 

gen TotArrest_Cust_DVSA = .
replace TotArrest_Cust_DVSA = 1 if Arrest_Cust == 1 & DV_SexAsslt == 1 
replace TotArrest_Cust_DVSA = 0 if Arrest_Cust == 0 | DV_SexAsslt == 0 

gen TotArrest_DVSI = . 
replace TotArrest_DVSI = 1 if Arrest == 1 & DV_Simple_Int == 1 
replace TotArrest_DVSI = 0 if Arrest == 0 | DV_Simple_Int == 0 

gen TotArrest_OV_DVSI = .
replace TotArrest_OV_DVSI = 1 if Arrest_OV == 1 & DV_Simple_Int == 1 
replace TotArrest_OV_DVSI = 0 if Arrest_OV ==0 | DV_Simple_Int == 0 

gen TotArrest_Sum_DVSI = .
replace TotArrest_Sum_DVSI = 1 if Arrest_Sum == 1 & DV_Simple_Int == 1 
replace TotArrest_Sum_DVSI = 0 if Arrest_Sum == 0 | DV_Simple_Int == 0 

gen TotArrest_Cust_DVSI = .
replace TotArrest_Cust_DVSI = 1 if Arrest_Cust == 1 & DV_Simple_Int == 1 
replace TotArrest_Cust_DVSI = 0 if Arrest_Cust == 0 | DV_Simple_Int == 0 

gen TotArrest_DVSC = . 
replace TotArrest_DVSC = 1 if Arrest == 1 & DV_SeriousCr == 1 
replace TotArrest_DVSC = 0 if Arrest == 0 | DV_SeriousCr == 0 

gen TotArrest_OV_DVSC = .
replace TotArrest_OV_DVSC = 1 if Arrest_OV == 1 & DV_SeriousCr == 1 
replace TotArrest_OV_DVSC = 0 if Arrest_OV ==0 | DV_SeriousCr == 0 

gen TotArrest_Sum_DVSC = .
replace TotArrest_Sum_DVSC = 1 if Arrest_Sum == 1 & DV_SeriousCr == 1 
replace TotArrest_Sum_DVSC = 0 if Arrest_Sum == 0 | DV_SeriousCr == 0 

gen TotArrest_Cust_DVSC = .
replace TotArrest_Cust_DVSC = 1 if Arrest_Cust == 1 & DV_SeriousCr == 1 
replace TotArrest_Cust_DVSC = 0 if Arrest_Cust == 0 | DV_SeriousCr == 0 



*Domestic Violence cases ending in arrest for women victims. 
gen Arrest_DV = .
replace Arrest_DV = 1 if Arrest == 1 & DV == 1 & WomVic == 1
replace Arrest_DV = 0 if Arrest == 0 | DV == 0 | WomVic == 0

gen Arrest_OV_DV = .
replace Arrest_OV_DV = 1 if Arrest_OV == 1 & DV == 1 & WomVic == 1
replace Arrest_OV_DV = 0 if Arrest_OV ==0 | DV == 0 | WomVic == 0

gen Arrest_Sum_DV = .
replace Arrest_Sum_DV = 1 if Arrest_Sum == 1 & DV == 1 & WomVic == 1
replace Arrest_Sum_DV = 0 if Arrest_Sum == 0 | DV == 0 | WomVic == 0

gen Arrest_Cust_DV = .
replace Arrest_Cust_DV = 1 if Arrest_Cust == 1 & DV == 1 & WomVic == 1
replace Arrest_Cust_DV = 0 if Arrest_Cust == 0 | DV == 0 | WomVic == 0


gen Arrest_DVV= . 
replace Arrest_DVV = 1 if Arrest == 1 & DV_Violent == 1 & WomVic == 1
replace Arrest_DVV = 0 if Arrest == 0 | DV_Violent == 0 | WomVic == 0

gen Arrest_OV_DVV= .
replace Arrest_OV_DVV= 1 if Arrest_OV == 1 & DV_Violent == 1 & WomVic == 1
replace Arrest_OV_DV = 0 if Arrest_OV ==0 | DV_Violent == 0 | WomVic == 0

gen Arrest_Sum_DVV = .
replace Arrest_Sum_DVV = 1 if Arrest_Sum == 1 & DV_Violent == 1 & WomVic == 1
replace Arrest_Sum_DVV = 0 if Arrest_Sum == 0 | DV_Violent == 0 | WomVic == 0

gen Arrest_Cust_DVV = .
replace Arrest_Cust_DVV = 1 if Arrest_Cust == 1 & DV_Violent == 1 & WomVic == 1
replace Arrest_Cust_DVV = 0 if Arrest_Cust == 0 | DV_Violent == 0 | WomVic == 0



gen Arrest_DVSA= . 
replace Arrest_DVSA = 1 if Arrest == 1 & DV_SexAsslt == 1 & WomVic == 1
replace Arrest_DVSA = 0 if Arrest == 0 | DV_SexAsslt == 0 | WomVic == 0

gen Arrest_OV_DVSA = .
replace Arrest_OV_DVSA = 1 if Arrest_OV == 1 & DV_SexAsslt == 1 & WomVic == 1
replace Arrest_OV_DVSA = 0 if Arrest_OV ==0 | DV_SexAsslt == 0 | WomVic == 0

gen Arrest_Sum_DVSA = .
replace Arrest_Sum_DVSA = 1 if Arrest_Sum == 1 & DV_SexAsslt == 1 & WomVic == 1
replace Arrest_Sum_DVSA = 0 if Arrest_Sum == 0 | DV_SexAsslt == 0 | WomVic == 0

gen Arrest_Cust_DVSA = .
replace Arrest_Cust_DVSA = 1 if Arrest_Cust == 1 & DV_SexAsslt == 1 & WomVic == 1
replace Arrest_Cust_DVSA = 0 if Arrest_Cust == 0 | DV_SexAsslt == 0 | WomVic == 0


gen Arrest_DVSI = . 
replace Arrest_DVSI = 1 if Arrest == 1 & DV_Simple_Int == 1 & WomVic == 1
replace Arrest_DVSI = 0 if Arrest == 0 | DV_Simple_Int == 0 | WomVic == 0

gen Arrest_OV_DVSI = .
replace Arrest_OV_DVSI = 1 if Arrest_OV == 1 & DV_Simple_Int == 1 & WomVic == 1
replace Arrest_OV_DVSI = 0 if Arrest_OV ==0 | DV_Simple_Int == 0 | WomVic == 0

gen Arrest_Sum_DVSI = .
replace Arrest_Sum_DVSI = 1 if Arrest_Sum == 1 & DV_Simple_Int == 1 & WomVic == 1
replace Arrest_Sum_DVSI = 0 if Arrest_Sum == 0 | DV_Simple_Int == 0 | WomVic == 0

gen Arrest_Cust_DVSI = .
replace Arrest_Cust_DVSI = 1 if Arrest_Cust == 1 & DV_Simple_Int == 1 & WomVic == 1
replace Arrest_Cust_DVSI = 0 if Arrest_Cust == 0 | DV_Simple_Int == 0 | WomVic == 0


gen Arrest_DVSC = . 
replace Arrest_DVSC = 1 if Arrest == 1 & DV_SeriousCr == 1 & WomVic == 1
replace Arrest_DVSC = 0 if Arrest == 0 | DV_SeriousCr == 0 | WomVic == 0

gen Arrest_OV_DVSC = .
replace Arrest_OV_DVSC = 1 if Arrest_OV == 1 & DV_SeriousCr == 1 & WomVic == 1
replace Arrest_OV_DVSC = 0 if Arrest_OV ==0 | DV_SeriousCr == 0 | WomVic == 0

gen Arrest_Sum_DVSC = .
replace Arrest_Sum_DVSC = 1 if Arrest_Sum == 1 & DV_SeriousCr == 1 & WomVic == 1
replace Arrest_Sum_DVSC = 0 if Arrest_Sum == 0 | DV_SeriousCr == 0 | WomVic == 0

gen Arrest_Cust_DVSC = .
replace Arrest_Cust_DVSC = 1 if Arrest_Cust == 1 & DV_SeriousCr == 1 & WomVic == 1
replace Arrest_Cust_DVSC = 0 if Arrest_Cust == 0 | DV_SeriousCr == 0 | WomVic == 0 


*Domestic Violence cases ending in arrest by race/ethnicity of women victims. 

gen HWArrest_DV = . 
replace HWArrest_DV = 1 if Arrest == 1 & DV ==1 & H_WomVic == 1
replace HWArrest_DV = 0 if Arrest == 0 | DV == 0 | H_WomVic == 0

gen HWArrest_OV_DV = . 
replace HWArrest_OV_DV = 1 if Arrest_OV ==1 & DV == 1 & H_WomVic == 1
replace HWArrest_OV_DV  = 0 if Arrest_OV == 0 | DV == 0 | H_WomVic == 0

gen HWArrest_Sum_DV = . 
replace HWArrest_Sum_DV = 1 if Arrest_Sum ==1 & DV == 1 & H_WomVic == 1
replace HWArrest_Sum_DV  = 0 if Arrest_Sum == 0 | DV == 0 | H_WomVic == 0

gen HWArrest_Cust_DV = . 
replace HWArrest_Cust_DV = 1 if Arrest_Cust ==1 & DV == 1 & H_WomVic == 1
replace HWArrest_Cust_DV  = 0 if Arrest_Cust == 0 | DV == 0 | H_WomVic == 0

gen HWArrest_DVV = . 
replace HWArrest_DVV = 1 if Arrest == 1 & DV_Violent == 1 & H_WomVic == 1
replace HWArrest_DVV = 0 if Arrest == 0 | DV_Violent == 0 | H_WomVic == 0

gen HWArrest_OV_DVV = . 
replace HWArrest_OV_DVV = 1 if Arrest_OV == 1 & DV_Violent == 1 & H_WomVic == 1
replace HWArrest_OV_DVV = 0 if Arrest_OV == 0 | DV_Violent == 0 | H_WomVic == 0

gen HWArrest_Sum_DVV = . 
replace HWArrest_Sum_DVV = 1 if Arrest_Sum == 1 & DV_Violent == 1 & H_WomVic == 1
replace HWArrest_Sum_DVV = 0 if Arrest_Sum == 0 | DV_Violent == 0 | H_WomVic == 0

gen HWArrest_Cust_DVV = . 
replace HWArrest_Cust_DVV = 1 if Arrest_Cust == 1 & DV_Violent == 1 & H_WomVic == 1
replace HWArrest_Cust_DVV = 0 if Arrest_Cust == 0 | DV_Violent == 0 | H_WomVic == 0

gen HWArrest_DVSA= . 
replace HWArrest_DVSA = 1 if Arrest == 1 & DV_SexAsslt == 1 & H_WomVic == 1
replace HWArrest_DVSA = 0 if Arrest == 0 | DV_SexAsslt == 0 | H_WomVic == 0 

gen HWArrest_OV_DVSA = .
replace HWArrest_OV_DVSA = 1 if Arrest_OV == 1 & DV_SexAsslt == 1 & H_WomVic == 1
replace HWArrest_OV_DVSA = 0 if Arrest_OV ==0 | DV_SexAsslt == 0 | H_WomVic == 0 

gen HWArrest_Sum_DVSA = .
replace HWArrest_Sum_DVSA = 1 if Arrest_Sum == 1 & DV_SexAsslt == 1 & H_WomVic == 1
replace HWArrest_Sum_DVSA = 0 if Arrest_Sum == 0 | DV_SexAsslt == 0 | H_WomVic == 0 

gen HWArrest_Cust_DVSA = .
replace HWArrest_Cust_DVSA = 1 if Arrest_Cust == 1 & DV_SexAsslt == 1 & H_WomVic == 1
replace HWArrest_Cust_DVSA = 0 if Arrest_Cust == 0 | DV_SexAsslt == 0 | H_WomVic == 0  

gen HWArrest_DVSI = . 
replace HWArrest_DVSI = 1 if Arrest == 1 & DV_Simple_Int == 1 & H_WomVic == 1
replace HWArrest_DVSI = 0 if Arrest == 0 | DV_Simple_Int == 0 | H_WomVic == 0 

gen HWArrest_OV_DVSI = .
replace HWArrest_OV_DVSI = 1 if Arrest_OV == 1 & DV_Simple_Int == 1 & H_WomVic == 1
replace HWArrest_OV_DVSI = 0 if Arrest_OV ==0 | DV_Simple_Int == 0 | H_WomVic == 0 

gen HWArrest_Sum_DVSI = .
replace HWArrest_Sum_DVSI = 1 if Arrest_Sum == 1 & DV_Simple_Int == 1 & H_WomVic == 1
replace HWArrest_Sum_DVSI = 0 if Arrest_Sum == 0 | DV_Simple_Int == 0 | H_WomVic == 0 

gen HWArrest_Cust_DVSI = .
replace HWArrest_Cust_DVSI = 1 if Arrest_Cust == 1 & DV_Simple_Int == 1 & H_WomVic == 1
replace HWArrest_Cust_DVSI = 0 if Arrest_Cust == 0 | DV_Simple_Int == 0 | H_WomVic == 0  

gen HWArrest_DVSC = . 
replace HWArrest_DVSC = 1 if Arrest == 1 & DV_SeriousCr == 1 & H_WomVic == 1
replace HWArrest_DVSC = 0 if Arrest == 0 | DV_SeriousCr == 0 | H_WomVic == 0 

gen HWArrest_OV_DVSC = .
replace HWArrest_OV_DVSC = 1 if Arrest_OV == 1 & DV_SeriousCr == 1 & H_WomVic == 1
replace HWArrest_OV_DVSC = 0 if Arrest_OV ==0 | DV_SeriousCr == 0 | H_WomVic == 0 

gen HWArrest_Sum_DVSC = .
replace HWArrest_Sum_DVSC = 1 if Arrest_Sum == 1 & DV_SeriousCr == 1 & H_WomVic == 1
replace HWArrest_Sum_DVSC = 0 if Arrest_Sum == 0 | DV_SeriousCr == 0 | H_WomVic == 0 

gen HWArrest_Cust_DVSC = .
replace HWArrest_Cust_DVSC = 1 if Arrest_Cust == 1 & DV_SeriousCr == 1 & H_WomVic == 1
replace HWArrest_Cust_DVSC = 0 if Arrest_Cust == 0 | DV_SeriousCr == 0 | H_WomVic == 0


gen BWArrest_DV = . 
replace BWArrest_DV = 1 if Arrest == 1 & DV == 1 & B_WomVic == 1
replace BWArrest_DV = 0 if Arrest == 0 | DV == 0 | B_WomVic == 0 

gen BWArrest_OV_DV = .
replace BWArrest_OV_DV = 1 if Arrest_OV == 1 & DV == 1 & B_WomVic == 1
replace BWArrest_OV_DV = 0 if Arrest_OV ==0 | DV == 0 | B_WomVic == 0 

gen BWArrest_Sum_DV = .
replace BWArrest_Sum_DV = 1 if Arrest_Sum == 1 & DV == 1 & B_WomVic == 1
replace BWArrest_Sum_DV = 0 if Arrest_Sum == 0 | DV == 0 | B_WomVic == 0 

gen BWArrest_Cust_DV = .
replace BWArrest_Cust_DV = 1 if Arrest_Cust == 1 & DV == 1 & B_WomVic == 1
replace BWArrest_Cust_DV = 0 if Arrest_Cust == 0 | DV == 0  | B_WomVic == 0 

gen BWArrest_DVV= . 
replace BWArrest_DVV = 1 if Arrest == 1 & DV_Violent == 1 & B_WomVic == 1
replace BWArrest_DVV = 0 if Arrest == 0 | DV_Violent == 0 | B_WomVic == 0 

gen BWArrest_OV_DVV= .
replace BWArrest_OV_DVV= 1 if Arrest_OV == 1 & DV_Violent == 1 & B_WomVic == 1
replace BWArrest_OV_DV = 0 if Arrest_OV ==0 | DV_Violent == 0 | B_WomVic == 0 

gen BWArrest_Sum_DVV = .
replace BWArrest_Sum_DVV = 1 if Arrest_Sum == 1 & DV_Violent == 1 & B_WomVic == 1
replace BWArrest_Sum_DVV = 0 if Arrest_Sum == 0 | DV_Violent == 0 | B_WomVic == 0 

gen BWArrest_Cust_DVV = .
replace BWArrest_Cust_DVV = 1 if Arrest_Cust == 1 & DV_Violent == 1 & B_WomVic == 1
replace BWArrest_Cust_DVV = 0 if Arrest_Cust == 0 | DV_Violent == 0 | B_WomVic == 0 


gen BWArrest_DVSA= . 
replace BWArrest_DVSA = 1 if Arrest == 1 & DV_SexAsslt == 1 & B_WomVic == 1
replace BWArrest_DVSA = 0 if Arrest == 0 | DV_SexAsslt == 0 | B_WomVic == 0 

gen BWArrest_OV_DVSA = .
replace BWArrest_OV_DVSA = 1 if Arrest_OV == 1 & DV_SexAsslt == 1 & B_WomVic == 1
replace BWArrest_OV_DVSA = 0 if Arrest_OV ==0 | DV_SexAsslt == 0 | B_WomVic == 0 

gen BWArrest_Sum_DVSA = .
replace BWArrest_Sum_DVSA = 1 if Arrest_Sum == 1 & DV_SexAsslt == 1 & B_WomVic == 1
replace BWArrest_Sum_DVSA = 0 if Arrest_Sum == 0 | DV_SexAsslt == 0 | B_WomVic == 0 

gen BWArrest_Cust_DVSA = .
replace BWArrest_Cust_DVSA = 1 if Arrest_Cust == 1 & DV_SexAsslt == 1 & B_WomVic == 1
replace BWArrest_Cust_DVSA = 0 if Arrest_Cust == 0 | DV_SexAsslt == 0 | B_WomVic == 0  


gen BWArrest_DVSI = . 
replace BWArrest_DVSI = 1 if Arrest == 1 & DV_Simple_Int == 1 & B_WomVic == 1
replace BWArrest_DVSI = 0 if Arrest == 0 | DV_Simple_Int == 0 | B_WomVic == 0 

gen BWArrest_OV_DVSI = .
replace BWArrest_OV_DVSI = 1 if Arrest_OV == 1 & DV_Simple_Int == 1 & B_WomVic == 1
replace BWArrest_OV_DVSI = 0 if Arrest_OV ==0 | DV_Simple_Int == 0 | B_WomVic == 0 

gen BWArrest_Sum_DVSI = .
replace BWArrest_Sum_DVSI = 1 if Arrest_Sum == 1 & DV_Simple_Int == 1 & B_WomVic == 1
replace BWArrest_Sum_DVSI = 0 if Arrest_Sum == 0 | DV_Simple_Int == 0 | B_WomVic == 0 

gen BWArrest_Cust_DVSI = .
replace BWArrest_Cust_DVSI = 1 if Arrest_Cust == 1 & DV_Simple_Int == 1 & B_WomVic == 1
replace BWArrest_Cust_DVSI = 0 if Arrest_Cust == 0 | DV_Simple_Int == 0 | B_WomVic == 0  


gen BWArrest_DVSC = . 
replace BWArrest_DVSC = 1 if Arrest == 1 & DV_SeriousCr == 1 & B_WomVic == 1
replace BWArrest_DVSC = 0 if Arrest == 0 | DV_SeriousCr == 0 | B_WomVic == 0 

gen BWArrest_OV_DVSC = .
replace BWArrest_OV_DVSC = 1 if Arrest_OV == 1 & DV_SeriousCr == 1 & B_WomVic == 1
replace BWArrest_OV_DVSC = 0 if Arrest_OV ==0 | DV_SeriousCr == 0 | B_WomVic == 0 

gen BWArrest_Sum_DVSC = .
replace BWArrest_Sum_DVSC = 1 if Arrest_Sum == 1 & DV_SeriousCr == 1 & B_WomVic == 1
replace BWArrest_Sum_DVSC = 0 if Arrest_Sum == 0 | DV_SeriousCr == 0 | B_WomVic == 0 

gen BWArrest_Cust_DVSC = .
replace BWArrest_Cust_DVSC = 1 if Arrest_Cust == 1 & DV_SeriousCr == 1 & B_WomVic == 1
replace BWArrest_Cust_DVSC = 0 if Arrest_Cust == 0 | DV_SeriousCr == 0 | B_WomVic == 0  


gen BNHWArrest_DV = . 
replace BNHWArrest_DV = 1 if Arrest == 1 & DV == 1 & BNH_WomVic == 1
replace BNHWArrest_DV = 0 if Arrest == 0 | DV == 0 | BNH_WomVic == 0 

gen BNHWArrest_OV_DV = .
replace BNHWArrest_OV_DV = 1 if Arrest_OV == 1 & DV == 1 & BNH_WomVic == 1
replace BNHWArrest_OV_DV = 0 if Arrest_OV ==0 | DV == 0 | BNH_WomVic == 0  

gen BNHWArrest_Sum_DV = .
replace BNHWArrest_Sum_DV = 1 if Arrest_Sum == 1 & DV == 1 & BNH_WomVic == 1
replace BNHWArrest_Sum_DV = 0 if Arrest_Sum == 0 | DV == 0 | BNH_WomVic == 0  

gen BNHWArrest_Cust_DV = .
replace BNHWArrest_Cust_DV = 1 if Arrest_Cust == 1 & DV == 1 & BNH_WomVic == 1
replace BNHWArrest_Cust_DV = 0 if Arrest_Cust == 0 | DV == 0  | BNH_WomVic == 0  


gen BNHWArrest_DVV= . 
replace BNHWArrest_DVV = 1 if Arrest == 1 & DV_Violent == 1 & BNH_WomVic == 1
replace BNHWArrest_DVV = 0 if Arrest == 0 | DV_Violent == 0 | BNH_WomVic == 0  

gen BNHWArrest_OV_DVV= .
replace BNHWArrest_OV_DVV= 1 if Arrest_OV == 1 & DV_Violent == 1 & BNH_WomVic == 1
replace BNHWArrest_OV_DV = 0 if Arrest_OV ==0 | DV_Violent == 0 | BNH_WomVic == 0  

gen BNHWArrest_Sum_DVV = .
replace BNHWArrest_Sum_DVV = 1 if Arrest_Sum == 1 & DV_Violent == 1 & BNH_WomVic == 1
replace BNHWArrest_Sum_DVV = 0 if Arrest_Sum == 0 | DV_Violent == 0 | BNH_WomVic == 0  

gen BNHWArrest_Cust_DVV = .
replace BNHWArrest_Cust_DVV = 1 if Arrest_Cust == 1 & DV_Violent == 1 & BNH_WomVic == 1
replace BNHWArrest_Cust_DVV = 0 if Arrest_Cust == 0 | DV_Violent == 0 | BNH_WomVic == 0  


gen BNHWArrest_DVSA= . 
replace BNHWArrest_DVSA = 1 if Arrest == 1 & DV_SexAsslt == 1 & BNH_WomVic == 1
replace BNHWArrest_DVSA = 0 if Arrest == 0 | DV_SexAsslt == 0 | BNH_WomVic == 0  

gen BNHWArrest_OV_DVSA = .
replace BNHWArrest_OV_DVSA = 1 if Arrest_OV == 1 & DV_SexAsslt == 1 & BNH_WomVic == 1
replace BNHWArrest_OV_DVSA = 0 if Arrest_OV ==0 | DV_SexAsslt == 0 | BNH_WomVic == 0  

gen BNHWArrest_Sum_DVSA = .
replace BNHWArrest_Sum_DVSA = 1 if Arrest_Sum == 1 & DV_SexAsslt == 1 & BNH_WomVic == 1
replace BNHWArrest_Sum_DVSA = 0 if Arrest_Sum == 0 | DV_SexAsslt == 0 | BNH_WomVic == 0  

gen BNHWArrest_Cust_DVSA = .
replace BNHWArrest_Cust_DVSA = 1 if Arrest_Cust == 1 & DV_SexAsslt == 1 & BNH_WomVic == 1
replace BNHWArrest_Cust_DVSA = 0 if Arrest_Cust == 0 | DV_SexAsslt == 0 | BNH_WomVic == 0   


gen BNHWArrest_DVSI = . 
replace BNHWArrest_DVSI = 1 if Arrest == 1 & DV_Simple_Int == 1 & BNH_WomVic == 1
replace BNHWArrest_DVSI = 0 if Arrest == 0 | DV_Simple_Int == 0 | BNH_WomVic == 0  

gen BNHWArrest_OV_DVSI = .
replace BNHWArrest_OV_DVSI = 1 if Arrest_OV == 1 & DV_Simple_Int == 1 & BNH_WomVic == 1
replace BNHWArrest_OV_DVSI = 0 if Arrest_OV ==0 | DV_Simple_Int == 0 | BNH_WomVic == 0  

gen BNHWArrest_Sum_DVSI = .
replace BNHWArrest_Sum_DVSI = 1 if Arrest_Sum == 1 & DV_Simple_Int == 1 & BNH_WomVic == 1
replace BNHWArrest_Sum_DVSI = 0 if Arrest_Sum == 0 | DV_Simple_Int == 0 | BNH_WomVic == 0  

gen BNHWArrest_Cust_DVSI = .
replace BNHWArrest_Cust_DVSI = 1 if Arrest_Cust == 1 & DV_Simple_Int == 1 & BNH_WomVic == 1
replace BNHWArrest_Cust_DVSI = 0 if Arrest_Cust == 0 | DV_Simple_Int == 0 | BNH_WomVic == 0   


gen BNHWArrest_DVSC = . 
replace BNHWArrest_DVSC = 1 if Arrest == 1 & DV_SeriousCr == 1 & BNH_WomVic == 1
replace BNHWArrest_DVSC = 0 if Arrest == 0 | DV_SeriousCr == 0 | BNH_WomVic == 0 

gen BNHWArrest_OV_DVSC = .
replace BNHWArrest_OV_DVSC = 1 if Arrest_OV == 1 & DV_SeriousCr == 1 & BNH_WomVic == 1
replace BNHWArrest_OV_DVSC = 0 if Arrest_OV ==0 | DV_SeriousCr == 0 | BNH_WomVic == 0 

gen BNHWArrest_Sum_DVSC = .
replace BNHWArrest_Sum_DVSC = 1 if Arrest_Sum == 1 & DV_SeriousCr == 1 & BNH_WomVic == 1
replace BNHWArrest_Sum_DVSC = 0 if Arrest_Sum == 0 | DV_SeriousCr == 0 | BNH_WomVic == 0 

gen BNHWArrest_Cust_DVSC = .
replace BNHWArrest_Cust_DVSC = 1 if Arrest_Cust == 1 & DV_SeriousCr == 1 & BNH_WomVic == 1
replace BNHWArrest_Cust_DVSC = 0 if Arrest_Cust == 0 | DV_SeriousCr == 0 | BNH_WomVic == 0 



gen WWArrest_DV = . 
replace WWArrest_DV = 1 if Arrest == 1 & DV == 1 & W_WomVic == 1
replace WWArrest_DV = 0 if Arrest == 0 | DV == 0 | W_WomVic == 0 

gen WWArrest_OV_DV = .
replace WWArrest_OV_DV = 1 if Arrest_OV == 1 & DV == 1 & W_WomVic == 1
replace WWArrest_OV_DV = 0 if Arrest_OV ==0 | DV == 0 | W_WomVic == 0 

gen WWArrest_Sum_DV = .
replace WWArrest_Sum_DV = 1 if Arrest_Sum == 1 & DV == 1 & W_WomVic == 1
replace WWArrest_Sum_DV = 0 if Arrest_Sum == 0 | DV == 0 | W_WomVic == 0 

gen WWArrest_Cust_DV = .
replace WWArrest_Cust_DV = 1 if Arrest_Cust == 1 & DV == 1 & W_WomVic == 1
replace WWArrest_Cust_DV = 0 if Arrest_Cust == 0 | DV == 0 | W_WomVic == 0 


gen WWArrest_DVV= . 
replace WWArrest_DVV = 1 if Arrest == 1 & DV_Violent == 1 & W_WomVic == 1
replace WWArrest_DVV = 0 if Arrest == 0 | DV_Violent == 0 | W_WomVic == 0 

gen WWArrest_OV_DVV= .
replace WWArrest_OV_DVV= 1 if Arrest_OV == 1 & DV_Violent == 1 & W_WomVic == 1
replace WWArrest_OV_DVV = 0 if Arrest_OV ==0 | DV_Violent == 0 | W_WomVic == 0 

gen WWArrest_Sum_DVV = .
replace WWArrest_Sum_DVV = 1 if Arrest_Sum == 1 & DV_Violent == 1 & W_WomVic == 1
replace WWArrest_Sum_DVV = 0 if Arrest_Sum == 0 | DV_Violent == 0 | W_WomVic == 0 

gen WWArrest_Cust_DVV = .
replace WWArrest_Cust_DVV = 1 if Arrest_Cust == 1 & DV_Violent == 1 & W_WomVic == 1
replace WWArrest_Cust_DVV = 0 if Arrest_Cust == 0 | DV_Violent == 0 | W_WomVic == 0 


gen WWArrest_DVSA= . 
replace WWArrest_DVSA = 1 if Arrest == 1 & DV_SexAsslt == 1 & W_WomVic == 1
replace WWArrest_DVSA = 0 if Arrest == 0 | DV_SexAsslt == 0 | W_WomVic == 0 

gen WWArrest_OV_DVSA = .
replace WWArrest_OV_DVSA = 1 if Arrest_OV == 1 & DV_SexAsslt == 1 & W_WomVic == 1
replace WWArrest_OV_DVSA = 0 if Arrest_OV ==0 | DV_SexAsslt == 0 | W_WomVic == 0  

gen WWArrest_Sum_DVSA = .
replace WWArrest_Sum_DVSA = 1 if Arrest_Sum == 1 & DV_SexAsslt == 1 & W_WomVic == 1
replace WWArrest_Sum_DVSA = 0 if Arrest_Sum == 0 | DV_SexAsslt == 0 | W_WomVic == 0 

gen WWArrest_Cust_DVSA = .
replace WWArrest_Cust_DVSA = 1 if Arrest_Cust == 1 & DV_SexAsslt == 1 & W_WomVic == 1
replace WWArrest_Cust_DVSA = 0 if Arrest_Cust == 0 | DV_SexAsslt == 0 | W_WomVic == 0  


gen WWArrest_DVSI = . 
replace WWArrest_DVSI = 1 if Arrest == 1 & DV_Simple_Int == 1 & W_WomVic == 1
replace WWArrest_DVSI = 0 if Arrest == 0 | DV_Simple_Int == 0 | W_WomVic == 0  

gen WWArrest_OV_DVSI = .
replace WWArrest_OV_DVSI = 1 if Arrest_OV == 1 & DV_Simple_Int == 1 & W_WomVic == 1
replace WWArrest_OV_DVSI = 0 if Arrest_OV ==0 | DV_Simple_Int == 0 | W_WomVic == 0 

gen WWArrest_Sum_DVSI = .
replace WWArrest_Sum_DVSI = 1 if Arrest_Sum == 1 & DV_Simple_Int == 1 & W_WomVic == 1
replace WWArrest_Sum_DVSI = 0 if Arrest_Sum == 0 | DV_Simple_Int == 0 | W_WomVic == 0  

gen WWArrest_Cust_DVSI = .
replace WWArrest_Cust_DVSI = 1 if Arrest_Cust == 1 & DV_Simple_Int == 1 & W_WomVic == 1
replace WWArrest_Cust_DVSI = 0 if Arrest_Cust == 0 | DV_Simple_Int == 0 | W_WomVic == 0  


gen WWArrest_DVSC = . 
replace WWArrest_DVSC = 1 if Arrest == 1 & DV_SeriousCr == 1 & W_WomVic == 1
replace WWArrest_DVSC = 0 if Arrest == 0 | DV_SeriousCr == 0 | W_WomVic == 0 

gen WWArrest_OV_DVSC = .
replace WWArrest_OV_DVSC = 1 if Arrest_OV == 1 & DV_SeriousCr == 1 & W_WomVic == 1
replace WWArrest_OV_DVSC = 0 if Arrest_OV ==0 | DV_SeriousCr == 0 | W_WomVic == 0 

gen WWArrest_Sum_DVSC = .
replace WWArrest_Sum_DVSC = 1 if Arrest_Sum == 1 & DV_SeriousCr == 1 & W_WomVic == 1
replace WWArrest_Sum_DVSC = 0 if Arrest_Sum == 0 | DV_SeriousCr == 0 | W_WomVic == 0 

gen WWArrest_Cust_DVSC = .
replace WWArrest_Cust_DVSC = 1 if Arrest_Cust == 1 & DV_SeriousCr == 1 & W_WomVic == 1
replace WWArrest_Cust_DVSC = 0 if Arrest_Cust == 0 | DV_SeriousCr == 0 | W_WomVic == 0  




gen WNHWArrest_DV = . 
replace WNHWArrest_DV = 1 if Arrest == 1 & DV == 1 & WNH_WomVic == 1
replace WNHWArrest_DV = 0 if Arrest == 0 | DV == 0 | WNH_WomVic == 0

gen WNHWArrest_OV_DV = .
replace WNHWArrest_OV_DV = 1 if Arrest_OV == 1 & DV == 1 & WNH_WomVic == 1
replace WNHWArrest_OV_DV = 0 if Arrest_OV ==0 | DV == 0 | WNH_WomVic == 0

gen WNHWArrest_Sum_DV = .
replace WNHWArrest_Sum_DV = 1 if Arrest_Sum == 1 & DV == 1 & WNH_WomVic == 1
replace WNHWArrest_Sum_DV = 0 if Arrest_Sum == 0 | DV == 0 | WNH_WomVic == 0

gen WNHWArrest_Cust_DV = .
replace WNHWArrest_Cust_DV = 1 if Arrest_Cust == 1 & DV == 1 & WNH_WomVic == 1
replace WNHWArrest_Cust_DV = 0 if Arrest_Cust == 0 | DV == 0 | WNH_WomVic == 0 


gen WNHWArrest_DVV= . 
replace WNHWArrest_DVV = 1 if Arrest == 1 & DV_Violent == 1 & WNH_WomVic == 1
replace WNHWArrest_DVV = 0 if Arrest == 0 | DV_Violent == 0 | WNH_WomVic == 0 

gen WNHWArrest_OV_DVV= .
replace WNHWArrest_OV_DVV= 1 if Arrest_OV == 1 & DV_Violent == 1 & WNH_WomVic == 1
replace WNHWArrest_OV_DV = 0 if Arrest_OV ==0 | DV_Violent == 0 | WNH_WomVic == 0 

gen WNHWArrest_Sum_DVV = .
replace WNHWArrest_Sum_DVV = 1 if Arrest_Sum == 1 & DV_Violent == 1 & WNH_WomVic == 1
replace WNHWArrest_Sum_DVV = 0 if Arrest_Sum == 0 | DV_Violent == 0 | WNH_WomVic == 0

gen WNHWArrest_Cust_DVV = .
replace WNHWArrest_Cust_DVV = 1 if Arrest_Cust == 1 & DV_Violent == 1 & WNH_WomVic == 1
replace WNHWArrest_Cust_DVV = 0 if Arrest_Cust == 0 | DV_Violent == 0 | WNH_WomVic == 0


gen WNHWArrest_DVSA= . 
replace WNHWArrest_DVSA = 1 if Arrest == 1 & DV_SexAsslt == 1 & WNH_WomVic == 1
replace WNHWArrest_DVSA = 0 if Arrest == 0 | DV_SexAsslt == 0 | WNH_WomVic == 0 

gen WNHWArrest_OV_DVSA = .
replace WNHWArrest_OV_DVSA = 1 if Arrest_OV == 1 & DV_SexAsslt == 1 & WNH_WomVic == 1
replace WNHWArrest_OV_DVSA = 0 if Arrest_OV ==0 | DV_SexAsslt == 0 | WNH_WomVic == 0 

gen WNHWArrest_Sum_DVSA = .
replace WNHWArrest_Sum_DVSA = 1 if Arrest_Sum == 1 & DV_SexAsslt == 1 & WNH_WomVic == 1
replace WNHWArrest_Sum_DVSA = 0 if Arrest_Sum == 0 | DV_SexAsslt == 0 | WNH_WomVic == 0

gen WNHWArrest_Cust_DVSA = .
replace WNHWArrest_Cust_DVSA = 1 if Arrest_Cust == 1 & DV_SexAsslt == 1 & WNH_WomVic == 1
replace WNHWArrest_Cust_DVSA = 0 if Arrest_Cust == 0 | DV_SexAsslt == 0 | WNH_WomVic == 0 


gen WNHWArrest_DVSI = . 
replace WNHWArrest_DVSI = 1 if Arrest == 1 & DV_Simple_Int == 1 & WNH_WomVic == 1
replace WNHWArrest_DVSI = 0 if Arrest == 0 | DV_Simple_Int == 0 | WNH_WomVic == 0  

gen WNHWArrest_OV_DVSI = .
replace WNHWArrest_OV_DVSI = 1 if Arrest_OV == 1 & DV_Simple_Int == 1 & WNH_WomVic == 1
replace WNHWArrest_OV_DVSI = 0 if Arrest_OV ==0 | DV_Simple_Int == 0 | WNH_WomVic == 0 

gen WNHWArrest_Sum_DVSI = .
replace WNHWArrest_Sum_DVSI = 1 if Arrest_Sum == 1 & DV_Simple_Int == 1 & WNH_WomVic == 1
replace WNHWArrest_Sum_DVSI = 0 if Arrest_Sum == 0 | DV_Simple_Int == 0 | WNH_WomVic == 0 

gen WNHWArrest_Cust_DVSI = .
replace WNHWArrest_Cust_DVSI = 1 if Arrest_Cust == 1 & DV_Simple_Int == 1 & WNH_WomVic == 1
replace WNHWArrest_Cust_DVSI = 0 if Arrest_Cust == 0 | DV_Simple_Int == 0 | WNH_WomVic == 0 


gen WNHWArrest_DVSC = . 
replace WNHWArrest_DVSC = 1 if Arrest == 1 & DV_SeriousCr == 1 & WNH_WomVic == 1
replace WNHWArrest_DVSC = 0 if Arrest == 0 | DV_SeriousCr == 0 | WNH_WomVic == 0

gen WNHWArrest_OV_DVSC = .
replace WNHWArrest_OV_DVSC = 1 if Arrest_OV == 1 & DV_SeriousCr == 1 & WNH_WomVic == 1
replace WNHWArrest_OV_DVSC = 0 if Arrest_OV ==0 | DV_SeriousCr == 0 | WNH_WomVic == 0

gen WNHWArrest_Sum_DVSC = .
replace WNHWArrest_Sum_DVSC = 1 if Arrest_Sum == 1 & DV_SeriousCr == 1 & WNH_WomVic == 1
replace WNHWArrest_Sum_DVSC = 0 if Arrest_Sum == 0 | DV_SeriousCr == 0 | WNH_WomVic == 0

gen WNHWArrest_Cust_DVSC = .
replace WNHWArrest_Cust_DVSC = 1 if Arrest_Cust == 1 & DV_SeriousCr == 1 & WNH_WomVic == 1
replace WNHWArrest_Cust_DVSC = 0 if Arrest_Cust == 0 | DV_SeriousCr == 0 | WNH_WomVic == 0


*Injury associated with incident
gen Injury = . 
replace Injury = 1 if V4026 > 1
replace Injury = 0 if V4026 == 1


*For the arrestee
gen Armed = . 
replace Armed = 1 if V60121  >= 110
replace Armed = 0 if V60121 == 1

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
gen ViolentCrimeRate = (ViolentCrime/BH019)*1000


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
