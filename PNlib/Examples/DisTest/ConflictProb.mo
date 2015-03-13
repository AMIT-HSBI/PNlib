within PNlib.Examples.DisTest;
model ConflictProb
  extends Modelica.Icons.Example;

  PNlib.PD P1(nIn = 1, startTokens = 2, nOut = 2, enablingType = 2, enablingProbOut = {0.5, 0.5}) annotation(Placement(transformation(extent = {{-50, 0}, {-30, 20}})));
  PNlib.TD T1(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{4, 50}, {24, 70}})));
  PNlib.TD T2(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{4, -30}, {24, -10}})));
  PNlib.PD P2(nIn = 1) annotation(Placement(transformation(extent = {{50, 50}, {70, 70}})));
  PNlib.PD P3(nIn = 1) annotation(Placement(transformation(extent = {{50, -30}, {70, -10}})));
  PNlib.TD T3(nOut = 1) annotation(Placement(transformation(extent = {{-92, 0}, {-72, 20}})));
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{-70, 52}, {-50, 72}})));
equation
  connect(T3.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{-77.2, 10}, {-50.8, 10}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-29.2, 9.5}, {-10, 9.5}, {-10, 60}, {9.2, 60}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(Line(points = {{18.8, 60}, {49.2, 60}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.inPlaces[1], P1.outTransition[2]) annotation(Line(points = {{9.2, -20}, {-10.4, -20}, {-10.4, 10.5}, {-29.2, 10.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.outPlaces[1], P3.inTransition[1]) annotation(Line(points = {{18.8, -20}, {49.2, -20}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(experiment(StartTime=0.0, StopTime=10.0));
end ConflictProb;
