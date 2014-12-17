within PNtest.ConTest;
model Speed
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{-52, 60}, {-32, 80}})));
  PNlib.TC T1(nOut = 1, maximumSpeed = 2) annotation(Placement(transformation(extent = {{-48, -6}, {-28, 14}})));
  PNlib.PC P1(nIn = 2, nOut = 1) annotation(Placement(transformation(extent = {{4, -6}, {24, 14}})));
  PNlib.TC T2(nOut = 1, arcWeightOut = {2}) annotation(Placement(transformation(extent = {{-48, -48}, {-28, -28}})));
  PNlib.TC T3(nIn = 1, nOut = 1, arcWeightIn = {4}, arcWeightOut = {4}) annotation(Placement(transformation(extent = {{38, -6}, {58, 14}})));
  PNlib.PC P2(nIn = 1) annotation(Placement(transformation(extent = {{68, -6}, {88, 14}})));
equation
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{-33.2, 4}, {-16, 4}, {-16, 3.5}, {3.2, 3.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.outPlaces[1], P1.inTransition[2]) annotation(Line(points = {{-33.2, -38}, {-14, -38}, {-14, 4.5}, {3.2, 4.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T3.inPlaces[1], P1.outTransition[1]) annotation(Line(points = {{43.2, 4}, {24.8, 4}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T3.outPlaces[1], P2.inTransition[1]) annotation(Line(points = {{52.8, 4}, {67.2, 4}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StartTime=0.0, StopTime=10.0));
end Speed;
