within PNlib.Interfaces;
connector PlaceIn "part of place model to connect places to input transitions"
  input Boolean active "Are the input transitions active?" annotation(HideResult = true);
  input Boolean fire "Do the input transitions fire?" annotation(HideResult = true);
  input Real arcWeight "Arc weights of input transitions" annotation(HideResult = true);
  input Integer arcWeightint "Integer arc weights of input transitions" annotation(HideResult = true);
  input Boolean enabledByInPlaces
    "Are the input transitions enabled by all theier input places?"                               annotation(HideResult = true);
  input Boolean disTransition
    "Types of input transitions (discrete/stochastic or continuous)"                           annotation(HideResult = true);
  input Real instSpeed "Instantaneous speeds of continuous input transitions" annotation(HideResult = true);
  input Real prelimSpeed "Preliminary speeds of continuous input transitions" annotation(HideResult = true);
  input Real maxSpeed "Maximum speeds of continuous input transitions" annotation(HideResult = true);
  output Real t "Marking of the place" annotation(HideResult = true);
  output Integer tint "Integer marking of the place" annotation(HideResult = true);
  output Real maxTokens "Maximum capacity of the place" annotation(HideResult = true);
  output Integer maxTokensint "Integer maximum capacity of the place" annotation(HideResult = true);
  output Boolean enable
    "Which of the input transitions are enabled by the place?"                     annotation(HideResult = true);
  output Real decreasingFactor
    "Factor for decreasing the speed of continuous input transitions"                            annotation(HideResult = true);
  output Boolean disPlace "Type of the place (discrete or continuous)" annotation(HideResult = true);
  output Boolean emptied
    "Is the continuous place emptied by output transitions?"                      annotation(HideResult = true);
  output Real speedSum "Output speed of a continuous place" annotation(HideResult = true);
  annotation (Icon(graphics={Polygon(
          points={{-100,100},{98,0},{-100,-100},{-100,100}},
          lineColor={0,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid)}));
end PlaceIn;
