**ALWAYS CHANGE DIRECTORY WHEN STARTING TO WORK!!!**

libname study5 '\\andrew\users\users21\mcikara\Desktop\Arbgroups\study5';

data study5.final;
set study5.final(where=(pid>0));
run;


proc print data=study5.final(obs=64);
run;


**THIS IS THE FULL MODEL

ods output CovParms = Study5_full; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1 group1 storynum resptype;
model rating = cond story1 group1 resptype cond*story1 cond*group1 cond*resptype story1*group1 story1*resptype group1*resptype cond*story1*group1 cond*story1*resptype cond*group1*resptype story1*group1*resptype cond*story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
run;
quit;
ods output close;

ods output CovParms = Study5_Null; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1 group1 storynum resptype;
model rating = / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study5_woCond; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid story1 group1 storynum resptype;
model rating = story1 group1 resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study5_woStory; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond group1 storynum resptype;
model rating = cond group1 resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study5_woGroup; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1  storynum resptype;
model rating = cond story1 resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study5_woResptype; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1 group1 storynum ;
model rating = cond story1 group1 / solution;

repeated storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study5_woCondXStory; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1 group1 storynum resptype;
model rating = cond story1 group1 resptype cond*group1 cond*resptype story1*group1 story1*resptype group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study5_woCondXGroup; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1 group1 storynum resptype;
model rating = cond story1 group1 resptype cond*story1 cond*resptype story1*group1 story1*resptype group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study5_woCondXResptype; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1 group1 storynum resptype;
model rating = cond story1 group1 resptype cond*story1 cond*group1 story1*group1 story1*resptype group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study5_woStoryXGroup; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1 group1 storynum resptype;
model rating = cond story1 group1 resptype cond*story1 cond*group1 cond*resptype story1*resptype group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;


ods output CovParms = Study5_StoryXResptype; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1 group1 storynum resptype;
model rating = cond story1 group1 resptype cond*story1 cond*group1 cond*resptype story1*group1 group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study5_woGroupXResptype; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1 group1 storynum resptype;
model rating = cond story1 group1 resptype cond*story1 cond*group1 cond*resptype story1*group1 story1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study5_woCondXStoryXGroup; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1 group1 storynum resptype;
model rating = cond story1 group1 resptype cond*story1 cond*group1 cond*resptype story1*group1 story1*resptype group1*resptype cond*story1*resptype cond*group1*resptype story1*group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study5_woCondXStoryXResptype; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1 group1 storynum resptype;
model rating = cond story1 group1 resptype cond*story1 cond*group1 cond*resptype story1*group1 story1*resptype group1*resptype cond*story1*group1 cond*group1*resptype story1*group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study5_woCondXGroupXResptype; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1 group1 storynum resptype;
model rating = cond story1 group1 resptype cond*story1 cond*group1 cond*resptype story1*group1 story1*resptype group1*resptype cond*story1*group1 cond*story1*resptype story1*group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study5_woStoryXGroupXResptype; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1 group1 storynum resptype;
model rating = cond story1 group1 resptype cond*story1 cond*group1 cond*resptype story1*group1 story1*resptype group1*resptype cond*story1*group1 cond*story1*resptype cond*group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study5_wo4way; 
proc mixed data=study5.final plot(maxpoints=6500)=studentpanel;
class pid cond story1 group1 storynum resptype;
model rating = cond story1 group1 resptype cond*story1 cond*group1 cond*resptype story1*group1 story1*resptype group1*resptype cond*story1*group1 cond*story1*resptype cond*group1*resptype story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study5_full hold=2,4;
run;
quit;
ods output close;



DATA Study5_full;
set Study5_full;
if CovParm = "resptype UN(1,1)";
run;

DATA Study5_Null;
set Study5_Null;
if CovParm = "resptype UN(1,1)";
run;

DATA Study5_woCond;
set Study5_woCond;
if CovParm = "’pid"’;
run;

DATA Study5_woStory;
set Study5_woStory;
if CovParm = "’pid"’;
run;

DATA Study5_woGroup;
set Study5_woGroup;
if CovParm = "’pid"’;
run;

DATA Study5_woResptype;
set Study5_woResptype;
if CovParm = "’pid"’;
run;

DATA Study5_woCondXStory; 
set Study5_woCondXStory; 
if CovParm = "’pid"’;
run;

DATA Study5_woCondXGroup; 
set Study5_woCondXGroup; 
if CovParm = "’pid"’;
run;

