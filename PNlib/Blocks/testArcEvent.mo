within PNlib.Blocks;
block testArcEvent
  "Generates an event when a test value of a test or inhibitor arc is exceeded or deceeded by the place"
  parameter input Integer nIn "number of input places";
  input Real tIn[:] "marking of input places";
  input Real testValue[:] "test values of test or inhibitor arcs";
  output Boolean testChange[nIn] "true when test value is exceeded or deceeded";
protected
  Boolean above[nIn];
  Boolean preabove[nIn];
  Boolean pretestChange[nIn];
  Boolean ttest[nIn];
  Boolean prettest[nIn];
  discrete Real ttest2[nIn];
equation
  preabove=pre(above);
  pretestChange=pre(testChange);
  prettest=pre(ttest);
algorithm
  for i in 1:nIn loop
    above[i]:=tIn[i] > testValue[i];
     when above[i]<>preabove[i] then
       testChange[i]:=true;
       ttest[i]:=preabove[i];
       ttest2[i]:=tIn[i];
     elsewhen pretestChange[i] and ((not ttest[i] and tIn[i]>ttest2[i]) or (ttest[i] and tIn[i]<ttest2[i])) then
       testChange[i]:=false;
     end when;
  end for;
end testArcEvent;
