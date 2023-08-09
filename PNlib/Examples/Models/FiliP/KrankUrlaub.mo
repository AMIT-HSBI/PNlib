within PNlib.Examples.Models.FiliP;

model KrankUrlaub
  parameter Real UrlaubStartTermine[:] = {10, 20, 30} "Begin Urlaub";
  parameter Real UrlaubEndTermine[:] = {15, 25, 35} "Ende Urlaub";
  PNlib.Components.TD Gesund1(nIn = 1, delay = 0, nOut = 1) annotation(
    Placement(visible = true, transformation(extent = {{14, -90}, {-6, -70}}, rotation = 0)));
  PNlib.Examples.Models.FiliP.PNerweiterungen.PDwkeit Krankpruefer1(enablingProbOut = {WK, 1 - WK}, enablingType = PNlib.Types.EnablingType.Probability, nIn = 1, nOut = 2) annotation(
    Placement(visible = true, transformation(extent = {{40, -90}, {20, -70}}, rotation = 0)));
  PNlib.Components.TD Arbeitet1(nIn = 1, nOut = 1, delay = 0) annotation(
    Placement(visible = true, transformation(extent = {{66, -90}, {46, -70}}, rotation = 0)));
  PNlib.Components.TD T12(nIn = 1, nOut = 1, delay = 0) annotation(
    Placement(visible = true, transformation(extent = {{-54, -90}, {-74, -70}}, rotation = 0)));
  PNlib.Components.PD KannArbeiteten(nIn = 3, nOut = 1) annotation(
    Placement(visible = true, transformation(extent = {{-30, -90}, {-50, -70}}, rotation = 0)));
  PNlib.Interfaces.TransitionOut transitionOut annotation(
    Placement(visible = true, transformation(origin = {-116.06, 0.392857}, extent = {{16.7164, -20}, {-16.7164, 20}}, rotation = 0), iconTransformation(origin = {-117.955, -2.23214}, extent = {{18.6119, -22.2679}, {-18.6119, 22.2679}}, rotation = 0)));
  PNlib.Interfaces.PlaceIn placeIn[3] annotation(
    Placement(visible = true, transformation(origin = {116.236, -0.234045}, extent = {{16.8909, -19.766}, {-16.8909, 19.766}}, rotation = 0), iconTransformation(origin = {120.636, 0.191491}, extent = {{18.6364, -21.8085}, {-18.6364, 21.8085}}, rotation = 0)));
  Real WK;
  //Real WU;
  PNlib.Components.TFDS Krank(E = 1:31, P = {75/237, 41/237, 24/237, 19/237, 22/237, 10/237, 13/237, 4/237, 2/237, 3/237, 2/237, 1/237, 3/237, 1/237, 1/237, 1/237, 1/237, 1/237, 1/237, 1/237, 1/237, 1/237, 1/237, 1/237, 1/237, 1/237, 1/237, 1/237, 1/237, 1/237, 1/237}, distributionType = PNlib.Types.DistributionType.Discrete, nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {4, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PNlib.Components.TE TUrlaubEnde(event = UrlaubEndTermine, nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {4, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PNlib.Components.TE TUrlaubStart(event = UrlaubStartTermine, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {4, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PD ImUrlaub(nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PNlib.Components.TD Urlaubgeber(delay = 0, nIn = 2, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {56, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PNlib.Components.PD P1(nIn = 1, nOut = 2) annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TE T1(event = UrlaubEndTermine, nIn = 1) annotation(
    Placement(visible = true, transformation(origin = {84, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PD Urlaubpruefer(nIn = 3, nOut = 2) annotation(
    Placement(visible = true, transformation(origin = {80, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
protected
  outer PNlib.Components.Settings settings "global settings for animation and display";
equation
  connect(Urlaubpruefer.outTransition[2], Arbeitet1.inPlaces[1]) annotation(
    Line(points = {{70, -80}, {60, -80}, {60, -80}, {60, -80}}, thickness = 0.5));
  connect(Urlaubpruefer.outTransition[1], Urlaubgeber.inPlaces[1]) annotation(
    Line(points = {{70, -80}, {66, -80}, {66, 0}, {62, 0}, {62, 0}, {60, 0}}, thickness = 0.5));
  connect(Urlaubpruefer.inTransition[3], placeIn[3]) annotation(
    Line(points = {{90, -80}, {96, -80}, {96, 0}, {116, 0}, {116, 0}}, thickness = 0.5));
  connect(Urlaubpruefer.inTransition[2], placeIn[2]) annotation(
    Line(points = {{90, -80}, {96, -80}, {96, 0}, {116, 0}, {116, 0}}, thickness = 0.5));
  connect(Urlaubpruefer.inTransition[1], placeIn[1]) annotation(
    Line(points = {{90, -80}, {96, -80}, {96, 0}, {116, 0}, {116, 0}}, thickness = 0.5));
  connect(P1.outTransition[2], Urlaubgeber.inPlaces[2]) annotation(
    Line(points = {{60, 50}, {62, 50}, {62, 0}, {60, 0}}, thickness = 0.5));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{60, 50}, {80, 50}, {80, 50}, {80, 50}}, thickness = 0.5));
  connect(TUrlaubStart.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{11, 50}, {40, 50}}, thickness = 0.5));
  connect(ImUrlaub.inTransition[1], Urlaubgeber.outPlaces[1]) annotation(
    Line(points = {{40, 0}, {52, 0}, {52, 0}, {52, 0}}, thickness = 0.5));
  connect(Arbeitet1.outPlaces[1], Krankpruefer1.inTransition[1]) annotation(
    Line(points = {{51.2, -78}, {39.2, -78}}));
  connect(Krank.inPlaces[1], Krankpruefer1.outTransition[1]) annotation(
    Line(points = {{8.8, -40}, {16.6, -40}, {16.6, -80}, {20.8, -80}}, thickness = 0.5));
  connect(Krankpruefer1.outTransition[2], Gesund1.inPlaces[1]) annotation(
    Line(points = {{19.2, -78}, {11.2, -78}}, thickness = 0.5));
  connect(ImUrlaub.outTransition[1], TUrlaubEnde.inPlaces[1]) annotation(
    Line(points = {{19.2, 2}, {11.2, 2}}, thickness = 0.5));
  connect(KannArbeiteten.inTransition[1], Gesund1.outPlaces[1]) annotation(
    Line(points = {{-29.2, -80}, {-1.2, -80}, {-1.2, -80}, {0.800078, -80}}, thickness = 0.5));
  connect(KannArbeiteten.inTransition[2], Krank.outPlaces[1]) annotation(
    Line(points = {{-29.2, -80}, {-19.2, -80}, {-19.2, -40}, {0.800078, -40}, {0.800078, -40}}, thickness = 0.5));
  connect(KannArbeiteten.inTransition[3], TUrlaubEnde.outPlaces[1]) annotation(
    Line(points = {{-29.2, -80}, {-19.2, -80}, {-19.2, 0}, {0.800078, 0}, {0.800078, 0}}, thickness = 0.5));
  connect(KannArbeiteten.outTransition[1], T12.inPlaces[1]) annotation(
    Line(points = {{-50.8, -80}, {-60.8, -80}}));
  connect(T12.outPlaces[1], transitionOut) annotation(
    Line(points = {{-69, -78}, {-93.5, -78}, {-93.5, 0}, {-118, 0}}));
  WK = if time <= 744 then 0.0117 else if time <= 1464 then 0.008 else if time <= 2208 then 0.0196 else if time <= 2928 then 0.0325 else if time <= 3672 then 0.0276 else if time <= 4416 then 0.031 else if time <= 5088 then 0.0344 else if time <= 5832 then 0.0458 else if time <= 6552 then 0.0084 else if time <= 7296 then 0.0118 else if time <= 8016 then 0.0315 else 0.0188;
  //WU = if time <= 744 then 0.0212 else if time <= 1464 then 0.0531 else if time <= 2208 then 0.0310 else if time <= 2928 then 0.0458 else if time <= 3672 then 0.0671 else if time <= 4416 then 0.046 else if time <= 5088 then 0.0135 else if time <= 5832 then 0.0304 else if time <= 6552 then 0.03 else if time <= 7296 then 0.0446 else if time <= 8016 then 0.0372 else 0.0618;
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.2), graphics = {Rectangle(origin = {0, -2}, fillColor = {255, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
end KrankUrlaub;
