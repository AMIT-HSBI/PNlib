within PNlib.Examples.ConTest;
model ZeroPlace
  extends Modelica.Icons.Example;

  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{-64, 64}, {-44, 84}})));
  PNlib.TC T1(nOut = 1) annotation(Placement(transformation(extent = {{-72, 6}, {-52, 26}})));
  PNlib.PC P1(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{-38, 6}, {-18, 26}})));
  PNlib.TC T2(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{-2, 6}, {18, 26}})));
  PNlib.PC P2(nIn = 1) annotation(Placement(transformation(extent = {{34, 6}, {54, 26}})));
equation
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{-57.2, 16}, {-38.8, 16}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P1.outTransition[1], T2.inPlaces[1]) annotation(Line(points = {{-17.2, 16}, {3.2, 16}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.outPlaces[1], P2.inTransition[1]) annotation(Line(points = {{12.8, 16}, {33.2, 16}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StartTime=0.0, StopTime=10.0));
end ZeroPlace;
