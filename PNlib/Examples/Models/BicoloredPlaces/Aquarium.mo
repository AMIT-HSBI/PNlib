within PNlib.Examples.Models.BicoloredPlaces;

model Aquarium
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(
    Placement(transformation(extent = {{-60, 20}, {-40, 40}})));
  PNlib.Examples.Models.BicoloredPlaces.CPC P1(nIn = 1, nOut = 1, startMarks = {50, 0}) annotation(
    Placement(transformation(extent = {{-30, -10}, {-10, 10}})));
  PNlib.Examples.Models.BicoloredPlaces.CPC P2(nIn = 1, startMarks = {0, 0}) annotation(
    Placement(transformation(extent = {{30, -10}, {50, 10}})));
  PNlib.Examples.Models.BicoloredPlaces.CTC t1(nOut = 1, arcWeightOut = {{0, 1}}) annotation(
    Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
  PNlib.Examples.Models.BicoloredPlaces.CTC t2(nIn = 1, nOut = 1, arcWeightIn = {{P1.color[1]/(P1.color[1] + P1.color[2]), P1.color[2]/(P1.color[1] + P1.color[2])}}, arcWeightOut = {{P1.color[1]/(P1.color[1] + P1.color[2]), P1.color[2]/(P1.color[1] + P1.color[2])}}) annotation(
    Placement(transformation(extent = {{0, -10}, {20, 10}})));
  Real ratio = P1.color[2]/(P1.color[1] + P1.color[2]);
equation
  connect(t1.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-45.2, 0}, {-38, 0}, {-31, 0}}, color = {0, 0, 0}));
  connect(P1.outTransition[1], t2.inPlaces[1]) annotation(
    Line(points = {{-9, 0}, {-9, 0}, {5.2, 0}}, color = {0, 0, 0}));
  connect(t2.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{14.8, 0}, {29, 0}}, color = {0, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-60, -20}, {60, 40}})),
    experiment(StartTime = 0.0, StopTime = 40.0));
end Aquarium;
