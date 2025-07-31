**ALWAYS CHANGE DIRECTORY WHEN STARTING TO WORK!!!**

libname study4a '\\andrew\users\users21\mcikara\Desktop\Arbgroups\study4a';

data study4a.final;
set study4a.final(where=(pid>0));
run;


proc print data=study4a.final(obs=64);
run;


**THIS IS THE FULL MODEL

ods output CovParms = Study4a_full; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype group1*resptype bef_aft*story1*group1 bef_aft*story1*resptype bef_aft*group1*resptype story1*group1*resptype bef_aft*story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
run;
quit;
ods output close;

ods output CovParms = Study4a_Null; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4a_woBA; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid story1 group1 storynum resptype;
model rating = story1 group1 resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4a_woStory; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft group1 storynum resptype;
model rating = bef_aft group1 resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4a_woGroup; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1  storynum resptype;
model rating = bef_aft story1 resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4a_woResptype; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum ;
model rating = bef_aft story1 group1 / solution;

repeated storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4a_woBAXStory; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4a_woBAXGroup; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*resptype story1*group1 story1*resptype group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4a_woBAXResptype; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 story1*group1 story1*resptype group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4a_woStoryXGroup; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*resptype group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;


ods output CovParms = Study4a_StoryXResptype; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4a_woGroupXResptype; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4a_woBAXStoryXGroup; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype group1*resptype bef_aft*story1*resptype bef_aft*group1*resptype story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4a_woBAXStoryXResptype; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype group1*resptype bef_aft*story1*group1 bef_aft*group1*resptype story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4a_woBAXGroupXResptype; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype group1*resptype bef_aft*story1*group1 bef_aft*story1*resptype story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4a_woStoryXGroupXResptype; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype group1*resptype bef_aft*story1*group1 bef_aft*story1*resptype bef_aft*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study4a_wo4way; 
proc mixed data=study4a.final plot(maxpoints=6500)=studentpanel;
class pid bef_aft story1 group1 storynum resptype;
model rating = bef_aft story1 group1 resptype bef_aft*story1 bef_aft*group1 bef_aft*resptype story1*group1 story1*resptype group1*resptype bef_aft*story1*group1 bef_aft*story1*resptype bef_aft*group1*resptype story1*group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study4a_full hold=2,4;
run;
quit;
ods output close;



DATA Study4a_full;
set Study4a_full;
if CovParm = "resptype UN(1,1)";
run;

DATA Study4a_Null;
set Study4a_Null;
if CovParm = "resptype UN(1,1)";
run;

DATA Study4a_woBA;
set Study4a_woBA;
if CovParm = "’pid"’;
run;

DATA Study4a_woStory;
set Study4a_woStory;
if CovParm = "’pid"’;
run;

DATA Study4a_woGroup;
set Study4a_woGroup;
if CovParm = "’pid"’;
run;

DATA Study4a_woResptype;
set Study4a_woResptype;
if CovParm = "’pid"’;
run;

DATA Study4a_woBAXStory; 
set Study4a_woBAXStory; 
if CovParm = "’pid"’;
run;

DATA Study4a_woBAXGroup; 
set Study4a_woBAXGroup; 
if CovParm = "’pid"’;
run;

DATA Study4a_woBAXResptype; 
set Study4a_woBAXResptype; 
if CovParm = "’pid"’;
run;

DATA Study4a_woStoryXGroup; 
set Study4a_woStoryXGroup; 
if CovParm = "’pid"’;
run;

DATA Study4a_StoryXResptype;
set Study4a_StoryXResptype;
if CovParm = "’pid"’;
run;

DATA Study4a_woGroupXResptype;
set Study4a_woGroupXResptype;
if CovParm = "’pid"’;
run;

DATA Study4a_woBAXStoryXGroup; 
set Study4a_woBAXStoryXGroup; 
if CovParm = "’pid"’;
run;

DATA Study4a_woBAXStoryXResptype; 
set Study4a_woBAXStoryXResptype; 
if CovParm = "’pid"’;
run;

