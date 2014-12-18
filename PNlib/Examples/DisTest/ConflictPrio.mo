within PNlib.Examples.DisTest;
model ConflictPrio
  PNlib.PD P1(nIn = 1, startTokens = 2, nOut = 2) annotation(Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
  PNlib.TD T1(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{-6, 40}, {14, 60}})));
  PNlib.TD T2(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{-6, -40}, {14, -20}})));
  PNlib.PD P2(nIn = 1) annotation(Placement(transformation(extent = {{40, 40}, {60, 60}})));
  PNlib.PD P3(nIn = 1) annotation(Placement(transformation(extent = {{40, -40}, {60, -20}})));
  PNlib.TD T3(nOut = 1) annotation(Placement(transformation(extent = {{-102, -10}, {-82, 10}})));
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{-82, 54}, {-62, 74}})));
equation
  connect(T3.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{-87.2, 0}, {-60.8, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-39.2, -0.5}, {-20, -0.5}, {-20, 50}, {-0.8, 50}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(Line(points = {{8.8, 50}, {39.2, 50}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.inPlaces[1], P1.outTransition[2]) annotation(Line(points = {{-0.8, -30}, {-20.4, -30}, {-20.4, 0.5}, {-39.2, 0.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.outPlaces[1], P3.inTransition[1]) annotation(Line(points = {{8.8, -30}, {39.2, -30}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StartTime=0.0, StopTime=10.0));
end ConflictPrio;
