within PNlib.Examples.ExtTest;
model TStriangular
  extends Modelica.Icons.Example;
  inner PNlib.Settings settings annotation(Placement(transformation(extent={{20, 20}, {40, 40}})));
  PD P1(nOut=1, startTokens=8) annotation(Placement(transformation(extent={{-40, -10}, {-20, 10}})));
  PD P2(nIn=1) annotation(Placement(transformation(extent={{20, -10}, {40, 10}})));
  TS T1(distributionType=2, localSeed=1, nIn=1, nOut=1) annotation(Placement(transformation(extent={{-10, -10}, {10, 10}})));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points={{-19.2, 0}, {-4.8, 0}}, color={0, 0, 0}));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(Line(points={{4.8, 0}, {19.2, 0}}, color={0, 0, 0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-40, -40}, {40, 40}})), experiment(StartTime=0.0, StopTime=10.0, Tolerance = 1e-6));
end TStriangular;
