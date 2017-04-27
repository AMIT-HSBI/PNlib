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
  Real BesetzungsDefizitFrueh=DefizitFruehschicht.t;
  Real BesetzungsDefizitSpaet=DefizitSpaetSchicht.t;
  Real BesetzungsDefizitNacht=DefizizNachtSchicht.t;
  PNlib.PD DefizitFruehschicht(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {164, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PD DefizitSpaetSchicht(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {162, -104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PD DefizizNachtSchicht(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {158, -146}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  protected
  PNlib.PD PersonalImFruedienst(enablingProbIn = fill(1 / nP, nP), enablingProbOut = fill(1 / (nP), nP), enablingType = PNlib.Types.EnablingType.Probability, maxTokens = APFD, nIn = nP, nOut = nP) annotation(
    Placement(visible = true, transformation(extent = {{-10, 18}, {10, 38}}, rotation = 0)));
  PNlib.PD PersonalImSpaetdienst(enablingProbIn = fill(1 / nP, nP), enablingProbOut = fill(1 / (nP), nP), enablingType = PNlib.Types.EnablingType.Probability, maxTokens = APSD, nIn = nP, nOut = nP) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  PNlib.PD PersonalImNachtdienst(enablingProbIn = fill(1 / nP, nP), enablingProbOut = fill(1 / (nP), nP), enablingType = PNlib.Types.EnablingType.Probability, maxTokens = APND, nIn = nP, nOut = nP) annotation(
    Placement(visible = true, transformation(extent = {{-8, -42}, {12, -22}}, rotation = 0)));
  PNlib.Interfaces.PlaceOut placeOut[3 * nP] annotation(
    Placement(transformation(extent = {{200, -52}, {304, 52}})));
  PNlib.Interfaces.PlaceIn placeIn[3 * nP] annotation(
    Placement(transformation(extent = {{-298, -50}, {-196, 48}})));
  PNlib.TT BeginnFrueh( nOut = 1,tactIntervall = 1, tactStart = (BeginFruehschicht+1)/24, arcWeightOut = {APFD - PersonalImFruedienst.t}) annotation(
    Placement(visible = true, transformation(extent = {{106, -70}, {126, -50}}, rotation = 0)));
  PNlib.TT BeginnSpaet( nOut = 1,tactIntervall = 1, tactStart = (BeginSpaetschicht+1)/24, arcWeightOut = {APSD - PersonalImSpaetdienst.t}) annotation(
    Placement(visible = true, transformation(extent = {{106, -108}, {126, -88}}, rotation = 0)));
  PNlib.TT BeginnNacht( nOut = 1,tactIntervall = 1, tactStart = (BeginNachtschicht+1)/24, arcWeightOut = {APND - PersonalImNachtdienst.t}) annotation(
    Placement(visible = true, transformation(extent = {{106, -148}, {126, -128}}, rotation = 0)));
  outer PNlib.Settings settings "global settings for animation and display";
equation
  connect(BeginnNacht.outPlaces[1], DefizizNachtSchicht.inTransition[1]) annotation(
    Line(points = {{120, -138}, {148, -138}, {148, -146}, {148, -146}}, thickness = 0.5));
  connect(BeginnSpaet.outPlaces[1], DefizitSpaetSchicht.inTransition[1]) annotation(
    Line(points = {{120, -98}, {150, -98}, {150, -104}, {152, -104}}, thickness = 0.5));
  connect(BeginnFrueh.outPlaces[1], DefizitFruehschicht.inTransition[1]) annotation(
    Line(points = {{120, -60}, {152, -60}, {152, -60}, {154, -60}}, thickness = 0.5));
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
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -200}, {200, 200}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -200}, {200, 200}}), graphics = {Rectangle(extent = {{-200, 200}, {198, -200}}, lineColor = {0, 0, 0}), Rectangle(extent = {{-20, 60}, {20, -60}}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Rectangle(extent = {{-60, 20}, {60, -20}}, pattern = LinePattern.None, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid)}));
end Station;