DATA Study5_woCondXResptype; 
set Study5_woCondXResptype; 
if CovParm = "’pid"’;
run;

DATA Study5_woStoryXGroup; 
set Study5_woStoryXGroup; 
if CovParm = "’pid"’;
run;

DATA Study5_StoryXResptype;
set Study5_StoryXResptype;
if CovParm = "’pid"’;
run;

DATA Study5_woGroupXResptype;
set Study5_woGroupXResptype;
if CovParm = "’pid"’;
run;

DATA Study5_woCondXStoryXGroup; 
set Study5_woCondXStoryXGroup; 
if CovParm = "’pid"’;
run;

DATA Study5_woCondXStoryXResptype; 
set Study5_woCondXStoryXResptype; 
if CovParm = "’pid"’;
run;

DATA Study5_woCondXGroupXResptype;
set Study5_woCondXGroupXResptype;
if CovParm = "’pid"’;
run;

DATA Study5_woStoryXGroupXResptype;
set Study5_woStoryXGroupXResptype;
if CovParm = "’pid"’;
run;

DATA Study5_wo4way;
set Study5_wo4way;
if CovParm = "resptype UN(1,1)";
run;



***COMPUTING F^2 FOR MAIN EFFECT OF COND2*****
DATA Study5_woCond_op;
merge Study5_full (rename=(Estimate=full)) Study5_Null (rename =(Estimate=null)) Study5_woCond (rename=(Estimate=woCond)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy5_woCond; set Study5_woCond_op;
DROP full null woCond;
R2full = (null - full)/null;
R2woCond = (null - woCond)/null;
f2 = (R2full - R2woCond)/(1 - R2full);
run;

PROC PRINT data=resultsStudy5_woCond;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF STORY*****
DATA Study5_woStory_op;
merge Study5_full (rename=(Estimate=full)) Study5_Null (rename =(Estimate=null)) Study5_woStory (rename=(Estimate=woStory)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy5_woStory; set Study5_woStory_op;
DROP full null woStory;
R2full = (null - full)/null;
R2woStory = (null - woStory)/null;
f2 = (R2full - R2woStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy5_woStory;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF GROUP*****
DATA Study5_woGroup_op;
merge Study5_full (rename=(Estimate=full)) Study5_Null (rename =(Estimate=null)) Study5_woGroup (rename=(Estimate=woGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy5_woGroup; set Study5_woGroup_op;
DROP full null woGroup;
R2full = (null - full)/null;
R2woGroup = (null - woGroup)/null;
f2 = (R2full - R2woGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy5_woGroup;
run;


***COMPUTING F^2 FOR MAIN EFFECT OF RESPTYPE*****
DATA Study5_woResptype_op;
merge Study5_full (rename=(Estimate=full)) Study5_Null (rename =(Estimate=null)) Study5_woResptype (rename=(Estimate=woResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy5_woResptype; set Study5_woResptype_op;
DROP full null woResptype;
R2full = (null - full)/null;
R2woResptype = (null - woResptype)/null;
f2 = (R2full - R2woResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy5_woResptype;
run;


***COMPUTING F^2 FOR CONDXSTORY*****
DATA Study5_woCondXStory_op;
merge Study5_full (rename=(Estimate=full)) Study5_Null (rename =(Estimate=null)) Study5_woCondXStory (rename=(Estimate=woCondXStory)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy5_woCondXStory; set Study5_woCondXStory_op;
DROP full null woCondXStory;
R2full = (null - full)/null;
R2woCondXStory = (null - woCondXStory)/null;
f2 = (R2full - R2woCondXStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy5_woCondXStory;
run;

***COMPUTING F^2 FOR CONDXGROUP*****
DATA Study5_woCondXGroup_op;
merge Study5_full (rename=(Estimate=full)) Study5_Null (rename =(Estimate=null)) Study5_woCondXGroup (rename=(Estimate=woCondXGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy5_woCondXGroup; set Study5_woCondXGroup_op;
DROP full null woCondXGroup;
R2full = (null - full)/null;
R2woCondXGroup = (null - woCondXGroup)/null;
f2 = (R2full - R2woCondXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy5_woCondXGroup;
run;

***COMPUTING F^2 FOR CONDXRESPTYPE*****
DATA Study5_woCondXResptype_op;
merge Study5_full (rename=(Estimate=full)) Study5_Null (rename =(Estimate=null)) Study5_woCondXResptype (rename=(Estimate=woCondXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy5_woCondXResptype; set Study5_woCondXResptype_op;
DROP full null woCondXResptype;
R2full = (null - full)/null;
R2woCondXResptype = (null - woCondXResptype)/null;
f2 = (R2full - R2woCondXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy5_woCondXResptype;
run;


***COMPUTING F^2 FOR STORYXGROUP*****
DATA Study5_woStoryXGroup_op;
merge Study5_full (rename=(Estimate=full)) Study5_Null (rename =(Estimate=null)) Study5_woStoryXGroup (rename=(Estimate=woStoryXGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy5_woStoryXGroup; set Study5_woStoryXGroup_op;
DROP full null woStoryXGroup;
R2full = (null - full)/null;
R2woStoryXGroup = (null - woStoryXGroup)/null;
f2 = (R2full - R2woStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy5_woStoryXGroup;
run;

***COMPUTING F^2 FOR STORYXRESPTYPE*****
DATA Study5_woStoryXResptype_op;
merge Study5_full (rename=(Estimate=full)) Study5_Null (rename =(Estimate=null)) Study5_woStoryXResptype (rename=(Estimate=woStoryXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy5_woStoryXResptype; set Study5_woStoryXResptype_op;
DROP full null woStoryXResptype;
R2full = (null - full)/null;
R2woStoryXResptype = (null - woStoryXResptype)/null;
f2 = (R2full - R2woStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy5_woStoryXResptype;
run;

***COMPUTING F^2 FOR GROUPXRESPTYPE*****
DATA Study5_woGroupXResptype_op;
merge Study5_full (rename=(Estimate=full)) Study5_Null (rename =(Estimate=null)) Study5_woGroupXResptype (rename=(Estimate=woGroupXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy5_woGroupXResptype; set Study5_woGroupXResptype_op;
DROP full null woGroupXResptype;
R2full = (null - full)/null;
R2woGroupXResptype = (null - woGroupXResptype)/null;
f2 = (R2full - R2woGroupXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy5_woGroupXResptype;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUP*****
DATA Study5_woCondXStoryXGroup_op;
merge Study5_full (rename=(Estimate=full)) Study5_Null (rename =(Estimate=null)) Study5_woCondXStoryXGroup (rename=(Estimate=woCondXStoryXGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy5_woCondXStoryXGroup; set Study5_woCondXStoryXGroup_op;
DROP full null woCondXStoryXGroup;
R2full = (null - full)/null;
R2woCondXStoryXGroup = (null - woCondXStoryXGroup)/null;
f2 = (R2full - R2woCondXStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy5_woCondXStoryXGroup;
run;

***COMPUTING F^2 FOR CONDXSTORYXRESPTYPE*****
DATA Study5_woCondXStoryXResptype_op;
merge Study5_full (rename=(Estimate=full)) Study5_Null (rename =(Estimate=null)) Study5_woCondXStoryXResptype (rename=(Estimate=woCondXStoryXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy5_woCondXStoryXResptype; set Study5_woCondXStoryXResptype_op;
DROP full null woCondXStoryXResptype;
R2full = (null - full)/null;
R2woCondXStoryXResptype = (null - woCondXStoryXResptype)/null;
f2 = (R2full - R2woCondXStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy5_woCondXStoryXResptype;
run;

***COMPUTING F^2 FOR STORYXGROUPXRESPTYPE*****
DATA Study5_woStoryXGroupXResptype_op;
merge Study5_full (rename=(Estimate=full)) Study5_Null (rename =(Estimate=null)) Study5_woStoryXGroupXResptype (rename=(Estimate=woStoryXGroupXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy5_woStoryXGroupXResptype; set Study5_woStoryXGroupXResptype_op;
DROP full null woStoryXGroupXResptype;
R2full = (null - full)/null;
R2woStoryXGroupXResptype = (null - woStoryXGroupXResptype)/null;
f2 = (R2full - R2woStoryXGroupXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy5_woStoryXGroupXResptype;
run;

***COMPUTING F^2 FOR CONDXSTORYXGROUPXRESPTYPE*****
DATA Study5_wo4way_op;
merge Study5_full (rename=(Estimate=full)) Study5_Null (rename =(Estimate=null)) Study5_wo4way (rename=(Estimate=wo4way)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy5_wo4way; set Study5_wo4way_op;
DROP full null wo4way;
R2full = (null - full)/null;
R2wo4way = (null - wo4way)/null;
f2 = (R2full - R2wo4way)/(1 - R2full);
run;

PROC PRINT data=resultsStudy5_wo4way;
run;


