libname study2 "/home/u64240311/ERROR/study2";

proc import datafile="/home/u64240311/ERROR/study2/ArbitraryGroups_STUDY2_SAS.csv"
    out=study2.final
    dbms=csv
    replace;
    guessingrows=MAX;
    getnames=yes;
run;

data study2.final;
set study2.final(where=(pid>0));
run;


proc print data=study2.final(obs=64);
run;


**THIS IS THE FULL MODEL;

ods output CovParms = Study2_full; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid story group storynum resptype;
model rating = story group resptype story*group story*resptype group*resptype story*group*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
lsmeans story*group*resptype / slice = story*resptype diff = all;
run;
quit;
ods output close;

ods output CovParms = Study2_Null; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid story group storynum resptype;
model rating = / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study2_woStory; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid group storynum resptype;
model rating = group resptype  / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study2_woGroup; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid  story  storynum resptype;
model rating =  story resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study2_woResptype; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid  story group storynum resptype;
model rating =  story group / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study2_woStoryXGroup; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid  story group storynum resptype;
model rating =  story group resptype story*resptype group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;


ods output CovParms = Study2_woStoryXResptype; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid  story group storynum resptype;
model rating =  story group resptype story*group group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study2_woGroupXResptype; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid  story group storynum resptype;
model rating =  story group resptype story*group story*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study2_wo3way; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid  story group storynum resptype;
model rating =  story group resptype story*group story*resptype group*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;



DATA Study2_full;
set Study2_full;
if strip(CovParm) = "resptype UN(1,1)" or strip(CovParm) = "UN(2,2)";
run;

DATA Study2_Null;
set Study2_Null;
if strip(CovParm) = "resptype UN(1,1)" or strip(CovParm) = "UN(2,2)"; 
run;

DATA Study2_wo3way;
set Study2_wo3way;
if strip(CovParm) = "resptype UN(1,1)" or strip(CovParm) = "UN(2,2)";
run;

***COMPUTING F^2 FOR MAIN EFFECT OF STORY;

proc sort data=Study2_full; by CovParm; run;
proc sort data=Study2_null; by CovParm; run;
proc sort data=Study2_woStory; by CovParm; run;
DATA Study2_woStory_op;
merge Study2_full (rename=(Estimate=full)) Study2_Null (rename =(Estimate=null)) Study2_woStory (rename=(Estimate=woStory)); by CovParm;
DROP Subject;
run;

DATA resultsStudy2_woStory; set Study2_woStory_op;
DROP full null woStory;
R2full = (null - full)/null;
R2woStory = (null - woStory)/null;
f2 = (R2full - R2woStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy2_woStory;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF GROUP;
proc sort data=Study2_woGroup; by CovParm; run;
DATA Study2_woGroup_op;
merge Study2_full (rename=(Estimate=full)) Study2_Null (rename =(Estimate=null)) Study2_woGroup (rename=(Estimate=woGroup)); by CovParm;
DROP Subject;
run;


DATA resultsStudy2_woGroup; set Study2_woGroup_op;
DROP full null woGroup;
R2full = (null - full)/null;
R2woGroup = (null - woGroup)/null;
f2 = (R2full - R2woGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy2_woGroup;
run;


***COMPUTING F^2 FOR MAIN EFFECT OF RESPTYPE;
proc sort data=Study2_woResptype; by CovParm; run;
DATA Study2_woResptype_op;
merge Study2_full (rename=(Estimate=full)) Study2_Null (rename =(Estimate=null)) Study2_woResptype (rename=(Estimate=woResptype)); by CovParm;
DROP Subject;
run;

DATA resultsStudy2_woResptype; set Study2_woResptype_op;
DROP full null woResptype;
R2full = (null - full)/null;
R2woResptype = (null - woResptype)/null;
f2 = (R2full - R2woResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy2_woResptype;
run;

***COMPUTING F^2 FOR STORYXGROUP;
PROC SORT data=Study2_woStoryXGroup; by CovParm; run;
DATA Study2_woStoryXGroup_op;
merge Study2_full (rename=(Estimate=full)) Study2_Null (rename =(Estimate=null)) Study2_woStoryXGroup (rename=(Estimate=woStoryXGroup)); by CovParm;
DROP Subject;
run;


DATA resultsStudy2_woStoryXGroup; set Study2_woStoryXGroup_op;
DROP full null woStoryXGroup;
R2full = (null - full)/null;
R2woStoryXGroup = (null - woStoryXGroup)/null;
f2 = (R2full - R2woStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy2_woStoryXGroup;
run;

***COMPUTING F^2 FOR STORYXRESPTYPE;
PROC SORT data=Study2_woStoryXResptype; by CovParm; run;
DATA Study2_woStoryXResptype_op;
merge Study2_full (rename=(Estimate=full)) Study2_Null (rename =(Estimate=null)) Study2_woStoryXResptype (rename=(Estimate=woStoryXResptype)); by CovParm;
DROP Subject;
run;

DATA resultsStudy2_woStoryXResptype; set Study2_woStoryXResptype_op;
DROP full null woStoryXResptype;
R2full = (null - full)/null;
R2woStoryXResptype = (null - woStoryXResptype)/null;
f2 = (R2full - R2woStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy2_woStoryXResptype;
run;

***COMPUTING F^2 FOR GROUPXRESPTYPE;
proc sort data=Study2_woGroupXResptype; by CovParm; run;
DATA Study2_woGroupXResptype_op;
merge Study2_full (rename=(Estimate=full)) Study2_Null (rename =(Estimate=null)) Study2_woGroupXResptype (rename=(Estimate=woGroupXResptype)); by CovParm;
DROP Subject;
run;

DATA resultsStudy2_woGroupXResptype; set Study2_woGroupXResptype_op;
DROP full null woGroupXResptype;
R2full = (null - full)/null;
R2woGroupXResptype = (null - woGroupXResptype)/null;
f2 = (R2full - R2woGroupXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy2_woGroupXResptype;
run;


***COMPUTING F^2 FOR STORYXGROUPXRESPTYPE;
proc sort data=Study2_wo3way; by CovParm; run;
DATA Study2_wo3way_op;
merge Study2_full (rename=(Estimate=full)) Study2_Null (rename =(Estimate=null)) Study2_wo3way (rename=(Estimate=wo3way)); by CovParm;
DROP Subject;
run;


DATA resultsStudy2_wo3way; set Study2_wo3way_op;
DROP full null wo3way;
R2full = (null - full)/null;
R2wo3way = (null - wo3way)/null;
f2 = (R2full - R2wo3way)/(1 - R2full);
run;

PROC PRINT data=resultsStudy2_wo3way;
run;

