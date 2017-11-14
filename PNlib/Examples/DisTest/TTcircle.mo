within PNlib.Examples.DisTest;
model TTcircle
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(Placement(visible = true, transformation(extent = {{30, 30}, {50, 50}}, rotation = 0)));
  PNlib.Components.PD P1(nIn = 1,nOut = 1, startTokens = 1) annotation(Placement(visible = true, transformation(extent = {{-30, 8}, {-10, 28}}, rotation = 0)));
  PNlib.Components.TT T1(nIn = 1, nOut = 1, tactIntervall = 1, tactStart = 0)  annotation(Placement(visible = true, transformation(origin = {0, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PD P2(nIn = 1, nOut = 1)  annotation(Placement(visible = true, transformation(origin = {22, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TT T2(nIn = 1, nOut = 1,tactIntervall = 2, tactStart = 1.5)  annotation(Placement(visible = true, transformation(origin = {0, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(Line(points = {{4.8, 18}, {12.8, 18}, {12.8, 18}, {12.8, 18}}));
  connect(P2.outTransition[1], T2.inPlaces[1]) annotation(Line(points = {{33, 18}, {40, 18}, {40, -22}, {4, -22}}));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-9.2, 18}, {-5.2, 18}}));
  connect(T2.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{-4, -22}, {-40, -22}, {-40, 18}, {-31, 18}}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-50, -50},
            {50, 50}}), graphics), experiment(StartTime=0.0, StopTime=10.0, Tolerance = 1e-6));
end TTcircle;
