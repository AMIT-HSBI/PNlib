within PNlib.Blocks;
block decreasingFactor "calculation of decreasing factors"
  parameter input Integer nIn "number of input transitions";
  parameter input Integer nOut "number of output transitions";
  input Real t "marking";
  input Real minMarks "minimum capacity";
  input Real maxMarks "maximum capacity";
  input Real speedIn "input speed";
  input Real speedOut "output speed";
  input Real maxSpeedIn[:] "maximum speeds of input transitions";
  input Real maxSpeedOut[:] "maximum speeds of output transitions";
  input Real prelimSpeedIn[:] "preliminary speeds of input transitions";
  input Real prelimSpeedOut[:] "preliminary speeds of output transitions";
  input Real arcWeightIn[:] "arc weights of input transitions";
  input Real arcWeightOut[:] "arc weights of output transitions";
  input Boolean firingIn[:] "firability of input transitions";
  input Boolean firingOut[:] "firability of output transitions";
  output Real decFactorIn[nIn] "decreasing factors for input transitions";
  output Real decFactorOut[nOut] "decreasing factors for output transitions";
protected
  Real maxSpeedSumIn;
  Real maxSpeedSumOut;
  Real prelimSpeedSumIn;
  Real prelimSpeedSumOut;
  Real prelimDecFactorIn;
  Real prelimDecFactorOut;
  Real modSpeedIn;
  Real modSpeedOut;
  Real minMarksMod;
  Integer numFireOut;
  Integer numFireIn;
  Boolean stop;
algorithm
  decFactorIn:=fill(-1, nIn);
  decFactorOut:=fill(-1, nOut);
  modSpeedIn:=speedIn;
  modSpeedOut:=speedOut;
  numFireOut := Functions.OddsAndEnds.numTrue(firingOut);
  numFireIn := Functions.OddsAndEnds.numTrue(firingIn);
  stop:=false;
  maxSpeedSumIn:=0;
  maxSpeedSumOut:=0;
  prelimSpeedSumIn:=0;
  prelimSpeedSumOut:=0;
  prelimDecFactorIn:=0;
  prelimDecFactorOut:=0;
  minMarksMod:=minMarks;
  //-----------------------------------------------------------------------------------------------------------//
  //decreasing factor of input transitions
if numFireOut>0 and numFireIn>1 then
//     for i in 1:nIn loop
//       if firingIn[i] then
//          prelimSpeedSumIn:=prelimSpeedSumIn + arcWeightIn[i]*prelimSpeedIn[i];
//          maxSpeedSumIn:=maxSpeedSumIn + arcWeightIn[i]*maxSpeedIn[i];
//       end if;
//     end for;
    prelimSpeedSumIn:=Functions.OddsAndEnds.conditionalSum(arcWeightIn.*prelimSpeedIn, firingIn);
    maxSpeedSumIn:=Functions.OddsAndEnds.conditionalSum(arcWeightIn.*maxSpeedIn, firingIn);
    if maxSpeedSumIn>0 then
    if not (t<maxMarks) and  speedOut<prelimSpeedSumIn then   // arcWeights can be zero and then is maxSpeedSumIn zero!!! and not maxSpeedSumIn<=0
      prelimDecFactorIn:=speedOut/maxSpeedSumIn;
      while not stop loop
        stop:=true;
        for i in 1:nIn loop
          if firingIn[i] and prelimDecFactorIn*maxSpeedIn[i]>prelimSpeedIn[i] and decFactorIn[i]<0 and prelimDecFactorIn<1 then
             decFactorIn[i]:=prelimSpeedIn[i]/maxSpeedIn[i];
             modSpeedOut:=modSpeedOut - arcWeightIn[i]*prelimSpeedIn[i];
             maxSpeedSumIn:=maxSpeedSumIn - arcWeightIn[i]*maxSpeedIn[i];
             stop:=false;
          end if;
        end for;
         if  maxSpeedSumIn>0 then
           prelimDecFactorIn:=modSpeedOut/maxSpeedSumIn;
         else
           prelimDecFactorIn:=1;
        end if;
 //       prelimDecFactorIn:=if not maxSpeedSumIn<=0 then modSpeedOut/maxSpeedSumIn else 1;  // arcWeights can be zero and then is maxSpeedSumIn zero!!!
      end while;
      for i in 1:nIn loop
        if decFactorIn[i]<0 then
          decFactorIn[i]:=prelimDecFactorIn;
        end if;
      end for;
    else
      decFactorIn:=fill(1, nIn);
    end if;
  else
      decFactorIn:=fill(1, nIn);
    end if;
     else
      decFactorIn:=fill(1, nIn);
end if;
  //-----------------------------------------------------------------------------------------------------------//
  //decreasing factor of output transitions
  stop:=false;
   if numFireOut>1 and numFireIn>0 then
    prelimSpeedSumOut:=Functions.OddsAndEnds.conditionalSum(arcWeightOut.*prelimSpeedOut, firingOut);
    maxSpeedSumOut:=Functions.OddsAndEnds.conditionalSum(arcWeightOut .*maxSpeedOut, firingOut);
    if maxSpeedSumOut>0 then
    if not t>minMarks and speedIn<prelimSpeedSumOut then

      prelimDecFactorOut:=speedIn/maxSpeedSumOut;
      while not stop loop
        stop:=true;
        for i in 1:nOut loop
          if firingOut[i] and prelimDecFactorOut*maxSpeedOut[i]>prelimSpeedOut[i] and decFactorOut[i]<0 and prelimDecFactorOut<1 then
             decFactorOut[i]:=prelimSpeedOut[i]/maxSpeedOut[i];
             modSpeedIn:=modSpeedIn - arcWeightOut[i]*prelimSpeedOut[i];
             maxSpeedSumOut:=maxSpeedSumOut - arcWeightOut[i]*maxSpeedOut[i];
             stop:=false;
          end if;
        end for;
      if maxSpeedSumOut>0 then
          prelimDecFactorOut:=modSpeedIn/maxSpeedSumOut;
      else
          prelimDecFactorIn:=1;
      end if;
      end while;
      for i in 1:nOut loop
        if decFactorOut[i]<0 then
          decFactorOut[i]:=prelimDecFactorOut;
        end if;
      end for;
    else
      decFactorOut:=fill(1, nOut);
    end if;
    else
       decFactorOut:=fill(1, nOut);
   end if;
   else
       decFactorOut:=fill(1, nOut);
   end if;
end decreasingFactor;
