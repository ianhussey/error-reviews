libname study3a "/home/u64240311/ERROR/study3a"; 
 
proc import datafile="/home/u64240311/ERROR/study3a/ArbitraryGroups_STUDY3a_SAS.csv" 
    out=study3a.final 
    dbms=csv 
    replace; 
    guessingrows=MAX; 
    getnames=yes; 
run;

data study3a.final;
set study3a.final(where=(pid>0));
run;


proc print data=study3a.final(obs=64);
run;


**THIS IS THE FULL MODEL;

ods output CovParms = Study3a_full; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group story*resptype group*resptype bef_aft*story*group bef_aft*story*resptype bef_aft*group*resptype story*group*resptype bef_aft*story*group*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
lsmeans bef_aft*story*group*resptype / slice = bef_aft*story*resptype diff = all;
run;
quit;
ods output close;

ods output CovParms = Study3a_Null; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3a_woBA; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid story group storynum resptype;
model rating = story group resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3a_woStory; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft group storynum resptype;
model rating = bef_aft group resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3a_woGroup; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story  storynum resptype;
model rating = bef_aft story resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3a_woResptype; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3a_woBAXStory; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*group bef_aft*resptype story*group story*resptype group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3a_woBAXGroup; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*resptype story*group story*resptype group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3a_woBAXResptype; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group story*group story*resptype group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3a_woStoryXGroup; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*resptype group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;


ods output CovParms = Study3a_woStoryXResptype; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group group*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3a_woGroupXResptype; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group story*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3a_woBAXStoryXGroup; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group story*resptype group*resptype bef_aft*story*resptype bef_aft*group*resptype story*group*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3a_woBAXStoryXResptype; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group story*resptype group*resptype bef_aft*story*group bef_aft*group*resptype story*group*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3a_woBAXGroupXResptype; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group story*resptype group*resptype bef_aft*story*group bef_aft*story*resptype story*group*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3a_woStoryXGroupXResptype; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group story*resptype group*resptype bef_aft*story*group bef_aft*story*resptype bef_aft*group*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study3a_wo4way; 
proc mixed data=study3a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story group storynum resptype;
model rating = bef_aft story group resptype bef_aft*story bef_aft*group bef_aft*resptype story*group story*resptype group*resptype bef_aft*story*group bef_aft*story*resptype bef_aft*group*resptype story*group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study3a_full hold=2,4;
run;
quit;
ods output close;

DATA Study3a_full;
set Study3a_full;
if strip(CovParm) = "resptype UN(1,1)" or strip(CovParm) = "UN(2,2)";
run;

DATA Study3a_Null;
set Study3a_Null;
if strip(CovParm) = "resptype UN(1,1)" or strip(CovParm) = "UN(2,2)";
run;

DATA Study3a_woStoryXGroupXResptype;
set Study3a_woStoryXGroupXResptype;
if strip(CovParm) = "resptype UN(1,1)" or strip(CovParm) = "UN(2,2)";
run;

***COMPUTING F^2 FOR MAIN EFFECT OF COND2;

proc sort data=Study3a_full; by CovParm; run;
proc sort data=Study3a_null; by CovParm; run;
proc sort data=Study3a_woBA; by CovParm; run;

DATA Study3a_woBA_op;
merge Study3a_full (rename=(Estimate=full)) Study3a_Null (rename =(Estimate=null)) Study3a_woBA (rename=(Estimate=woBA)); by CovParm;
DROP Subject;
run;

