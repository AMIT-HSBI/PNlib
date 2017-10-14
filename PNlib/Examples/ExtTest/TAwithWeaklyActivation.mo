within PNlib.Examples.ExtTest;
model TAwithWeaklyActivation
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  PNlib.Components.PC P1(
    nIn=1,
    nOut=2,
    startMarks=4)
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  PNlib.Components.PC P2(nIn=1, maxMarks=3)
    annotation (Placement(transformation(extent={{50,10},{70,30}})));
  PNlib.Components.TA TA1(normalArc=2, testValue=5) annotation (Placement(
        transformation(
        extent={{-7,-2},{7,2}},
        rotation=0,
        origin={9,20})));
  PNlib.Components.TC T1(nOut=1, maximumSpeed=if time > 2 then 2 else 1)
    annotation (Placement(transformation(extent={{-70,30},{-50,50}})));
  PNlib.Components.TC T2(nOut=1, nIn=1)
    annotation (Placement(transformation(extent={{20,10},{40,30}})));
  PNlib.Components.TC T3(nIn=1, maximumSpeed=if time > 3 then 2 else 0)
    annotation (Placement(transformation(extent={{20,50},{40,70}})));
equation
  connect(P1.outTransition[1], TA1.inPlace) annotation(Line(points={{-19.2, 39.5}, {-10, 39.5}, {-10, 20}, {0.888889, 20}}, color={0, 0, 0}));
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(Line(points={{-55.2, 40}, {-40.8, 40}}, color={0, 0, 0}));
  connect(T2.outPlaces[1], P2.inTransition[1]) annotation(Line(points={{34.8, 20}, {34.8, 20}, {49.2, 20}}, color={0, 0, 0}));
  connect(T3.inPlaces[1], P1.outTransition[2]) annotation(Line(points={{25.2, 60}, {-10, 60}, {-10, 40.5}, {-19.2, 40.5}}, color={0, 0, 0}));
  connect(TA1.outTransition, T2.inPlaces[1]) annotation(Line(points={{17.1111, 20}, {17.1111, 20}, {25.2, 20}}, color={0, 0, 0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-80, 0}, {80, 80}})), experiment(StartTime=0.0, StopTime=5.0, Tolerance = 1e-6));
end TAwithWeaklyActivation;
