within PNlib.Blocks;
block enablingOutDis "enabling process of output transitions"
  parameter input Integer nOut "number of output transitions";
  input Integer arcWeight[:] "arc weights of output transitions";
  input Integer t "current token number";
  input Integer minTokens "minimum capacity";
  input Boolean TAout[:] "active output transitions with passed delay";
  input Integer enablingType "resolution of actual conflicts";
  input Real enablingProb[:] "enabling probabilites of output transitions";
  input Boolean disTransition[:] "discrete output transition";
  input Boolean delayPassed "Does any delayPassed of a output transition";
  input Boolean activeCon "change of activation of output transitions";
  output Boolean TEout_[nOut] "enabled output transitions";
protected
  Boolean TEout[nOut] "enabled output transitions";
  Integer remTAout[nOut] "remaining active output transitions";
  discrete Real cumEnablingProb[nOut] "cumulated, scaled enabling probabilities";
  Integer arcWeightSum "arc weight sum";
  Integer nremTAout "number of remaining active output transitions";
  Integer nTAout "number of active output transitions";
  Integer k "iteration index";
  Integer posTE "possible enabled transition";
  discrete Real randNum "uniform distributed random number";
  discrete Real sumEnablingProbTAout
    "sum of the enabling probabilities of the active output transitions";
  Boolean endWhile;
algorithm
  when delayPassed or activeCon then
      if nOut>0 then
        TEout:=fill(false,nOut);
          arcWeightSum:=Functions.OddsAndEnds.conditionalSumInt(arcWeight,TAout);  //arc weight sum of all active output transitions
          if (t - arcWeightSum >= minTokens) then  //Place has no actual conflict; all active output transitions are enabled
            TEout:=TAout;
          else                          //Place has an actual conflict;
            if enablingType==1 then     //deterministic enabling according to priorities
              arcWeightSum:=0;
              for i in 1: nOut loop  //discrete transitions are proven at first
                if TAout[i] and disTransition[i] and t-(arcWeightSum+arcWeight[i])>=minTokens then
                  TEout[i]:=true;
                  arcWeightSum:=arcWeightSum + arcWeight[i];
                end if;
              end for;
              for i in 1: nOut loop  //continuous transitions afterwards (discrete transitions have priority over continuous transitions)
                if TAout[i] and not disTransition[i] and ((t-(arcWeightSum+arcWeight[i])>=minTokens)) then
                  TEout[i]:=true;
                  arcWeightSum:=arcWeightSum + arcWeight[i];
                end if;
              end for;
            else                        //probabilistic enabling according to enabling probabilities
              arcWeightSum:=0;
              remTAout:=zeros(nOut);
              nremTAout:=0;
              for i in 1:nOut loop
                if TAout[i] and disTransition[i] then
                  nremTAout:=nremTAout+1;  //number of active output transitions
                  remTAout[nremTAout]:=i;  //active output transitions
                end if;
              end for;
              nTAout:=nremTAout;          //number of active output transitions
              if nTAout>0 then
                sumEnablingProbTAout:=sum(enablingProb[remTAout[1:nremTAout]]);  //enabling probability sum of all active output transitions
                cumEnablingProb:=zeros(nOut);      //cumulative, scaled enabling probabilities
                cumEnablingProb[1]:=enablingProb[remTAout[1]]/sumEnablingProbTAout;
                for j in 2:nremTAout loop
                  cumEnablingProb[j]:=cumEnablingProb[j-1]+enablingProb[remTAout[j]]/sumEnablingProbTAout;
                end for;
                randNum := PNlib.Functions.Random.random()/32767; //muss hier stehen sonst immer fast gleiche Zufallszahl => immer gleiches enabling
                for i in 1:nTAout loop
                  randNum := PNlib.Functions.Random.random()/32767;  //uniform distributed random number
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
                  if t-(arcWeightSum + arcWeight[posTE]) >= minTokens then
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
             for i in 1: nOut loop
               if TAout[i] and not disTransition[i] and t-(arcWeightSum+arcWeight[i])>=minTokens then
                 TEout[i]:=true;
                 arcWeightSum:=arcWeightSum + arcWeight[i];
               end if;
             end for;
            end if;
      end if;
      else
        TEout:=fill(false, nOut);
        remTAout:=fill(0, nOut);
        cumEnablingProb:=fill(0.0, nOut);
        arcWeightSum:=0;
        nremTAout:=0;
        nTAout:=0;
        k:=0;
        posTE:=0;
        randNum:=0;
        sumEnablingProbTAout:=0.0;
        endWhile:=false;
      end if;
  end when;
  TEout_:=TEout and TAout;
end enablingOutDis;
