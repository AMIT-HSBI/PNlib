within PNlib.Interfaces;
connector PlaceOut
  "part of place model to connect places to output transitions"
  input Boolean active "Are the output transitions active?" annotation(HideResult = true);
  input Boolean fire "Do the output transitions fire?" annotation(HideResult = true);
  input Real arcWeight "Arc weights of output transitions" annotation(HideResult = true);
  input Integer arcWeightint "Integer arc weights of output transitions" annotation(HideResult = true);
  input Boolean disTransition "Are the output transitions discrete?" annotation(HideResult = true);
  input Real instSpeed "Instantaneous speeds of continuous output transitions" annotation(HideResult = true);
  input Real prelimSpeed "Preliminary speeds of continuous output transitions" annotation(HideResult = true);
  input Real maxSpeed "Maximum speeds of continuous output transitions" annotation(HideResult = true);
  output Real t "Marking of the place" annotation(HideResult = true);
  output Integer tint "Integer marking of the place" annotation(HideResult = true);
  output Real minTokens "Minimum capacity of the place" annotation(HideResult = true);
  output Integer minTokensint "Integer minimum capacity of the place" annotation(HideResult = true);
  output Boolean enable
    "Which of the output transitions are enabled by the place?"                     annotation(HideResult = true);
  output Real decreasingFactor
    "Factor for decreasing the speed of continuous input transitions"                            annotation(HideResult = true);
  output Boolean disPlace "Type of the place (discrete or continuous)" annotation(HideResult = true);
  output Integer arcType
    "Type of output arcs (normal, test,inhibition, or read)"                      annotation(HideResult = true);
  output Boolean fed "Is the continuous place fed by input transitions?" annotation(HideResult = true);
  output Real speedSum "Input speed of a continuous place" annotation(HideResult = true);
  output Boolean tokenInOut "Does the place have a discrete token change?" annotation(HideResult = true);
  output Real testValue "Test value of a test or inhibitor arc" annotation(HideResult = true);
  output Integer testValueint "Integer test value of a test or inhibitor arc"  annotation(HideResult = true);
  output Integer normalArc
    "Double arc: test and normal arc or inhibitor and normal arc"                        annotation(HideResult = true);
  annotation (Icon(graphics={Polygon(
          points={{-100,100},{98,0},{-100,-100},{-100,100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}));
end PlaceOut;
