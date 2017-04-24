within PNlib.Examples.Models.FiliP.ModellStationen;
model Station20
  extends Modelica.Icons.Example;
  extends PNlib.Examples.Models.FiliP.AllgemeineParameter;
    PNlib.Examples.Models.FiliP.Station station(nP = 20, APFD = 4, APSD = 3, APND = 1) annotation(
      Placement(visible = true, transformation(extent = {{-48, 268}, {-8, 308}}, rotation = 0)));
  inner PNlib.Settings settings annotation(
    Placement(visible = true, transformation(origin = {306, 290}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft0(Stelle = 0.75, UrlaubsTage = 27) annotation(
      Placement(visible = true, transformation(extent = {{-324, 54}, {-264, 114}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft1(Stelle = 0.9, UrlaubsTage = 32) annotation(
      Placement(visible = true, transformation(extent = {{-322, -50}, {-262, 10}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft2(Stelle = 0.51, UrlaubsTage = 12) annotation(
      Placement(visible = true, transformation(extent = {{-322, -146}, {-262, -86}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft3(Stelle = 0.5, UrlaubsTage = 12, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{-316, -244}, {-256, -184}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft4(Stelle = 1, UrlaubsTage = 36, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{-182, 64}, {-122, 124}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft5(Stelle = 0.41, UrlaubsTage = 10) annotation(
      Placement(visible = true, transformation(extent = {{-182, -36}, {-122, 24}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft6(Stelle = 0.35, UrlaubsTage = 8, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{-182, -132}, {-122, -72}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft7(Stelle = 0.5, UrlaubsTage = 17) annotation(
      Placement(visible = true, transformation(extent = {{-176, -230}, {-116, -170}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft8(Stelle = 0.5, UrlaubsTage = 12) annotation(
      Placement(visible = true, transformation(extent = {{-48, 58}, {12, 118}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft9(Stelle = 1, UrlaubsTage = 36, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{-46, -42}, {14, 18}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft10(Stelle = 0.8, UrlaubsTage = 29) annotation(
      Placement(visible = true, transformation(extent = {{-46, -138}, {14, -78}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft11(Stelle = 0.75, UrlaubsTage = 27, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{-40, -236}, {20, -176}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft12(Stelle = 1, UrlaubsTage = 35, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{100, 50}, {160, 110}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft13(Stelle = 0.5, UrlaubsTage = 18) annotation(
      Placement(visible = true, transformation(extent = {{102, -50}, {162, 10}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft14(Stelle = 0.35, UrlaubsTage = 13) annotation(
      Placement(visible = true, transformation(extent = {{102, -146}, {162, -86}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft15(Stelle = 0.75, UrlaubsTage = 27) annotation(
      Placement(visible = true, transformation(extent = {{108, -244}, {168, -184}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft16(Stelle = 1, UrlaubsTage = 36, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{284, 44}, {344, 104}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft17(Stelle = 1, UrlaubsTage = 36) annotation(
      Placement(visible = true, transformation(extent = {{286, -56}, {346, 4}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft18(Stelle = 1, UrlaubsTage = 36, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{286, -152}, {346, -92}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft19(Stelle = 1, WEF = 2, UrlaubsTage = 32) annotation(
      Placement(visible = true, transformation(extent = {{292, -252}, {352, -192}}, rotation = 0)));
  equation
  connect(pflegekraft19.transitionOut[1], station.placeIn[58]) annotation(
    Line);
  connect(pflegekraft19.transitionOut[2], station.placeIn[59]) annotation(
    Line);
  connect(pflegekraft19.transitionOut[2], station.placeIn[59]) annotation(
    Line);
  connect(pflegekraft19.transitionOut[2], station.placeIn[59]) annotation(
    Line);
  connect(pflegekraft19.transitionOut[2], station.placeIn[59]) annotation(
    Line);
  connect(pflegekraft19.transitionOut[2], station.placeIn[59]) annotation(
    Line);
  connect(pflegekraft18.transitionOut[1], station.placeIn[55]) annotation(
    Line);
  connect(pflegekraft18.transitionOut[2], station.placeIn[56]) annotation(
    Line);
  connect(pflegekraft18.transitionOut[2], station.placeIn[56]) annotation(
    Line);
  connect(pflegekraft18.transitionOut[2], station.placeIn[56]) annotation(
    Line);
  connect(pflegekraft18.transitionOut[2], station.placeIn[56]) annotation(
    Line);
  connect(pflegekraft18.transitionOut[2], station.placeIn[56]) annotation(
    Line);
  connect(pflegekraft17.transitionOut[1], station.placeIn[52]) annotation(
    Line);
  connect(pflegekraft17.transitionOut[2], station.placeIn[53]) annotation(
    Line);
  connect(pflegekraft17.transitionOut[2], station.placeIn[53]) annotation(
    Line);
  connect(pflegekraft17.transitionOut[2], station.placeIn[53]) annotation(
    Line);
  connect(pflegekraft17.transitionOut[2], station.placeIn[53]) annotation(
    Line);
  connect(pflegekraft17.transitionOut[2], station.placeIn[53]) annotation(
    Line);
  connect(pflegekraft16.transitionOut[1], station.placeIn[49]) annotation(
    Line);
  connect(pflegekraft16.transitionOut[2], station.placeIn[50]) annotation(
    Line);
  connect(pflegekraft16.transitionOut[2], station.placeIn[50]) annotation(
    Line);
  connect(pflegekraft16.transitionOut[2], station.placeIn[50]) annotation(
    Line);
  connect(pflegekraft16.transitionOut[2], station.placeIn[50]) annotation(
    Line);
  connect(pflegekraft16.transitionOut[2], station.placeIn[50]) annotation(
    Line);
  connect(pflegekraft15.transitionOut[1], station.placeIn[46]) annotation(
    Line);
  connect(pflegekraft15.transitionOut[2], station.placeIn[47]) annotation(
    Line);
  connect(pflegekraft15.transitionOut[2], station.placeIn[47]) annotation(
    Line);
  connect(pflegekraft15.transitionOut[2], station.placeIn[47]) annotation(
    Line);
  connect(pflegekraft15.transitionOut[2], station.placeIn[47]) annotation(
    Line);
  connect(pflegekraft15.transitionOut[2], station.placeIn[47]) annotation(
    Line);
  connect(pflegekraft14.transitionOut[1], station.placeIn[43]) annotation(
    Line);
  connect(pflegekraft14.transitionOut[2], station.placeIn[44]) annotation(
    Line);
  connect(pflegekraft14.transitionOut[2], station.placeIn[44]) annotation(
    Line);
  connect(pflegekraft14.transitionOut[2], station.placeIn[44]) annotation(
    Line);
  connect(pflegekraft14.transitionOut[2], station.placeIn[44]) annotation(
    Line);
  connect(pflegekraft14.transitionOut[2], station.placeIn[44]) annotation(
    Line);
  connect(pflegekraft13.transitionOut[1], station.placeIn[40]) annotation(
    Line);
  connect(pflegekraft13.transitionOut[2], station.placeIn[41]) annotation(
    Line);
  connect(pflegekraft13.transitionOut[2], station.placeIn[41]) annotation(
    Line);
  connect(pflegekraft13.transitionOut[2], station.placeIn[41]) annotation(
    Line);
  connect(pflegekraft13.transitionOut[2], station.placeIn[41]) annotation(
    Line);
  connect(pflegekraft13.transitionOut[2], station.placeIn[41]) annotation(
    Line);
  connect(pflegekraft12.transitionOut[1], station.placeIn[37]) annotation(
    Line);
  connect(pflegekraft12.transitionOut[2], station.placeIn[38]) annotation(
    Line);
  connect(pflegekraft12.transitionOut[2], station.placeIn[38]) annotation(
    Line);
  connect(pflegekraft12.transitionOut[2], station.placeIn[38]) annotation(
    Line);
  connect(pflegekraft12.transitionOut[2], station.placeIn[38]) annotation(
    Line);
  connect(pflegekraft12.transitionOut[2], station.placeIn[38]) annotation(
    Line);
  connect(pflegekraft11.transitionOut[1], station.placeIn[34]) annotation(
    Line);
  connect(pflegekraft11.transitionOut[2], station.placeIn[35]) annotation(
    Line);
  connect(pflegekraft11.transitionOut[2], station.placeIn[35]) annotation(
    Line);
  connect(pflegekraft11.transitionOut[2], station.placeIn[35]) annotation(
    Line);
  connect(pflegekraft11.transitionOut[2], station.placeIn[35]) annotation(
    Line);
  connect(pflegekraft11.transitionOut[2], station.placeIn[35]) annotation(
    Line);
  connect(pflegekraft10.transitionOut[1], station.placeIn[31]) annotation(
    Line);
  connect(pflegekraft10.transitionOut[2], station.placeIn[32]) annotation(
    Line);
  connect(pflegekraft10.transitionOut[2], station.placeIn[32]) annotation(
    Line);
  connect(pflegekraft10.transitionOut[2], station.placeIn[32]) annotation(
    Line);
  connect(pflegekraft10.transitionOut[2], station.placeIn[32]) annotation(
    Line);
  connect(pflegekraft10.transitionOut[2], station.placeIn[32]) annotation(
    Line);
  connect(pflegekraft9.transitionOut[1], station.placeIn[28]) annotation(
    Line);
  connect(pflegekraft9.transitionOut[2], station.placeIn[29]) annotation(
    Line);
  connect(pflegekraft9.transitionOut[2], station.placeIn[29]) annotation(
    Line);
  connect(pflegekraft9.transitionOut[2], station.placeIn[29]) annotation(
    Line);
  connect(pflegekraft9.transitionOut[2], station.placeIn[29]) annotation(
    Line);
  connect(pflegekraft9.transitionOut[2], station.placeIn[29]) annotation(
    Line);
  connect(pflegekraft8.transitionOut[1], station.placeIn[25]) annotation(
    Line);
  connect(pflegekraft8.transitionOut[2], station.placeIn[26]) annotation(
    Line);
  connect(pflegekraft8.transitionOut[2], station.placeIn[26]) annotation(
    Line);
  connect(pflegekraft8.transitionOut[2], station.placeIn[26]) annotation(
    Line);
  connect(pflegekraft8.transitionOut[2], station.placeIn[26]) annotation(
    Line);
  connect(pflegekraft8.transitionOut[2], station.placeIn[26]) annotation(
    Line);
  connect(pflegekraft7.transitionOut[1], station.placeIn[22]) annotation(
    Line);
  connect(pflegekraft7.transitionOut[2], station.placeIn[23]) annotation(
    Line);
  connect(pflegekraft7.transitionOut[2], station.placeIn[23]) annotation(
    Line);
  connect(pflegekraft7.transitionOut[2], station.placeIn[23]) annotation(
    Line);
  connect(pflegekraft7.transitionOut[2], station.placeIn[23]) annotation(
    Line);
  connect(pflegekraft7.transitionOut[2], station.placeIn[23]) annotation(
    Line);
  connect(pflegekraft6.transitionOut[1], station.placeIn[19]) annotation(
    Line);
  connect(pflegekraft6.transitionOut[2], station.placeIn[20]) annotation(
    Line);
  connect(pflegekraft6.transitionOut[2], station.placeIn[20]) annotation(
    Line);
  connect(pflegekraft6.transitionOut[2], station.placeIn[20]) annotation(
    Line);
  connect(pflegekraft6.transitionOut[2], station.placeIn[20]) annotation(
    Line);
  connect(pflegekraft6.transitionOut[2], station.placeIn[20]) annotation(
    Line);
  connect(pflegekraft5.transitionOut[1], station.placeIn[16]) annotation(
    Line);
  connect(pflegekraft5.transitionOut[2], station.placeIn[17]) annotation(
    Line);
  connect(pflegekraft5.transitionOut[2], station.placeIn[17]) annotation(
    Line);
  connect(pflegekraft5.transitionOut[2], station.placeIn[17]) annotation(
    Line);
  connect(pflegekraft5.transitionOut[2], station.placeIn[17]) annotation(
    Line);
  connect(pflegekraft5.transitionOut[2], station.placeIn[17]) annotation(
    Line);
  connect(pflegekraft4.transitionOut[1], station.placeIn[13]) annotation(
    Line);
  connect(pflegekraft4.transitionOut[2], station.placeIn[14]) annotation(
    Line);
  connect(pflegekraft4.transitionOut[2], station.placeIn[14]) annotation(
    Line);
  connect(pflegekraft4.transitionOut[2], station.placeIn[14]) annotation(
    Line);
  connect(pflegekraft4.transitionOut[2], station.placeIn[14]) annotation(
    Line);
  connect(pflegekraft4.transitionOut[2], station.placeIn[14]) annotation(
    Line);
  connect(pflegekraft3.transitionOut[1], station.placeIn[10]) annotation(
    Line);
  connect(pflegekraft3.transitionOut[2], station.placeIn[11]) annotation(
    Line);
  connect(pflegekraft3.transitionOut[2], station.placeIn[11]) annotation(
    Line);
  connect(pflegekraft3.transitionOut[2], station.placeIn[11]) annotation(
    Line);
  connect(pflegekraft3.transitionOut[2], station.placeIn[11]) annotation(
    Line);
  connect(pflegekraft3.transitionOut[2], station.placeIn[11]) annotation(
    Line);
  connect(pflegekraft2.transitionOut[1], station.placeIn[7]) annotation(
    Line);
  connect(pflegekraft2.transitionOut[2], station.placeIn[8]) annotation(
    Line);
  connect(pflegekraft2.transitionOut[2], station.placeIn[8]) annotation(
    Line);
  connect(pflegekraft2.transitionOut[2], station.placeIn[8]) annotation(
    Line);
  connect(pflegekraft2.transitionOut[2], station.placeIn[8]) annotation(
    Line);
  connect(pflegekraft2.transitionOut[2], station.placeIn[8]) annotation(
    Line);
  connect(pflegekraft1.transitionOut[1], station.placeIn[4]) annotation(
    Line);
  connect(pflegekraft1.transitionOut[2], station.placeIn[5]) annotation(
    Line);
  connect(pflegekraft1.transitionOut[2], station.placeIn[5]) annotation(
    Line);
  connect(pflegekraft1.transitionOut[2], station.placeIn[5]) annotation(
    Line);
  connect(pflegekraft1.transitionOut[2], station.placeIn[5]) annotation(
    Line);
  connect(pflegekraft1.transitionOut[2], station.placeIn[5]) annotation(
    Line);
  connect(pflegekraft0.transitionOut[1], station.placeIn[1]) annotation(
    Line);
  connect(pflegekraft0.transitionOut[2], station.placeIn[2]) annotation(
    Line);
  connect(pflegekraft0.transitionOut[2], station.placeIn[2]) annotation(
    Line);
  connect(pflegekraft0.transitionOut[2], station.placeIn[2]) annotation(
    Line);
  connect(pflegekraft0.transitionOut[2], station.placeIn[2]) annotation(
    Line);
  connect(pflegekraft0.transitionOut[2], station.placeIn[2]) annotation(
    Line);
//////////////////////////////////////////////////////////////////////////////
    annotation(
      Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-400, -400}, {400, 400}}, initialScale = 0.1)),
      Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}))/*,
    experiment(StartTime = 0, StopTime = 8760, Tolerance = 1e-06)*/);
  end Station20;
