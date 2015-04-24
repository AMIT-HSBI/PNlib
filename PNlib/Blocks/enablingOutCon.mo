within PNlib.Blocks;
block enablingOutCon
  "enabling process of output transitions (continuous places)"
  parameter input Integer nOut "number of output transitions";
  input Real arcWeight[:] "arc weights of output transitions";
  input Real t_ "current marks";
  input Real minMarks "minimum capacity";
  input Boolean TAout[:] "active output transitions with passed delay";
  input Integer enablingType "resolution of actual conflicts";
  input Real enablingProb[:] "enabling probabilites of output transitions";
  input Boolean disTransition[:] "discrete transition?";
  input Boolean delayPassed "Does any delayPassed of a output transition";
  output Boolean TEout_[nOut] "enabled output transitions";
protected
  Real t=t_+Constants.eps
    "numeric to realize the correct simulation of some specific hybrid petri nets";
  Boolean TEout[nOut] "enabled output transitions";
  Boolean disTAout[nOut] "discret active output transitions";
  Integer remTAout[nOut] "remaining active output transitions";
  discrete Real cumEnablingProb[nOut]
    "cumulated, scaled enabling probabilities";
  discrete Real arcWeightSum "arc weight sum";
  Integer nremTAout "number of remaining active output transitions";
  Integer nTAout "number of active output transitions";
  Integer k "iteration index";
  Integer posTE "possible enabled transition";
  discrete Real randNum "uniform distributed random number";
  discrete Real sumEnablingProbTAout
    "sum of the enabling probabilities of the active output transitions";
  Boolean endWhile;
algorithm
  when delayPassed then
    if nOut>0 then
    disTAout:=TAout and disTransition;
    arcWeightSum := Functions.OddsAndEnds.conditionalSum(arcWeight, disTAout);
                                                                   //arc weight sum of all active output transitions
    if t - arcWeightSum >= minMarks or Functions.OddsAndEnds.isEqual(arcWeightSum, 0.0) then  //Place has no actual conflict; all active output transitions are enabled
      TEout:=TAout;
    else                          //Place has an actual conflict;
      TEout:=TAout and not disTransition;
      if enablingType==1 then     //deterministic enabling according to priorities
        arcWeightSum:=0;
        for i in 1: nOut loop
          if disTAout[i] and ((t-(arcWeightSum+arcWeight[i])>=minMarks) or Functions.OddsAndEnds.isEqual(arcWeight[i], 0.0)) then
            TEout[i]:=true;
            arcWeightSum:=arcWeightSum + arcWeight[i];
          end if;
        end for;
      else                        //probabilistic enabling according to enabling probabilities
        arcWeightSum:=0;
        remTAout:=zeros(nOut);
        nremTAout:=0;
        for i in 1:nOut loop
          if disTAout[i] then
            nremTAout:=nremTAout+1;  //number of active output transitions
            remTAout[nremTAout]:=i;  //active output transitions
          end if;
        end for;
        nTAout:=nremTAout;          //number of active output transitions
        sumEnablingProbTAout:=sum(enablingProb[remTAout[1:nremTAout]]);  //enabling probability sum of all active output transitions
        cumEnablingProb:=zeros(nOut);      //cumulative, scaled enabling probabilities
        cumEnablingProb[1]:=enablingProb[remTAout[1]]/sumEnablingProbTAout;
        for j in 2:nremTAout loop
          cumEnablingProb[j]:=cumEnablingProb[j-1]+enablingProb[remTAout[j]]/sumEnablingProbTAout;
        end for;
        //muss hier stehen sonst immer fast gleiche Zufallszahl => immer gleiches enabling
        randNum := PNlib.Functions.Random.random()/32767;
        for i in 1:nTAout loop
          randNum := PNlib.Functions.Random.random()/32767;
                                            //uniform distributed random number
          endWhile:=false;
          k:=1;
          while k<=nremTAout and not endWhile loop
              if randNum <= cumEnablingProb[k] then
                 posTE:=remTAout[k];
                 endWhile:=true;
              else
                k:=k + 1;
              end if;
          end while;
          if (t-(arcWeightSum + arcWeight[posTE]) >= minMarks) or  Functions.OddsAndEnds.isEqual(arcWeight[i], 0.0) then
             arcWeightSum:=arcWeightSum + arcWeight[posTE];
             TEout[posTE]:=true;
          end if;
          nremTAout:=nremTAout - 1;
          if nremTAout > 0 then
            remTAout:=Functions.OddsAndEnds.deleteElementInt(remTAout,k);
            cumEnablingProb:=zeros(nOut);
            sumEnablingProbTAout:=sum(enablingProb[remTAout[1:nremTAout]]);
            if sumEnablingProbTAout>0 then
              cumEnablingProb[1]:=enablingProb[remTAout[1]]/sumEnablingProbTAout;
              for j in 2:nremTAout loop
                cumEnablingProb[j]:=cumEnablingProb[j-1]+enablingProb[remTAout[j]]/sumEnablingProbTAout;
              end for;
            else
                cumEnablingProb[1:nremTAout]:=fill(1/nremTAout, nremTAout);
            end if;
          end if;
        end for;
       end if;
      end if;
    else
      TEout:=fill(false, nOut);
      disTAout:=fill(false, nOut);
      remTAout:=fill(0, nOut);
      cumEnablingProb:=fill(0.0, nOut);
      arcWeightSum:=0.0;
      nremTAout:=0;
      nTAout:=0;
      k:=0;
      posTE:=0;
      randNum:=0.0;
      sumEnablingProbTAout:=0.0;
      endWhile:=false;
    end if;
  end when;
  TEout_:=TEout and TAout;
end enablingOutCon;
