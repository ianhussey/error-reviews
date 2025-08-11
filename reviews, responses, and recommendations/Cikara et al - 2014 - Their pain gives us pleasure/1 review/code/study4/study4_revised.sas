libname study4 "/home/u64240311/ERROR/study4";  
  
proc import datafile="/home/u64240311/ERROR/study4/ArbitraryGroups_STUDY4_SAS.csv"  
    out=study4.final  
    dbms=csv  
    replace;  
    guessingrows=MAX;  
    getnames=yes;  
run;

data study4.final;
set study4.final(where=(pid>0));
run;


proc print data=study4.final(obs=64);
run;


**THIS IS THE FULL MODEL;

ods output CovParms = study4_full; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story group storynum resptype;
model rating = cond story group resptype cond*story cond*group cond*resptype story*group story*resptype group*resptype cond*story*group cond*story*resptype cond*group*resptype story*group*resptype cond*story*group*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
lsmeans cond*story*group*resptype / slice = cond*story*resptype diff = all;
run;
quit;
ods output close;

ods output CovParms = study4_Null; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story group storynum resptype;
model rating = / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = study4_woCond; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid story group storynum resptype;
model rating = story group resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = study4_woStory; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond group storynum resptype;
model rating = cond group resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = study4_woGroup; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story  storynum resptype;
model rating = cond story resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = study4_woResptype; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story group storynum resptype;
model rating = cond story group / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = study4_woCondXStory; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story group storynum resptype;
model rating = cond story group resptype cond*group cond*resptype story*group story*resptype group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = study4_woCondXGroup; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story group storynum resptype;
model rating = cond story group resptype cond*story cond*resptype story*group story*resptype group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = study4_woCondXResptype; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story group storynum resptype;
model rating = cond story group resptype cond*story cond*group story*group story*resptype group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = study4_woStoryXGroup; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story group storynum resptype;
model rating = cond story group resptype cond*story cond*group cond*resptype story*resptype group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;


ods output CovParms = study4_woStoryXResptype; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story group storynum resptype;
model rating = cond story group resptype cond*story cond*group cond*resptype story*group group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = study4_woGroupXResptype; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story group storynum resptype;
model rating = cond story group resptype cond*story cond*group cond*resptype story*group story*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = study4_woCondXStoryXGroup; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story group storynum resptype;
model rating = cond story group resptype cond*story cond*group cond*resptype story*group story*resptype group*resptype cond*story*resptype cond*group*resptype story*group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = study4_woCondXStoryXResptype; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story group storynum resptype;
model rating = cond story group resptype cond*story cond*group cond*resptype story*group story*resptype group*resptype cond*story*group cond*group*resptype story*group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = study4_woCondXGroupXResptype; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story group storynum resptype;
model rating = cond story group resptype cond*story cond*group cond*resptype story*group story*resptype group*resptype cond*story*group cond*story*resptype story*group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = study4_woStoryXGroupXResptype; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story group storynum resptype;
model rating = cond story group resptype cond*story cond*group cond*resptype story*group story*resptype group*resptype cond*story*group cond*story*resptype cond*group*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = study4_wo4way; 
proc mixed data=study4.final plot(maxpoints=6500)=studentpanel;
class pid cond story group storynum resptype;
model rating = cond story group resptype cond*story cond*group cond*resptype story*group story*resptype group*resptype cond*story*group cond*story*resptype cond*group*resptype story*group*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=study4_full hold=2,4;
run;
quit;
ods output close;



DATA study4_full;
set study4_full;
if strip(CovParm) = "resptype UN(1,1)" or strip(CovParm) = "UN(2,2)";
run;

DATA study4_Null;
set study4_Null;
if strip(CovParm) = "resptype UN(1,1)" or strip(CovParm) = "UN(2,2)";
run;

DATA study4_wo4way;
set study4_wo4way;
if strip(CovParm) = "resptype UN(1,1)" or strip(CovParm) = "UN(2,2)";
run;

***COMPUTING F^2 FOR MAIN EFFECT OF COND2;
proc sort data=study4_full; by CovParm; run;
proc sort data=study4_null; by CovParm; run;
proc sort data=study4_woCond; by CovParm; run;
DATA study4_woCond_op;
merge study4_full (rename=(Estimate=full)) study4_Null (rename =(Estimate=null)) study4_woCond (rename=(Estimate=woCond)); by CovParm;
DROP Subject;
run;


