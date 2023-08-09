within PNlib.Functions.Enabling;

function benefitBaBConOut "Enabling Output Transition by Benefit and Branch and Bound"
  extends Modelica.Icons.Function;
  input Integer depth;
  input Integer nOut "number of output transitions";
  input Real benefit[:] "enabling benefit of output transitions";
  input Integer arcWeight[:] "arc weights of output transitions";
  input Real Quotient[:] "benefit Quotient";
  input Integer t "current token number";
  input Real benefitMaxIn "theoretical benefit input";
  input Integer minTokens "minimum capacity";
  input Boolean TEoutIn[:] "enabled output transitions input";
  input Integer TokenIn "used token input";
  input Real benefitLimitIn "best valid benefit input";
  input Boolean TAout[:] "active output transitions with passed delay";
  input Boolean disTransition[:] "discrete output transition";
  output Boolean TEoutOut[nOut] "enabled output transitions output";
  output Integer TokenOut "used token output";
  output Real benefitMaxOut "theoretical benefit output";
  output Boolean valid "valid solution";
  output Real benefitLimitOut "best valid benefit Output";
protected
  Real benefitLimit "best valid benefit";
  Real Quotient_[nOut] "new benefitb Quotient";
  Real MaxBenefit "max benefit Quotient";
  Integer Index "index of max benefit Quotient";
  Boolean TEoutOut1[nOut] "enabled output transitions output of partial solution 1";
  Integer TokenOut1 "used token output of partial solution 1";
  Real benefitMaxOut1 "theoretical benefit output of partial solution 1";
  Boolean valid1 "valid solution of partial solution 1";
  Boolean TEoutOut2[nOut] "enabled output transitions output of partial solution 2";
  Integer TokenOut2 "used token output of partial solution 2";
  Real benefitMaxOut2 "theoretical benefit output of partial solution 2";
  Boolean valid2 "valid solution of partial solution 2";
algorithm
  // starting values
  benefitLimitOut := benefitLimitIn;
  benefitLimit := benefitLimitIn;
  TEoutOut := TEoutIn;
  TEoutOut1 := TEoutIn;
  TEoutOut2 := TEoutIn;
  Quotient_ := Quotient;
  TokenOut := TokenIn;
  // max benefit Quotient
  MaxBenefit := max(Quotient_);
  Index := Modelica.Math.Vectors.find(MaxBenefit, Quotient_);
  // quotient update
  Quotient_[Index] := -1;
  if not TAout[Index] or not disTransition[Index] then
    (TEoutOut, TokenOut, benefitMaxOut, valid, benefitLimitOut) := benefitBaBConOut(depth + 1, nOut, benefit, arcWeight, Quotient_, t, benefitMaxIn - benefit[Index], minTokens, TEoutOut, TokenOut, benefitLimit, TAout, disTransition);
    return;
  end if;
  // partial solution 1
  TEoutOut1[Index] := true;
  TokenOut1 := TokenIn + arcWeight[Index];
  benefitMaxOut1 := benefitMaxIn;
  // partial solution 2
  TEoutOut2[Index] := false;
  benefitMaxOut2 := benefitMaxIn - benefit[Index];
  TokenOut2 := TokenIn;
  // branch solution
  if depth < nOut then // no finished solution
    if t - TokenOut1 >= minTokens and benefitMaxOut1 >= benefitLimit then
      (TEoutOut1, TokenOut1, benefitMaxOut1, valid1, benefitLimit) := benefitBaBConOut(depth + 1, nOut, benefit, arcWeight, Quotient_, t, benefitMaxOut1, minTokens, TEoutOut1, TokenOut1, benefitLimit, TAout, disTransition);
    else
      valid1 := false;
    end if;
    if t - TokenOut2 >= minTokens and benefitMaxOut2 >= benefitLimit then
      (TEoutOut2, TokenOut2, benefitMaxOut2, valid2, benefitLimit) := benefitBaBConOut(depth + 1, nOut, benefit, arcWeight, Quotient_, t, benefitMaxOut2, minTokens, TEoutOut2, TokenOut2, benefitLimit, TAout, disTransition);
    else
      valid2 := false;
    end if;
  else // finished solution
    if t - TokenOut1 >= minTokens and benefitMaxOut1 >= benefitLimit then
      valid1 := true;
      benefitLimit := benefitMaxOut1;
    else
      valid1 := false;
    end if;
    if t - TokenOut2 >= minTokens and benefitMaxOut2 >= benefitLimit then
      valid2 := true;
      benefitLimit := benefitMaxOut2;
    else
      valid2 := false;
    end if;
  end if;
  // output the solution
  if valid1 and benefitMaxOut1 >= benefitLimit then
    TEoutOut := TEoutOut1;
    TokenOut := TokenOut1;
    benefitMaxOut := benefitMaxOut1;
    valid := true;
    benefitLimitOut := benefitLimit;
  elseif valid2 and benefitMaxOut2 >= benefitLimit then
    TEoutOut := TEoutOut2;
    TokenOut := TokenOut2;
    benefitMaxOut := benefitMaxOut2;
    valid := true;
    benefitLimitOut := benefitLimit;
  end if;
end benefitBaBConOut;
