within PNlib.Examples.ExtTest;
model IAwithPDtoTD
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(Placement(transformation(extent={{-60, 40}, {-40, 60}})));
  PNlib.Components.IA TA1(testValue=3) annotation(Placement(transformation(extent={{-20, -36}, {-6, -30}})));
  PNlib.Components.PD P1(nOut=2, startTokens=5) annotation(Placement(transformation(extent={{-54, -12}, {-34, 8}})));
  PNlib.Components.PD P2(nIn=1) annotation(Placement(transformation(extent={{30, 18}, {50, 38}})));
  PNlib.Components.PD P3(nIn=1) annotation(Placement(transformation(extent={{30, -42}, {50, -22}})));
  PNlib.Components.TD T1(nIn=1, nOut=1) annotation(Placement(transformation(extent={{6, 18}, {26, 38}})));
  PNlib.Components.TD T2(nIn=1, nOut=1) annotation(Placement(transformation(extent={{6, -42}, {26, -22}})));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points={{-33.2, -2.5}, {-28, -2.5}, {-28, 28}, {11.2, 28}}, color={0, 0, 0}));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(Line(points={{20.8, 28}, {29.2, 28}}, color={0, 0, 0}));
  connect(P1.outTransition[2], TA1.inPlace) annotation(Line(points={{-33.2, -1.5}, {-28, -1.5}, {-28, -33}, {-21.1111, -33}}, color={0, 0, 0}));
  connect(TA1.outTransition, T2.inPlaces[1]) annotation(Line(points={{-4.88889, -33}, {1.5556, -33}, {1.5556, -32}, {11.2, -32}}, color={0, 0, 0}));
  connect(T2.outPlaces[1], P3.inTransition[1]) annotation(Line(points={{20.8, -32}, {29.2, -32}}, color={0, 0, 0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60, -60}, {60, 60}}), graphics), experiment(StartTime=0.0, StopTime=10.0, Tolerance = 1e-6));
end IAwithPDtoTD;
