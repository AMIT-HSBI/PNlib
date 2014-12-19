within PNlib.Examples.ConTest;
model PCtoTC
  extends Modelica.Icons.Example;

  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{-72, 48}, {-52, 68}})));
  PNlib.PC P1(nOut = 1, startMarks = 1) annotation(Placement(transformation(extent = {{-62, -12}, {-42, 8}})));
  PNlib.TC T1(nIn = 1) annotation(Placement(transformation(extent = {{-8, -12}, {12, 8}})));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-41.2, -2}, {-2.8, -2}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StartTime=0.0, StopTime=10.0));
end PCtoTC;
