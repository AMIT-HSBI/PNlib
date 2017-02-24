within PNlib.Examples.DisTest;
model TFDtest
  extends Modelica.Icons.Example;
  inner PNlib.Settings settings annotation(Placement(visible = true, transformation(extent = {{60, 20}, {80, 40}}, rotation = 0)));
  PNlib.PD P1(nIn = 1,nOut = 1, startTokens = 5) annotation(Placement(visible = true, transformation(extent = {{-56, -10}, {-36, 10}}, rotation = 0)));
  PNlib.PD P2(nIn = 1, nOut = 0, startTokens = 0)  annotation(
    Placement(visible = true, transformation(origin = {22, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TFD T1(nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-12, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TD T2(delay = 5, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T2.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-64, 0}, {-56, 0}, {-56, 0}, {-56, 0}}));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{-35, 0}, {-16, 0}}));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{-8, 0}, {11, 0}}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-80, -40},
            {80, 40}}), graphics), experiment(StartTime=0.0, StopTime=5.0, Tolerance = 1e-6));
end TFDtest;
