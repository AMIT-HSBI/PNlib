within PNlib.Examples.DisTest;
model PDtoTT
  extends Modelica.Icons.Example;

  inner PNlib.Settings settings annotation(Placement(transformation(extent={{20, 20},
            {40, 40}})));
  PNlib.PD P1(nOut = 1, startTokens = 10) annotation(Placement(transformation(extent={{-30, -10},
            {-10, 10}})));
  TT T1(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {18, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{-10, 0}, {14, 0}, {14, 0}, {14, 0}}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-40, -40},
            {40, 40}}), graphics), experiment(StartTime=0.0, StopTime=10.0, Tolerance = 1e-6));
end PDtoTT;
