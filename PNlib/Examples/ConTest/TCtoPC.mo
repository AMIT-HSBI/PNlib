within PNlib.Examples.ConTest;
model TCtoPC
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{-62, 50}, {-42, 70}})));
  PNlib.TC T1(nOut = 1) annotation(Placement(transformation(extent = {{-58, -16}, {-38, 4}})));
  PNlib.PC P1(nIn = 1) annotation(Placement(transformation(extent = {{-6, -16}, {14, 4}})));
equation
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{-43.2, -6}, {-6.8, -6}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StartTime=0.0, StopTime=10.0));
end TCtoPC;
