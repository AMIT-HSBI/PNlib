within PNlib.Components;
model RA "Read Arc"

  Interfaces.TransitionIn inPlace(active=outTransition.active,
  fire=outTransition.fire,
  arcWeight=0,
  arcWeightint=0,
  disTransition=outTransition.disTransition,
  instSpeed=0,
  prelimSpeed=0,
  maxSpeed=0) "connector for place" annotation(Placement(transformation(
          extent={{-110, 12}, {-90, 32}}), iconTransformation(extent={{-118, 16},
            {-98, 36}})));
  Interfaces.PlaceOut outTransition(t=inPlace.t,
  tint=inPlace.tint,
  minTokens=inPlace.minTokens,
  minTokensint=inPlace.minTokensint,
  enable=inPlace.enable,
  fed=inPlace.fed,
  decreasingFactor=inPlace.decreasingFactor,
  disPlace=inPlace.disPlace,
  tokenInOut=inPlace.tokenInOut,
  arcType=4,
  testValue=1,
  testValueint=1,
  normalArc=1,
  speedSum=inPlace.speedSum) "connector for transition" annotation(Placement(transformation(extent={{28, 16},
            {48, 36}}), iconTransformation(extent={{28, 16},
            {48, 36}})));
protected
  outer PNlib.Components.Settings settings
    "global settings for animation and display";
  annotation(defaultComponentName = "RA1", Icon(coordinateSystem(preserveAspectRatio=true, extent={{-98, 4},
            {28, 48}}),
                   graphics={
        Rectangle(
          extent={{-98, 48}, {28, 4}},
          lineColor={0, 0, 0},
          fillColor={255, 255, 255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-94, 24}, {22, 24}},
          smooth=Smooth.None,
          color={0, 0, 0}),
        Polygon(
          points={{14, 30}, {14, 18}, {26, 18}, {26, 30}, {14, 30}},
          lineColor={0, 0, 0},
          smooth=Smooth.None,
          fillColor={0, 0, 0},
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
          preserveAspectRatio=true, extent={{-98, 0}, {28, 48}}), graphics));
end RA;
