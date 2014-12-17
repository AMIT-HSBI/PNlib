within PNlib.Models.Senseo;
model Refill_Water
  "Refilling water: the water tank of the Senseo machine is refilled (step 3)."

  TD       refilling2(
    nIn=1,
    nOut=2,
    arcWeightOut={1,0.7 - watertank_.t},
    delay=30) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={62,40})));
  PD       puffer(
    nIn=1,
    nOut=1,
    maxTokens=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={36,40})));
  TD       refilling1(
    delay=1,
    arcWeightOut={1},
    nOut=1,
    nIn=2,
    arcWeightIn={1,0.36})   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={8,40})));
  IA       IA1(testValue=0.36)
    annotation (Placement(transformation(extent={{-74,-20},{-62,-16}})));
  Interfaces.TransitionIn watertank_
    annotation (Placement(transformation(extent={{-120,-28},{-100,-8}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,-40})));
  Interfaces.TransitionOut refill_[2]    annotation (Placement(transformation(
        extent={{-20,-10},{0,10}},
        rotation=0,
        origin={110,40}),  iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,90})));
  Interfaces.TransitionIn start_    annotation (Placement(transformation(
        extent={{-20,-10},{0,10}},
        rotation=0,
        origin={-102,40}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-40})));
  Real color[3]=if fac<1 then {0,0,255} else {255,255,255};
  Real startTime;
  Real fac=if (time-startTime)/60<1 and startTime>0 then (time-startTime)/60 else 0;
  Real recsize[2,2]={{-100,80},{-100+200*fac,-80}};
equation
  when  puffer.t>0 then
    startTime=time;
  end when;
  connect(IA1.inPlace, watertank_)
                                 annotation (Line(
      points={{-74.9524,-18},{-110,-18}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(refilling1.outPlaces[1], puffer.inTransition[1]) annotation (Line(
      points={{12.8,40},{25.2,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(puffer.outTransition[1], refilling2.inPlaces[1]) annotation (Line(
      points={{46.8,40},{57.2,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(refilling2.outPlaces, refill_)    annotation (Line(
      points={{66.8,40},{100,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(refilling1.inPlaces[1], start_)    annotation (Line(
      points={{3.2,39.5},{-110,39.5},{-110,40},{-112,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(IA1.outTransition, refilling1.inPlaces[2]) annotation (Line(
      points={{-61.0476,-18},{-40,-18},{-40,40.5},{3.2,40.5}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics), Icon(graphics={Rectangle(
          extent={{-100,80},{100,-80}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),       Rectangle(
          extent=DynamicSelect({{-100,80},{100,-80}},recsize),
          lineColor={0,0,0},
          fillColor=DynamicSelect({255,255,255},color),
          fillPattern=FillPattern.Solid), Text(
          extent={{-78,20},{80,-12}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Refill Water")}));
end Refill_Water;
