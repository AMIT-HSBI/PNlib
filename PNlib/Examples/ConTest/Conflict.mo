within PNlib.Examples.ConTest;
model Conflict
  PNlib.TC T1(nOut = 1) annotation(Placement(transformation(extent = {{-84, 6}, {-64, 26}})));
  PNlib.TC T2(maximumSpeed = 2, nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{-6, 36}, {14, 56}})));
  PNlib.TC T3(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{-4, -16}, {16, 4}})));
  PNlib.PC P1(nIn = 1, nOut = 2) annotation(Placement(transformation(extent = {{-44, 6}, {-24, 26}})));
  PNlib.PC P2(nIn = 1) annotation(Placement(transformation(extent = {{40, 36}, {60, 56}})));
  PNlib.PC P3(nIn = 1) annotation(Placement(transformation(extent = {{44, -18}, {64, 2}})));
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{-56, 58}, {-36, 78}})));
equation
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{-69.2, 16}, {-44.8, 16}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P1.outTransition[1], T2.inPlaces[1]) annotation(Line(points = {{-23.2, 15.5}, {-12, 15.5}, {-12, 46}, {-0.8, 46}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.outPlaces[1], P2.inTransition[1]) annotation(Line(points = {{8.8, 46}, {39.2, 46}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T3.inPlaces[1], P1.outTransition[2]) annotation(Line(points = {{1.2, -6}, {-10, -6}, {-10, 16.5}, {-23.2, 16.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P3.inTransition[1], T3.outPlaces[1]) annotation(Line(points = {{43.2, -8}, {28, -8}, {28, -6}, {10.8, -6}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StartTime=0.0, StopTime=10.0));
end Conflict;
