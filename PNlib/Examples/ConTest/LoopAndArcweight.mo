within PNlib.Examples.ConTest;
model LoopAndArcweight
  extends Modelica.Icons.Example;

  inner PNlib.Components.Settings settings
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  PNlib.Components.PC P1(
    nOut=1,
    nIn=1,
    startMarks=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,-30})));
  PNlib.Components.TC T1(
    nIn=1,
    nOut=2,
    arcWeightIn={3},
    arcWeightOut={2,2}) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={0,0})));
  PNlib.Components.PC P2(nIn=1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={20,30})));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points={{-10.8,
          -30}, {-20, -30}, {-20, 4.44089e-016}, {-4.8, 4.44089e-016}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P1.inTransition[1], T1.outPlaces[1]) annotation(Line(points={{10.8,
          -30}, {20, -30}, {20, 0.5}, {4.8, 0.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P2.inTransition[1], T1.outPlaces[2]) annotation(Line(points={{20, 19.2},
          {20, -0.5}, {4.8, -0.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-40, -40},
            {40, 40}}), graphics), experiment(StartTime=0.0, StopTime=10.0, Tolerance = 1e-6));
end LoopAndArcweight;
