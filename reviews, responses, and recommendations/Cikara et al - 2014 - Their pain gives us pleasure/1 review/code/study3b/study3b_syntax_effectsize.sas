**ALWAYS CHANGE DIRECTORY WHEN STARTING TO WORK!!!**

libname study4b '\\andrew\users\users21\mcikara\Desktop\Arbgroups\study4b';

data study4b.final;
set study4b.final(where=(pid>0));
run;


proc print data=study4b.final(obs=64);
run;


**THIS IS THE FULL MODEL

ods output CovParms = Study4b_full; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype group1*resptype bef_aft*story1*group1 bef_aft*story1*resptype bef_aft*group1*resptype story1*group1*resptype bef_aft*story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
run;
quit;
ods output close;

ods output CovParms = Study4b_Null; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4b_woBA; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid story1 group1 storynum resptype;
model rating = story1 group1 resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4b_woStory; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft group1 storynum resptype;
model rating = bef_aft group1 resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4b_woGroup; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1  storynum resptype;
model rating = bef_aft story1 resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4b_woResptype; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum ;
model rating = bef_aft story1 group1 / solution;

repeated storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4b_woBAXStory; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4b_woBAXGroup; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*resptype story1*group1 story1*resptype group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4b_woBAXResptype; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 story1*group1 story1*resptype group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4b_woStoryXGroup; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*resptype group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;


ods output CovParms = Study4b_StoryXResptype; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4b_woGroupXResptype; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4b_woBAXStoryXGroup; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype group1*resptype bef_aft*story1*resptype bef_aft*group1*resptype story1*group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4b_woBAXStoryXResptype; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype group1*resptype bef_aft*story1*group1 bef_aft*group1*resptype story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4b_woBAXGroupXResptype; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype group1*resptype bef_aft*story1*group1 bef_aft*story1*resptype story1*group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4b_woStoryXGroupXResptype; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype group1*resptype bef_aft*story1*group1 bef_aft*story1*resptype bef_aft*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4b_wo4way; 
proc mixed data=study4b.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype group1*resptype bef_aft*story1*group1 bef_aft*story1*resptype bef_aft*group1*resptype story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4b_full hold=2,4;
run;
quit;
ods output close;



DATA Study4b_full;
set Study4b_full;
if CovParm = "resptype UN(1,1)";
run;

DATA Study4b_Null;
set Study4b_Null;
if CovParm = "resptype UN(1,1)";
run;

DATA Study4b_woBA;
set Study4b_woBA;
if CovParm = "’pid"’;
run;

DATA Study4b_woStory;
set Study4b_woStory;
if CovParm = "’pid"’;
run;

DATA Study4b_woGroup;
set Study4b_woGroup;
if CovParm = "’pid"’;
run;

DATA Study4b_woResptype;
set Study4b_woResptype;
if CovParm = "’pid"’;
run;

DATA Study4b_woBAXStory; 
set Study4b_woBAXStory; 
if CovParm = "’pid"’;
run;

DATA Study4b_woBAXGroup; 
set Study4b_woBAXGroup; 
if CovParm = "’pid"’;
run;

DATA Study4b_woBAXResptype; 
set Study4b_woBAXResptype; 
if CovParm = "’pid"’;
run;

DATA Study4b_woStoryXGroup; 
set Study4b_woStoryXGroup; 
if CovParm = "’pid"’;
run;

DATA Study4b_StoryXResptype;
set Study4b_StoryXResptype;
if CovParm = "’pid"’;
run;

DATA Study4b_woGroupXResptype;
set Study4b_woGroupXResptype;
if CovParm = "’pid"’;
run;

DATA Study4b_woBAXStoryXGroup; 
set Study4b_woBAXStoryXGroup; 
if CovParm = "’pid"’;
run;

DATA Study4b_woBAXStoryXResptype; 
set Study4b_woBAXStoryXResptype; 
if CovParm = "resptype UN(1,1)";
run;

DATA Study4b_woBAXGroupXResptype;
set Study4b_woBAXGroupXResptype;
if CovParm = "’pid"’;
run;

