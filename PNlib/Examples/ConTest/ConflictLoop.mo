within PNlib.Examples.ConTest;
model ConflictLoop
  extends Modelica.Icons.Example;

  PNlib.TC T1(nOut = 1, nIn = 2, arcWeightOut = {3}, arcWeightIn = {2, 1}) annotation(Placement(transformation(extent = {{-74, -40}, {-54, -20}})));
  PNlib.TC T2(nIn = 1, nOut = 1, maximumSpeed = 4) annotation(Placement(transformation(extent = {{4, -10}, {24, 10}})));
  PNlib.TC T3(nIn = 1, nOut = 1, maximumSpeed = 2) annotation(Placement(transformation(extent = {{6, -62}, {26, -42}})));
  PNlib.PC P1(nIn = 1, nOut = 2) annotation(Placement(transformation(extent = {{-34, -40}, {-14, -20}})));
  PNlib.PC P2(nIn = 1, nOut = 1, startMarks = 2) annotation(Placement(transformation(extent = {{50, -10}, {70, 10}})));
  PNlib.PC P3(nIn = 1, nOut = 1, startMarks = 1) annotation(Placement(transformation(extent = {{54, -64}, {74, -44}})));
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{-52, 60}, {-32, 80}})));
equation
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{-59.2, -30}, {-34.8, -30}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P1.outTransition[1], T2.inPlaces[1]) annotation(Line(points = {{-13.2, -30.5}, {-2, -30.5}, {-2, 0}, {9.2, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.outPlaces[1], P2.inTransition[1]) annotation(Line(points = {{18.8, 0}, {49.2, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T3.inPlaces[1], P1.outTransition[2]) annotation(Line(points = {{11.2, -52}, {0, -52}, {0, -29.5}, {-13.2, -29.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P3.inTransition[1], T3.outPlaces[1]) annotation(Line(points = {{53.2, -54}, {38, -54}, {38, -52}, {20.8, -52}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P2.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{70.8, 0}, {84, 0}, {84, 26}, {-90, 26}, {-90, -30.5}, {-68.8, -30.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P3.outTransition[1], T1.inPlaces[2]) annotation(Line(points = {{74.8, -54}, {90, -54}, {90, -84}, {-88, -84}, {-88, -29.5}, {-68.8, -29.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StartTime=0.0, StopTime=10.0));
end ConflictLoop;
