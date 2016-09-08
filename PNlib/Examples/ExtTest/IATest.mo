within PNlib.Examples.ExtTest;
model IATest
  extends Modelica.Icons.Example;
  inner PNlib.Settings settings annotation(Placement(transformation(extent={{100, 20}, {120, 40}})));
  IA IA1( normalArc=2, testValue=1) annotation (Placement(transformation(extent={{-44, -2}, {-30, 2}})));
  IA IA2(testValue=2, normalArc=1) annotation (Placement(transformation(extent={{-6, -3}, {6, 3}}, rotation=0, origin={50, -1})));
  PC P1(nOut=2, nIn=1, startMarks=2) annotation (Placement(transformation(extent={{-70, -10}, {-50, 10}})));
  PC P2(nIn=1, nOut=1, startMarks=1) annotation (Placement(transformation(extent={{10, -10}, {30, 10}})));
  PC P3(nIn=1) annotation (Placement(transformation(extent={{90, -10}, {110, 10}})));
  TC T1(nOut=1, nIn=1) annotation (Placement(transformation(extent={{-20, -10}, {0, 10}})));
  TC T2(nOut=1, maximumSpeed=1.5) annotation (Placement(transformation(extent={{-100, -10}, {-80, 10}})));
  TC T3(nIn=2, arcWeightIn={1, 2}, maximumSpeed=2, nOut=1) annotation (Placement(transformation(extent={{-10, -10}, {10, 10}}, rotation=0, origin={80, 0})));
equation
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation (Line(points={{-5.2, 0}, {9.2, 0}}, color={0, 0, 0}));
  connect(P1.outTransition[1], IA1.inPlace) annotation (Line(points={{-49.2, -0.5}, {-48, -0.5}, {-48, 0}, {-45.1111, 0}}, color={0, 0, 0}));
  connect(IA1.outTransition, T1.inPlaces[1]) annotation (Line(points={{-28.8889, 0}, {-28.8889, 0}, {-14.8, 0}}, color={0, 0, 0}));
  connect(T2.outPlaces[1], P1.inTransition[1]) annotation (Line(points={{-85.2, 0}, {-70.8, 0}}, color={0, 0, 0}));
  connect(P2.outTransition[1], IA2.inPlace) annotation (Line(points={{30.8, 0}, {38, 0}, {38, -1}, {43.0476, -1}}, color={0, 0, 0}));
  connect(IA2.outTransition, T3.inPlaces[1]) annotation (Line(points={{56.9524, -1}, {56.9524, 0}, {66, 0}, {76, 0}, {76, -0.5}, {75.2, -0.5}}, color={0, 0, 0}));
  connect(P1.outTransition[2], T3.inPlaces[2]) annotation (Line(points={{-49.2, 0.5}, {-48, 0.5}, {-48, -20}, {66, -20}, {66, -4}, {66, 0.5}, {75.2, 0.5}}, color={0, 0, 0}));
  connect(T3.outPlaces[1], P3.inTransition[1]) annotation (Line(points={{84.8, 0}, {89.2, 0}}, color={0, 0, 0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100, -40}, {120, 40}})), experiment(StartTime=0.0, StopTime=6.0));
end IATest;
