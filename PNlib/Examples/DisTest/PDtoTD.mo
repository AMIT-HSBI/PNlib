within PNlib.Examples.DisTest;
model PDtoTD
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{32, 56}, {52, 76}})));
  PNlib.PD P1(nOut = 1, startTokens = 10) annotation(Placement(transformation(extent = {{-50, -8}, {-30, 12}})));
  PNlib.TD T1(nIn = 1) annotation(Placement(transformation(extent = {{-6, -8}, {14, 12}})));
equation
  connect(T1.inPlaces[1], P1.outTransition[1]) annotation(Line(points = {{-0.8, 2}, {-29.2, 2}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StartTime=0.0, StopTime=10.0));
end PDtoTD;
