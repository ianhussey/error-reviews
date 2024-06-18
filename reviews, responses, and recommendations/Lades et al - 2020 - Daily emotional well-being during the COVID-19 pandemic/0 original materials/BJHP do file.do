**** FOR BJHP PAPER ****

*** Individual level (604 rows)
use "C:\Users\lklad\OneDrive\Projects\CoronaDRM\British Health Psych\Data and Do file\DRMCoronaWave1DTA_BJHP", clear

sum posaffAvg negaffAvg

* Duration of survey
sum durationInMinSurvey  if durationInMinSurvey  < 60

* Gender
tab sex

* Age
sum age

* Region in Ireland
tab region

* Number of people living in household. Highest category 7 means 7 or more.
sum numHousehold, d

* Education 
tab edu

* Employment status
tab econStatus

* Income
sum inc, d
tab inc

*** Episode-level (2795 rows)
use "C:\Users\lklad\OneDrive\Projects\CoronaDRM\British Health Psych\Data and Do file\DRMCoronaWave1DTA_EPISODE_BJHP", clear

alpha feel_HappyE feel_CalmE feel_EnergeticE
alpha feel_OverwhelmedE feel_SadE feel_BoredE feel_FrustratedE feel_LonelyE feel_WorriedE 

* How much time did people spent at home?
egen DurAtplace = sum(DurInME) , by(placeE)
tab DurAtplace 

* How much time do people spend in the presence of people from their household?
gen interactHousehold = 0
replace interactHousehold = 1 if interactPerson_1E == 1 | interactPerson_2E == 1 
egen DurinteractHousehold = sum(DurInME) , by(interactHousehold)
tab DurinteractHousehold

* How much time do people spend alone?
egen DurAlone = sum(DurInME) , by(interactPerson_12E)
tab DurAlone 

*** Table 1

*Mean affect by activities
foreach var of varlist activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E {
sum posaff if `var' == 1
}
foreach var of varlist activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E {
sum negaff if `var' == 1
}
*Mean affect by location
tabstat posaff , by(placeE) 
tabstat negaff , by(placeE)

