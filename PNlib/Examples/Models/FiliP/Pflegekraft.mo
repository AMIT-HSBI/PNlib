within PNlib.Examples.Models.FiliP;
model Pflegekraft
  Real HatFruehDienst=IstImFruehDienst.t;
  Real HatSpaetDienst=IstImSpaetDienst.t;
  Real HatNachtDienst=IstImNachtDienst.t;
  Boolean IstKrank=krankurlaub.Krank.fire;
  Real HatUrlaubt=krankurlaub.ImUrlaub.t;
  Real HatWochenende=ImWochenEnde.t;
  Real HatRuhezeit=Ruhe.t;
  Real Dienstfaehig=Dienstbereit.t;
  Real ArbeitszeitKontingentPlanungsPeriode=ArbeitszeitKontingent.t;
  Real GeleisteteArbeistzeitGesammt=GeleisteteArbeistzeit.t;
  protected
  extends PNlib.Examples.Models.FiliP.AllgemeineParameter;
  parameter Real Stelle = 1 "Was fuer eine Stelle" annotation(
    Dialog(enable = true, group = "Personaldaten"));
  //parameter Integer UrlaubsTage = 36 "Anzahl der Urlaubstage" annotation(Dialog(enable = true, group = "Personal Daten"));
  parameter Integer WEF = 1 "Welches Wochenende frei" annotation(
    Dialog(enable = true, group = "Personaldaten"),
    choices(choice = 1 "1. Wochenende", choice = 2 "2. Wochenende", choice = 3 "jedes Wochenende", __Dymola_radioButtons = true));
  parameter Real UrlaubStartTermine[:] = {10,20,30} "number of input places"annotation(Dialog(enable = true, group = "Personal Daten"));
  parameter Real UrlaubEndTermine[:] = {15,25,35} "number of input places"annotation(Dialog(enable = true, group = "Personal Daten"));
  /*Real HatFruehDienst=IstImFruehDienst.t;
  Real HatSpaetDienst=IstImSpaetDienst.t;
  Real HatNachtDienst=IstImNachtDienst.t;
  Boolean IstKrank=krankurlaub.Krank.fire;
  Real HatUrlaubt=krankurlaub.ImUrlaub.t;
  Real HatWochenende=ImWochenEnde.t;
  Real HatRuhezeit=Ruhe.t;
  Real Dienstfaehig=Dienstbereit.t;
  Real ArbeitszeitKontingentPlanungsPeriode=ArbeitszeitKontingent.t;
  Real GeleisteteArbeistzeitGesammt=GeleisteteArbeistzeit.t;
  protected*/
  PNlib.PD IstImFruehDienst(nIn = 1, nOut = 1) annotation(
    Placement(transformation(extent = {{-10, 240}, {10, 260}})));
  PNlib.PD IstImSpaetDienst(nIn = 1, nOut = 1) annotation(
    Placement(transformation(extent = {{-10, 150}, {10, 170}})));
  PNlib.PD IstImNachtDienst(nIn = 1, nOut = 1) annotation(
    Placement(transformation(extent = {{-10, 62}, {10, 82}})));
  PNlib.TT FSB(nOut = 2, nIn = 2, tactIntervall = 1, tactStart = BeginFruehschicht/24, arcWeightIn = {1, DauerFruehschicht - 0.5}) annotation(
    Placement(transformation(extent = {{-94, 240}, {-74, 260}})));
  PNlib.TT SSB(nOut = 2, nIn = 2, tactIntervall = 1, tactStart = BeginSpaetschicht/24, arcWeightIn = {1, DauerSpaetschicht - 0.5}) annotation(
    Placement(transformation(extent = {{-92, 150}, {-72, 170}})));
  PNlib.TT NSB(nOut = 2, nIn = 2, tactIntervall = 1, tactStart = BeginNachtschicht/24, arcWeightIn = {1, DauerNachtschicht - 0.75}) annotation(
    Placement(transformation(extent = {{-94, 62}, {-74, 82}})));
  PNlib.TD FSE(nIn = 2, nOut = 2, delay = DauerFruehschicht/24, arcWeightOut = {1, DauerFruehschicht - 0.5}) annotation(
    Placement(transformation(extent = {{74, 240}, {94, 260}})));
  PNlib.TD SSE(nIn = 2, nOut = 2, delay = DauerSpaetschicht/24, arcWeightOut = {1, DauerSpaetschicht - 0.5}) annotation(
    Placement(transformation(extent = {{74, 150}, {94, 170}})));
  PNlib.TD NSE(nIn = 2, nOut = 2, delay = DauerNachtschicht/24, arcWeightOut = {1, DauerNachtschicht - 0.75}) annotation(
    Placement(transformation(extent = {{74, 62}, {94, 82}})));
  PNlib.PC GeleisteteArbeistzeit(nIn = 3) annotation(
    Placement(transformation(extent = {{242, -48}, {262, -28}})));
  PNlib.PD Ruhe(nOut = 2, nIn = 3) annotation(
    Placement(transformation(extent = {{90, -90}, {70, -70}})));
  PNlib.PD Dienstbereit(nIn = 1, nOut = 5, startTokens = 1) annotation(
    Placement(transformation(extent = {{-130, -88}, {-150, -68}})));
  PNlib.TD RuheZeitEnde(nIn = 1, delay = 11/24, nOut = 1) annotation(
    Placement(transformation(extent = {{62, -90}, {42, -70}})));
  PNlib.PC ArbeitszeitKontingent( nIn = 1,nOut = 4, startMarks = if WEF == 2 then 57.75 * Stelle else 11 * Stelle) annotation(
    Placement(transformation(extent = {{-266, -84}, {-246, -64}})));
  PNlib.Interfaces.TransitionOut transitionOut[3] annotation(
    Placement(transformation(extent = {{-300, 154}, {-360, 252}})));
  PNlib.Interfaces.TransitionIn transitionIn[3] annotation(
    Placement(transformation(extent = {{360, 152}, {300, 250}})));
  PNlib.TT ArbeitszeitGeber(nOut = 1, tactIntervall = 14, tactStart = if WEF == 2 then 9 else 2, arcWeightOut = {2 * 38.5 * Stelle}, nIn = 1, arcWeightIn = {ArbeitszeitKontingent.t}) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-256, -168})));
  PNlib.TT WochenEndSignal(nOut = 1, tactIntervall = if WEF == 3 then 7 else 14, tactStart = if WEF == 2 then 9 else 2) annotation(
    Placement(transformation(extent = {{198, -278}, {178, -258}})));
  PNlib.TD WochenEndGeber2(nIn = 2, nOut = 1, delay = 0) annotation(
    Placement(transformation(extent = {{44, -192}, {24, -172}})));
  PNlib.TD WochenEndGeber1(nIn = 2, nOut = 1, delay = 0) annotation(
    Placement(transformation(extent = {{-130, -190}, {-110, -170}})));
  PNlib.PD SollInsWochenEnde(nOut = 3, nIn = 1, maxTokens = 1) annotation(
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -90, origin = {-8, -228})));
  PNlib.PD ImWochenEnde(nOut = 1, nIn = 2) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-78, -158})));
  PNlib.TT WochenEndEnde(nIn = 1, tactIntervall = if WEF == 3 then 7 else 14, tactStart = if WEF == 2 then 11 else 4, nOut = 1) annotation(
    Placement(transformation(extent = {{-34, -168}, {-14, -148}})));
  PNlib.TD EinTagWiederholer(nOut = 1, nIn = 1, delay = 1) annotation(
    Placement(transformation(extent = {{-58, -128}, {-38, -108}})));
  PNlib.TD WEenderbeiKrank(nIn = 1, delay = 2) annotation(
    Placement(transformation(extent = {{102, -228}, {122, -208}})));
  PNlib.Examples.Models.FiliP.KrankUrlaub krankurlaub (UrlaubEndTermine = UrlaubEndTermine, UrlaubStartTermine = UrlaubStartTermine)  annotation(
    Placement(visible = true, transformation(origin = {-80, -78}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
protected
  outer PNlib.Settings settings "global settings for animation and display";
equation
  connect(WochenEndEnde.outPlaces[1], krankurlaub.placeIn[3]) annotation(
    Line(points = {{-20, -158}, {0, -158}, {0, -80}, {-52, -80}, {-52, -78}, {-56, -78}}, thickness = 0.5));
  connect(EinTagWiederholer.outPlaces[1], krankurlaub.placeIn[2]) annotation(
    Line(points = {{-44, -118}, {-20, -118}, {-20, -80}, {-56, -80}, {-56, -78}}, thickness = 0.5));
  connect(RuheZeitEnde.outPlaces[1], krankurlaub.placeIn[1]) annotation(
    Line(points = {{48, -80}, {-54, -80}, {-54, -78}, {-56, -78}}, thickness = 0.5));
  connect(krankurlaub.transitionOut, Dienstbereit.inTransition[1]) annotation(
    Line(points = {{-104, -80}, {-118, -80}, {-118, -78}, {-130, -78}}));
  connect(FSB.outPlaces[1], IstImFruehDienst.inTransition[1]) annotation(
    Line(points = {{-79.2, 250}, {-10.8, 250}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(IstImFruehDienst.outTransition[1], FSE.inPlaces[1]) annotation(
    Line(points = {{10.8, 250}, {79.2, 250}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(SSB.outPlaces[1], IstImSpaetDienst.inTransition[1]) annotation(
    Line(points = {{-77.2, 160}, {-10.8, 160}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(SSE.inPlaces[1], IstImSpaetDienst.outTransition[1]) annotation(
    Line(points = {{79.2, 160}, {46, 160}, {46, 160}, {10.8, 160}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(NSB.outPlaces[1], IstImNachtDienst.inTransition[1]) annotation(
    Line(points = {{-79.2, 72}, {-10.8, 72}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(IstImNachtDienst.outTransition[1], NSE.inPlaces[1]) annotation(
    Line(points = {{10.8, 72}, {79.2, 72}}, color = {0, 0, 0}, smooth = Smooth.None));

    connect(FSB.outPlaces[2], transitionOut[1]) annotation(
      Line(points = {{-79.2, 250}, {-56, 250}, {-56, 294}, {-262, 294}, {-262, 203}, {-330, 203}}, color = {0, 0, 0}, smooth = Smooth.None));
    connect(SSB.outPlaces[2], transitionOut[2]) annotation(
      Line(points = {{-77.2, 160}, {-42, 160}, {-42, 298}, {-280, 298}, {-280, 203}, {-330, 203}}, color = {0, 0, 0}, smooth = Smooth.None));
    connect(NSB.outPlaces[2], transitionOut[3]) annotation(
      Line(points = {{-79.2, 72}, {-79.2, 54}, {-66, 54}, {-66, 276}, {-248, 276}, {-248, 203}, {-330, 203}}, color = {0, 0, 0}, smooth = Smooth.None));
    connect(FSE.inPlaces[2], transitionIn[1]) annotation(
      Line(points = {{79.2, 250}, {44, 250}, {44, 278}, {282, 278}, {282, 201}, {330, 201}}, color = {0, 0, 0}, smooth = Smooth.None));
    connect(SSE.inPlaces[2], transitionIn[2]) annotation(
      Line(points = {{79.2, 160}, {48, 160}, {48, 190}, {172, 190}, {172, 201}, {330, 201}}, color = {0, 0, 0}, smooth = Smooth.None));
    connect(NSE.inPlaces[2], transitionIn[3]) annotation(
      Line(points = {{79.2, 72}, {54, 72}, {54, 201}, {330, 201}}, color = {0, 0, 0}, smooth = Smooth.None));

  connect(Ruhe.outTransition[1], RuheZeitEnde.inPlaces[1]) annotation(
    Line(points = {{69.2, -80.5}, {56.8, -80}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(Ruhe.inTransition[1], NSE.outPlaces[1]) annotation(
    Line(points = {{90.8, -80.6667}, {114.8, -80.6667}, {114.8, 71.5}, {88.8, 71.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(SSE.outPlaces[1], Ruhe.inTransition[2]) annotation(
    Line(points = {{88.8, 159.5}, {122, 159.5}, {122, -80}, {90.8, -80}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(FSE.outPlaces[1], Ruhe.inTransition[3]) annotation(
    Line(points = {{88.8, 249.5}, {130, 249.5}, {130, -79.3333}, {90.8, -79.3333}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(Dienstbereit.outTransition[1], NSB.inPlaces[1]) annotation(
    Line(points = {{-150.8, -78.8}, {-164, -78.8}, {-164, 71.5}, {-88.8, 71.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(SSB.inPlaces[1], Dienstbereit.outTransition[2]) annotation(
    Line(points = {{-86.8, 159.5}, {-172, 159.5}, {-172, -78.4}, {-150.8, -78.4}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(FSB.inPlaces[1], Dienstbereit.outTransition[3]) annotation(
    Line(points = {{-88.8, 249.5}, {-186, 249.5}, {-186, -78}, {-150.8, -78}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(ArbeitszeitKontingent.outTransition[1], FSB.inPlaces[2]) annotation(
    Line(points = {{-245.2, -74.8}, {-234, -74.8}, {-234, 250.5}, {-88.8, 250.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(ArbeitszeitKontingent.outTransition[2], SSB.inPlaces[2]) annotation(
    Line(points = {{-245.2, -74.4}, {-222.6, -74.4}, {-222.6, 160.5}, {-86.8, 160.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(ArbeitszeitKontingent.outTransition[3], NSB.inPlaces[2]) annotation(
    Line(points = {{-245.2, -74}, {-214, -74}, {-214, 72.5}, {-88.8, 72.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(ArbeitszeitGeber.outPlaces[1], ArbeitszeitKontingent.inTransition[1]) annotation(
    Line(points = {{-256, -163.2}, {-274, -163.2}, {-274, -74}, {-266.8, -74}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(WochenEndEnde.inPlaces[1], ImWochenEnde.outTransition[1]) annotation(
    Line(points = {{-28.8, -158}, {-67.2, -158}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(WochenEndGeber1.inPlaces[1], Dienstbereit.outTransition[4]) annotation(
    Line(points = {{-124.8, -180.5}, {-170, -180.5}, {-170, -77.6}, {-150.8, -77.6}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(WochenEndGeber2.inPlaces[1], Ruhe.outTransition[2]) annotation(
    Line(points = {{38.8, -182.5}, {64, -182.5}, {64, -79.5}, {69.2, -79.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(SollInsWochenEnde.outTransition[1], WochenEndGeber1.inPlaces[2]) annotation(
    Line(points = {{-8.66667, -217.2}, {-144, -217.2}, {-144, -179.5}, {-124.8, -179.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(SollInsWochenEnde.outTransition[2], WochenEndGeber2.inPlaces[2]) annotation(
    Line(points = {{-8, -217.2}, {83, -217.2}, {83, -181.5}, {38.8, -181.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(WochenEndGeber1.outPlaces[1], ImWochenEnde.inTransition[1]) annotation(
    Line(points = {{-115.2, -180}, {-104.6, -180}, {-104.6, -158.5}, {-88.8, -158.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(WochenEndGeber2.outPlaces[1], ImWochenEnde.inTransition[2]) annotation(
    Line(points = {{29.2, -182}, {-98, -182}, {-98, -157.5}, {-88.8, -157.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(WochenEndSignal.outPlaces[1], SollInsWochenEnde.inTransition[1]) annotation(
    Line(points = {{183.2, -268}, {88, -268}, {88, -238.8}, {-8, -238.8}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(GeleisteteArbeistzeit.inTransition[1], FSE.outPlaces[2]) annotation(
    Line(points = {{241.2, -38.6667}, {166, -38.6667}, {166, 250.5}, {88.8, 250.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(GeleisteteArbeistzeit.inTransition[2], SSE.outPlaces[2]) annotation(
    Line(points = {{241.2, -38}, {166, -38}, {166, 160.5}, {88.8, 160.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(GeleisteteArbeistzeit.inTransition[3], NSE.outPlaces[2]) annotation(
    Line(points = {{241.2, -37.3333}, {166, -37.3333}, {166, 72.5}, {88.8, 72.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(EinTagWiederholer.inPlaces[1], Dienstbereit.outTransition[5]) annotation(
    Line(points = {{-52.8, -118}, {-156, -118}, {-156, -77.2}, {-150.8, -77.2}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(WEenderbeiKrank.inPlaces[1], SollInsWochenEnde.outTransition[3]) annotation(
    Line(points = {{107.2, -218}, {50, -218}, {50, -217.2}, {-7.33333, -217.2}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(ArbeitszeitGeber.inPlaces[1], ArbeitszeitKontingent.outTransition[4]) annotation(
    Line(points = {{-256, -172.8}, {-198, -172.8}, {-198, -73.6}, {-245.2, -73.6}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-300, -300}, {300, 300}}, initialScale = 0.1), graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-300, 300}, {300, -302}}), Line(points = {{-160, -100}, {158, -100}, {78, 0}, {-78, 0}, {-158, -100}}), Rectangle(extent = {{-76, 0}, {80, 138}}), Rectangle(extent = {{-20, 138}, {20, 160}}), Ellipse(extent = {{-72, 286}, {74, 160}}, endAngle = 360), Ellipse(extent = {{116, 134}, {80, 4}}, endAngle = 360), Ellipse(fillPattern = FillPattern.Solid, extent = {{-40, 260}, {-16, 236}}, endAngle = 360), Rectangle(fillColor = {255, 0, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-8, -20}, {8, -80}}), Ellipse(extent = {{-62, -100}, {-10, -282}}, endAngle = 360), Ellipse(extent = {{12, -100}, {64, -282}}, endAngle = 360), Ellipse(fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-44, 196}, {46, 184}}, endAngle = 360), Ellipse(fillPattern = FillPattern.Solid, extent = {{18, 260}, {42, 236}}, endAngle = 360), Rectangle(extent = {{-8, 228}, {12, 214}}), Ellipse(extent = {{-76, 134}, {-112, 4}}, endAngle = 360), Rectangle(origin = {0, -50}, rotation = 90, fillColor = {255, 0, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-8, 30}, {8, -30}}), Text(extent = {{-314, 470}, {290, 304}}, textString = "%name")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-300, -300}, {300, 300}}, initialScale = 0.1), graphics));
end Pflegekraft;