DATA resultsstudy4_woCond; set study4_woCond_op;
DROP full null woCond;
R2full = (null - full)/null;
R2woCond = (null - woCond)/null;
f2 = (R2full - R2woCond)/(1 - R2full);
run;

PROC PRINT data=resultsstudy4_woCond;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF STORY;
proc sort data=study4_woStory; by CovParm; run;
DATA study4_woStory_op;
merge study4_full (rename=(Estimate=full)) study4_Null (rename =(Estimate=null)) study4_woStory (rename=(Estimate=woStory)); by CovParm;
DROP Subject;
run;


DATA resultsstudy4_woStory; set study4_woStory_op;
DROP full null woStory;
R2full = (null - full)/null;
R2woStory = (null - woStory)/null;
f2 = (R2full - R2woStory)/(1 - R2full);
run;

PROC PRINT data=resultsstudy4_woStory;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF GROUP;
proc sort data=study4_woGroup; by CovParm; run;
DATA study4_woGroup_op;
merge study4_full (rename=(Estimate=full)) study4_Null (rename =(Estimate=null)) study4_woGroup (rename=(Estimate=woGroup)); by CovParm;
DROP Subject;
run;


DATA resultsstudy4_woGroup; set study4_woGroup_op;
DROP full null woGroup;
R2full = (null - full)/null;
R2woGroup = (null - woGroup)/null;
f2 = (R2full - R2woGroup)/(1 - R2full);
run;

PROC PRINT data=resultsstudy4_woGroup;
run;


***COMPUTING F^2 FOR MAIN EFFECT OF RESPTYPE;
proc sort data=study4_woResptype; by CovParm; run;
DATA study4_woResptype_op;
merge study4_full (rename=(Estimate=full)) study4_Null (rename =(Estimate=null)) study4_woResptype (rename=(Estimate=woResptype)); by CovParm;
DROP Subject;
run;


DATA resultsstudy4_woResptype; set study4_woResptype_op;
DROP full null woResptype;
R2full = (null - full)/null;
R2woResptype = (null - woResptype)/null;
f2 = (R2full - R2woResptype)/(1 - R2full);
run;

PROC PRINT data=resultsstudy4_woResptype;
run;


***COMPUTING F^2 FOR CONDXSTORY;
proc sort data=study4_woCondXStory; by CovParm; run;
DATA study4_woCondXStory_op;
merge study4_full (rename=(Estimate=full)) study4_Null (rename =(Estimate=null)) study4_woCondXStory (rename=(Estimate=woCondXStory)); by CovParm;
DROP Subject;
run;


DATA resultsstudy4_woCondXStory; set study4_woCondXStory_op;
DROP full null woCondXStory;
R2full = (null - full)/null;
R2woCondXStory = (null - woCondXStory)/null;
f2 = (R2full - R2woCondXStory)/(1 - R2full);
run;

PROC PRINT data=resultsstudy4_woCondXStory;
run;

***COMPUTING F^2 FOR CONDXGROUP;
proc sort data=study4_woCondXGroup; by CovParm; run;
DATA study4_woCondXGroup_op;
merge study4_full (rename=(Estimate=full)) study4_Null (rename =(Estimate=null)) study4_woCondXGroup (rename=(Estimate=woCondXGroup)); by CovParm;
DROP Subject;
run;


