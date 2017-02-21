within PNlib.Examples.DisTest;
model TEtest
  extends Modelica.Icons.Example;

  inner PNlib.Settings settings annotation(Placement(visible = true, transformation(extent = {{60, 20}, {80, 40}}, rotation = 0)));
  PNlib.PD P1(nIn = 1,nOut = 1, startTokens = 0) annotation(Placement(visible = true, transformation(extent = {{-20, 10}, {0, 30}}, rotation = 0)));
  PNlib.TE T1(nIn = 1, nOut = 1) annotation(Placement(visible = true, transformation(extent = {{20, 10}, {40, 30}}, rotation = 0)));
  PNlib.TE T2(event = {0.5, 2.5, 2.8}, nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-54, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PD P2(nIn = 1, nOut = 1, startTokens = 1)  annotation(
    Placement(visible = true, transformation(origin = {-10, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(P2.inTransition[1], T1.outPlaces[1]) annotation(
    Line(points = {{1, -20}, {44, -20}, {44, 20}, {34, 20}}));
  connect(P2.outTransition[1], T2.inPlaces[1]) annotation(
    Line(points = {{-21, -20}, {-70, -20}, {-70, 20}, {-58, 20}}));
  connect(T1.inPlaces[1], P1.outTransition[1]) annotation(
    Line(points = {{25.2, 20}, {0.799999, 20}}));
  connect(T2.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-49.2, 20}, {-19.2, 20}, {-19.2, 20}, {-19.2, 20}}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-80, -40},
            {80, 40}}), graphics), experiment(StartTime=0.0, StopTime=5.0, Tolerance = 1e-6));
end TEtest;
