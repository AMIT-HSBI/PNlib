within PNlib.Examples.Models.FiliP.ModellStationen;
model Station20
  extends Modelica.Icons.Example;
  extends PNlib.Examples.Models.FiliP.AllgemeineParameter;
    PNlib.Examples.Models.FiliP.Station station(nP = 20, APFD = 4, APSD = 3, APND = 1) annotation(
      Placement(visible = true, transformation(extent = {{-48, 268}, {-8, 308}}, rotation = 0)));
  inner PNlib.Components.Settings settings annotation(
    Placement(visible = true, transformation(origin = {306, 290}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft1(Stelle = 0.75) annotation(
      Placement(visible = true, transformation(extent = {{-324, 54}, {-264, 114}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft2(Stelle = 0.9) annotation(
      Placement(visible = true, transformation(extent = {{-322, -50}, {-262, 10}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft3(Stelle = 0.51) annotation(
      Placement(visible = true, transformation(extent = {{-322, -146}, {-262, -86}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft4(Stelle = 0.5, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{-316, -244}, {-256, -184}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft5(Stelle = 1, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{-182, 64}, {-122, 124}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft6(Stelle = 0.41) annotation(
      Placement(visible = true, transformation(extent = {{-182, -36}, {-122, 24}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft7(Stelle = 0.35, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{-182, -132}, {-122, -72}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft8(Stelle = 0.5) annotation(
      Placement(visible = true, transformation(extent = {{-176, -230}, {-116, -170}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft9(Stelle = 0.5) annotation(
      Placement(visible = true, transformation(extent = {{-48, 58}, {12, 118}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft10(Stelle = 1, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{-46, -42}, {14, 18}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft11(Stelle = 0.8) annotation(
      Placement(visible = true, transformation(extent = {{-46, -138}, {14, -78}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft12(Stelle = 0.75, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{-40, -236}, {20, -176}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft13(Stelle = 1, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{100, 50}, {160, 110}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft14(Stelle = 0.5) annotation(
      Placement(visible = true, transformation(extent = {{102, -50}, {162, 10}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft15(Stelle = 0.35) annotation(
      Placement(visible = true, transformation(extent = {{102, -146}, {162, -86}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft16(Stelle = 0.75) annotation(
      Placement(visible = true, transformation(extent = {{108, -244}, {168, -184}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft17(Stelle = 1, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{284, 44}, {344, 104}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft18(Stelle = 1) annotation(
      Placement(visible = true, transformation(extent = {{286, -56}, {346, 4}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft19(Stelle = 1, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{286, -152}, {346, -92}}, rotation = 0)));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft20(Stelle = 1, WEF = 2) annotation(
      Placement(visible = true, transformation(extent = {{292, -252}, {352, -192}}, rotation = 0)));
  equation

    connect(station.placeIn[60], pflegekraft20.transitionOut[3]);
    connect(station.placeIn[59], pflegekraft20.transitionOut[2]);
    connect(station.placeIn[58], pflegekraft20.transitionOut[1]);
    connect(station.placeIn[57], pflegekraft19.transitionOut[3]);
    connect(station.placeIn[56], pflegekraft19.transitionOut[2]);
    connect(station.placeIn[55], pflegekraft19.transitionOut[1]);
    connect(station.placeIn[54], pflegekraft18.transitionOut[3]);
    connect(station.placeIn[53], pflegekraft18.transitionOut[2]);
    connect(station.placeIn[52], pflegekraft18.transitionOut[1]);
    connect(station.placeIn[51], pflegekraft17.transitionOut[3]);
    connect(station.placeIn[50], pflegekraft17.transitionOut[2]);
    connect(station.placeIn[49], pflegekraft17.transitionOut[1]);
    connect(station.placeIn[48], pflegekraft16.transitionOut[3]);
    connect(station.placeIn[47], pflegekraft16.transitionOut[2]);
    connect(station.placeIn[46], pflegekraft16.transitionOut[1]);
    connect(station.placeIn[45], pflegekraft15.transitionOut[3]);
    connect(station.placeIn[44], pflegekraft15.transitionOut[2]);
    connect(station.placeIn[43], pflegekraft15.transitionOut[1]);
    connect(station.placeIn[42], pflegekraft14.transitionOut[3]);
    connect(station.placeIn[41], pflegekraft14.transitionOut[2]);
    connect(station.placeIn[40], pflegekraft14.transitionOut[1]);
    connect(station.placeIn[39], pflegekraft13.transitionOut[3]);
    connect(station.placeIn[38], pflegekraft13.transitionOut[2]);
    connect(station.placeIn[37], pflegekraft13.transitionOut[1]);
    connect(station.placeIn[36], pflegekraft12.transitionOut[3]);
    connect(station.placeIn[35], pflegekraft12.transitionOut[2]);
    connect(station.placeIn[34], pflegekraft12.transitionOut[1]);
    connect(station.placeIn[33], pflegekraft11.transitionOut[3]);
    connect(station.placeIn[32], pflegekraft11.transitionOut[2]);
    connect(station.placeIn[31], pflegekraft11.transitionOut[1]);
    connect(station.placeIn[30], pflegekraft10.transitionOut[3]);
    connect(station.placeIn[29], pflegekraft10.transitionOut[2]);
    connect(station.placeIn[28], pflegekraft10.transitionOut[1]);
    connect(station.placeIn[27], pflegekraft9.transitionOut[3]);
    connect(station.placeIn[26], pflegekraft9.transitionOut[2]);
    connect(station.placeIn[25], pflegekraft9.transitionOut[1]);
    connect(station.placeIn[24], pflegekraft8.transitionOut[3]);
    connect(station.placeIn[23], pflegekraft8.transitionOut[2]);
    connect(station.placeIn[22], pflegekraft8.transitionOut[1]);
    connect(station.placeIn[21], pflegekraft7.transitionOut[3]);
    connect(station.placeIn[20], pflegekraft7.transitionOut[2]);
    connect(station.placeIn[19], pflegekraft7.transitionOut[1]);
    connect(station.placeIn[18], pflegekraft6.transitionOut[3]);
    connect(station.placeIn[17], pflegekraft6.transitionOut[2]);
    connect(station.placeIn[16], pflegekraft6.transitionOut[1]);
    connect(station.placeIn[15], pflegekraft5.transitionOut[3]);
    connect(station.placeIn[14], pflegekraft5.transitionOut[2]);
    connect(station.placeIn[13], pflegekraft5.transitionOut[1]);
    connect(station.placeIn[12], pflegekraft4.transitionOut[3]);
    connect(station.placeIn[11], pflegekraft4.transitionOut[2]);
    connect(station.placeIn[10], pflegekraft4.transitionOut[1]);
    connect(station.placeIn[9], pflegekraft3.transitionOut[3]);
    connect(station.placeIn[8], pflegekraft3.transitionOut[2]);
    connect(station.placeIn[7], pflegekraft3.transitionOut[1]);
    connect(station.placeIn[6], pflegekraft2.transitionOut[3]);
    connect(station.placeIn[5], pflegekraft2.transitionOut[2]);
    connect(station.placeIn[4], pflegekraft2.transitionOut[1]);
    connect(station.placeIn[3], pflegekraft1.transitionOut[3]);
    connect(station.placeIn[2], pflegekraft1.transitionOut[2]);
    connect(station.placeIn[1], pflegekraft1.transitionOut[1]);



    connect(station.placeOut[60], pflegekraft20.transitionIn[3]);
    connect(station.placeOut[59], pflegekraft20.transitionIn[2]);
    connect(station.placeOut[58], pflegekraft20.transitionIn[1]);
    connect(station.placeOut[57], pflegekraft19.transitionIn[3]);
    connect(station.placeOut[56], pflegekraft19.transitionIn[2]);
    connect(station.placeOut[55], pflegekraft19.transitionIn[1]);
    connect(station.placeOut[54], pflegekraft18.transitionIn[3]);
    connect(station.placeOut[53], pflegekraft18.transitionIn[2]);
    connect(station.placeOut[52], pflegekraft18.transitionIn[1]);
    connect(station.placeOut[51], pflegekraft17.transitionIn[3]);
    connect(station.placeOut[50], pflegekraft17.transitionIn[2]);
    connect(station.placeOut[49], pflegekraft17.transitionIn[1]);
    connect(station.placeOut[48], pflegekraft16.transitionIn[3]);
    connect(station.placeOut[47], pflegekraft16.transitionIn[2]);
    connect(station.placeOut[46], pflegekraft16.transitionIn[1]);
    connect(station.placeOut[45], pflegekraft15.transitionIn[3]);
    connect(station.placeOut[44], pflegekraft15.transitionIn[2]);
    connect(station.placeOut[43], pflegekraft15.transitionIn[1]);
    connect(station.placeOut[42], pflegekraft14.transitionIn[3]);
    connect(station.placeOut[41], pflegekraft14.transitionIn[2]);
    connect(station.placeOut[40], pflegekraft14.transitionIn[1]);
    connect(station.placeOut[39], pflegekraft13.transitionIn[3]);
    connect(station.placeOut[38], pflegekraft13.transitionIn[2]);
    connect(station.placeOut[37], pflegekraft13.transitionIn[1]);
    connect(station.placeOut[36], pflegekraft12.transitionIn[3]);
    connect(station.placeOut[35], pflegekraft12.transitionIn[2]);
    connect(station.placeOut[34], pflegekraft12.transitionIn[1]);
    connect(station.placeOut[33], pflegekraft11.transitionIn[3]);
    connect(station.placeOut[32], pflegekraft11.transitionIn[2]);
    connect(station.placeOut[31], pflegekraft11.transitionIn[1]);
    connect(station.placeOut[30], pflegekraft10.transitionIn[3]);
    connect(station.placeOut[29], pflegekraft10.transitionIn[2]);
    connect(station.placeOut[28], pflegekraft10.transitionIn[1]);
    connect(station.placeOut[27], pflegekraft9.transitionIn[3]);
    connect(station.placeOut[26], pflegekraft9.transitionIn[2]);
    connect(station.placeOut[25], pflegekraft9.transitionIn[1]);
    connect(station.placeOut[24], pflegekraft8.transitionIn[3]);
    connect(station.placeOut[23], pflegekraft8.transitionIn[2]);
    connect(station.placeOut[22], pflegekraft8.transitionIn[1]);
    connect(station.placeOut[21], pflegekraft7.transitionIn[3]);
    connect(station.placeOut[20], pflegekraft7.transitionIn[2]);
    connect(station.placeOut[19], pflegekraft7.transitionIn[1]);
    connect(station.placeOut[18], pflegekraft6.transitionIn[3]);
    connect(station.placeOut[17], pflegekraft6.transitionIn[2]);
    connect(station.placeOut[16], pflegekraft6.transitionIn[1]);
    connect(station.placeOut[15], pflegekraft5.transitionIn[3]);
    connect(station.placeOut[14], pflegekraft5.transitionIn[2]);
    connect(station.placeOut[13], pflegekraft5.transitionIn[1]);
    connect(station.placeOut[12], pflegekraft4.transitionIn[3]);
    connect(station.placeOut[11], pflegekraft4.transitionIn[2]);
    connect(station.placeOut[10], pflegekraft4.transitionIn[1]);
    connect(station.placeOut[9], pflegekraft3.transitionIn[3]);
    connect(station.placeOut[8], pflegekraft3.transitionIn[2]);
    connect(station.placeOut[7], pflegekraft3.transitionIn[1]);
    connect(station.placeOut[6], pflegekraft2.transitionIn[3]);
    connect(station.placeOut[5], pflegekraft2.transitionIn[2]);
    connect(station.placeOut[4], pflegekraft2.transitionIn[1]);
    connect(station.placeOut[3], pflegekraft1.transitionIn[3]);
    connect(station.placeOut[2], pflegekraft1.transitionIn[2]);
    connect(station.placeOut[1], pflegekraft1.transitionIn[1]);

//////////////////////////////////////////////////////////////////////////////
    annotation(
      Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-400, -400}, {400, 400}}, initialScale = 0.1)),
      Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}))/*,
    experiment(StartTime = 0, StopTime = 365, Tolerance = 1e-06)*/);
  end Station20;
