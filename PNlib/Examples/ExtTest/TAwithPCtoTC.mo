within PNlib.Examples.ExtTest;
model TAwithPCtoTC
  extends Modelica.Icons.Example;
  PC P1(nOut = 2, startMarks = 5) annotation(Placement(transformation(extent = {{-54, -10}, {-34, 10}})));
  TC T1(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{6, 20}, {26, 40}})));
  inner Settings settings annotation(Placement(transformation(extent = {{-60, 40}, {-40, 60}})));
  TC T2(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{6, -40}, {26, -20}})));
  PC P2(nIn = 1) annotation(Placement(transformation(extent = {{30, 20}, {50, 40}})));
  PC P3(nIn = 1) annotation(Placement(transformation(extent = {{30, -40}, {50, -20}})));
  TA TA1(testValue = 3) annotation(Placement(transformation(extent = {{-20, -34}, {-6, -28}})));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-33.2, -0.5}, {-28, -0.5}, {-28, 30}, {11.2, 30}}, color = {0, 0, 0}));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(Line(points = {{20.8, 30}, {29.2, 30}}, color = {0, 0, 0}));
  connect(P1.outTransition[2], TA1.inPlace) annotation(Line(points={{-33.2,0.5},
          {-28,0.5},{-28,-31},{-21.1111,-31}},                                                                                color = {0, 0, 0}));
  connect(TA1.outTransition, T2.inPlaces[1]) annotation(Line(points={{-4.88889,
          -31},{1.5556,-31},{1.5556,-30},{11.2,-30}},                                                                               color = {0, 0, 0}));
  connect(T2.outPlaces[1], P3.inTransition[1]) annotation(Line(points = {{20.8, -30}, {29.2, -30}}, color = {0, 0, 0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -60}, {60, 60}}), graphics), experiment(StartTime = 0.0, StopTime = 10.0));
end TAwithPCtoTC;
