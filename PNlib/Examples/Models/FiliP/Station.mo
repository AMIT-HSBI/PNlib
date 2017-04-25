within PNlib.Examples.Models.FiliP;
model Station
  extends PNlib.Examples.Models.FiliP.AllgemeineParameter;
  parameter Integer nP = 1 "Anzahl der Pflegekraefte" annotation(
    Dialog(enable = true, group = "Personal Daten"));
  parameter Integer APFD = 3 "Min. Anzahl Personal im Fruehedienst" annotation(
    Dialog(enable = true, group = "Personal"));
  parameter Integer APSD = 2 "Min. Anzahl Personal im Spaetdienst" annotation(
    Dialog(enable = true, group = "Personal"));
  parameter Integer APND = 2 "Min. Anzahl Personal im Nachtdienst" annotation(
    Dialog(enable = true, group = "Personal"));
  Real BesetzungFruehDienst=PersonalImFruedienst.t;
  Real BesetzungSpaetDienst=PersonalImSpaetdienst.t;
  Real BesetzungNachtDienst=PersonalImNachtdienst.t;
  Real BesetzungsDefizit=ZusaetzlicherPflegebedarf.t;
  protected
  PNlib.PD PersonalImFruedienst(enablingProbIn = fill(1 / nP, nP), enablingProbOut = fill(1 / (nP + 1), nP + 1), enablingType = PNlib.Types.EnablingType.Probability, maxTokens = APFD, nIn = nP, nOut = nP + 1) annotation(
    Placement(transformation(extent = {{-10, 112}, {10, 132}})));
  PNlib.PD PersonalImSpaetdienst(enablingProbIn = fill(1 / nP, nP), enablingProbOut = fill(1 / (nP + 1), nP + 1), enablingType = PNlib.Types.EnablingType.Probability, maxTokens = APSD, nIn = nP, nOut = nP + 1) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  PNlib.PD PersonalImNachtdienst(enablingProbIn = fill(1 / nP, nP), enablingProbOut = fill(1 / (nP + 1), nP + 1), enablingType = PNlib.Types.EnablingType.Probability, maxTokens = APND, nIn = nP, nOut = nP + 1) annotation(
    Placement(transformation(extent = {{-10, -70}, {10, -50}})));
  PNlib.Interfaces.PlaceOut placeOut[3 * nP] annotation(
    Placement(transformation(extent = {{200, -52}, {304, 52}})));
  PNlib.Interfaces.PlaceIn placeIn[3 * nP] annotation(
    Placement(transformation(extent = {{-298, -50}, {-196, 48}})));
  PNlib.TT BeginnFrueh(tactIntervall = 1, nOut = 1, tactStart = BeginFruehschicht/24, arcWeightOut = {DauerFruehschicht - 0.5}) annotation(
    Placement(transformation(extent = {{-54, 158}, {-34, 178}})));
  PNlib.TT BeginnSpaet(tactIntervall = 1, nOut = 1, tactStart = BeginSpaetschicht/24, arcWeightOut = {DauerSpaetschicht - 0.5}) annotation(
    Placement(transformation(extent = {{-54, 50}, {-34, 70}})));
  PNlib.TT BeginnNacht(tactIntervall = 1, nOut = 1, tactStart = BeginNachtschicht/24, arcWeightOut = {DauerNachtschicht - 0.75}) annotation(
    Placement(transformation(extent = {{-54, -148}, {-34, -128}})));
  PNlib.PC IstFruehDienst(nIn = 1, nOut = 1) annotation(
    Placement(transformation(extent = {{-10, 158}, {10, 178}})));
  PNlib.PC IstSpaetDienst(nIn = 1, nOut = 1) annotation(
    Placement(transformation(extent = {{-10, 50}, {10, 70}})));
  PNlib.PC IstNachtDienst(nIn = 1, nOut = 1) annotation(
    Placement(transformation(extent = {{-10, -148}, {10, -128}})));
  PNlib.RA RASpaet annotation(
    Placement(transformation(extent = {{26, 20}, {40, 24}})));
  PNlib.RA RANacht annotation(
    Placement(transformation(extent = {{32, -92}, {44, -88}})));
  PNlib.TC BedarfsMesserFrueh(nIn = 2, nOut = 1, arcWeightOut = {24*(APFD - PersonalImFruedienst.t)}) annotation(
    Placement(transformation(extent = {{66, 158}, {86, 178}})));
  PNlib.TC BedarfsMesserSpaet(nIn = 2, nOut = 1, arcWeightOut = {24*(APSD - PersonalImSpaetdienst.t)}) annotation(
    Placement(transformation(extent = {{66, 50}, {86, 70}})));
  PNlib.TC BedarfsMesserNacht(nIn = 2, nOut = 1, arcWeightOut = {24*(APND - PersonalImNachtdienst.t)}) annotation(
    Placement(transformation(extent = {{66, -148}, {86, -128}})));
  PNlib.PC ZusaetzlicherPflegebedarf(nIn = 3) annotation(
    Placement(transformation(extent = {{166, -106}, {186, -86}})));
  PNlib.RA RAFrueh annotation(
    Placement(transformation(extent = {{30, 144}, {42, 148}})));
