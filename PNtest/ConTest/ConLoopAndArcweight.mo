within PNtest.ConTest;
model ConLoopAndArcweight
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{-68, 56}, {-48, 76}})));
  PNlib.PC P1(nOut = 1, nIn = 1, startMarks = 1) annotation(Placement(transformation(extent = {{22, -44}, {42, -24}})));
  PNlib.TC T1(nIn = 1, nOut = 2, arcWeightIn = {3}, arcWeightOut = {2, 2}) annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {30, 22})));
  PNlib.PC P2(nIn = 1) annotation(Placement(transformation(extent = {{10, 56}, {-10, 76}})));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{42.8, -34}, {58, -34}, {58, 22}, {34.8, 22}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P1.inTransition[1], T1.outPlaces[1]) annotation(Line(points = {{21.2, -34}, {0, -34}, {0, 21.5}, {25.2, 21.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P2.inTransition[1], T1.outPlaces[2]) annotation(Line(points = {{10.8, 66}, {18, 66}, {18, 22.5}, {25.2, 22.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StartTime=0.0, StopTime=10.0));
end ConLoopAndArcweight;
