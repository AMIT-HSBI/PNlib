within PNlib.Examples.Models.Printing;
model Role_change "change of the paper role"
  import PNlib;
  parameter Real Role_length=20000 "length of paper on role in meters";
  parameter Real cutting_at=500 "length by which the rest is cut";
  parameter Real display_time=100 "for animation";

  PNlib.Components.TD new_role(
    nOut=2,
    delay=1,
    nIn=1,
    arcWeightIn={1},
    firingCon=pre(start),
    arcWeightOut={Role_length,1})
    annotation (Placement(transformation(extent={{-88,-20},{-68,0}})));
  PNlib.Components.TD cutting_rest(
    nIn=1,
    nOut=1,
    delay=2,
    firingCon=pre(start))
    annotation (Placement(transformation(extent={{-20,38},{0,58}})));
  PNlib.Components.PD P1(
    maxTokens=1,
    nIn=2,
    nOut=1) annotation (Placement(transformation(extent={{10,38},{30,58}})));
  PNlib.Components.TD T1(
    nIn=2,
    nOut=1,
    firingCon=pre(start),
    arcWeightIn={1,Role.t})
    annotation (Placement(transformation(extent={{42,38},{62,58}})));
  PNlib.Components.PD P2(
    nIn=1,
    nOut=1,
    maxTokens=1)
    annotation (Placement(transformation(extent={{68,38},{88,58}})));
  PNlib.Components.IA IA2(testValue=cutting_at) annotation (Placement(
        transformation(
        extent={{-8.5,-2.50012},{8.5,2.50012}},
        rotation=90,
        origin={-32.5,38.5})));
  PNlib.Components.PD Role_change(
    nIn=1,
    maxTokens=1,
    nOut=2) annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
  PNlib.Components.PC Role(
    nIn=1,
    nOut=3,
    minMarks=0,
    maxMarks=PNlib.Constants.inf,
    startMarks=0,
    reStart=reStart) "[m]"
    annotation (Placement(transformation(extent={{-56,-20},{-36,0}})));
  Interfaces.PlaceOut rollenwechsel_[2]
                                     annotation(Placement(transformation(
          extent={{100,-86},{116,-66}}),
                                       iconTransformation(extent={{68,-40},{88,-20}})));
  Interfaces.PlaceOut rolle_ annotation(Placement(transformation(extent={{100,-50},
            {116,-30}}),
                       iconTransformation(extent={{68,20},{88,40}})));
            Real fireAni[3];
protected
  outer Boolean start;
  outer Boolean reStart;
public
  Modelica.Blocks.Interfaces.RealOutput meter_role_  annotation(Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-46,20}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,80})));
  Interfaces.PlaceIn start_ annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={8,110}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,80})));
equation
  fireAni=if (new_role.fireTime+display_time>=time and new_role.ani) then {255,255,0} else {255,255,255};
  connect(new_role.outPlaces[1], Role.inTransition[1])    annotation(Line(
      points={{-73.2,-10.5},{-73,-10.5},{-73,-10},{-56.8,-10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Role.outTransition[1], IA2.inPlace)  annotation(Line(
      points={{-35.2,-10.6667},{-30.7325,-10.6667},{-30.7325,20.9739}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(IA2.outTransition, cutting_rest.inPlaces[1])     annotation(Line(
      points={{-30.7325,40.6723},{-30.7325,48},{-14.8,48}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(cutting_rest.outPlaces[1], P1.inTransition[1])     annotation(Line(
      points={{-5.2,48},{2,48},{2,47.5},{9.2,47.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(
      points={{30.8,48},{40,48},{40,47.5},{47.2,47.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(Line(
      points={{56.8,48},{67.2,48}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(P2.outTransition[1], new_role.inPlaces[1])   annotation(Line(
      points={{88.8,48},{98,48},{98,72},{-96,72},{-96,-10},{-82.8,-10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(new_role.outPlaces[2], Role_change.inTransition[1])     annotation (
      Line(
      points={{-73.2,-9.5},{-72,-10},{-68,-10},{-68,-80},{-10.8,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Role_change.outTransition[1], rollenwechsel_[1])   annotation(Line(
      points={{10.8,-80.5},{31.1,-80.5},{31.1,-81},{108,-81}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Role.outTransition[2], T1.inPlaces[2])  annotation(Line(
      points={{-35.2,-10},{40,-10},{40,48.5},{47.2,48.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Role.outTransition[3], rolle_)  annotation(Line(
      points={{-35.2,-9.33333},{40,-9.33333},{40,-40},{108,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Role.pc_t, meter_role_)   annotation(Line(
      points={{-46,0.8},{-46,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(P1.inTransition[2], start_) annotation(Line(
      points={{9.2,48.5},{8,48.5},{8,110}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Role_change.outTransition[2], rollenwechsel_[2])
  annotation(Diagram(graphics), Icon(graphics={Rectangle(
          extent={{-72,70},{68,-74}},
          lineColor={0,0,0},
          fillColor=DynamicSelect({255,255,255},fireAni),
          fillPattern=FillPattern.Solid), Bitmap(
          extent={{-84,58},{82,-62}},
          imageSource="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")}));
  annotation(Diagram(graphics));
end Role_change;
