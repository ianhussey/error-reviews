**ALWAYS CHANGE DIRECTORY WHEN STARTING TO WORK!!!**

libname study1 '\\andrew\users\users21\mcikara\Desktop\Arbgroups\study1';

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


**THIS IS THE FULL MODEL

ods output CovParms = Study1_full; 
proc mixed data=study1.final plot(maxpoints=6500)=studentpanel;
class pid cond2 story1 group1 storynum resptype;
model rating = cond2 story1 group1 resptype cond2*story1 cond2*group1 cond2*resptype story1*group1 story1*resptype group1*resptype cond2*story1*group1 cond2*story1*resptype cond2*group1*resptype story1*group1*resptype cond2*story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
run;
quit;
ods output close;

**THIS WAS HOW WE GENERATED LSMEANS COMPARISONS
lsmeans cond2*story1*group1*resptype / slice = cond2*story1*resptype diff = all;

***THE REST IS FOR COMPUTING EFFECT SIZE

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
class pid cond2 story1 group1 storynum ;
model rating = cond2 story1 group1 / solution;
repeated storynum/ subject=pid type=un@cs /*type=un@un*/;
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


ods output CovParms = Study1_StoryXResptype; 
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
if CovParm = "resptype UN(1,1)";
run;

DATA Study1_full;
set Study1_full;
if CovParm = "UN(2,2)";
run;

DATA Study1_Null;
set Study1_Null;
if CovParm = "resptype UN(1,1)";
run;

DATA Study1_Null;
set Study1_Null;
if CovParm = "UN(2,2)";
run;


DATA Study1_woCond;
set Study1_woCond;
if CovParm = "pid";
run;

DATA Study1_woStory;
set Study1_woStory;
if CovParm = "pid";
run;

DATA Study1_woGroup;
set Study1_woGroup;
if CovParm = "pid";
run;

DATA Study1_woResptype;
set Study1_woResptype;
if CovParm = "pid";
run;

DATA Study1_woCondXStory; 
set Study1_woCondXStory; 
if CovParm = "pid";
run;

DATA Study1_woCondXGroup; 
set Study1_woCondXGroup; 
if CovParm = "pid";
run;

DATA Study1_woCondXResptype; 
set Study1_woCondXResptype; 
if CovParm = "pid";
run;

DATA Study1_woStoryXGroup; 
set Study1_woStoryXGroup; 
if CovParm = "pid";
run;

DATA Study1_StoryXResptype;
set Study1_StoryXResptype;
if CovParm = "pid";
run;

DATA Study1_woGroupXResptype;
set Study1_woGroupXResptype;
if CovParm = "pid";
run;

DATA Study1_woCondXStoryXGroup; 
set Study1_woCondXStoryXGroup; 
if CovParm = "pid";
run;

DATA Study1_woCondXStoryXResptype; 
set Study1_woCondXStoryXResptype; 
if CovParm = "pid";
run;

DATA Study1_woCondXGroupXResptype;
set Study1_woCondXGroupXResptype;
if CovParm = "pid";
run;

DATA Study1_woStoryXGroupXResptype;
set Study1_woStoryXGroupXResptype;
if CovParm = "pid";
run;

DATA Study1_wo4way;
set Study1_wo4way;
if CovParm = "resptype UN(1,1)";
run;

DATA Study1_wo4way;
set Study1_wo4way;
if CovParm = " UN(2,2)";
run;


***COMPUTING F^2 FOR MAIN EFFECT OF COND2*****

