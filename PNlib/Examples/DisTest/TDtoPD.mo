within PNlib.Examples.DisTest;
model TDtoPD
  PNlib.PD P1(nOut = 0, nIn = 1) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TD T1(nOut = 1) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PNlib.Settings settings1 annotation(Placement(visible = true, transformation(origin = {60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(P1.inTransition[1], T1.outPlaces[1]) annotation(Line(points = {{29.2, 0}, {4.22535, 0}, {4.22535, 0}, {4.8, 0}}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime=0.0, StopTime=10.0));
end TDtoPD;
