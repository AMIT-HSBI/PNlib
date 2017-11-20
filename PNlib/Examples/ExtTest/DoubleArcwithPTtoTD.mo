within PNlib.Examples.ExtTest;
model DoubleArcwithPTtoTD
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(Placement(transformation(extent={{-60, 40}, {-40, 60}})));
  PNlib.Components.IA IA1(testValue=3, normalArc=false) annotation(Placement(transformation(extent={{-24, 28}, {-12, 32}})));
  PNlib.Components.PD P1(nOut=2, startTokens=5) annotation(Placement(transformation(extent={{-54, -8}, {-34, 12}})));
  PNlib.Components.PD P2(nIn=1) annotation(Placement(transformation(extent={{30, 20}, {50, 40}})));
  PNlib.Components.PD P3(nIn=1) annotation(Placement(transformation(extent={{30, -38}, {50, -18}})));
  PNlib.Components.TA TA1(normalArc=false, testValue=2) annotation(Placement(transformation(extent={{-20, -32}, {-6, -26}})));
  PNlib.Components.TD T1(nOut=1, nIn=1) annotation(Placement(transformation(extent={{6, 20}, {26, 40}})));
  PNlib.Components.TD T2(nIn=1, nOut=1) annotation(Placement(transformation(extent={{6, -38}, {26, -18}})));
equation
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(Line(points={{20.8, 30}, {29.2, 30}}, color={0, 0, 0}));
  connect(P1.outTransition[1], TA1.inPlace) annotation(Line(points={{-33.2, 1.5}, {-28, 1.5}, {-28, -29}, {-21.1111, -29}}, color={0, 0, 0}));
  connect(TA1.outTransition, T2.inPlaces[1]) annotation(Line(points={{-4.88889, -29}, {1.5556, -29}, {1.5556, -28}, {11.2, -28}}, color={0, 0, 0}));
  connect(T2.outPlaces[1], P3.inTransition[1]) annotation(Line(points={{20.8, -28}, {29.2, -28}}, color={0, 0, 0}));
  connect(IA1.inPlace, P1.outTransition[2]) annotation(Line(points={{-24.9524, 30}, {-28, 30}, {-28, 2.5}, {-33.2, 2.5}}, color={0, 0, 0}));
  connect(IA1.outTransition, T1.inPlaces[1]) annotation(Line(points={{-11.0476, 30}, {-11.0476, 30}, {11.2, 30}}, color={0, 0, 0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60, -60}, {60, 60}})), experiment(StartTime=0.0, StopTime=10.0, Tolerance = 1e-6));
end DoubleArcwithPTtoTD;