DATA Study1_woCond_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woCond (rename=(Estimate=woCond)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy1_woCond; set Study1_woCond_op;
DROP full null woCond;
R2full = (null - full)/null;
R2woCond = (null - woCond)/null;
f2 = (R2full - R2woCond)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woCond;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF STORY*****
DATA Study1_woStory_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woStory (rename=(Estimate=woStory)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy1_woStory; set Study1_woStory_op;
DROP full null woStory;
R2full = (null - full)/null;
R2woStory = (null - woStory)/null;
f2 = (R2full - R2woStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woStory;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF GROUP*****
DATA Study1_woGroup_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woGroup (rename=(Estimate=woGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy1_woGroup; set Study1_woGroup_op;
DROP full null woGroup;
R2full = (null - full)/null;
R2woGroup = (null - woGroup)/null;
f2 = (R2full - R2woGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woGroup;
run;


***COMPUTING F^2 FOR MAIN EFFECT OF RESPTYPE*****
DATA Study1_woResptype_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woResptype (rename=(Estimate=woResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy1_woResptype; set Study1_woResptype_op;
DROP full null woResptype;
R2full = (null - full)/null;
R2woResptype = (null - woResptype)/null;
f2 = (R2full - R2woResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woResptype;
run;


***COMPUTING F^2 FOR CONDXSTORY*****
DATA Study1_woCondXStory_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woCondXStory (rename=(Estimate=woCondXStory)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy1_woCondXStory; set Study1_woCondXStory_op;
DROP full null woCondXStory;
R2full = (null - full)/null;
R2woCondXStory = (null - woCondXStory)/null;
f2 = (R2full - R2woCondXStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woCondXStory;
run;

***COMPUTING F^2 FOR CONDXGROUP*****
DATA Study1_woCondXGroup_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woCondXGroup (rename=(Estimate=woCondXGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy1_woCondXGroup; set Study1_woCondXGroup_op;
DROP full null woCondXGroup;
R2full = (null - full)/null;
R2woCondXGroup = (null - woCondXGroup)/null;
f2 = (R2full - R2woCondXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woCondXGroup;
run;

***COMPUTING F^2 FOR CONDXRESPTYPE*****
DATA Study1_woCondXResptype_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woCondXResptype (rename=(Estimate=woCondXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy1_woCondXResptype; set Study1_woCondXResptype_op;
DROP full null woCondXResptype;
R2full = (null - full)/null;
R2woCondXResptype = (null - woCondXResptype)/null;
f2 = (R2full - R2woCondXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woCondXResptype;
run;


***COMPUTING F^2 FOR STORYXGROUP*****
DATA Study1_woStoryXGroup_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woStoryXGroup (rename=(Estimate=woStoryXGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy1_woStoryXGroup; set Study1_woStoryXGroup_op;
DROP full null woStoryXGroup;
R2full = (null - full)/null;
R2woStoryXGroup = (null - woStoryXGroup)/null;
f2 = (R2full - R2woStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woStoryXGroup;
run;

***COMPUTING F^2 FOR STORYXRESPTYPE*****
DATA Study1_woStoryXResptype_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woStoryXResptype (rename=(Estimate=woStoryXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy1_woStoryXResptype; set Study1_woStoryXResptype_op;
DROP full null woStoryXResptype;
R2full = (null - full)/null;
R2woStoryXResptype = (null - woStoryXResptype)/null;
f2 = (R2full - R2woStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woStoryXResptype;
run;

***COMPUTING F^2 FOR GROUPXRESPTYPE*****
DATA Study1_woGroupXResptype_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woGroupXResptype (rename=(Estimate=woGroupXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy1_woGroupXResptype; set Study1_woGroupXResptype_op;
DROP full null woGroupXResptype;
R2full = (null - full)/null;
R2woGroupXResptype = (null - woGroupXResptype)/null;
f2 = (R2full - R2woGroupXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woGroupXResptype;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUP*****
DATA Study1_woCondXStoryXGroup_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woCondXStoryXGroup (rename=(Estimate=woCondXStoryXGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy1_woCondXStoryXGroup; set Study1_woCondXStoryXGroup_op;
DROP full null woCondXStoryXGroup;
R2full = (null - full)/null;
R2woCondXStoryXGroup = (null - woCondXStoryXGroup)/null;
f2 = (R2full - R2woCondXStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woCondXStoryXGroup;
run;

***COMPUTING F^2 FOR CONDXSTORYXRESPTYPE*****
DATA Study1_woCondXStoryXResptype_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woCondXStoryXResptype (rename=(Estimate=woCondXStoryXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy1_woCondXStoryXResptype; set Study1_woCondXStoryXResptype_op;
DROP full null woCondXStoryXResptype;
R2full = (null - full)/null;
R2woCondXStoryXResptype = (null - woCondXStoryXResptype)/null;
f2 = (R2full - R2woCondXStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woCondXStoryXResptype;
run;

***COMPUTING F^2 FOR STORYXGROUPXRESPTYPE*****
DATA Study1_woStoryXGroupXResptype_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_woStoryXGroupXResptype (rename=(Estimate=woStoryXGroupXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy1_woStoryXGroupXResptype; set Study1_woStoryXGroupXResptype_op;
DROP full null woStoryXGroupXResptype;
R2full = (null - full)/null;
R2woStoryXGroupXResptype = (null - woStoryXGroupXResptype)/null;
f2 = (R2full - R2woStoryXGroupXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_woStoryXGroupXResptype;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUPXRESPTYPE*****

DATA Study1_wo4way_op;
merge Study1_full (rename=(Estimate=full)) Study1_Null (rename =(Estimate=null)) Study1_wo4way (rename=(Estimate=wo4way)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy1_wo4way; set Study1_wo4way_op;
DROP full null wo4way;
R2full = (null - full)/null;
R2wo4way = (null - wo4way)/null;
f2 = (R2full - R2wo4way)/(1 - R2full);
run;

PROC PRINT data=resultsStudy1_wo4way;
run;


