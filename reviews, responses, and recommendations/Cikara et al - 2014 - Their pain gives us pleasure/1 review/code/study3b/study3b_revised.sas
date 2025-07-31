libname study3b "/home/u64240311/ERROR/study3b";  
  
proc import datafile="/home/u64240311/ERROR/study3b/ArbitraryGroups_STUDY3b_SAS.csv"  
    out=study3b.final  
    dbms=csv  
    replace;  
    guessingrows=MAX;  
    getnames=yes;  
run;

data study3b.final;
set study3b.final(where=(pid>0));
run;


proc print data=study3b.final(obs=64);
run;


**THIS IS THE FULL MODEL;

ods output CovParms = Study3b_full; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group story*resptype group*resptype bef_aft*story*group bef_aft*story*resptype bef_aft*group*resptype story*group*resptype bef_aft*story*group*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
lsmeans bef_aft*story*group*resptype / slice = bef_aft*story*resptype diff = all;
run;
quit;
ods output close;

ods output CovParms = Study3b_Null; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3b_woBA; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid story group storynum resptype;
model rating = story group resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3b_woStory; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft group storynum resptype;
model rating = bef_aft group resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3b_woGroup; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story  storynum resptype;
model rating = bef_aft story resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3b_woResptype; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3b_woBAXStory; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*group bef_aft*resptype story*group story*resptype group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3b_woBAXGroup; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*resptype story*group story*resptype group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3b_woBAXResptype; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group story*group story*resptype group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3b_woStoryXGroup; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*resptype group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;


ods output CovParms = Study3b_woStoryXResptype; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3b_woGroupXResptype; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group story*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3b_woBAXStoryXGroup; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group story*resptype group*resptype bef_aft*story*resptype bef_aft*group*resptype story*group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3b_woBAXStoryXResptype; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group story*resptype group*resptype bef_aft*story*group bef_aft*group*resptype story*group*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3b_woBAXGroupXResptype; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group story*resptype group*resptype bef_aft*story*group bef_aft*story*resptype story*group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3b_woStoryXGroupXResptype; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group story*resptype group*resptype bef_aft*story*group bef_aft*story*resptype bef_aft*group*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3b_wo4way; 
proc mixed data=study3b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group story*resptype group*resptype bef_aft*story*group bef_aft*story*resptype bef_aft*group*resptype story*group*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3b_full hold=2,4;
run;
quit;
ods output close;



DATA Study3b_full;
set Study3b_full;
if strip(CovParm) = "resptype UN(1,1)" or strip(CovParm) = "UN(2,2)";
run;

DATA Study3b_Null;
set Study3b_Null;
if strip(CovParm) = "resptype UN(1,1)" or strip(CovParm) = "UN(2,2)";
run;

***COMPUTING F^2 FOR MAIN EFFECT OF COND2;
proc sort data=Study3b_full; by CovParm; run; 
proc sort data=Study3b_null; by CovParm; run; 
proc sort data=Study3b_woBA; by CovParm; run;
DATA Study3b_woBA_op;
merge Study3b_full (rename=(Estimate=full)) Study3b_Null (rename =(Estimate=null)) Study3b_woBA (rename=(Estimate=woBA)); by CovParm;
DROP Subject;
run;

DATA resultsStudy3b_woBA; set Study3b_woBA_op;
DROP full null woBA;
R2full = (null - full)/null;
R2woBA = (null - woBA)/null;
f2 = (R2full - R2woBA)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3b_woBA;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF STORY;
proc sort data=Study3b_woStory; by CovParm; run;