protected
  outer PNlib.Settings settings "global settings for animation and display";
equation
  for i in 1:nP loop
    connect(PersonalImFruedienst.inTransition[i], placeIn[1 + 3 * (i - 1)]) annotation(
      Line(points = {{-10.8, 122}, {-148, 122}, {-148, -1}, {-247, -1}}, color = {0, 0, 0}, smooth = Smooth.None));
    connect(PersonalImFruedienst.outTransition[i], placeOut[1 + 3 * (i - 1)]) annotation(
      Line(points = {{10.8, 122}, {166, 122}, {166, 0}, {252, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
    connect(PersonalImSpaetdienst.outTransition[i], placeOut[2 + 3 * (i - 1)]) annotation(
      Line(points = {{10.8, 0}, {252, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
    connect(PersonalImSpaetdienst.inTransition[i], placeIn[2 + 3 * (i - 1)]) annotation(
      Line(points = {{-10.8, 0}, {-128, 0}, {-128, -1}, {-247, -1}}, color = {0, 0, 0}, smooth = Smooth.None));
    connect(PersonalImNachtdienst.outTransition[i], placeOut[3 + 3 * (i - 1)]) annotation(
      Line(points = {{10.8, -60}, {58, -60}, {58, 0}, {252, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
    connect(PersonalImNachtdienst.inTransition[i], placeIn[3 + 3 * (i - 1)]) annotation(
      Line(points = {{-10.8, -60}, {-60, -60}, {-60, -1}, {-247, -1}}, color = {0, 0, 0}, smooth = Smooth.None));
  end for;
  connect(BeginnFrueh.outPlaces[1], IstFruehDienst.inTransition[1]) annotation(
    Line(points = {{-39.2, 168}, {-10.8, 168}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(BeginnSpaet.outPlaces[1], IstSpaetDienst.inTransition[1]) annotation(
    Line(points = {{-39.2, 60}, {-10.8, 60}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(BeginnNacht.outPlaces[1], IstNachtDienst.inTransition[1]) annotation(
    Line(points = {{-39.2, -138}, {-10.8, -138}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(IstFruehDienst.outTransition[1], BedarfsMesserFrueh.inPlaces[1]) annotation(
    Line(points = {{10.8, 168}, {42, 168}, {42, 167.5}, {71.2, 167.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(IstSpaetDienst.outTransition[1], BedarfsMesserSpaet.inPlaces[1]) annotation(
    Line(points = {{10.8, 60}, {42, 60}, {42, 59.5}, {71.2, 59.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(IstNachtDienst.outTransition[1], BedarfsMesserNacht.inPlaces[1]) annotation(
    Line(points = {{10.8, -138}, {42, -138}, {42, -138.5}, {71.2, -138.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(RANacht.outTransition, BedarfsMesserNacht.inPlaces[2]) annotation(
    Line(points = {{44.9524, -90}, {58, -90}, {58, -137.5}, {71.2, -137.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(RANacht.inPlace, PersonalImNachtdienst.outTransition[nP + 1]) annotation(
    Line(points = {{31.0476, -90}, {31.0476, -88}, {10.8, -88}, {10.8, -60}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(RASpaet.inPlace, PersonalImSpaetdienst.outTransition[nP + 1]) annotation(
    Line(points = {{24.8889, 22}, {24.8889, 12}, {10.8, 12}, {10.8, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(RASpaet.outTransition, BedarfsMesserSpaet.inPlaces[2]) annotation(
    Line(points = {{41.1111, 22}, {41.1111, 42}, {71.2, 42}, {71.2, 60.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(RAFrueh.inPlace, PersonalImFruedienst.outTransition[nP + 1]) annotation(
    Line(points = {{29.0476, 146}, {20, 146}, {20, 122}, {10.8, 122}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(RAFrueh.outTransition, BedarfsMesserFrueh.inPlaces[2]) annotation(
    Line(points = {{42.9524, 146}, {56.4762, 146}, {56.4762, 168.5}, {71.2, 168.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(BedarfsMesserFrueh.outPlaces[1], ZusaetzlicherPflegebedarf.inTransition[1]) annotation(
    Line(points = {{80.8, 168}, {120, 168}, {120, -96.6667}, {165.2, -96.6667}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(BedarfsMesserSpaet.outPlaces[1], ZusaetzlicherPflegebedarf.inTransition[2]) annotation(
    Line(points = {{80.8, 60}, {120, 60}, {120, -96}, {165.2, -96}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(BedarfsMesserNacht.outPlaces[1], ZusaetzlicherPflegebedarf.inTransition[3]) annotation(
    Line(points = {{80.8, -138}, {118, -138}, {118, -95.3333}, {165.2, -95.3333}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -200}, {200, 200}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -200}, {200, 200}}), graphics = {Rectangle(extent = {{-200, 200}, {198, -200}}, lineColor = {0, 0, 0}), Rectangle(extent = {{-20, 60}, {20, -60}}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Rectangle(extent = {{-60, 20}, {60, -20}}, pattern = LinePattern.None, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid)}));
end Station;
