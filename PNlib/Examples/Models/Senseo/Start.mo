within PNlib.Examples.Models.Senseo;
model Start
  "User action: starting and stopping the machine (step 1, 2, 11), initiating the insertion of coffee pads (step 5) and the refill of water (step 3)."
  parameter Real EV_time=600;
  TS starting(
    h=1/EV_time,
    nIn=1,
    nOut=1)
    annotation(Placement(transformation(extent={{12,-26},{32,-6}})));
   Real colorHead[3]=if stop.t>0 then {255,0,0} else {0,255,0};
  PD       start(       nOut=2,
    nIn=3,
    maxTokens=1)                                       annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={60,10})));
  PD       stop(nIn=1,
    startTokens=1,
    nOut=1,
    maxTokens=1)
    annotation(Placement(transformation(extent={{-20,-26},{0,-6}})));
  Interfaces.PlaceOut refill_ annotation(Placement(transformation(extent={{100,-18},
            {120,2}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-64,-82})));
  TD       T8(
    nIn=1,
    nOut=1,
    delay=1)
           annotation(Placement(transformation(extent={{-54,-26},{-34,-6}})));
  TD       T6(
    nOut=1,
    nIn=1,
    delay=1)
           annotation(Placement(transformation(extent={{-54,22},{-34,42}})));
  PD       nextcoffee(
    nIn=1,
    maxTokens=1,
    startTokens=0,
    nOut=1) annotation(Placement(transformation(extent={{-18,22},{2,42}})));
  TD       T10(nIn=1, nOut=1) annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={24,32})));
  PD       P1(
    nIn=1,
    nOut=2,
    enablingType=PNlib.Types.EnablingType.Probability,
    enablingProbOut={0.2,0.8},
    maxTokens=1)
    annotation(Placement(transformation(extent={{-90,-4},{-70,16}})));
  Interfaces.PlaceIn stopornext_ annotation(Placement(transformation(extent={{-120,-4},
            {-100,16}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={66,-72})));
  Interfaces.PlaceIn refillstart_ annotation(Placement(transformation(extent={{-120,
            -50},{-100,-30}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,-82})));
  TD T1(nIn=1, nOut=2)
    annotation(Placement(transformation(extent={{78,22},{98,42}})));
  Interfaces.TransitionOut start_[2]
    annotation(Placement(transformation(extent={{100,24},{120,44}}),
        iconTransformation(extent={{50,44},{70,64}})));
equation
  connect(stop.outTransition[1], starting.inPlaces[1]) annotation(Line(
      points={{0.8,-16},{17.2,-16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(start.outTransition[1], refill_) annotation(Line(
      points={{70.8,9.5},{76,9.5},{76,-8},{110,-8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(P1.outTransition[1], T6.inPlaces[1]) annotation(Line(
      points={{-69.2,5.5},{-60,5.5},{-60,32},{-48.8,32}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(P1.outTransition[2], T8.inPlaces[1]) annotation(Line(
      points={{-69.2,6.5},{-60,6.5},{-60,-16},{-48.8,-16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T6.outPlaces[1], nextcoffee.inTransition[1]) annotation(Line(
      points={{-39.2,32},{-18.8,32}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T8.outPlaces[1], stop.inTransition[1]) annotation(Line(
      points={{-39.2,-16},{-20.8,-16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(P1.inTransition[1], stopornext_) annotation(Line(
      points={{-90.8,6},{-110,6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(nextcoffee.outTransition[1], T10.inPlaces[1]) annotation(Line(
      points={{2.8,32},{19.2,32}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T10.outPlaces[1], start.inTransition[1]) annotation(Line(
      points={{28.8,32},{42,32},{42,9.33333},{49.2,9.33333}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(starting.outPlaces[1], start.inTransition[2]) annotation(Line(
      points={{26.8,-16},{42,-16},{42,10},{49.2,10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(start.inTransition[3], refillstart_) annotation(Line(
      points={{49.2,10.6667},{44,10.6667},{44,-40},{-110,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(start.outTransition[2], T1.inPlaces[1]) annotation(Line(
      points={{70.8,10.5},{76,10.5},{76,32},{83.2,32}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T1.outPlaces[1], start_[1]) annotation(Line(
      points={{92.8,31.5},{106,31.5},{106,30},{101.4,30},{101.4,29},{110,29}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T1.outPlaces[2], start_[2])
  annotation(Diagram(graphics), Icon(graphics={
        Ellipse(
          extent={{-20,92},{22,56}},
          lineColor={0,0,0},
          fillColor=DynamicSelect({255,255,255}, colorHead),
          fillPattern=FillPattern.Solid,
          lineThickness=0.5),
        Line(
          points={{0,56},{0,-26},{-56,-72}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{0,-26},{56,-72}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-50,54},{0,14}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{0,14},{50,54}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=0.5),
        Text(
          extent={{38,62},{38,52}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Start"),
        Text(
          extent={{-34,-68},{-34,-78}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Refill"),
        Text(
          extent={{32,-68},{32,-78}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Stop/Next")}));
  annotation(Icon(graphics), Diagram(graphics));
end Start;
