*Every episode can have many activites
cd "C:\Users\adema\Dropbox\Projects_own\ERROR_replication"
set scheme plotplainblind
use "DRMCoronaWave1DTA_EPISODE_CLEAN", clear
xtset id
gen ep_id = _n

*II.3: Potential duplicates:
{
    log using .\log_23.log, replace
    l ParticipantID sex age region county if dup2>=1&episode==1


    *Main figure w/o these observations:
    eststo clear
    eststo: xtreg zposaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , fe 
    eststo: xtreg znegaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , fe 
    *Choosing resting/relaxing as the refcat:
    coefplot est1,  bylabel("Positive affect")  ||   est2 , bylabel("Negative affect") keep(activity*) xline(0) p1(label(Without # of events FEs)) p2(label(with # of events FEs))
    graph export mod_A.png, replace
    bys ep_id: gen N_pers_ep = spousePers +KidsPers +FriendsPers+ ParentsPers +WorkPers+ PetsPers +OtherPers+ NobodyPers

    eststo clear
    eststo: xtreg zposaff  spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe 
    eststo: xtreg znegaff  spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe 
    coefplot est1,  bylabel("Positive affect")  || est2, bylabel("Negative affect") keep(*Pers) xline(0)  p1(label(Without # of events FEs)) p2(label(with # of events FEs))
    graph export mod_C.png, replace
    eststo clear
    eststo: xtreg zposaff  spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe 
    eststo: xtreg znegaff  spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe 
    coefplot est1 ,  bylabel("Positive affect")  || est2, bylabel("Negative affect") keep(*Dist) xline(0)  p1(label(Without # of events FEs)) p2(label(with # of events FEs))
    graph export mod_D.png, replace


    log close
    graphlog using log_23.log, lspacing(1) replace


}
*II.4: standard error corrections:
{
    log using .\log_24.log, replace

    xtset id

    xtreg zposaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , fe

    xtreg zposaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , fe vce(cluster id)

    xtreg znegaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , fe

    xtreg znegaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , fe vce(cluster id)


    xtreg zposaff spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe
    xtreg zposaff spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe vce(cluster id)
    xtreg znegaff spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe
    xtreg znegaff spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe vce(cluster id)

    xtreg zposaff spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
    xtreg zposaff spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe vce(cluster id)
    xtreg znegaff spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe
    xtreg znegaff spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe vce(cluster id)

    xtreg zposaff i.placeE , fe
    xtreg zposaff i.placeE , fe vce(cluster id)
    xtreg zposaff i.placeE , fe
    xtreg zposaff i.placeE , fe vce(cluster id)
    log close
    graphlog using log_24.log, lspacing(1) replace

}
*II.5 Benjamini-Hochberg approach to MHT:
{
    log using .\log_25.log, replace

    *I ordered the regressors on t statistic. The benjamini Hochberg method rejects when the ith p-value in rank (starting from smallest p-value) is lower than i*0.05/N, where N is the number of hypotheses to test
    xtreg zposaff  activity_11E    activity_6E activity_8E activity_18E  activity_1E  activity_10E activity_24E  activity_25E     activity_9E       activity_15E activity_4E activity_17E activity_14E activity_12E     activity_22E activity_16E     activity_7E activity_23E activity_3E activity_13E activity_5E activity_21E activity_2E activity_19E  activity_20E , fe
    log close
    graphlog using log_25.log, lspacing(1) replace

}
*III.1: Interpretation of "reference" category
{
    log using .\log_31.log, replace

    bys ep_id: gen N_act_ep = activity_1E+ activity_2E+ activity_3E +activity_4E +activity_5E+ activity_6E +activity_7E+ activity_8E +activity_9E +activity_10E+ activity_11E+ activity_12E +activity_13E +activity_14E+ activity_15E+ activity_16E +activity_17E +activity_18E+ activity_19E +activity_20E +activity_21E +activity_22E +activity_23E+ activity_24E+ activity_25E 
    eststo clear
    eststo: xtreg zposaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , fe vce(cluster id)
    eststo: xtreg znegaff activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E activity_18E activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , fe vce(cluster id)
    *Choosing resting/relaxing as the refcat:
    eststo: xtreg   zposaff i.N_act_ep  activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E  activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E , fe vce(cluster id)
    eststo: xtreg   znegaff i.N_act_ep activity_1E activity_2E activity_3E activity_4E activity_5E activity_6E activity_7E activity_8E activity_9E activity_10E activity_11E activity_12E activity_13E activity_14E activity_15E activity_16E activity_17E  activity_19E activity_20E activity_21E activity_22E activity_23E activity_24E activity_25E, fe vce(cluster id)
    coefplot est1 est3,  bylabel("Positive affect")  || est2 est4, bylabel("Negative affect") keep(*N_act_ep*) xline(0)
    coefplot est1 est3,  bylabel("Positive affect")  ||     est2 est4, bylabel("Negative affect") keep(activity*) xline(0) p1(label(Without # of events FEs)) p2(label(with # of events FEs))
    graph export reference_change_1A.png, replace
    *bys ep_id: gen N_pers_ep = spousePers +KidsPers +FriendsPers+ ParentsPers +WorkPers+ PetsPers +OtherPers+ NobodyPers

    eststo clear
    eststo: xtreg zposaff  spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe vce(cluster id)
    eststo: xtreg zposaff  i.N_pers_ep spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe vce(cluster id)
    eststo: xtreg znegaff  spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe vce(cluster id)
    eststo: xtreg znegaff  i.N_pers_ep spousePers KidsPers FriendsPers ParentsPers WorkPers PetsPers OtherPers NobodyPers , fe vce(cluster id)
    coefplot est1 est2,  bylabel("Positive affect")  || est3 est4, bylabel("Negative affect") keep(*Pers) xline(0)  p1(label(Without # of events FEs)) p2(label(with # of events FEs))
    graph export reference_change_1C.png, replace
    eststo clear
    eststo: xtreg zposaff  spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe vce(cluster id)
    eststo: xtreg zposaff  i.N_pers_ep spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe vce(cluster id)
    eststo: xtreg znegaff  spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe vce(cluster id)
    eststo: xtreg znegaff  i.N_pers_ep spouseDist KidsDist FriendsDist ParentsDist WorkDist PetsDist OtherDist NobodyDist , fe vce(cluster id)
    coefplot est1 est2,  bylabel("Positive affect")  || est3 est4, bylabel("Negative affect") keep(*Dist) xline(0)  p1(label(Without # of events FEs)) p2(label(with # of events FEs))
    graph export reference_change_1D.png, replace
    log close
    graphlog using log_31.log, lspacing(1) replace

}
