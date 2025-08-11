**ALWAYS CHANGE DIRECTORY WHEN STARTING TO WORK!!!**

libname study2 '\\andrew\users\users21\mcikara\Desktop\Arbgroups\study2';

data study2.final;
set study2.final(where=(pid>0));
run;


proc print data=study2.final(obs=64);
run;


**THIS IS THE FULL MODEL

ods output CovParms = Study2_full; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid story1 group1 storynum resptype;
model rating = story1 group1 resptype story1*group1 story1*resptype group1*resptype story1*group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
run;
quit;
ods output close;

ods output CovParms = Study2_Null; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid story1 group1 storynum resptype;
model rating = / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study2_woStory; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid group1 storynum resptype;
model rating = group1 resptype  / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study2_woGroup; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid  story1  storynum resptype;
model rating =  story1 resptype  / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study2_woResptype; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid  story1 group1 storynum ;
model rating =  story1 group1 / solution;

repeated storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study2_woStoryXGroup; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid  story1 group1 storynum resptype;
model rating =  story1 group1 resptype story1*resptype group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;


ods output CovParms = Study2_StoryXResptype; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid  story1 group1 storynum resptype;
model rating =  story1 group1 resptype story1*group1 group1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study2_woGroupXResptype; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid  story1 group1 storynum resptype;
model rating =  story1 group1 resptype story1*group1 story1*resptype / solution;

repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;

ods output CovParms = Study2_wo3way; 
proc mixed data=study2.final plot(maxpoints=6500)=studentpanel;
class pid  story1 group1 storynum resptype;
model rating =  story1 group1 resptype story1*group1 story1*resptype group1*resptype / solution;
repeated resptype storynum/ subject=pid type=un@cs /*type=un@un*/;
parms /parmsdata=Study2_full hold=2,4;
run;
quit;
ods output close;



DATA Study2_full;
set Study2_full;
if CovParm = "resptype UN(1,1)";
run;

DATA Study2_full;
set Study2_full;
if CovParm = "UN(2,2)";
run;

DATA Study2_Null;
set Study2_Null;
if CovParm = "resptype UN(1,1)";
run;

DATA Study2_Null;
set Study2_Null;
if CovParm = "UN(2,2)";
run;

DATA Study2_woStory;
set Study2_woStory;
if CovParm = "’pid"’;
run;

DATA Study2_woGroup;
set Study2_woGroup;
if CovParm = "’pid"’;
run;

DATA Study2_woResptype;
set Study2_woResptype;
if CovParm = "’pid"’;
run;

DATA Study2_woStoryXGroup; 
set Study2_woStoryXGroup; 
if CovParm = "’pid"’;
run;

DATA Study2_StoryXResptype;
set Study2_StoryXResptype;
if CovParm = "’pid"’;
run;

DATA Study2_woGroupXResptype;
set Study2_woGroupXResptype;
if CovParm = "’pid"’;
run;

DATA Study2_wo3way;
set Study2_wo3way;
if CovParm = "resptype UN(1,1)";
run;

DATA Study2_wo3way;
set Study2_wo3way;
if CovParm = "UN(2,2)"’;
run;



***COMPUTING F^2 FOR MAIN EFFECT OF STORY*****
DATA Study2_woStory_op;
merge Study2_full (rename=(Estimate=full)) Study2_Null (rename =(Estimate=null)) Study2_woStory (rename=(Estimate=woStory)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy2_woStory; set Study2_woStory_op;
DROP full null woStory;
R2full = (null - full)/null;
R2woStory = (null - woStory)/null;
f2 = (R2full - R2woStory)/(1 - R2full);
run;

PROC PRINT data=resultsStudy2_woStory;
run;

***COMPUTING F^2 FOR MAIN EFFECT OF GROUP*****
DATA Study2_woGroup_op;
merge Study2_full (rename=(Estimate=full)) Study2_Null (rename =(Estimate=null)) Study2_woGroup (rename=(Estimate=woGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy2_woGroup; set Study2_woGroup_op;
DROP full null woGroup;
R2full = (null - full)/null;
R2woGroup = (null - woGroup)/null;
f2 = (R2full - R2woGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy2_woGroup;
run;


***COMPUTING F^2 FOR MAIN EFFECT OF RESPTYPE*****
DATA Study2_woResptype_op;
merge Study2_full (rename=(Estimate=full)) Study2_Null (rename =(Estimate=null)) Study2_woResptype (rename=(Estimate=woResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy2_woResptype; set Study2_woResptype_op;
DROP full null woResptype;
R2full = (null - full)/null;
R2woResptype = (null - woResptype)/null;
f2 = (R2full - R2woResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy2_woResptype;
run;



***COMPUTING F^2 FOR STORYXGROUP*****
DATA Study2_woStoryXGroup_op;
merge Study2_full (rename=(Estimate=full)) Study2_Null (rename =(Estimate=null)) Study2_woStoryXGroup (rename=(Estimate=woStoryXGroup)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy2_woStoryXGroup; set Study2_woStoryXGroup_op;
DROP full null woStoryXGroup;
R2full = (null - full)/null;
R2woStoryXGroup = (null - woStoryXGroup)/null;
f2 = (R2full - R2woStoryXGroup)/(1 - R2full);
run;

PROC PRINT data=resultsStudy2_woStoryXGroup;
run;

***COMPUTING F^2 FOR STORYXRESPTYPE*****
DATA Study2_woStoryXResptype_op;
merge Study2_full (rename=(Estimate=full)) Study2_Null (rename =(Estimate=null)) Study2_woStoryXResptype (rename=(Estimate=woStoryXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy2_woStoryXResptype; set Study2_woStoryXResptype_op;
DROP full null woStoryXResptype;
R2full = (null - full)/null;
R2woStoryXResptype = (null - woStoryXResptype)/null;
f2 = (R2full - R2woStoryXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy2_woStoryXResptype;
run;

***COMPUTING F^2 FOR GROUPXRESPTYPE*****
DATA Study2_woGroupXResptype_op;
merge Study2_full (rename=(Estimate=full)) Study2_Null (rename =(Estimate=null)) Study2_woGroupXResptype (rename=(Estimate=woGroupXResptype)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy2_woGroupXResptype; set Study2_woGroupXResptype_op;
DROP full null woGroupXResptype;
R2full = (null - full)/null;
R2woGroupXResptype = (null - woGroupXResptype)/null;
f2 = (R2full - R2woGroupXResptype)/(1 - R2full);
run;

PROC PRINT data=resultsStudy2_woGroupXResptype;
run;


***COMPUTING F^2 FOR STORYXGROUPXRESPTYPE*****
DATA Study2_wo3way_op;
merge Study2_full (rename=(Estimate=full)) Study2_Null (rename =(Estimate=null)) Study2_wo3way (rename=(Estimate=wo3way)); by CovParm;
DROP CovParm Subject;
run;


DATA resultsStudy2_wo3way; set Study2_wo3way_op;
DROP full null wo3way;
R2full = (null - full)/null;
R2wo3way = (null - wo3way)/null;
f2 = (R2full - R2wo3way)/(1 - R2full);
run;

PROC PRINT data=resultsStudy2_wo3way;
run;