DATA Study4b_woStoryXGroupXResptype;
set Study4b_woStoryXGroupXResptype;
if CovParm = "resptype UN(1,1)";
run;

DATA Study4b_wo4way;
set Study4b_wo4way;
if CovParm = "’pid"’;
run;



***COMPUTING F^2 FOR MAIN EFFECT OF COND2*****
DATA Study4b_woBA_op;
merge Study4b_full (rename=(Estimate=full)) Study4b_Null (rename =(Estimate=null)) Study4b_woBA (rename=(Estimate=woBA)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4b_woBA; set Study4b_woBA_op;
DROP full null woBA;
R2full = (null - full)/null;
R2woBA = (null - woBA)/null;
f2 = (R2full - R2woBA)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4b_woBA;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF STORY*****
DATA Study4b_woStory_op;
merge Study4b_full (rename=(Estimate=full)) Study4b_Null (rename =(Estimate=null)) Study4b_woStory (rename=(Estimate=woStory)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4b_woStory; set Study4b_woStory_op;
DROP full null woStory;
R2full = (null - full)/null;
R2woStory = (null - woStory)/null;
f2 = (R2full - R2woStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4b_woStory;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF GROUP*****
DATA Study4b_woGroup_op;
merge Study4b_full (rename=(Estimate=full)) Study4b_Null (rename =(Estimate=null)) Study4b_woGroup (rename=(Estimate=woGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4b_woGroup; set Study4b_woGroup_op;
DROP full null woGroup;
R2full = (null - full)/null;
R2woGroup = (null - woGroup)/null;
f2 = (R2full - R2woGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4b_woGroup;
run;


***COMPUTING F^2 FOR MAIN EFFECT OF RESPTYPE*****
DATA Study4b_woResptype_op;
merge Study4b_full (rename=(Estimate=full)) Study4b_Null (rename =(Estimate=null)) Study4b_woResptype (rename=(Estimate=woResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4b_woResptype; set Study4b_woResptype_op;
DROP full null woResptype;
R2full = (null - full)/null;
R2woResptype = (null - woResptype)/null;
f2 = (R2full - R2woResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4b_woResptype;
run;


***COMPUTING F^2 FOR CONDXSTORY*****
DATA Study4b_woBAXStory_op;
merge Study4b_full (rename=(Estimate=full)) Study4b_Null (rename =(Estimate=null)) Study4b_woBAXStory (rename=(Estimate=woBAXStory)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4b_woBAXStory; set Study4b_woBAXStory_op;
DROP full null woBAXStory;
R2full = (null - full)/null;
R2woBAXStory = (null - woBAXStory)/null;
f2 = (R2full - R2woBAXStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4b_woBAXStory;
run;

***COMPUTING F^2 FOR CONDXGROUP*****
DATA Study4b_woBAXGroup_op;
merge Study4b_full (rename=(Estimate=full)) Study4b_Null (rename =(Estimate=null)) Study4b_woBAXGroup (rename=(Estimate=woBAXGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4b_woBAXGroup; set Study4b_woBAXGroup_op;
DROP full null woBAXGroup;
R2full = (null - full)/null;
R2woBAXGroup = (null - woBAXGroup)/null;
f2 = (R2full - R2woBAXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4b_woBAXGroup;
run;

***COMPUTING F^2 FOR CONDXRESPTYPE*****
DATA Study4b_woBAXResptype_op;
merge Study4b_full (rename=(Estimate=full)) Study4b_Null (rename =(Estimate=null)) Study4b_woBAXResptype (rename=(Estimate=woBAXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4b_woBAXResptype; set Study4b_woBAXResptype_op;
DROP full null woBAXResptype;
R2full = (null - full)/null;
R2woBAXResptype = (null - woBAXResptype)/null;
f2 = (R2full - R2woBAXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4b_woBAXResptype;
run;


***COMPUTING F^2 FOR STORYXGROUP*****
DATA Study4b_woStoryXGroup_op;
merge Study4b_full (rename=(Estimate=full)) Study4b_Null (rename =(Estimate=null)) Study4b_woStoryXGroup (rename=(Estimate=woStoryXGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4b_woStoryXGroup; set Study4b_woStoryXGroup_op;
DROP full null woStoryXGroup;
R2full = (null - full)/null;
R2woStoryXGroup = (null - woStoryXGroup)/null;
f2 = (R2full - R2woStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4b_woStoryXGroup;
run;

***COMPUTING F^2 FOR STORYXRESPTYPE*****
DATA Study4b_woStoryXResptype_op;
merge Study4b_full (rename=(Estimate=full)) Study4b_Null (rename =(Estimate=null)) Study4b_woStoryXResptype (rename=(Estimate=woStoryXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4b_woStoryXResptype; set Study4b_woStoryXResptype_op;
DROP full null woStoryXResptype;
R2full = (null - full)/null;
R2woStoryXResptype = (null - woStoryXResptype)/null;
f2 = (R2full - R2woStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4b_woStoryXResptype;
run;

***COMPUTING F^2 FOR GROUPXRESPTYPE*****
DATA Study4b_woGroupXResptype_op;
merge Study4b_full (rename=(Estimate=full)) Study4b_Null (rename =(Estimate=null)) Study4b_woGroupXResptype (rename=(Estimate=woGroupXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4b_woGroupXResptype; set Study4b_woGroupXResptype_op;
DROP full null woGroupXResptype;
R2full = (null - full)/null;
R2woGroupXResptype = (null - woGroupXResptype)/null;
f2 = (R2full - R2woGroupXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4b_woGroupXResptype;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUP*****
DATA Study4b_woBAXStoryXGroup_op;
merge Study4b_full (rename=(Estimate=full)) Study4b_Null (rename =(Estimate=null)) Study4b_woBAXStoryXGroup (rename=(Estimate=woBAXStoryXGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4b_woBAXStoryXGroup; set Study4b_woBAXStoryXGroup_op;
DROP full null woBAXStoryXGroup;
R2full = (null - full)/null;
R2woBAXStoryXGroup = (null - woBAXStoryXGroup)/null;
f2 = (R2full - R2woBAXStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4b_woBAXStoryXGroup;
run;

***COMPUTING F^2 FOR CONDXSTORYXRESPTYPE*****
DATA Study4b_woBAXStoryXResp_op;
merge Study4b_full (rename=(Estimate=full)) Study4b_Null (rename =(Estimate=null)) Study4b_woBAXStoryXResptype (rename=(Estimate=woBAXStoryXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resStudy4b_woBAXStoryXResp; set Study4b_woBAXStoryXResp_op;
DROP full null woBAXStoryXResptype;
R2full = (null - full)/null;
R2woBAXStoryXResp = (null - woBAXStoryXResptype)/null;
f2 = (R2full - R2woBAXStoryXResp)/(1 - R2full);
run;

PROC PRINT data=resStudy4b_woBAXStoryXResp;
run;

***COMPUTING F^2 FOR STORYXGROUPXRESPTYPE*****

DATA Study4b_woStoryXGroupXResp_op;
merge Study4b_full (rename=(Estimate=full)) Study4b_Null (rename =(Estimate=null)) Study4b_woStoryXGroupXResptype (rename=(Estimate=woStoryXGroupXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resStudy4b_woStoryXGroupXResp; set Study4b_woStoryXGroupXResp_op;
DROP full null woStoryXGroupXResptype;
R2full = (null - full)/null;
R2woStoryXGroupXResp = (null - woStoryXGroupXResptype)/null;
f2 = (R2full - R2woStoryXGroupXResp)/(1 - R2full);
run;

PROC PRINT data=resStudy4b_woStoryXGroupXResp;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUPXRESPTYPE*****
DATA Study4b_wo4way_op;
merge Study4b_full (rename=(Estimate=full)) Study4b_Null (rename =(Estimate=null)) Study4b_wo4way (rename=(Estimate=wo4way)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4b_wo4way; set Study4b_wo4way_op;
DROP full null wo4way;
R2full = (null - full)/null;
R2wo4way = (null - wo4way)/null;
f2 = (R2full - R2wo4way)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4b_wo4way;
run;


