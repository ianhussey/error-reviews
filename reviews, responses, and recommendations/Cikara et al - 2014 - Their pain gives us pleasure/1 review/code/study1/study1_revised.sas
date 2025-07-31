libname study1 "/home/u64240311/ERROR/study1";

proc import datafile="/home/u64240311/ERROR/study1/ArbitraryGroups_STUDY1_SAS.csv"
    out=study1.final
    dbms=csv
    replace;
    guessingrows=MAX;
    getnames=yes;
run;

data study1.final;
set study1.final(where=(pid>0));
run;

proc print data=study1.final(obs=64);
run;

data study1.final;
set study1.final;
if cond="compete" then cond1="compete";
if cond="neutral" then cond1="neutral";
if cond="cooperate" then cond1="zcoop";
run;

data study1.final;
set study1.final;
if cond="compete" then cond2="zcomp";
if cond="neutral" then cond2="neutral";
if cond="cooperate" then cond2="coop";
run;

data study1.final;
set study1.final;
if group="ingrp" then group1="zingrp";
if group="outgrp" then group1="outgrp";
run;

data study1.final;
set study1.final;
if story="neg" then story1="zneg";
if story="pos" then story1="pos";
run;


**THIS IS THE FULL MODEL;
ods output CovParms = Study1_full;  
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel; 
class pid cond2 story1 group1 storynum resptype; 
model rating = cond2 story1 group1 resptype cond2*story1 cond2*group1 cond2*resptype story1*group1 story1*resptype group1*resptype cond2*story1*group1 cond2*story1*resptype cond2*group1*resptype story1*group1*resptype cond2*story1*group1*resptype / solution; 
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/; 
lsmeans cond2*story1*group1*resptype / slice = cond2*story1*resptype diff = all; 
run; 
quit; 
ods output close;



***THE REST IS FOR COMPUTING EFFECT SIZE;

ods output CovParms = Study1_Null; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study1_woCond; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid story1 group1 storynum resptype;
model rating = story1 group1 resptype  / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study1_woStory; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 group1 storynum resptype;
model rating = cond2 group1 resptype  / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study1_woGroup; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1  storynum resptype;
model rating = cond2 story1 resptype  / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study1_woResptype; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = cond2 story1 group1 / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study1_woCondXStory; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = cond2 story1 group1 resptype cond2*group1 cond2*resptype story1*group1 story1*resptype group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study1_woCondXGroup; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = cond2 story1 group1 resptype cond2*story1 cond2*resptype story1*group1 story1*resptype group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study1_woCondXResptype; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = cond2 story1 group1 resptype cond2*story1 cond2*group1 story1*group1 story1*resptype group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study1_woStoryXGroup; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = cond2 story1 group1 resptype cond2*story1 cond2*group1 cond2*resptype story1*resptype group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;


ods output CovParms = Study1_woStoryXResptype; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = cond2 story1 group1 resptype cond2*story1 cond2*group1 cond2*resptype story1*group1 group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study1_woGroupXResptype; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = cond2 story1 group1 resptype cond2*story1 cond2*group1 cond2*resptype story1*group1 story1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study1_woCondXStoryXGroup; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = cond2 story1 group1 resptype cond2*story1 cond2*group1 cond2*resptype story1*group1 story1*resptype group1*resptype cond2*story1*resptype cond2*group1*resptype story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study1_woCondXStoryXResptype; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = cond2 story1 group1 resptype cond2*story1 cond2*group1 cond2*resptype story1*group1 story1*resptype group1*resptype cond2*story1*group1 cond2*group1*resptype story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study1_woCondXGroupXResptype; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = cond2 story1 group1 resptype cond2*story1 cond2*group1 cond2*resptype story1*group1 story1*resptype group1*resptype cond2*story1*group1 cond2*story1*resptype story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study1_woStoryXGroupXResptype; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = cond2 story1 group1 resptype cond2*story1 cond2*group1 cond2*resptype story1*group1 story1*resptype group1*resptype cond2*story1*group1 cond2*story1*resptype cond2*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study1_wo4way; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = cond2 story1 group1 resptype cond2*story1 cond2*group1 cond2*resptype story1*group1 story1*resptype group1*resptype cond2*story1*group1 cond2*story1*resptype cond2*group1*resptype story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study1_full hold=2,4;
run;
quit;
ods output close;

DATA Study1_full; 
    set Study1_full; 
	if strip(CovParm) = "UN(2,2)" or strip(CovParm) = "resptype UN(1,1)";
run;

DATA Study1_Null;
set Study1_Null;
if strip(CovParm) = "UN(2,2)" or strip(CovParm) = "resptype UN(1,1)";
run;

DATA Study1_wo4way;
set Study1_wo4way;
if strip(CovParm) = "UN(2,2)" or strip(CovParm) = "resptype UN(1,1)";
run;

