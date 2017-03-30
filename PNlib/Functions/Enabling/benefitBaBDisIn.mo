within PNlib.Functions.Enabling;
function benefitBaBDisIn "Enabling Input Transition by Benefit and Branch and Bound"
  extends Modelica.Icons.Function;
  input Integer depth;
  input Integer nIn "number of input transitions";
  input Real benefit[:] "enabling benefit of input transitions";
  input Integer arcWeight[:] "arc weights of input transitions";
  input Real Quotient[:] "benefit Quotient";
  input Integer t "current token number";
  input Real benefitMaxIn "theoretical benefit input";
  input Integer maxTokens "maximum capacity";
  input Boolean TEinIn[:] "enabled input transitions input";
  input Integer TokenIn "used token input";
  input Real benefitLimitIn "best valid benefit input";
  input Boolean TAein[:] "active previous transitions which are already enabled by their input places";
  input Boolean disTransition[:] "discrete input transition";
  output Boolean TEinOut[nIn] "enabled input transitions output";
  output Integer TokenOut "used token output";
  output Real benefitMaxOut "theoretical benefit output";
  output Boolean valid "valid solution";
  output Real benefitLimitOut "best valid benefit Output";
  protected
  Real benefitLimit "best valid benefit";
  Real Quotient_[nIn] "new benefitb Quotient";
  Real MaxBenefit "max benefit Quotient";
  Integer Index "index of max benefit Quotient";
  Boolean TEinOut1[nIn] "enabled input transitions output of partial solution 1";
  Integer TokenOut1 "used token output of partial solution 1";
  Real benefitMaxOut1 "theoretical benefit output of partial solution 1";
  Boolean valid1"valid solution of partial solution 1";
  Boolean TEinOut2[nIn] "enabled output transitions output of partial solution 2";
  Integer TokenOut2 "used token output of partial solution 2";
  Real benefitMaxOut2 "theoretical benefit output of partial solution 2";
  Boolean valid2 "valid solution of partial solution 2";
  algorithm
    // starting values
    benefitLimitOut:=benefitLimitIn;
    benefitLimit:=benefitLimitIn;
    TEinOut:= TEinIn;
    TEinOut1:= TEinIn;
    TEinOut2:= TEinIn;
    Quotient_:=Quotient;
    TokenOut :=TokenIn;
    // max benefit Quotient
    MaxBenefit:=max(Quotient_);
    Index:=Modelica.Math.Vectors.find(MaxBenefit,Quotient_);
    // quotient update
    Quotient_[Index]:=-1;
    if not TAein[Index] or not disTransition[Index] then
    (TEinOut,TokenOut ,benefitMaxOut, valid, benefitLimitOut):=benefitBaBDisIn(depth+1, nIn, benefit, arcWeight, Quotient_, t, benefitMaxIn-benefit[Index], maxTokens, TEinOut, TokenOut, benefitLimit, TAein, disTransition);
    return;
    end if;
    // partial solution 1
    TEinOut1[Index] := true;
    TokenOut1 := TokenIn + arcWeight[Index];
    benefitMaxOut1:= benefitMaxIn;
    // partial solution 2
    TEinOut2[Index] := false;
    benefitMaxOut2:= benefitMaxIn-benefit[Index];
    TokenOut2 := TokenIn;
    // branch solution
    if depth < nIn then // no finished solution
      if t+TokenOut1 <=maxTokens and benefitMaxOut1>=benefitLimit then
          (TEinOut1,TokenOut1 ,benefitMaxOut1, valid1, benefitLimit):=benefitBaBDisIn(depth+1, nIn, benefit, arcWeight, Quotient_, t, benefitMaxOut1, maxTokens, TEinOut1, TokenOut1, benefitLimit, TAein, disTransition);
      else
        valid1:=false;
      end if;
      if t+TokenOut2 <= maxTokens and benefitMaxOut2>=benefitLimit then
          (TEinOut2,TokenOut2 ,benefitMaxOut2, valid2 , benefitLimit):=benefitBaBDisIn(depth+1, nIn, benefit, arcWeight, Quotient_, t, benefitMaxOut2, maxTokens, TEinOut2, TokenOut2, benefitLimit, TAein, disTransition);
      else
        valid2:=false;
      end if;
     else // finished solution
       if t+TokenOut1 <= maxTokens and benefitMaxOut1>=benefitLimit then
          valid1:=true;
          benefitLimit:=benefitMaxOut1;
       else
          valid1:=false;
       end if;
       if t+TokenOut2 <= maxTokens and benefitMaxOut2>=benefitLimit then
          valid2:=true;
          benefitLimit:=benefitMaxOut2;
       else
          valid2:=false;
       end if;
     end if;
    // output the solution
    if valid1 and benefitMaxOut1>=benefitLimit then
      TEinOut:=TEinOut1;
      TokenOut:=TokenOut1;
      benefitMaxOut:=benefitMaxOut1;
      valid:=true;
      benefitLimitOut:=benefitLimit;
    elseif valid2 and benefitMaxOut2>=benefitLimit then
      TEinOut:=TEinOut2;
      TokenOut:=TokenOut2;
      benefitMaxOut:=benefitMaxOut2;
      valid:=true;
      benefitLimitOut:=benefitLimit;
    end if;
end benefitBaBDisIn;
