within PNlib.Examples.DisTest;
model ConflictBeneBaB
  extends Modelica.Icons.Example;
  PNlib.Components.PD P1(nIn = 1) annotation(Placement(visible = true, transformation(extent = {{30, 70}, {50, 90}}, rotation = 0)));
  PNlib.Components.TD T1(arcWeightIn = {4},nIn = 1, nOut = 1) annotation(Placement(visible = true, transformation(extent = {{-6, 70}, {14, 90}}, rotation = 0)));
  PNlib.Components.TD T2(arcWeightIn = {3},nIn = 1, nOut = 1) annotation(Placement(visible = true, transformation(extent = {{-6, 30}, {14, 50}}, rotation = 0)));
  PNlib.Components.PD P2(nIn = 1) annotation(Placement(visible = true, transformation(extent = {{30, 30}, {50, 50}}, rotation = 0)));
  PNlib.Components.PD P3(nIn = 1) annotation(Placement(visible = true, transformation(extent = {{30, -10}, {50, 10}}, rotation = 0)));
  inner PNlib.Components.Settings settings annotation(Placement(visible = true, transformation(extent = {{-60, 80}, {-40, 100}}, rotation = 0)));
  PNlib.Components.TD T3(arcWeightIn = {1},nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {4, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TD T4(arcWeightIn = {1},nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {4, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TD T5(arcWeightIn = {1},nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {4, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PD P4(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PD P5(maxTokens = 1,nIn = 1, nOut = 1, startTokens = 1)  annotation(
    Placement(visible = true, transformation(origin = {40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PD P7(benefitType = PNlib.Types.BenefitType.BranchAndBound, enablingBeneOut = {6, 5, 3, 4, 2, 0}, enablingType = PNlib.Types.EnablingType.Benefit,nIn = 1, nOut = 6, startTokens = 4)  annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TD T7(arcWeightOut = {4},delay = 2, nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-40, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PNlib.Components.TD T6(arcWeightIn = {1},nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {4, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PD P6(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {40, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T6.inPlaces[1], P7.outTransition[6]) annotation(
    Line(points = {{0, -120}, {-12, -120}, {-12, 0}, {-20, 0}, {-20, 0}}));
  connect(T6.outPlaces[1], P6.inTransition[1]) annotation(
    Line(points = {{8, -120}, {28, -120}, {28, -120}, {30, -120}}));
  connect(T4.outPlaces[1], P5.inTransition[1]) annotation(
    Line(points = {{8, -80}, {30, -80}, {30, -80}, {30, -80}, {30, -80}}));
  connect(T5.outPlaces[1], P4.inTransition[1]) annotation(
    Line(points = {{8, -40}, {28, -40}, {28, -40}, {30, -40}}));
  connect(T3.outPlaces[1], P3.inTransition[1]) annotation(
    Line(points = {{8, 0}, {28, 0}, {28, 0}, {30, 0}}));
  connect(T2.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{8, 40}, {28, 40}, {28, 40}, {30, 40}}));
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{8, 80}, {30, 80}, {30, 80}, {30, 80}}));
  connect(P7.outTransition[5], T4.inPlaces[1]) annotation(
    Line(points = {{-20, 0}, {-12, 0}, {-12, -80}, {0, -80}, {0, -80}}));
  connect(P7.outTransition[4], T5.inPlaces[1]) annotation(
    Line(points = {{-20, 0}, {-12, 0}, {-12, -40}, {0, -40}, {0, -40}}));
  connect(P7.outTransition[3], T3.inPlaces[1]) annotation(
    Line(points = {{-20, 0}, {0, 0}, {0, 0}, {0, 0}}));
  connect(P7.outTransition[2], T2.inPlaces[1]) annotation(
    Line(points = {{-20, 0}, {-12, 0}, {-12, 40}, {-2, 40}, {-2, 40}, {0, 40}}));
  connect(P7.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{-20, 0}, {-12, 0}, {-12, 80}, {0, 80}, {0, 80}, {0, 80}}));
  connect(T7.outPlaces[1], P7.inTransition[1]) annotation(
    Line(points = {{-40, -56}, {-40, -56}, {-40, 0}, {-40, 0}}));
  connect(T7.inPlaces[1], P5.outTransition[1]) annotation(
    Line(points = {{-40, -64}, {-40, -64}, {-40, -96}, {56, -96}, {56, -80}, {50, -80}, {50, -80}}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -140}, {60, 100}}), graphics), experiment(StartTime = 0.0, StopTime = 5.0, Tolerance = 1e-6));
end ConflictBeneBaB;