***COMPUTING F^2 FOR MAIN EFFECT OF COND2;
proc sort data=Study1_full; by CovParm; run;
proc sort data=Study1_Null; by CovParm; run;
proc sort data=Study1_woCond; by CovParm; run;

DATA Study1_woCond_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woCond (rename=(Estimate=woCond)); by CovParm;
DROP Subject;
run;

DATA resultsStudy1_woCond; set Study1_woCond_op;
DROP full null woCond;
R2full = (null - full)/null;
R2woCond = (null - woCond)/null;
f2 = (R2full - R2woCond)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woCond;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF STORY;
proc sort data=Study1_woStory; by CovParm; run;
DATA Study1_woStory_op;
merge Study1_full (rename=(Estimate=full)) 
      Study1_Null (rename =(Estimate=null)) 
      Study1_woStory (rename=(Estimate=woStory)); 
by CovParm; 
DROP Subject;
run;

DATA resultsStudy1_woStory; 
set Study1_woStory_op;
DROP full null woStory;
R2full = (null - full)/null;
R2woStory = (null - woStory)/null;
f2 = (R2full - R2woStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woStory;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF GROUP;
proc sort data=Study1_woGroup; by CovParm; run;
DATA Study1_woGroup_op;
merge Study1_full (rename=(Estimate=full)) 
      Study1_Null (rename =(Estimate=null)) 
      Study1_woGroup (rename=(Estimate=woGroup)); 
by CovParm; 
DROP Subject;
run;

DATA resultsStudy1_woGroup; 
set Study1_woGroup_op;
DROP full null woGroup;
R2full = (null - full)/null;
R2woGroup = (null - woGroup)/null;
f2 = (R2full - R2woGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woGroup;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF RESPTYPE;
proc sort data=Study1_woResptype; by CovParm; run;
DATA Study1_woResptype_op;
merge Study1_full (rename=(Estimate=full)) 
      Study1_Null (rename =(Estimate=null)) 
      Study1_woResptype (rename=(Estimate=woResptype)); 
by CovParm; 
DROP Subject;
run;

DATA resultsStudy1_woResptype; 
set Study1_woResptype_op;
DROP full null woResptype;
R2full = (null - full)/null;
R2woResptype = (null - woResptype)/null;
f2 = (R2full - R2woResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woResptype;
run;

***COMPUTING F^2 FOR CONDXSTORY;
proc sort data=Study1_woCondXStory; by CovParm; run;
DATA Study1_woCondXStory_op;
merge Study1_full (rename=(Estimate=full)) 
      Study1_Null (rename =(Estimate=null)) 
      Study1_woCondXStory (rename=(Estimate=woCondXStory)); 
by CovParm; 
DROP Subject;
run;

DATA resultsStudy1_woCondXStory; 
set Study1_woCondXStory_op;
DROP full null woCondXStory;
R2full = (null - full)/null;
R2woCondXStory = (null - woCondXStory)/null;
f2 = (R2full - R2woCondXStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woCondXStory;
run;

***COMPUTING F^2 FOR CONDXGROUP;
proc sort data=Study1_woCondXGroup; by CovParm; run;
DATA Study1_woCondXGroup_op;
merge Study1_full (rename=(Estimate=full)) 
      Study1_Null (rename =(Estimate=null)) 
      Study1_woCondXGroup (rename=(Estimate=woCondXGroup)); 
by CovParm; 
DROP Subject;
run;

DATA resultsStudy1_woCondXGroup; 
set Study1_woCondXGroup_op;
DROP full null woCondXGroup;
R2full = (null - full)/null;
R2woCondXGroup = (null - woCondXGroup)/null;
f2 = (R2full - R2woCondXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woCondXGroup;
run;

***COMPUTING F^2 FOR CONDXRESPTYPE;
proc sort data=Study1_woCondXResptype; by CovParm; run;

DATA Study1_woCondXResptype_op;
merge Study1_full (rename=(Estimate=full)) 
      Study1_Null (rename =(Estimate=null)) 
      Study1_woCondXResptype (rename=(Estimate=woCondXResptype)); 
by CovParm; 
DROP Subject;
run;

DATA resultsStudy1_woCondXResptype; 
set Study1_woCondXResptype_op;
DROP full null woCondXResptype;
R2full = (null - full)/null;
R2woCondXResptype = (null - woCondXResptype)/null;
f2 = (R2full - R2woCondXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woCondXResptype;
run;

***COMPUTING F^2 FOR STORYXGROUP;
proc sort data=Study1_woStoryXGroup; by CovParm; run;
DATA Study1_woStoryXGroup_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woStoryXGroup (rename=(Estimate=woStoryXGroup)); by CovParm;
DROP Subject;
run;


DATA resultsStudy1_woStoryXGroup; set Study1_woStoryXGroup_op;
DROP full null woStoryXGroup;
R2full = (null - full)/null;
R2woStoryXGroup = (null - woStoryXGroup)/null;
f2 = (R2full - R2woStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woStoryXGroup;
run;

***COMPUTING F^2 FOR STORYXRESPTYPE;
proc sort data=Study1_woStoryXResptype; by CovParm; run;
DATA Study1_woStoryXResptype_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woStoryXResptype (rename=(Estimate=woStoryXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsStudy1_woStoryXResptype; set Study1_woStoryXResptype_op;
DROP full null woStoryXResptype;
R2full = (null - full)/null;
R2woStoryXResptype = (null - woStoryXResptype)/null;
f2 = (R2full - R2woStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woStoryXResptype;
run;

***COMPUTING F^2 FOR GROUPXRESPTYPE;
proc sort data=study1_wogroupxresptype; by CovParm; run;
DATA Study1_woGroupXResptype_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woGroupXResptype (rename=(Estimate=woGroupXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsStudy1_woGroupXResptype; set Study1_woGroupXResptype_op;
DROP full null woGroupXResptype;
R2full = (null - full)/null;
R2woGroupXResptype = (null - woGroupXResptype)/null;
f2 = (R2full - R2woGroupXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woGroupXResptype;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUP;
proc sort data=study1_woCondxStoryxgroup; by CovParm; run;
DATA Study1_woCondXStoryXGroup_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woCondXStoryXGroup (rename=(Estimate=woCondXStoryXGroup)); by CovParm;
DROP Subject;
run;


DATA resultsStudy1_woCondXStoryXGroup; set Study1_woCondXStoryXGroup_op;
DROP full null woCondXStoryXGroup;
R2full = (null - full)/null;
R2woCondXStoryXGroup = (null - woCondXStoryXGroup)/null;
f2 = (R2full - R2woCondXStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woCondXStoryXGroup;
run;

***COMPUTING F^2 FOR CONDXSTORYXRESPTYPE;
proc sort data=Study1_woCondXStoryXResptype; by CovParm; run;
DATA Study1_woCondXStoryXResptype_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woCondXStoryXResptype (rename=(Estimate=woCondXStoryXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsStudy1_woCXSXR; set Study1_woCondXStoryXResptype_op;
DROP full null woCondXStoryXResptype;
R2full = (null - full)/null;
R2woCondXStoryXResptype = (null - woCondXStoryXResptype)/null;
f2 = (R2full - R2woCondXStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woCXSXR;
run;

***COMPUTING F^2 FOR STORYXGROUPXRESPTYPE;
proc sort data=Study1_woStoryXGroupXResptype; by CovParm; run;
DATA Study1_woStoryXGroupXResptype_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woStoryXGroupXResptype (rename=(Estimate=woStoryXGroupXResptype)); by CovParm;
DROP Subject;
run;

DATA resultsStudy1_woSXGXR; set Study1_woStoryXGroupXResptype_op;
DROP full null woStoryXGroupXResptype;
R2full = (null - full)/null;
R2woStoryXGroupXResptype = (null - woStoryXGroupXResptype)/null;
f2 = (R2full - R2woStoryXGroupXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woSXGXR;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUPXRESPTYPE;
proc sort data=Study1_wo4way; by CovParm; run;
DATA Study1_wo4way_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_wo4way (rename=(Estimate=wo4way)); by CovParm;
DROP Subject;
run;


DATA resultsStudy1_wo4way; set Study1_wo4way_op;
DROP full null wo4way;
R2full = (null - full)/null;
R2wo4way = (null - wo4way)/null;
f2 = (R2full - R2wo4way)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_wo4way;
run;

* The code below computes Cohen's d by dividing by the pooled residual standard deviation;

ods output CovParms = Study1_full diffs = Study1_diffs; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = cond2 story1 group1 resptype cond2*story1 cond2*group1 cond2*resptype story1*group1 story1*resptype group1*resptype cond2*story1*group1 cond2*story1*resptype cond2*group1*resptype story1*group1*resptype cond2*story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs ;
lsmeans cond2*story1*group1*resptype / slice = cond2*story1*resptype diff = all;
run;
quit;
ods output close;

data _null_;
    retain var1 var2;
    set Study1_full;

    if CovParm = "resptype UN(1,1)" then var1 = Estimate;
    if CovParm = "UN(2,2)" then var2 = Estimate;

    if _N_ = 4 then do;
        pooled_var = mean(of var1, var2);
        pooled_sd = sqrt(pooled_var);
        call symputx('resid_sd', pooled_sd);
    end;
run;

%put &=resid_sd;

data Study1_diffs_with_d;
    set Study1_diffs;
    cohens_d = Estimate / &resid_sd;
run;
proc print data=Study1_diffs_with_d; run;