DATA resultsstudy4_woCondXGroup; set study4_woCondXGroup_op;
DROP full null woCondXGroup;
R2full = (null - full)/null;
R2woCondXGroup = (null - woCondXGroup)/null;
f2 = (R2full - R2woCondXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsstudy4_woCondXGroup;
run;

***COMPUTING F^2 FOR CONDXRESPTYPE;
proc sort data=study4_woCondXResptype; by CovParm; run;
DATA study4_woCondXResptype_op;
merge study4_full (rename=(Estimate=full)) study4_Null (rename =(Estimate=null)) study4_woCondXResptype (rename=(Estimate=woCondXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsstudy4_woCondXResptype; set study4_woCondXResptype_op;
DROP full null woCondXResptype;
R2full = (null - full)/null;
R2woCondXResptype = (null - woCondXResptype)/null;
f2 = (R2full - R2woCondXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsstudy4_woCondXResptype;
run;


***COMPUTING F^2 FOR STORYXGROUP;
proc sort data=study4_woStoryXGroup; by CovParm; run;
DATA study4_woStoryXGroup_op;
merge study4_full (rename=(Estimate=full)) study4_Null (rename =(Estimate=null)) study4_woStoryXGroup (rename=(Estimate=woStoryXGroup)); by CovParm;
DROP Subject;
run;


DATA resultsstudy4_woStoryXGroup; set study4_woStoryXGroup_op;
DROP full null woStoryXGroup;
R2full = (null - full)/null;
R2woStoryXGroup = (null - woStoryXGroup)/null;
f2 = (R2full - R2woStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsstudy4_woStoryXGroup;
run;

***COMPUTING F^2 FOR STORYXRESPTYPE;
proc sort data=study4_woStoryXResptype; by CovParm; run;
DATA study4_woStoryXResptype_op;
merge study4_full (rename=(Estimate=full)) study4_Null (rename =(Estimate=null)) study4_woStoryXResptype (rename=(Estimate=woStoryXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsstudy4_woStoryXResptype; set study4_woStoryXResptype_op;
DROP full null woStoryXResptype;
R2full = (null - full)/null;
R2woStoryXResptype = (null - woStoryXResptype)/null;
f2 = (R2full - R2woStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsstudy4_woStoryXResptype;
run;

***COMPUTING F^2 FOR GROUPXRESPTYPE;
proc sort data=study4_woGroupXResptype; by CovParm; run;
DATA study4_woGroupXResptype_op;
merge study4_full (rename=(Estimate=full)) study4_Null (rename =(Estimate=null)) study4_woGroupXResptype (rename=(Estimate=woGroupXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsstudy4_woGroupXResptype; set study4_woGroupXResptype_op;
DROP full null woGroupXResptype;
R2full = (null - full)/null;
R2woGroupXResptype = (null - woGroupXResptype)/null;
f2 = (R2full - R2woGroupXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsstudy4_woGroupXResptype;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUP;
proc sort data=study4_woCondXStoryXGroup; by CovParm; run;
DATA study4_woCondXStoryXGroup_op;
merge study4_full (rename=(Estimate=full)) study4_Null (rename =(Estimate=null)) study4_woCondXStoryXGroup (rename=(Estimate=woCondXStoryXGroup)); by CovParm;
DROP Subject;
run;


DATA resultsstudy4_woCondXStoryXGroup; set study4_woCondXStoryXGroup_op;
DROP full null woCondXStoryXGroup;
R2full = (null - full)/null;
R2woCondXStoryXGroup = (null - woCondXStoryXGroup)/null;
f2 = (R2full - R2woCondXStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsstudy4_woCondXStoryXGroup;
run;

***COMPUTING F^2 FOR CONDXSTORYXRESPTYPE;
proc sort data=study4_woCondXStoryXResptype; by CovParm; run;
DATA study4_woCondXStoryXResptype_op;
merge study4_full (rename=(Estimate=full)) study4_Null (rename =(Estimate=null)) study4_woCondXStoryXResptype (rename=(Estimate=woCondXStoryXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsstudy4_woCXSXR; set study4_woCondXStoryXResptype_op;
DROP full null woCondXStoryXResptype;
R2full = (null - full)/null;
R2woCondXStoryXResptype = (null - woCondXStoryXResptype)/null;
f2 = (R2full - R2woCondXStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsstudy4_woCXSXR;
run;

***COMPUTING F^2 FOR STORYXGROUPXRESPTYPE;
proc sort data=study4_woStoryXGroupXResptype; by CovParm; run;
DATA study4_woStoryXGroupXResptype_op;
merge study4_full (rename=(Estimate=full)) study4_Null (rename =(Estimate=null)) study4_woStoryXGroupXResptype (rename=(Estimate=woStoryXGroupXResptype)); by CovParm;
DROP Subject;
run;


DATA resultsstudy4_woSXGXR; set study4_woStoryXGroupXResptype_op;
DROP full null woStoryXGroupXResptype;
R2full = (null - full)/null;
R2woStoryXGroupXResptype = (null - woStoryXGroupXResptype)/null;
f2 = (R2full - R2woStoryXGroupXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsstudy4_woSXGXR;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUPXRESPTYPE;
proc sort data=study4_wo4way; by CovParm; run;
DATA study4_wo4way_op;
merge study4_full (rename=(Estimate=full)) study4_Null (rename =(Estimate=null)) study4_wo4way (rename=(Estimate=wo4way)); by CovParm;
DROP Subject;
run;


DATA resultsstudy4_wo4way; set study4_wo4way_op;
DROP full null wo4way;
R2full = (null - full)/null;
R2wo4way = (null - wo4way)/null;
f2 = (R2full - R2wo4way)/(1 - R2full);
run;

PROC PRINT data=resultsstudy4_wo4way;
run;