DATA Study4a_woBAXGroupXResptype;
set Study4a_woBAXGroupXResptype;
if CovParm = "’pid"’;
run;

DATA Study4a_woStoryXGroupXResptype;
set Study4a_woStoryXGroupXResptype;
if CovParm = "resptype UN(1,1)";
run;

DATA Study4a_wo4way;
set Study4a_wo4way;
if CovParm = "’pid"’;
run;



***COMPUTING F^2 FOR MAIN EFFECT OF COND2*****
DATA Study4a_woBA_op;
merge Study4a_full (rename=(Estimate=full)) Study4a_Null (rename =(Estimate=null)) Study4a_woBA (rename=(Estimate=woBA)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4a_woBA; set Study4a_woBA_op;
DROP full null woBA;
R2full = (null - full)/null;
R2woBA = (null - woBA)/null;
f2 = (R2full - R2woBA)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4a_woBA;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF STORY*****
DATA Study4a_woStory_op;
merge Study4a_full (rename=(Estimate=full)) Study4a_Null (rename =(Estimate=null)) Study4a_woStory (rename=(Estimate=woStory)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4a_woStory; set Study4a_woStory_op;
DROP full null woStory;
R2full = (null - full)/null;
R2woStory = (null - woStory)/null;
f2 = (R2full - R2woStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4a_woStory;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF GROUP*****
DATA Study4a_woGroup_op;
merge Study4a_full (rename=(Estimate=full)) Study4a_Null (rename =(Estimate=null)) Study4a_woGroup (rename=(Estimate=woGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4a_woGroup; set Study4a_woGroup_op;
DROP full null woGroup;
R2full = (null - full)/null;
R2woGroup = (null - woGroup)/null;
f2 = (R2full - R2woGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4a_woGroup;
run;


***COMPUTING F^2 FOR MAIN EFFECT OF RESPTYPE*****
DATA Study4a_woResptype_op;
merge Study4a_full (rename=(Estimate=full)) Study4a_Null (rename =(Estimate=null)) Study4a_woResptype (rename=(Estimate=woResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4a_woResptype; set Study4a_woResptype_op;
DROP full null woResptype;
R2full = (null - full)/null;
R2woResptype = (null - woResptype)/null;
f2 = (R2full - R2woResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4a_woResptype;
run;


***COMPUTING F^2 FOR CONDXSTORY*****
DATA Study4a_woBAXStory_op;
merge Study4a_full (rename=(Estimate=full)) Study4a_Null (rename =(Estimate=null)) Study4a_woBAXStory (rename=(Estimate=woBAXStory)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4a_woBAXStory; set Study4a_woBAXStory_op;
DROP full null woBAXStory;
R2full = (null - full)/null;
R2woBAXStory = (null - woBAXStory)/null;
f2 = (R2full - R2woBAXStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4a_woBAXStory;
run;

***COMPUTING F^2 FOR CONDXGROUP*****
DATA Study4a_woBAXGroup_op;
merge Study4a_full (rename=(Estimate=full)) Study4a_Null (rename =(Estimate=null)) Study4a_woBAXGroup (rename=(Estimate=woBAXGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4a_woBAXGroup; set Study4a_woBAXGroup_op;
DROP full null woBAXGroup;
R2full = (null - full)/null;
R2woBAXGroup = (null - woBAXGroup)/null;
f2 = (R2full - R2woBAXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4a_woBAXGroup;
run;

***COMPUTING F^2 FOR CONDXRESPTYPE*****
DATA Study4a_woBAXResptype_op;
merge Study4a_full (rename=(Estimate=full)) Study4a_Null (rename =(Estimate=null)) Study4a_woBAXResptype (rename=(Estimate=woBAXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4a_woBAXResptype; set Study4a_woBAXResptype_op;
DROP full null woBAXResptype;
R2full = (null - full)/null;
R2woBAXResptype = (null - woBAXResptype)/null;
f2 = (R2full - R2woBAXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4a_woBAXResptype;
run;


***COMPUTING F^2 FOR STORYXGROUP*****
DATA Study4a_woStoryXGroup_op;
merge Study4a_full (rename=(Estimate=full)) Study4a_Null (rename =(Estimate=null)) Study4a_woStoryXGroup (rename=(Estimate=woStoryXGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4a_woStoryXGroup; set Study4a_woStoryXGroup_op;
DROP full null woStoryXGroup;
R2full = (null - full)/null;
R2woStoryXGroup = (null - woStoryXGroup)/null;
f2 = (R2full - R2woStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4a_woStoryXGroup;
run;

***COMPUTING F^2 FOR STORYXRESPTYPE*****
DATA Study4a_woStoryXResptype_op;
merge Study4a_full (rename=(Estimate=full)) Study4a_Null (rename =(Estimate=null)) Study4a_woStoryXResptype (rename=(Estimate=woStoryXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4a_woStoryXResptype; set Study4a_woStoryXResptype_op;
DROP full null woStoryXResptype;
R2full = (null - full)/null;
R2woStoryXResptype = (null - woStoryXResptype)/null;
f2 = (R2full - R2woStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4a_woStoryXResptype;
run;

***COMPUTING F^2 FOR GROUPXRESPTYPE*****
DATA Study4a_woGroupXResptype_op;
merge Study4a_full (rename=(Estimate=full)) Study4a_Null (rename =(Estimate=null)) Study4a_woGroupXResptype (rename=(Estimate=woGroupXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4a_woGroupXResptype; set Study4a_woGroupXResptype_op;
DROP full null woGroupXResptype;
R2full = (null - full)/null;
R2woGroupXResptype = (null - woGroupXResptype)/null;
f2 = (R2full - R2woGroupXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4a_woGroupXResptype;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUP*****
DATA Study4a_woBAXStoryXGroup_op;
merge Study4a_full (rename=(Estimate=full)) Study4a_Null (rename =(Estimate=null)) Study4a_woBAXStoryXGroup (rename=(Estimate=woBAXStoryXGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4a_woBAXStoryXGroup; set Study4a_woBAXStoryXGroup_op;
DROP full null woBAXStoryXGroup;
R2full = (null - full)/null;
R2woBAXStoryXGroup = (null - woBAXStoryXGroup)/null;
f2 = (R2full - R2woBAXStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4a_woBAXStoryXGroup;
run;

***COMPUTING F^2 FOR CONDXSTORYXRESPTYPE*****
DATA Study4a_woBAXStoryXResptype_op;
merge Study4a_full (rename=(Estimate=full)) Study4a_Null (rename =(Estimate=null)) Study4a_woBAXStoryXResptype (rename=(Estimate=woBAXStoryXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4a_woBAXStoryXResptype; set Study4a_woBAXStoryXResptype_op;
DROP full null woBAXStoryXResptype;
R2full = (null - full)/null;
R2woBAXStoryXResptype = (null - woBAXStoryXResptype)/null;
f2 = (R2full - R2woBAXStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4a_woBAXStoryXResptype;
run;

***COMPUTING F^2 FOR STORYXGROUPXRESPTYPE*****

DATA Study4a_woSXGXR_op;
merge Study4a_full (rename=(Estimate=full)) Study4a_Null (rename =(Estimate=null)) Study4a_woStoryXGroupXResptype (rename=(Estimate=woStoryXGroupXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4a_woSXGXR; set Study4a_woSXGXR_op;
DROP full null woStoryXGroupXResptype;
R2full = (null - full)/null;
R2woSXGXR = (null - woStoryXGroupXResptype)/null;
f2 = (R2full - R2woSXGXR)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4a_woSXGXR;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUPXRESPTYPE*****
DATA Study4a_wo4way_op;
merge Study4a_full (rename=(Estimate=full)) Study4a_Null (rename =(Estimate=null)) Study4a_wo4way (rename=(Estimate=wo4way)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy4a_wo4way; set Study4a_wo4way_op;
DROP full null wo4way;
R2full = (null - full)/null;
R2wo4way = (null - wo4way)/null;
f2 = (R2full - R2wo4way)/(1 - R2full);
run;

PROC PRINT data=resultsStudy4a_wo4way;
run;


