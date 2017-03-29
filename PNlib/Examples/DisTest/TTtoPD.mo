within PNlib.Examples.DisTest;
model TTtoPD
  extends Modelica.Icons.Example;

  inner PNlib.Settings settings annotation(Placement(transformation(extent={{20, 20},
            {40, 40}})));
  PNlib.PD P1(nIn = 1) annotation(Placement(visible = true, transformation(extent = {{10, -10}, {30, 10}}, rotation = 0)));
  PNlib.TT T1(nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-16, 0}, {8, 0}, {8, 0}, {10, 0}}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-40, -40},
            {40, 40}}), graphics), experiment(StartTime=0.0, StopTime=10.0, Tolerance = 1e-6));
end TTtoPD;
