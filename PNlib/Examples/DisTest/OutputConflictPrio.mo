within PNlib.Examples.DisTest;
model OutputConflictPrio
  extends Modelica.Icons.Example;

  PNlib.PD P1(nIn = 1, startTokens = 2, nOut = 2, enablingProbOut = {0.5, 0.5}, minTokens = 2, enablingType = 1) annotation(Placement(transformation(extent = {{-40, 10}, {-20, 30}})));
  PNlib.TD T1(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{14, 60}, {34, 80}})));
  PNlib.TD T2(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{14, -20}, {34, 0}})));
  PNlib.PD P2(nIn = 1) annotation(Placement(transformation(extent = {{60, 60}, {80, 80}})));
  PNlib.PD P3(nIn = 1) annotation(Placement(transformation(extent = {{60, -20}, {80, 0}})));
  PNlib.TD T3(nOut = 1) annotation(Placement(transformation(extent = {{-82, 10}, {-62, 30}})));
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{-60, 62}, {-40, 82}})));
equation
  connect(T3.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{-67.2, 20}, {-40.8, 20}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-19.2, 19.5}, {0, 19.5}, {0, 70}, {19.2, 70}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(Line(points = {{28.8, 70}, {59.2, 70}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.inPlaces[1], P1.outTransition[2]) annotation(Line(points = {{19.2, -10}, {-0.4, -10}, {-0.4, 20.5}, {-19.2, 20.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.outPlaces[1], P3.inTransition[1]) annotation(Line(points = {{28.8, -10}, {59.2, -10}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(experiment(StartTime=0.0, StopTime=10.0));
end OutputConflictPrio;