proc sort data=Study3a_woBA_op; by CovParm; run;
DATA resultsStudy3a_woBA; set Study3a_woBA_op;
DROP full null woBA;
R2full = (null - full)/null;
R2woBA = (null - woBA)/null;
f2 = (R2full - R2woBA)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3a_woBA;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF STORY;
proc sort data=Study3a_woStory; by CovParm; run;
DATA Study3a_woStory_op;
merge Study3a_full (rename=(Estimate=full)) Study3a_Null (rename =(Estimate=null)) Study3a_woStory (rename=(Estimate=woStory)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3a_woStory; set Study3a_woStory_op;
DROP full null woStory;
R2full = (null - full)/null;
R2woStory = (null - woStory)/null;
f2 = (R2full - R2woStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3a_woStory;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF GROUP;
proc sort data=Study3a_woGroup; by CovParm; run;
DATA Study3a_woGroup_op;
merge Study3a_full (rename=(Estimate=full)) Study3a_Null (rename =(Estimate=null)) Study3a_woGroup (rename=(Estimate=woGroup)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3a_woGroup; set Study3a_woGroup_op;
DROP full null woGroup;
R2full = (null - full)/null;
R2woGroup = (null - woGroup)/null;
f2 = (R2full - R2woGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3a_woGroup;
run;


***COMPUTING F^2 FOR MAIN EFFECT OF RESPTYPE;
proc sort data=Study3a_woResptype; by CovParm; run;
DATA Study3a_woResptype_op;
merge Study3a_full (rename=(Estimate=full)) Study3a_Null (rename =(Estimate=null)) Study3a_woResptype (rename=(Estimate=woResptype)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3a_woResptype; set Study3a_woResptype_op;
DROP full null woResptype;
R2full = (null - full)/null;
R2woResptype = (null - woResptype)/null;
f2 = (R2full - R2woResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3a_woResptype;
run;


***COMPUTING F^2 FOR CONDXSTORY;
proc sort data=Study3a_woBAXStory; by CovParm; run;
DATA Study3a_woBAXStory_op;
merge Study3a_full (rename=(Estimate=full)) Study3a_Null (rename =(Estimate=null)) Study3a_woBAXStory (rename=(Estimate=woBAXStory)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3a_woBAXStory; set Study3a_woBAXStory_op;
DROP full null woBAXStory;
R2full = (null - full)/null;
R2woBAXStory = (null - woBAXStory)/null;
f2 = (R2full - R2woBAXStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3a_woBAXStory;
run;

***COMPUTING F^2 FOR CONDXGROUP;
proc sort data=Study3a_woBAXGroup; by CovParm; run;
DATA Study3a_woBAXGroup_op;
merge Study3a_full (rename=(Estimate=full)) Study3a_Null (rename =(Estimate=null)) Study3a_woBAXGroup (rename=(Estimate=woBAXGroup)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3a_woBAXGroup; set Study3a_woBAXGroup_op;
DROP full null woBAXGroup;
R2full = (null - full)/null;
R2woBAXGroup = (null - woBAXGroup)/null;
f2 = (R2full - R2woBAXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3a_woBAXGroup;
run;

***COMPUTING F^2 FOR CONDXRESPTYPE;
proc sort data=Study3a_woBAXResptype; by CovParm; run;
DATA Study3a_woBAXResptype_op;
merge Study3a_full (rename=(Estimate=full)) Study3a_Null (rename =(Estimate=null)) Study3a_woBAXResptype (rename=(Estimate=woBAXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3a_woBAXResptype; set Study3a_woBAXResptype_op;
DROP full null woBAXResptype;
R2full = (null - full)/null;
R2woBAXResptype = (null - woBAXResptype)/null;
f2 = (R2full - R2woBAXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3a_woBAXResptype;
run;


***COMPUTING F^2 FOR STORYXGROUP;
proc sort data=Study3a_woStoryXGroup; by CovParm; run;
DATA Study3a_woStoryXGroup_op;
merge Study3a_full (rename=(Estimate=full)) Study3a_Null (rename =(Estimate=null)) Study3a_woStoryXGroup (rename=(Estimate=woStoryXGroup)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3a_woStoryXGroup; set Study3a_woStoryXGroup_op;
DROP full null woStoryXGroup;
R2full = (null - full)/null;
R2woStoryXGroup = (null - woStoryXGroup)/null;
f2 = (R2full - R2woStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3a_woStoryXGroup;
run;

***COMPUTING F^2 FOR STORYXRESPTYPE;
proc sort data=Study3a_woStoryXResptype; by CovParm; run;
DATA Study3a_woStoryXResptype_op;
merge Study3a_full (rename=(Estimate=full)) Study3a_Null (rename =(Estimate=null)) Study3a_woStoryXResptype (rename=(Estimate=woStoryXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3a_woStoryXResptype; set Study3a_woStoryXResptype_op;
DROP full null woStoryXResptype;
R2full = (null - full)/null;
R2woStoryXResptype = (null - woStoryXResptype)/null;
f2 = (R2full - R2woStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3a_woStoryXResptype;
run;

***COMPUTING F^2 FOR GROUPXRESPTYPE;
proc sort data=Study3a_woGroupXResptype; by CovParm; run;
DATA Study3a_woGroupXResptype_op;
merge Study3a_full (rename=(Estimate=full)) Study3a_Null (rename =(Estimate=null)) Study3a_woGroupXResptype (rename=(Estimate=woGroupXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3a_woGroupXResptype; set Study3a_woGroupXResptype_op;
DROP full null woGroupXResptype;
R2full = (null - full)/null;
R2woGroupXResptype = (null - woGroupXResptype)/null;
f2 = (R2full - R2woGroupXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3a_woGroupXResptype;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUP;
proc sort data=Study3a_woBAXStoryXGroup; by CovParm; run;
DATA Study3a_woBAXStoryXGroup_op;
merge Study3a_full (rename=(Estimate=full)) Study3a_Null (rename =(Estimate=null)) Study3a_woBAXStoryXGroup (rename=(Estimate=woBAXStoryXGroup)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3a_woBAXStoryXGroup; set Study3a_woBAXStoryXGroup_op;
DROP full null woBAXStoryXGroup;
R2full = (null - full)/null;
R2woBAXStoryXGroup = (null - woBAXStoryXGroup)/null;
f2 = (R2full - R2woBAXStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3a_woBAXStoryXGroup;
run;

***COMPUTING F^2 FOR CONDXSTORYXRESPTYPE;
proc sort data=Study3a_woBAXStoryXResptype; by CovParm; run;
DATA Study3a_woBAXStoryXResptype_op;
merge Study3a_full (rename=(Estimate=full)) Study3a_Null (rename =(Estimate=null)) Study3a_woBAXStoryXResptype (rename=(Estimate=woBAXStoryXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3a_woBAXSXR; set Study3a_woBAXStoryXResptype_op;
DROP full null woBAXStoryXResptype;
R2full = (null - full)/null;
R2woBAXStoryXResptype = (null - woBAXStoryXResptype)/null;
f2 = (R2full - R2woBAXStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3a_woBAXSXR;
run;

***COMPUTING F^2 FOR STORYXGROUPXRESPTYPE;
proc sort data=Study3a_woStoryXGroupXResptype; by CovParm; run;
DATA Study3a_woSXGXR_op;
merge Study3a_full (rename=(Estimate=full)) Study3a_Null (rename =(Estimate=null)) Study3a_woStoryXGroupXResptype (rename=(Estimate=woStoryXGroupXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3a_woSXGXR; set Study3a_woSXGXR_op;
DROP full null woStoryXGroupXResptype;
R2full = (null - full)/null;
R2woSXGXR = (null - woStoryXGroupXResptype)/null;
f2 = (R2full - R2woSXGXR)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3a_woSXGXR;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUPXRESPTYPE;
proc sort data=Study3a_wo4way; by CovParm; run;
DATA Study3a_wo4way_op;
merge Study3a_full (rename=(Estimate=full)) Study3a_Null (rename =(Estimate=null)) Study3a_wo4way (rename=(Estimate=wo4way)); by CovParm;
DROP Subject;
run;


DATA resultsStudy3a_wo4way; set Study3a_wo4way_op;
DROP full null wo4way;
R2full = (null - full)/null;
R2wo4way = (null - wo4way)/null;
f2 = (R2full - R2wo4way)/(1 - R2full);
run;

PROC PRINT data=resultsStudy3a_wo4way;
run;


