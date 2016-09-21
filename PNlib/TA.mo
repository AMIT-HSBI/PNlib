within PNlib;
model TA "Test Arc"
  //****MODIFIABLE PARAMETERS AND VARIABLES BEGIN****//
  parameter Real testValue=1 "marking that has to be exceeded to enable firing" annotation(Dialog(enable = true, group = "Test Arc"));
  parameter Integer normalArc=1 "Double arc: test and normal arc?" annotation(Dialog(enable = true, group = "Test Arc"), choices(choice=1 "No", choice=2 "Yes", __Dymola_radioButtons=true));
  //****MODIFIABLE PARAMETERS AND VARIABLES END****//
  Integer animateWeightTIarc=settings.animateWeightTIarc "only for transition animation and display (Do not change!)";
  Integer testColor[3] "only for transition animation and display (Do not change!)";
  Interfaces.TransitionIn inPlace(
    active=outTransition.active,
    fire=outTransition.fire,
    arcWeight=if normalArc==1 then 0 else outTransition.arcWeight,
    arcWeightint=if normalArc==1 then 0 else outTransition.arcWeightint,
    disTransition=outTransition.disTransition,
    instSpeed=if normalArc==1 then 0 else outTransition.instSpeed,
    prelimSpeed=if normalArc==1 then 0 else outTransition.prelimSpeed,
    maxSpeed=if normalArc==1 then 0 else outTransition.maxSpeed) "connector for place" annotation(Placement(transformation(extent={{-110, 12}, {-90, 32}}), iconTransformation(extent={{-118, 16}, {-98, 36}})));
  Interfaces.PlaceOut outTransition(
    t=inPlace.t,
    tint=inPlace.tint,
    minTokens=inPlace.minTokens,
    minTokensint=inPlace.minTokensint,
    enable=inPlace.enable,
    fed=inPlace.fed,
    decreasingFactor=inPlace.decreasingFactor,
    disPlace=inPlace.disPlace,
    tokenInOut=inPlace.tokenInOut,
    arcType=2,
    testValue=testValue,
    testValueint=testValueInt,
    normalArc=normalArc,
    speedSum=inPlace.speedSum) "connector for transition" annotation(Placement(transformation(extent={{28, 16}, {48, 36}}), iconTransformation(extent={{28, 16}, {48, 36}})));
protected
  outer PNlib.Settings settings "global settings for animation and display";
  Integer testValueInt "integer test value (for generating events!)";
equation
  if outTransition.disPlace then
    testValueInt=integer(testValue);
  else
    testValueInt=1;
  end if;
  //****ANIMATION BEGIN****//
  if inPlace.t>testValue and settings.animateTIarc==1 then
    testColor={0, 255, 0};
  elseif settings.animateTIarc==1 then
    testColor={255, 0, 0};
  else
    testColor={255, 255, 255};
  end if;
  //****ANIMATION END****//
  //****ERROR MESSENGES BEGIN****//
  assert((outTransition.disPlace and testValue-testValueInt<=0.0) or not outTransition.disPlace, "Test arcs connected to discrete places must have integer test values.");
  assert(testValue>=inPlace.minTokens, "Test values must be greater or equal than minimum values.");
  //****ERROR MESSENGES END****//
  annotation(defaultComponentName = "TA1", Icon(coordinateSystem(preserveAspectRatio=true, extent={{-98, 4}, {28, 48}}), graphics={Rectangle(extent={{-98, 48}, {28, 4}}, lineColor={0, 0, 0}, fillColor=DynamicSelect({255, 255, 255}, testColor), fillPattern=FillPattern.Solid), Line(points={{-94, 24}, {22, 24}}, color={0, 0, 0}, smooth=Smooth.None, pattern=LinePattern.Dash), Polygon(points={{14, 32}, {14, 16}, {26, 24}, {14, 32}}, lineColor={0, 0, 0}, smooth=Smooth.None, fillColor={0, 0, 0}, fillPattern=FillPattern.Solid), Text(extent={{-38, -4}, {-38, -16}}, lineColor={0, 0, 0}, lineThickness=0.5, textString=DynamicSelect(" ", if animateWeightTIarc==1 then realString(testValue, 1, 1) else " "))}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-98, 0}, {28, 48}}), graphics));
end TA;
