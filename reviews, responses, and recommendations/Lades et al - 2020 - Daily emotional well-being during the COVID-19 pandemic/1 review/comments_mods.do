*Every episode can have many activites
cd "C:\Users\adema\Dropbox\Projects_own\ERROR_replication"

use "DRMCoronaWave1DTA_EPISODE_CLEAN", clear

*I: standard error corrections:
{
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

}
*II: Interpretation of "reference" category
{
    gen ep_id = _n
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
    bys ep_id: gen N_pers_ep = spousePers +KidsPers +FriendsPers+ ParentsPers +WorkPers+ PetsPers +OtherPers+ NobodyPers

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

}
*III: absence of "persons":
{
    gen total_perswith = spousePers +KidsPers+ FriendsPers +ParentsPers+ WorkPers +PetsPers +OtherPers+ NobodyPers
    gen total_distwith = spouseDist +KidsDist +FriendsDist +ParentsDist +WorkDist +PetsDist +OtherDist+ NobodyDist
    gen someone_perswith = (spousePers +KidsPers+ FriendsPers +ParentsPers+ WorkPers +PetsPers +OtherPers)>0
    gen someone_distwith = (spouseDist +KidsDist +FriendsDist +ParentsDist +WorkDist +PetsDist +OtherDist)>0
    tab someone_perswith someone_distwith, su(NobodyPers)
    tab someone_perswith someone_distwith, su(NobodyDist)
    tab total_perswith NobodyPers
    tab total_distwith NobodyDist 

    gen Nobody = (spousePers==0& spouseDist==0& KidsPers ==0&KidsDist==0& FriendsPers==0& FriendsDist==0& ParentsPers==0& ParentsDist ==0&WorkPers==0& WorkDist ==0&PetsPers ==0&PetsDist ==0&OtherPers==0& OtherDist)
    eststo clear
    eststo: xtreg zposaff  spousePers spouseDist KidsPers KidsDist FriendsPers FriendsDist ParentsPers ParentsDist WorkPers WorkDist PetsPers PetsDist OtherPers OtherDist Nobody       , fe 
    eststo: xtreg znegaff  spousePers spouseDist KidsPers KidsDist FriendsPers FriendsDist ParentsPers ParentsDist WorkPers WorkDist PetsPers PetsDist OtherPers OtherDist Nobody, fe 
    coefplot est1 est2 , keep(*Pers *Dist Nobody) xline(0)  p1(label(Positive affect)) p2(label(Negative affect))
    graph export pers_dist_together.png, replace


}
*Benjamini-Hochberg:
{
    *I ordered the regressors on t statistic. The benjamini Hochberg method rejects when the ith p-value in rank (starting from smallest p-value) is lower than i*0.05/N, where N is the number of hypotheses to test
    xtreg zposaff  activity_11E    activity_6E activity_8E activity_18E  activity_1E  activity_10E activity_24E  activity_25E     activity_9E       activity_15E activity_4E activity_17E activity_14E activity_12E     activity_22E activity_16E     activity_7E activity_23E activity_3E activity_13E activity_5E activity_21E activity_2E activity_19E  activity_20E , fe
}

