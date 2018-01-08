within PNlib.Examples;

model TestWorkload
  extends Modelica.Icons.Example;
  parameter Integer no_cons = 3;
  PNlib.Components.PD P1(maxTokens = no_cons, nIn = 1, nOut = 1, startTokens = no_cons)  annotation(
    Placement(visible = true, transformation(origin = {0, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Examples.Models.PNproBP.Workload workload1(max_tokens = no_cons)  annotation(
    Placement(visible = true, transformation(origin = {0, 32}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  PNlib.Components.TD T1(nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {32, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PD P11(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {66, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PNlib.Components.Settings settings annotation(
    Placement(visible = true, transformation(origin = {-56, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TE T11(event = {3, 7, 7.5}, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-44, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T11.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-40, 6}, {-10, 6}, {-10, 6}, {-10, 6}}, thickness = 0.5));
  connect(T1.outPlaces[1], P11.inTransition[1]) annotation(
    Line(points = {{36, 6}, {56, 6}, {56, 8}, {56, 8}, {56, 8}}, thickness = 0.5));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{10, 6}, {28, 6}, {28, 6}, {28, 6}, {28, 6}}, thickness = 0.5));
  connect(P1.pd_t, workload1.u) annotation(
    Line(points = {{0, 16}, {0, 16}, {0, 26}, {0, 26}}, color = {255, 127, 0}));
  annotation(
    uses(PNlib(version = "2.0")));
end TestWorkload;
