within PNlib.Components;
model IA "Inhibitor Arc"
  //****MODIFIABLE PARAMETERS AND VARIABLES BEGIN****//
  parameter Real testValue=1 "marking that has to be deceeded to enable firing" annotation(Dialog(enable = true, group = "Inhibitor Arc"));
  parameter Boolean realInhibitorArc=true "real Inhibitor arc <, Inhibitor arc <=" annotation(Dialog(enable = true, group = "Inhibitor Arc"));
  parameter Boolean normalArc=true "double arc: inhibitor and normal arc?" annotation(Dialog(enable = true, group = "Inhibitor Arc"));
  //****MODIFIABLE PARAMETERS AND VARIABLES END****//
  Boolean animateWeightTIarc=settings.animateWeightTIarc
    "only for transition animation and display (Do not change!)";
  Integer testColor[3]
    "only for transition animation and display (Do not change!)";
  Interfaces.TransitionIn inPlace(active=outTransition.active,
  fire=outTransition.fire,
  arcWeight=if normalArc then 0 else outTransition.arcWeight ,
  arcWeightint=if normalArc then 0 else outTransition.arcWeightint,
  disTransition=outTransition.disTransition,
  instSpeed=if normalArc then 0 else outTransition.instSpeed,
  prelimSpeed=if normalArc then 0 else outTransition.prelimSpeed,
  maxSpeed=if normalArc then 0 else outTransition.maxSpeed)
    "connector for place"
          annotation(Placement(transformation(
          extent={{-110, 12}, {-90, 32}}), iconTransformation(extent={{-118, 16},
            {-98, 36}})));
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
  arcType=if realInhibitorArc then PNlib.Types.ArcType.RealInhibitorArc else PNlib.Types.ArcType.InhibitorArc,
  testValue=testValue,
  testValueint=testValueInt,
  normalArc=normalArc,
  speedSum=inPlace.speedSum) "connector for transition" annotation(Placement(transformation(extent={{28, 16},
            {48, 36}}), iconTransformation(extent={{28, 16},
            {48, 36}})));
protected
  outer PNlib.Components.Settings settings "global settings for animation and display";
  Integer testValueInt "integer test value (for generating events!)";
equation
  if outTransition.disPlace then
     testValueInt=integer(testValue);
  else
     testValueInt=1;
  end if;
  //****ANIMATION BEGIN****//
  if inPlace.t<testValue and settings.animateTIarc then
    testColor={0, 255, 0};
  elseif  settings.animateTIarc then
    testColor={255, 0, 0};
  else
    testColor={255, 255, 255};
  end if;
  //****ANIMATION END****//
  //****ERROR MESSENGES BEGIN****//
  assert((outTransition.disPlace and testValue-testValueInt<=0.0) or not outTransition.disPlace, "Test arcs connected to discrete places must have integer test values.");
  assert(testValue>=0, "Test values must be greater or equal than zero.");
  //****ERROR MESSENGES END****//
  annotation(defaultComponentName = "IA1", Icon(coordinateSystem(preserveAspectRatio=true, extent={{-98, 4},
            {28, 48}}),
                   graphics={
        Rectangle(
          extent={{-98, 48}, {28, 4}},
          lineColor={0, 0, 0},
          fillColor=DynamicSelect({255, 255, 255}, testColor),
          fillPattern=FillPattern.Solid),
        Line(
          points={{-94, 24}, {22, 24}},
          color={0, 0, 0},
          smooth=Smooth.None),
        Ellipse(
          extent={{14, 30}, {26, 18}},
          lineColor={0, 0, 0},
          fillColor={255, 255, 255},
          fillPattern=FillPattern.Solid),
       Text(
          extent={{-38, -4}, {-38, -16}},
          lineColor={0, 0, 0},
          lineThickness=0.5,
          textString=DynamicSelect(" ", if animateWeightTIarc then realString(testValue, 1, 1) else " "))}), Diagram(coordinateSystem(
          preserveAspectRatio=true, extent={{-98, 0}, {28, 48}}), graphics));
end IA;
