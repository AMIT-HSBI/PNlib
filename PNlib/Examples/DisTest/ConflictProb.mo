within PNlib.Examples.DisTest;
model ConflictProb
  extends Modelica.Icons.Example;

  PNlib.PD P1(nIn = 1, startTokens = 2, nOut = 2, enablingType = 2, enablingProbOut = {0.5, 0.5}) annotation(Placement(transformation(extent={{-30,-10},
            {-10,10}})));
  PNlib.TD T1(nIn = 1, nOut = 1) annotation(Placement(transformation(extent={{0,10},{
            20,30}})));
  PNlib.TD T2(nIn = 1, nOut = 1) annotation(Placement(transformation(extent={{0,-30},
            {20,-10}})));
  PNlib.PD P2(nIn = 1) annotation(Placement(transformation(extent={{30,10},{50,30}})));
  PNlib.PD P3(nIn = 1) annotation(Placement(transformation(extent={{30,-30},{50,
            -10}})));
  PNlib.TD T3(nOut = 1) annotation(Placement(transformation(extent={{-60,-10},{-40,
            10}})));
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent={{-60,20},
            {-40,40}})));
equation
  connect(T3.outPlaces[1], P1.inTransition[1]) annotation(Line(points={{-45.2,0},
          {-30.8,0}},                                                                               color = {0, 0, 0}, smooth = Smooth.None));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points={{-9.2,-0.5},
          {0,-0.5},{0,20},{5.2,20}},                                                                                      color = {0, 0, 0}, smooth = Smooth.None));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(Line(points={{14.8,20},
          {29.2,20}},                                                                             color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.inPlaces[1], P1.outTransition[2]) annotation(Line(points={{5.2,-20},
          {-0.4,-20},{-0.4,0.5},{-9.2,0.5}},                                                                                      color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.outPlaces[1], P3.inTransition[1]) annotation(Line(points={{14.8,-20},
          {29.2,-20}},                                                                              color = {0, 0, 0}, smooth = Smooth.None));
  annotation(experiment(StartTime=0.0, StopTime=10.0),
    Diagram(coordinateSystem(extent={{-60,-40},{60,40}})));
end ConflictProb;