DATA Study3b_woStory_op;
merge Study3b_full (rename=(Estimate=full)) Study3b_Null (rename =(Estimate=null)) Study3b_woStory (rename=(Estimate=woStory)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3b_woStory; set Study3b_woStory_op;
DROP full null woStory;
R2full = (null - full)/null;
R2woStory = (null - woStory)/null;
f2 = (R2full - R2woStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3b_woStory;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF GROUP;
proc sort data=Study3b_woGroup; by CovParm; run;
DATA Study3b_woGroup_op;
merge Study3b_full (rename=(Estimate=full)) Study3b_Null (rename =(Estimate=null)) Study3b_woGroup (rename=(Estimate=woGroup)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3b_woGroup; set Study3b_woGroup_op;
DROP full null woGroup;
R2full = (null - full)/null;
R2woGroup = (null - woGroup)/null;
f2 = (R2full - R2woGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3b_woGroup;
run;


***COMPUTING F^2 FOR MAIN EFFECT OF RESPTYPE;
proc sort data=Study3b_woResptype; by CovParm; run;
DATA Study3b_woResptype_op;
merge Study3b_full (rename=(Estimate=full)) Study3b_Null (rename =(Estimate=null)) Study3b_woResptype (rename=(Estimate=woResptype)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3b_woResptype; set Study3b_woResptype_op;
DROP full null woResptype;
R2full = (null - full)/null;
R2woResptype = (null - woResptype)/null;
f2 = (R2full - R2woResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3b_woResptype;
run;


***COMPUTING F^2 FOR CONDXSTORY;
proc sort data=Study3b_woBAXStory; by CovParm; run;
DATA Study3b_woBAXStory_op;
merge Study3b_full (rename=(Estimate=full)) Study3b_Null (rename =(Estimate=null)) Study3b_woBAXStory (rename=(Estimate=woBAXStory)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3b_woBAXStory; set Study3b_woBAXStory_op;
DROP full null woBAXStory;
R2full = (null - full)/null;
R2woBAXStory = (null - woBAXStory)/null;
f2 = (R2full - R2woBAXStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3b_woBAXStory;
run;

***COMPUTING F^2 FOR CONDXGROUP;
proc sort data=Study3b_woBAXGroup; by CovParm; run;
DATA Study3b_woBAXGroup_op;
merge Study3b_full (rename=(Estimate=full)) Study3b_Null (rename =(Estimate=null)) Study3b_woBAXGroup (rename=(Estimate=woBAXGroup)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3b_woBAXGroup; set Study3b_woBAXGroup_op;
DROP full null woBAXGroup;
R2full = (null - full)/null;
R2woBAXGroup = (null - woBAXGroup)/null;
f2 = (R2full - R2woBAXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3b_woBAXGroup;
run;

***COMPUTING F^2 FOR CONDXRESPTYPE;
proc sort data=Study3b_woBAXResptype; by CovParm; run;
DATA Study3b_woBAXResptype_op;
merge Study3b_full (rename=(Estimate=full)) Study3b_Null (rename =(Estimate=null)) Study3b_woBAXResptype (rename=(Estimate=woBAXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3b_woBAXResptype; set Study3b_woBAXResptype_op;
DROP full null woBAXResptype;
R2full = (null - full)/null;
R2woBAXResptype = (null - woBAXResptype)/null;
f2 = (R2full - R2woBAXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3b_woBAXResptype;
run;


***COMPUTING F^2 FOR STORYXGROUP;
proc sort data=Study3b_woStoryXGroup; by CovParm; run;
DATA Study3b_woStoryXGroup_op;
merge Study3b_full (rename=(Estimate=full)) Study3b_Null (rename =(Estimate=null)) Study3b_woStoryXGroup (rename=(Estimate=woStoryXGroup)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3b_woStoryXGroup; set Study3b_woStoryXGroup_op;
DROP full null woStoryXGroup;
R2full = (null - full)/null;
R2woStoryXGroup = (null - woStoryXGroup)/null;
f2 = (R2full - R2woStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3b_woStoryXGroup;
run;

***COMPUTING F^2 FOR STORYXRESPTYPE;
proc sort data=Study3b_woStoryXResptype; by CovParm; run;
DATA Study3b_woStoryXResptype_op;
merge Study3b_full (rename=(Estimate=full)) Study3b_Null (rename =(Estimate=null)) Study3b_woStoryXResptype (rename=(Estimate=woStoryXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3b_woStoryXResptype; set Study3b_woStoryXResptype_op;
DROP full null woStoryXResptype;
R2full = (null - full)/null;
R2woStoryXResptype = (null - woStoryXResptype)/null;
f2 = (R2full - R2woStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3b_woStoryXResptype;
run;

***COMPUTING F^2 FOR GROUPXRESPTYPE;
proc sort data=Study3b_woGroupXResptype; by CovParm; run;
DATA Study3b_woGroupXResptype_op;
merge Study3b_full (rename=(Estimate=full)) Study3b_Null (rename =(Estimate=null)) Study3b_woGroupXResptype (rename=(Estimate=woGroupXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3b_woGroupXResptype; set Study3b_woGroupXResptype_op;
DROP full null woGroupXResptype;
R2full = (null - full)/null;
R2woGroupXResptype = (null - woGroupXResptype)/null;
f2 = (R2full - R2woGroupXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3b_woGroupXResptype;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUP;
proc sort data=Study3b_woBAXStoryXGroup; by CovParm; run;
DATA Study3b_woBAXStoryXGroup_op;
merge Study3b_full (rename=(Estimate=full)) Study3b_Null (rename =(Estimate=null)) Study3b_woBAXStoryXGroup (rename=(Estimate=woBAXStoryXGroup)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3b_woBAXStoryXGroup; set Study3b_woBAXStoryXGroup_op;
DROP full null woBAXStoryXGroup;
R2full = (null - full)/null;
R2woBAXStoryXGroup = (null - woBAXStoryXGroup)/null;
f2 = (R2full - R2woBAXStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3b_woBAXStoryXGroup;
run;

***COMPUTING F^2 FOR CONDXSTORYXRESPTYPE;
proc sort data=Study3b_woBAXStoryXResptype; by CovParm; run;
DATA Study3b_woBAXStoryXResp_op;
merge Study3b_full (rename=(Estimate=full)) Study3b_Null (rename =(Estimate=null)) Study3b_woBAXStoryXResptype (rename=(Estimate=woBAXStoryXResptype)); by CovParm;
DROP Subject;
run;


DATA resStudy3b_woBAXStoryXResp; set Study3b_woBAXStoryXResp_op;
DROP full null woBAXStoryXResptype;
R2full = (null - full)/null;
R2woBAXStoryXResp = (null - woBAXStoryXResptype)/null;
f2 = (R2full - R2woBAXStoryXResp)/(1 - R2full);
run;

PROC PRINT data=resStudy3b_woBAXStoryXResp;
run;

***COMPUTING F^2 FOR STORYXGROUPXRESPTYPE;
proc sort data=Study3b_woStoryXGroupXResptype; by CovParm; run;
DATA Study3b_woStoryXGroupXResp_op;
merge Study3b_full (rename=(Estimate=full)) Study3b_Null (rename =(Estimate=null)) Study3b_woStoryXGroupXResptype (rename=(Estimate=woStoryXGroupXResptype)); by CovParm;
DROP Subject;
run;


DATA resStudy3b_woStoryXGroupXResp; set Study3b_woStoryXGroupXResp_op;
DROP full null woStoryXGroupXResptype;
R2full = (null - full)/null;
R2woStoryXGroupXResp = (null - woStoryXGroupXResptype)/null;
f2 = (R2full - R2woStoryXGroupXResp)/(1 - R2full);
run;

PROC PRINT data=resStudy3b_woStoryXGroupXResp;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUPXRESPTYPE;
proc sort data=Study3b_wo4way; by CovParm; run;
DATA Study3b_wo4way_op;
merge Study3b_full (rename=(Estimate=full)) Study3b_Null (rename =(Estimate=null)) Study3b_wo4way (rename=(Estimate=wo4way)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3b_wo4way; set Study3b_wo4way_op;
DROP full null wo4way;
R2full = (null - full)/null;
R2wo4way = (null - wo4way)/null;
f2 = (R2full - R2wo4way)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3b_wo4way;
run;