*** Graph 1
use "C:\Users\lklad\OneDrive\Projects\CoronaDRM\British Health Psych\Data and Do file\DRMCoronaWave1DTA_EPISODE_BJHP", clear
xtset id
xtreg zposaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , fe
margins,  at(activity_1E=1) at(activity_2E=1) at( activity_3E=1) at( activity_4E=1) at( activity_5E=1) at(activity_6E=1) at( activity_7E=1) at( activity_8E=1) at( activity_9E=1) at( activity_10E=1) at( activity_11E=1) at( activity_12E = 1) at( activity_13E = 1) at( activity_14E = 1) at( activity_15E = 1) at( activity_16E = 1) at( activity_17E = 1) at( activity_18E = 1) at( activity_19E = 1) at( activity_20E = 1) at( activity_22E = 1) at( activity_23E = 1) at( activity_24E = 1) at( activity_25E = 1) post
estimates store zposaffactivity
xtreg znegaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , fe
margins,  at(activity_1E=1) at(activity_2E=1) at( activity_3E=1) at( activity_4E=1) at( activity_5E=1) at(activity_6E=1) at( activity_7E=1) at( activity_8E=1) at( activity_9E=1) at( activity_10E=1) at( activity_11E=1) at( activity_12E = 1) at( activity_13E = 1) at( activity_14E = 1) at( activity_15E = 1) at( activity_16E = 1) at( activity_17E = 1) at( activity_18E = 1) at( activity_19E = 1) at( activity_20E = 1) at( activity_22E = 1) at( activity_23E = 1) at( activity_24E = 1) at( activity_25E = 1) post
estimates store znegaffactivity
xtreg zposaff i.placeE , fe
margins, at(placeE=(1(1)6)) post
estimates store zposaffplaceE
xtreg znegaff i.placeE , fe
margins, at(placeE=(1(1)6)) post
estimates store znegaffplaceE
xtreg zposaff spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe
margins, at(spousePers == 1) at(KidsPers == 1) at(FriendsPers == 1) at(ParentsPers == 1) at(WorkPers == 1) at(PetsPers == 1) at(OtherPers == 1) at(NobodyPers == 1) post
estimates store zposaffinteractPerson
xtreg znegaff spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe
margins, at(spousePers == 1) at(KidsPers == 1) at(FriendsPers == 1) at(ParentsPers == 1) at(WorkPers == 1) at(PetsPers == 1) at(OtherPers == 1) at(NobodyPers == 1) post
estimates store znegaffinteractPerson
xtreg zposaff spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
margins, at(spouseDist == 1) at(KidsDist == 1) at(FriendsDist == 1) at(ParentsDist == 1) at(WorkDist == 1) at(PetsDist == 1) at(OtherDist == 1) at(NobodyDist == 1) post
estimates store zposaffinteractDiston
xtreg znegaff spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
margins, at(spouseDist == 1) at(KidsDist == 1) at(FriendsDist == 1) at(ParentsDist == 1) at(WorkDist == 1) at(PetsDist == 1) at(OtherDist == 1) at(NobodyDist == 1) post
estimates store znegaffinteractDiston
	coefplot  ( zposaffactivity,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
			  ( znegaffactivity,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
			  , xline(0, lcolor(black*0.5) lstyle(solid)) xlab(-0.5(0.25)0.5)  sort(1, descending) scheme(burd ) ///
			  nodraw text(-1.5 -1.4 "A" ,  size(huge)) legend(order(4 "Negative" "affect" "(z-score)" 2 "Positive" "affect" "(z-score)" ) col(2) pos(6))    ///
			  title(Behaviours, pos(12)) name(act,replace)  ///
			  ylab(1 "Exercising" 2 "Going for a walk" 3 "Gardening" 4 "Pursuing a hobby" 5 "Taking care of children" 6 "Socialising" 7 "Drinking alcohol"  8 "Pray/worship/meditate" 9 "Eating" 10 "Commuting to work" 11 "Internet" 12 "Other" 13 "Resting/relaxing" 14 "Doing housework" 15 "Preparing food" 16 "Drinking" 17 "Watching TV/streaming " 18 "Listening to the radio" 19 "Doing nothing" 20 "Using social media"  21 "Schooling children" 22 "Shopping" 23 "Working/studying" 24 "Informing myself about Covid-19" , nogrid)
	coefplot  ( zposaffplaceE,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
			  ( znegaffplaceE,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
			  , xline(0, lcolor(black*0.5) lstyle(solid))   xlab(-0.5(0.25)0.5, nogrid)  sort(1, descending) scheme(burd ) ///
			  scale(1.3) legend(off)   ///
			  text(-2 -1.2 "B" ,  size(huge))  nodraw  title(Locations, pos(12)) name(place,replace) /// 
			  ylab(4 "At home" 5 "At work" 1 "Outdoors / nature" 6 "At a shop" 3 "At other peoples home" 2 "Somewhere else" ) 
	coefplot  ( zposaffinteractPerson,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
			  ( znegaffinteractPerson,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
			  , xline(0, lcolor(black*0.5) lstyle(solid))   xlab(-0.5(0.25)0.5, nogrid) sort(1, descending) scheme(burd ) ///
			  scale(1.3) legend(off)   ///
			  text(-2 -1.2 "C" ,  size(huge)) nodraw title(Personal interactions, pos(12))  name(perInter,replace) /// 
			  ylab(6 "Spouse/significant other" 3 "My children" 1 "Friends" 4 "Parents/relatives" 8 "Work-related" 2 "Pets" 7 "Other" 5 "Nobody" )
	coefplot  ( zposaffinteractDiston,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
			  ( znegaffinteractDiston,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
			  , xline(0, lcolor(black*0.5) lstyle(solid))   xlab(-0.5(0.25)0.5, nogrid)   sort(1, descending) scheme(burd ) ///
			  text(-2 -1.2 "D" ,  size(huge)) scale(1.3) legend(off)    ///
			    nodraw title(Remote interactions, pos(12))  name(distInter,replace) /// 
				ylab(7 "Spouse/significant other" 3 "My children" 6 "Friends" 4 "Parents/relatives" 8 "Work-related" 1 "Pets" 2 "Other" 5 "Nobody" )
graph combine place perInter distInter, col(1) name(placesocial, replace) scheme(burd)
graph combine act placesocial , scheme(burd ) graphregion(margin(zero)) xsize(4) 
graph export "BJHOGraph.png", replace

*** Table corresponding to Graph 1
use "C:\Users\lklad\OneDrive\Projects\CoronaDRM\British Health Psych\Data and Do file\DRMCoronaWave1DTA_EPISODE_BJHP", clear
xtset id
xtreg zposaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , fe
outreg2 using zPosAffRegsFE.doc, replace 
xtreg znegaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , fe
outreg2 using negaffRegsFE.doc, replace 
xtreg zposaff i.placeE , fe
outreg2 using zPosAffRegsLocFE.doc, replace 
xtreg znegaff i.placeE , fe
outreg2 using negaffRegsLocFE.doc, replace 
xtreg zposaff spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe
outreg2 using zPosAffRegsPersonalFE.doc, replace 
xtreg znegaff spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe
outreg2 using zNegAffRegsPersonalFE.doc, replace 
xtreg zposaff spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
outreg2 using zPosAffRegsDistFE.doc, replace 
xtreg znegaff spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
outreg2 using zNegAffRegsDistFE.doc, replace 

* To calculate the Benjamini-Hochberg Adjusted P value
xtset id
set pformat %5.4f
xtreg zposaff Commuting Working Shopping Internet Informing_Covid19 Housework Eating Drinking Pray_worship_meditate Preparing_food Socialising Taking_care_children schooling_children Watching_Streaming_TV Social_media Listening_radio Resting_relaxing Walk Exercising Hobby Gardening Nothing Other , fe 
xtreg znegaff Commuting Working Shopping Internet Informing_Covid19 Housework Eating Drinking Pray_worship_meditate Preparing_food Socialising Taking_care_children schooling_children Watching_Streaming_TV Social_media Listening_radio Resting_relaxing Walk Exercising Hobby Gardening Nothing Other , fe 
xtreg zposaff i.placeE , fe
xtreg znegaff i.placeE , fe
xtreg zposaff spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe
xtreg znegaff spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe
xtreg zposaff spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
xtreg znegaff spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe

*** Robustness checks

* Mutually adjusted coefficients
use "C:\Users\lklad\OneDrive\Projects\CoronaDRM\British Health Psych\Data and Do file\DRMCoronaWave1DTA_EPISODE_BJHP", clear
xtset id
xtreg zposaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E i.placeE spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
margins,  at(activity_1E=1) at(activity_2E=1) at( activity_3E=1) at( activity_4E=1) at( activity_5E=1) at(activity_6E=1) at( activity_7E=1) at( activity_8E=1) at( activity_9E=1) at( activity_10E=1) at( activity_11E=1) at( activity_12E = 1) at( activity_13E = 1) at( activity_14E = 1) at( activity_15E = 1) at( activity_16E = 1) at( activity_17E = 1) at( activity_18E = 1) at( activity_19E = 1) at( activity_20E = 1) at( activity_22E = 1) at( activity_23E = 1) at( activity_24E = 1) at( activity_25E = 1) post
estimates store zposaffactivityFULL
xtreg znegaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E i.placeE spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
margins,  at(activity_1E=1) at(activity_2E=1) at( activity_3E=1) at( activity_4E=1) at( activity_5E=1) at(activity_6E=1) at( activity_7E=1) at( activity_8E=1) at( activity_9E=1) at( activity_10E=1) at( activity_11E=1) at( activity_12E = 1) at( activity_13E = 1) at( activity_14E = 1) at( activity_15E = 1) at( activity_16E = 1) at( activity_17E = 1) at( activity_18E = 1) at( activity_19E = 1) at( activity_20E = 1) at( activity_22E = 1) at( activity_23E = 1) at( activity_24E = 1) at( activity_25E = 1) post
estimates store znegaffactivityFULL
xtreg zposaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E i.placeE spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
margins, at(placeE=(1(1)6)) post
estimates store zposaffplaceEFULL
xtreg znegaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E i.placeE spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
margins, at(placeE=(1(1)6)) post
estimates store znegaffplaceEFULL
xtreg zposaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E i.placeE spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
margins, at(spousePers == 1) at(KidsPers == 1) at(FriendsPers == 1) at(ParentsPers == 1) at(WorkPers == 1) at(PetsPers == 1) at(OtherPers == 1) at(NobodyPers == 1) post
estimates store zposaffinteractPersonFULL
xtreg znegaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E i.placeE spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
margins, at(spousePers == 1) at(KidsPers == 1) at(FriendsPers == 1) at(ParentsPers == 1) at(WorkPers == 1) at(PetsPers == 1) at(OtherPers == 1) at(NobodyPers == 1) post
estimates store znegaffinteractPersonFULL
xtreg zposaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E i.placeE spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
margins, at(spouseDist == 1) at(KidsDist == 1) at(FriendsDist == 1) at(ParentsDist == 1) at(WorkDist == 1) at(PetsDist == 1) at(OtherDist == 1) at(NobodyDist == 1) post
estimates store zposaffinteractDistonFULL
xtreg znegaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E i.placeE spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
margins, at(spouseDist == 1) at(KidsDist == 1) at(FriendsDist == 1) at(ParentsDist == 1) at(WorkDist == 1) at(PetsDist == 1) at(OtherDist == 1) at(NobodyDist == 1) post
estimates store znegaffinteractDistonFULL
	coefplot  ( zposaffactivityFULL,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
			  ( znegaffactivityFULL,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
			  , xline(0, lcolor(black*0.5) lstyle(solid))   xlab(-0.5(0.25)0.5)  sort(1, descending) scheme(burd ) ///
			   text(-1.5 -1.4 "A" ,  size(huge)) legend(order(4 "Negative" "affect" "(z-score)" 2 "Positive" "affect" "(z-score)" ) col(2) pos(6))    ///
			  nodraw  title(Activities, pos(12)) name(actFULL,replace) /// 
			  ylab( 1 "Exercising" 2 "Gardening" 3 "Pursuing a hobby" 4 "Taking care of children" 5 "Socialising" 6 "Drinking alcohol" 7 "Pray/worship/meditate" 8 "Going for a walk" 9 "Eating" 10 "Commuting to work"  			  11 "Internet" 12 "Resting/relaxing" 13 "Other" 14 "Doing housework" 15 "Preparing food" 16 "Watching TV/streaming" 			  17 "Drinking" 18 "Listening to the radio" 19 "Doing nothing" 20 "Using social media" 21 "Shopping" 22 "Working/studying" 23 "Schooling children" 24 "Informing myself about Covid-19", nogrid)
	coefplot  ( zposaffplaceEFULL,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
			  ( znegaffplaceEFULL,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
			  , xline(0, lcolor(black*0.5) lstyle(solid))   xlab(-0.5(0.25)0.5, nogrid)  sort(1, descending) scheme(burd ) ///
			  nodraw  scale(1.3) legend(off) text(-2 -1.2 "B" ,  size(huge)) title(Locations, pos(12)) name(placeFULL,replace) ///
			  ylab(6 "At home" 2 "At work" 1 "Outdoors / nature" 5 "At a shop" 4 "At other peoples home" 3 "Somewhere else" ) 
	coefplot  ( zposaffinteractPersonFULL,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
			  ( znegaffinteractPersonFULL,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
			  , xline(0, lcolor(black*0.5) lstyle(solid))   xlab(-0.5(0.25)0.5, nogrid) sort(1, descending) scheme(burd ) ///
			  scale(1.3) legend(off) text(-2 -1.2 "C" ,  size(huge)) nodraw  title(Personal interactions, pos(12))  name(perInterFULL,replace) /// 
			  ylab(6 "Spouse/significant other" 3 "My children" 1 "Friends" 4 "Parents/relatives" 8 "Work-related" 2 "Pets" 7 "Other" 5 "Nobody" )
	coefplot  ( zposaffinteractDistonFULL,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
			  ( znegaffinteractDistonFULL,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
			  , xline(0, lcolor(black*0.5) lstyle(solid))   xlab(-0.5(0.25)0.5, nogrid)   sort(1, descending) scheme(burd ) ///
			  text(-2 -1.2 "D" ,  size(huge)) scale(1.3) legend(off)    ///
			  nodraw title(Remote interactions, pos(12))  name(distInterFULL,replace) ///	
			  ylab(8 "Spouse/significant other" 2 "My children" 7 "Friends" 5 "Parents/relatives" 6 "Work-related" 3 "Pets" 1 "Other" 4 "Nobody" )
graph combine placeFULL perInterFULL distInterFULL, col(1) name(placesocialFULL, replace) scheme(burd)
graph combine actFULL placesocialFULL , scheme(burd ) graphregion(margin(zero)) xsize(4) title(Fixed Effects Regressions (mutually adjusted) , pos(12))
graph export "BJHOGraph2.png", replace

* Random effects models
use "C:\Users\lklad\OneDrive\Projects\CoronaDRM\British Health Psych\Data and Do file\DRMCoronaWave1DTA_EPISODE_BJHP", clear
xtset id
xtreg zposaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , re
margins,  at(activity_1E=1) at(activity_2E=1) at( activity_3E=1) at( activity_4E=1) at( activity_5E=1) at(activity_6E=1) at( activity_7E=1) at( activity_8E=1) at( activity_9E=1) at( activity_10E=1) at( activity_11E=1) at( activity_12E = 1) at( activity_13E = 1) at( activity_14E = 1) at( activity_15E = 1) at( activity_16E = 1) at( activity_17E = 1) at( activity_18E = 1) at( activity_19E = 1) at( activity_20E = 1) at( activity_22E = 1) at( activity_23E = 1) at( activity_24E = 1) at( activity_25E = 1) post
estimates store zposaffactivityRE
xtreg znegaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , re
margins,  at(activity_1E=1) at(activity_2E=1) at( activity_3E=1) at( activity_4E=1) at( activity_5E=1) at(activity_6E=1) at( activity_7E=1) at( activity_8E=1) at( activity_9E=1) at( activity_10E=1) at( activity_11E=1) at( activity_12E = 1) at( activity_13E = 1) at( activity_14E = 1) at( activity_15E = 1) at( activity_16E = 1) at( activity_17E = 1) at( activity_18E = 1) at( activity_19E = 1) at( activity_20E = 1) at( activity_22E = 1) at( activity_23E = 1) at( activity_24E = 1) at( activity_25E = 1) post
estimates store znegaffactivityRE
xtreg zposaff i.placeE , re
margins, at(placeE=(1(1)6)) post
estimates store zposaffplaceERE
xtreg znegaff i.placeE , re
margins, at(placeE=(1(1)6)) post
estimates store znegaffplaceERE
xtreg zposaff spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , re
margins, at(spousePers == 1) at(KidsPers == 1) at(FriendsPers == 1) at(ParentsPers == 1) at(WorkPers == 1) at(PetsPers == 1) at(OtherPers == 1) at(NobodyPers == 1) post
estimates store zposaffinteractPersonRE
xtreg znegaff spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , re
margins, at(spousePers == 1) at(KidsPers == 1) at(FriendsPers == 1) at(ParentsPers == 1) at(WorkPers == 1) at(PetsPers == 1) at(OtherPers == 1) at(NobodyPers == 1) post
estimates store znegaffinteractPersonRE
xtreg zposaff spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , re
margins, at(spouseDist == 1) at(KidsDist == 1) at(FriendsDist == 1) at(ParentsDist == 1) at(WorkDist == 1) at(PetsDist == 1) at(OtherDist == 1) at(NobodyDist == 1) post
estimates store zposaffinteractDistonRE
xtreg znegaff spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , re
margins, at(spouseDist == 1) at(KidsDist == 1) at(FriendsDist == 1) at(ParentsDist == 1) at(WorkDist == 1) at(PetsDist == 1) at(OtherDist == 1) at(NobodyDist == 1) post
estimates store znegaffinteractDistonRE
	coefplot  ( zposaffactivityRE,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
			  ( znegaffactivityRE,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
			  , xline(0, lcolor(black*0.5) lstyle(solid)) xlab(-0.5(0.25)0.5)  sort(1, descending) scheme(burd ) ///
			   text(-1.5 -1.4 "A" ,  size(huge)) legend(order(4 "Negative" "affect" "(z-score)" 2 "Positive" "affect" "(z-score)" ) col(2) pos(6))    ///
			  title(Activities, pos(12)) name(actRE,replace) ///
			  nodraw ylab(1 "Exercising" 2 "Gardening" 3 "Going for a walk" 4 "Pursuing a hobby" 5 "Socialising" 6 "Taking care of children" 7 "Pray/worship/meditate"  8 "Eating" 9 "Drinking alcohol" 10 "Commuting to work" 11 "Internet" 12 "Other" 13 "Resting/relaxing" 14 "Preparing food" 15 "Drinking" 16 "Doing housework" 17 "Watching TV/streaming" 18 "Listening to the radio" 19 "Using social media" 20 "Schooling children"  21 "Working/studying" 22 "Doing nothing" 23 "Shopping" 24 "Informing myself about Covid-19" , nogrid)
	coefplot  ( zposaffplaceERE,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
			  ( znegaffplaceERE,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
			  , xline(0, lcolor(black*0.5) lstyle(solid))   xlab(-0.5(0.25)0.5, nogrid)  sort(1, descending) scheme(burd ) ///
			  scale(1.3) legend(off)   ///
			  text(-2 -1.2 "B" ,  size(huge)) nodraw title(Locations, pos(12)) name(placeRE,replace) /// 
			  ylab(4 "At home" 5 "At work" 1 "Outdoors / nature" 6 "At a shop" 2 "At other peoples home" 3 "Somewhere else" ) 
	coefplot  ( zposaffinteractPersonRE,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
			  ( znegaffinteractPersonRE,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
			  , xline(0, lcolor(black*0.5) lstyle(solid))   xlab(-0.5(0.25)0.5, nogrid) sort(1, descending) scheme(burd ) ///
			  scale(1.3) legend(off)   ///
			  text(-2 -1.2 "C" ,  size(huge)) nodraw title(Personal interactions, pos(12))  name(perInterRE,replace)  /// 
			  ylab(6 "Spouse/significant other" 3 "My children" 1 "Friends" 4 "Parents/relatives" 8 "Work-related" 2 "Pets" 7 "Other" 5 "Nobody" )
	coefplot  ( zposaffinteractDistonRE,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
			  ( znegaffinteractDistonRE,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
			  , xline(0, lcolor(black*0.5) lstyle(solid))   xlab(-0.5(0.25)0.5, nogrid)   sort(1, descending) scheme(burd ) ///
			  text(-2 -1.2 "D" ,  size(huge)) scale(1.3) legend(off)    ///
			   nodraw title(Remote interactions, pos(12))  name(distInterRE,replace) /// 
				ylab(7 "Spouse/significant other" 3 "My children" 6 "Friends" 5 "Parents/relatives" 8 "Work-related" 1 "Pets" 2 "Other" 4 "Nobody" )
graph combine placeRE perInterRE distInterRE, col(1) name(placesocialRE, replace) scheme(burd)
graph combine actRE placesocialRE , scheme(burd ) graphregion(margin(zero)) xsize(4) title(Random Effects Regressions (no controls) , pos(12))
graph export "BJHOGraph3.png", replace

* Random effects models controlled for age and gender
use "C:\Users\lklad\OneDrive\Projects\CoronaDRM\British Health Psych\Data and Do file\DRMCoronaWave1DTA_EPISODE_BJHP", clear
xtset id
xtreg zposaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E age i.sex , re
margins,  at(activity_1E=1) at(activity_2E=1) at( activity_3E=1) at( activity_4E=1) at( activity_5E=1) at(activity_6E=1) at( activity_7E=1) at( activity_8E=1) at( activity_9E=1) at( activity_10E=1) at( activity_11E=1) at( activity_12E = 1) at( activity_13E = 1) at( activity_14E = 1) at( activity_15E = 1) at( activity_16E = 1) at( activity_17E = 1) at( activity_18E = 1) at( activity_19E = 1) at( activity_20E = 1) at( activity_22E = 1) at( activity_23E = 1) at( activity_24E = 1) at( activity_25E = 1) post
estimates store zposaffactivityRECON
xtreg znegaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E age i.sex , re
margins,  at(activity_1E=1) at(activity_2E=1) at( activity_3E=1) at( activity_4E=1) at( activity_5E=1) at(activity_6E=1) at( activity_7E=1) at( activity_8E=1) at( activity_9E=1) at( activity_10E=1) at( activity_11E=1) at( activity_12E = 1) at( activity_13E = 1) at( activity_14E = 1) at( activity_15E = 1) at( activity_16E = 1) at( activity_17E = 1) at( activity_18E = 1) at( activity_19E = 1) at( activity_20E = 1) at( activity_22E = 1) at( activity_23E = 1) at( activity_24E = 1) at( activity_25E = 1) post
estimates store znegaffactivityRECON
xtreg zposaff i.placeE age i.sex , re
margins, at(placeE=(1(1)6)) post
estimates store zposaffplaceERECON
xtreg znegaff i.placeE age i.sex , re
margins, at(placeE=(1(1)6)) post
estimates store znegaffplaceERECON
xtreg zposaff spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers age i.sex , re
margins, at(spousePers == 1) at(KidsPers == 1) at(FriendsPers == 1) at(ParentsPers == 1) at(WorkPers == 1) at(PetsPers == 1) at(OtherPers == 1) at(NobodyPers == 1) post
estimates store zposaffinteractPersonRECON
xtreg znegaff spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers age i.sex , re
margins, at(spousePers == 1) at(KidsPers == 1) at(FriendsPers == 1) at(ParentsPers == 1) at(WorkPers == 1) at(PetsPers == 1) at(OtherPers == 1) at(NobodyPers == 1) post
estimates store znegaffinteractPersonRECON
xtreg zposaff spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist age i.sex , re
margins, at(spouseDist == 1) at(KidsDist == 1) at(FriendsDist == 1) at(ParentsDist == 1) at(WorkDist == 1) at(PetsDist == 1) at(OtherDist == 1) at(NobodyDist == 1) post
estimates store zposaffinteractDistonRECON
xtreg znegaff spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist age i.sex , re
margins, at(spouseDist == 1) at(KidsDist == 1) at(FriendsDist == 1) at(ParentsDist == 1) at(WorkDist == 1) at(PetsDist == 1) at(OtherDist == 1) at(NobodyDist == 1) post
estimates store znegaffinteractDistonRECON
		coefplot  ( zposaffactivityRECON,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
				  ( znegaffactivityRECON,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
				  , xline(0, lcolor(black*0.5) lstyle(solid)) xlab(-0.5(0.25)0.5)  sort(1, descending) scheme(burd ) ///
				   text(-1.5 -1.4 "A" ,  size(huge)) legend(order(4 "Negative" "affect" "(z-score)" 2 "Positive" "affect" "(z-score)" ) col(2) pos(6))    ///
				  nodraw title(Activities, pos(12)) name(actRECON,replace) ///
				  ylab(1 "Exercising" 2 "Going for a walk" 3 "Gardening" 4 "Pursuing a hobby" 5 "Taking care of children" 6 "Socialising" 7 "Pray/worship/meditate"  8 "Eating" 9 "Commuting to work" 10 "Drinking alcohol" 11 "Internet" 12 "Other" 13 "Resting/relaxing" 14 "Preparing food" 15 "Doing housework" 16 "Drinking" 17 "Watching TV/streaming" 18 "Listening to the radio" 19 "Schooling children" 20 "Using social media"  21 "Working/studying" 22 "Doing nothing" 23 "Shopping" 24 "Informing myself about Covid-19" , nogrid)
		coefplot  ( zposaffplaceERECON,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
				  ( znegaffplaceERECON,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
				  , xline(0, lcolor(black*0.5) lstyle(solid))   xlab(-0.5(0.25)0.5, nogrid)  sort(1, descending) scheme(burd ) ///
				  nodraw  scale(1.3) legend(off) text(-2 -1.2 "B" ,  size(huge))  title(Locations, pos(12)) name(placeRECON,replace) /// 
				  ylab(4 "At home" 5 "At work" 1 "Outdoors / nature" 6 "At a shop" 2 "At other peoples home" 3 "Somewhere else" ) 
		coefplot  ( zposaffinteractPersonRECON,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
				  ( znegaffinteractPersonRECON,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
				  , xline(0, lcolor(black*0.5) lstyle(solid))   xlab(-0.5(0.25)0.5, nogrid) sort(1, descending) scheme(burd ) ///
				  scale(1.3) legend(off)   ///
				  nodraw text(-2 -1.2 "C" ,  size(huge)) title(Personal interactions, pos(12))  name(perInterRECON,replace) /// 
				  ylab(6 "Spouse/significant other" 3 "My children" 1 "Friends" 4 "Parents/relatives" 8 "Work-related" 2 "Pets" 7 "Other" 5 "Nobody" )
		coefplot  ( zposaffinteractDistonRECON,  msymbol(D) color(ebblue*2)  ciopts(color(ebblue*2)))  ///
				  ( znegaffinteractDistonRECON,  msymbol(O)  color(red*1.75)  ciopts(color(red*1.75))) ///
				  , xline(0, lcolor(black*0.5) lstyle(solid))   xlab(-0.5(0.25)0.5, nogrid)   sort(1, descending) scheme(burd ) ///
				  text(-2 -1.2 "D" ,  size(huge)) scale(1.3) legend(off)    ///
					title(Remote interactions, pos(12))  name(distInterRECON,replace) /// 
					nodraw ylab(7 "Spouse/significant other" 3 "My children" 6 "Friends" 5 "Parents/relatives" 8 "Work-related" 1 "Pets" 2 "Other" 4 "Nobody" )
graph combine placeRECON perInterRECON distInterRECON, col(1) name(placesocialRECON, replace) scheme(burd)
graph combine actRECON placesocialRECON , scheme(burd ) graphregion(margin(zero)) xsize(4) title(Random Effects Regressions (controls: age, gender) , pos(12))
graph export "BJHOGraph4.png", replace

