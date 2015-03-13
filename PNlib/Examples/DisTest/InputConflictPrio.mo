within PNlib.Examples.DisTest;
model InputConflictPrio
  extends Modelica.Icons.Example;

  PNlib.PD P1(maxTokens = 2, nIn = 2, nOut = 1) annotation(Placement(transformation(extent = {{24, -6}, {44, 14}})));
  PNlib.TD T1(nIn = 1) annotation(Placement(transformation(extent = {{68, -6}, {88, 14}})));
  PNlib.TD T2(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{-26, 36}, {-6, 56}})));
  PNlib.TD T3(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{-26, -36}, {-6, -16}})));
  PNlib.PD P2(startTokens = 5, nOut = 1) annotation(Placement(transformation(extent = {{-70, 36}, {-50, 56}})));
  PNlib.PD P3(startTokens = 5, enablingType = 1, nOut = 1) annotation(Placement(transformation(extent = {{-70, -36}, {-50, -16}})));
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{46, 40}, {66, 60}})));
equation
  connect(P2.outTransition[1], T2.inPlaces[1]) annotation(Line(points = {{-49.2, 46}, {-20.8, 46}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P3.outTransition[1], T3.inPlaces[1]) annotation(Line(points = {{-49.2, -26}, {-20.8, -26}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{-11.2, 46}, {8, 46}, {8, 3.5}, {23.2, 3.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T3.outPlaces[1], P1.inTransition[2]) annotation(Line(points = {{-11.2, -26}, {10, -26}, {10, 4.5}, {23.2, 4.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T1.inPlaces[1], P1.outTransition[1]) annotation(Line(points = {{73.2, 4}, {44.8, 4}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StartTime=0.0, StopTime=10.0));
end InputConflictPrio;
