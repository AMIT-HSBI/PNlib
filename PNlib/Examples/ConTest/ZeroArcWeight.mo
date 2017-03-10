within PNlib.Examples.ConTest;
model ZeroArcWeight
  extends Modelica.Icons.Example;

  PNlib.PC P1(nOut=1)
    annotation(Placement(transformation(extent={{-50, 10}, {-30, 30}})));
  PNlib.PC P2(nOut=1, startMarks=10)
    annotation(Placement(transformation(extent={{-50, -30}, {-30, -10}})));
  PNlib.TC T1(nIn=2, nOut=1, arcWeightIn={0, 1})
    annotation(Placement(transformation(extent={{-10, -10}, {10, 10}})));
  PNlib.PC P3(nIn=1)
    annotation(Placement(transformation(extent={{30, -10}, {50, 10}})));
  inner Settings settings
    annotation(Placement(transformation(extent={{30, 20}, {50, 40}})));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points={{-29.2, 20},
          {-20, 20}, {-20, -0.5}, {-4.8, -0.5}}, color={0, 0, 0}));
  connect(P2.outTransition[1], T1.inPlaces[2]) annotation(Line(points={{-29.2, -20},
          {-20, -20}, {-20, 0.5}, {-4.8, 0.5}}, color={0, 0, 0}));
  connect(T1.outPlaces[1], P3.inTransition[1])
    annotation(Line(points={{4.8, 0}, {29.2, 0}}, color={0, 0, 0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60, -40},
            {60, 40}})), experiment(StartTime=0.0, StopTime=12.0, Tolerance = 1e-6));
end ZeroArcWeight;
