within PNlib.Examples.DisTest;
model DisLoopAndArcweight
  PNlib.PD P1(nOut = 1, nIn = 1, startTokens = 2) annotation(Placement(transformation(extent = {{-10, -26}, {10, -6}})));
  PNlib.TD T1(nIn = 1, nOut = 1, arcWeightIn = {2}, arcWeightOut = {3}) annotation(Placement(transformation(extent = {{10, 26}, {-10, 46}})));
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{42, 68}, {62, 88}})));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{10.8, -16}, {46, -16}, {46, 36}, {4.8, 36}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{-4.8, 36}, {-42, 36}, {-42, -16}, {-10.8, -16}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StartTime=0.0, StopTime=10.0));
end DisLoopAndArcweight;
