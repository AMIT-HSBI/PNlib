within PNlib.Examples.Models.FiliP.ModellStationen;
model Station20
  extends Modelica.Icons.Example;
  extends PNlib.Examples.Models.FiliP.AllgemeineParameter;
    PNlib.Examples.Models.FiliP.Station station(nP = 20, APFD = 4, APSD = 3, APND = 1) annotation(
      Placement(transformation(extent = {{-576, 752}, {-536, 792}})));
  protected
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft0(Stelle = 0.75, UrlaubsTage = 27) annotation(
      Placement(transformation(extent = {{-852, 538}, {-792, 598}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft1(Stelle = 0.9, UrlaubsTage = 32) annotation(
      Placement(transformation(extent = {{-850, 434}, {-790, 494}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft2(Stelle = 0.51, UrlaubsTage = 12) annotation(
      Placement(transformation(extent = {{-850, 338}, {-790, 398}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft3(Stelle = 0.5, UrlaubsTage = 12, WEF = 2) annotation(
      Placement(transformation(extent = {{-844, 240}, {-784, 300}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft4(Stelle = 1, UrlaubsTage = 36, WEF = 2) annotation(
      Placement(transformation(extent = {{-710, 548}, {-650, 608}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft5(Stelle = 0.41, UrlaubsTage = 10) annotation(
      Placement(transformation(extent = {{-710, 448}, {-650, 508}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft6(Stelle = 0.35, UrlaubsTage = 8, WEF = 2) annotation(
      Placement(transformation(extent = {{-710, 352}, {-650, 412}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft7(Stelle = 0.5, UrlaubsTage = 17) annotation(
      Placement(transformation(extent = {{-704, 254}, {-644, 314}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft8(Stelle = 0.5, UrlaubsTage = 12) annotation(
      Placement(transformation(extent = {{-576, 542}, {-516, 602}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft9(Stelle = 1, UrlaubsTage = 36, WEF = 2) annotation(
      Placement(transformation(extent = {{-574, 442}, {-514, 502}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft10(Stelle = 0.8, UrlaubsTage = 29) annotation(
      Placement(transformation(extent = {{-574, 346}, {-514, 406}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft11(Stelle = 0.75, UrlaubsTage = 27, WEF = 2) annotation(
      Placement(transformation(extent = {{-568, 248}, {-508, 308}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft12(Stelle = 1, UrlaubsTage = 35, WEF = 2) annotation(
      Placement(transformation(extent = {{-428, 534}, {-368, 594}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft13(Stelle = 0.5, UrlaubsTage = 18) annotation(
      Placement(transformation(extent = {{-426, 434}, {-366, 494}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft14(Stelle = 0.35, UrlaubsTage = 13) annotation(
      Placement(transformation(extent = {{-426, 338}, {-366, 398}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft15(Stelle = 0.75, UrlaubsTage = 27) annotation(
      Placement(transformation(extent = {{-420, 240}, {-360, 300}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft16(Stelle = 1, UrlaubsTage = 36, WEF = 2) annotation(
      Placement(transformation(extent = {{-244, 528}, {-184, 588}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft17(Stelle = 1, UrlaubsTage = 36) annotation(
      Placement(transformation(extent = {{-242, 428}, {-182, 488}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft18(Stelle = 1, UrlaubsTage = 36, WEF = 2) annotation(
      Placement(transformation(extent = {{-242, 332}, {-182, 392}})));
    PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft19(Stelle = 1, WEF = 2, UrlaubsTage = 32) annotation(
      Placement(transformation(extent = {{-236, 232}, {-176, 292}})));
  equation
    connect(pflegekraft0.transitionOut[1], station.placeIn[1]);
    connect(pflegekraft0.transitionOut[2], station.placeIn[2]);
    connect(pflegekraft0.transitionOut[3], station.placeIn[3]);
    connect(pflegekraft1.transitionOut[1], station.placeIn[4]);
    connect(pflegekraft1.transitionOut[2], station.placeIn[5]);
    connect(pflegekraft1.transitionOut[3], station.placeIn[6]);
    connect(pflegekraft2.transitionOut[1], station.placeIn[7]);
    connect(pflegekraft2.transitionOut[2], station.placeIn[8]);
    connect(pflegekraft2.transitionOut[3], station.placeIn[9]);
    connect(pflegekraft3.transitionOut[1], station.placeIn[10]);
    connect(pflegekraft3.transitionOut[2], station.placeIn[11]);
    connect(pflegekraft3.transitionOut[3], station.placeIn[12]);
    connect(pflegekraft4.transitionOut[1], station.placeIn[13]);
    connect(pflegekraft4.transitionOut[2], station.placeIn[14]);
    connect(pflegekraft4.transitionOut[3], station.placeIn[15]);
    connect(pflegekraft5.transitionOut[1], station.placeIn[16]);
    connect(pflegekraft5.transitionOut[2], station.placeIn[17]);
    connect(pflegekraft5.transitionOut[3], station.placeIn[18]);
    connect(pflegekraft6.transitionOut[1], station.placeIn[19]);
    connect(pflegekraft6.transitionOut[2], station.placeIn[20]);
    connect(pflegekraft6.transitionOut[3], station.placeIn[21]);
    connect(pflegekraft7.transitionOut[1], station.placeIn[22]);
    connect(pflegekraft7.transitionOut[2], station.placeIn[23]);
    connect(pflegekraft7.transitionOut[3], station.placeIn[24]);
    connect(pflegekraft8.transitionOut[1], station.placeIn[25]);
    connect(pflegekraft8.transitionOut[2], station.placeIn[26]);
    connect(pflegekraft8.transitionOut[3], station.placeIn[27]);
    connect(pflegekraft9.transitionOut[1], station.placeIn[28]);
    connect(pflegekraft9.transitionOut[2], station.placeIn[29]);
    connect(pflegekraft9.transitionOut[3], station.placeIn[30]);
    connect(pflegekraft10.transitionOut[1], station.placeIn[31]);
    connect(pflegekraft10.transitionOut[2], station.placeIn[32]);
    connect(pflegekraft10.transitionOut[3], station.placeIn[33]);
    connect(pflegekraft11.transitionOut[1], station.placeIn[34]);
    connect(pflegekraft11.transitionOut[2], station.placeIn[35]);
    connect(pflegekraft11.transitionOut[3], station.placeIn[36]);
    connect(pflegekraft12.transitionOut[1], station.placeIn[37]);
    connect(pflegekraft12.transitionOut[2], station.placeIn[38]);
    connect(pflegekraft12.transitionOut[3], station.placeIn[39]);
    connect(pflegekraft13.transitionOut[1], station.placeIn[40]);
    connect(pflegekraft13.transitionOut[2], station.placeIn[41]);
    connect(pflegekraft13.transitionOut[3], station.placeIn[42]);
    connect(pflegekraft14.transitionOut[1], station.placeIn[43]);
    connect(pflegekraft14.transitionOut[2], station.placeIn[44]);
    connect(pflegekraft14.transitionOut[3], station.placeIn[45]);
    connect(pflegekraft15.transitionOut[1], station.placeIn[46]);
    connect(pflegekraft15.transitionOut[2], station.placeIn[47]);
    connect(pflegekraft15.transitionOut[3], station.placeIn[48]);
    connect(pflegekraft16.transitionOut[1], station.placeIn[49]);
    connect(pflegekraft16.transitionOut[2], station.placeIn[50]);
    connect(pflegekraft16.transitionOut[3], station.placeIn[51]);
    connect(pflegekraft17.transitionOut[1], station.placeIn[52]);
    connect(pflegekraft17.transitionOut[2], station.placeIn[53]);
    connect(pflegekraft17.transitionOut[3], station.placeIn[54]);
    connect(pflegekraft18.transitionOut[1], station.placeIn[55]);
    connect(pflegekraft18.transitionOut[2], station.placeIn[56]);
    connect(pflegekraft18.transitionOut[3], station.placeIn[57]);
    connect(pflegekraft19.transitionOut[1], station.placeIn[58]);
    connect(pflegekraft19.transitionOut[2], station.placeIn[59]);
    connect(pflegekraft19.transitionOut[3], station.placeIn[60]);
  //////////////////////////////////////////////////////////////////////////////
    connect(pflegekraft0.transitionIn[1], station.placeOut[1]);
    connect(pflegekraft0.transitionIn[2], station.placeOut[2]);
    connect(pflegekraft0.transitionIn[3], station.placeOut[3]);
    connect(pflegekraft1.transitionIn[1], station.placeOut[4]);
    connect(pflegekraft1.transitionIn[2], station.placeOut[5]);
    connect(pflegekraft1.transitionIn[3], station.placeOut[6]);
    connect(pflegekraft2.transitionIn[1], station.placeOut[7]);
    connect(pflegekraft2.transitionIn[2], station.placeOut[8]);
    connect(pflegekraft2.transitionIn[3], station.placeOut[9]);
    connect(pflegekraft3.transitionIn[1], station.placeOut[10]);
    connect(pflegekraft3.transitionIn[2], station.placeOut[11]);
    connect(pflegekraft3.transitionIn[3], station.placeOut[12]);
    connect(pflegekraft4.transitionIn[1], station.placeOut[13]);
    connect(pflegekraft4.transitionIn[2], station.placeOut[14]);
    connect(pflegekraft4.transitionIn[3], station.placeOut[15]);
    connect(pflegekraft5.transitionIn[1], station.placeOut[16]);
    connect(pflegekraft5.transitionIn[2], station.placeOut[17]);
    connect(pflegekraft5.transitionIn[3], station.placeOut[18]);
    connect(pflegekraft6.transitionIn[1], station.placeOut[19]);
    connect(pflegekraft6.transitionIn[2], station.placeOut[20]);
    connect(pflegekraft6.transitionIn[3], station.placeOut[21]);
    connect(pflegekraft7.transitionIn[1], station.placeOut[22]);
    connect(pflegekraft7.transitionIn[2], station.placeOut[23]);
    connect(pflegekraft7.transitionIn[3], station.placeOut[24]);
    connect(pflegekraft8.transitionIn[1], station.placeOut[25]);
    connect(pflegekraft8.transitionIn[2], station.placeOut[26]);
    connect(pflegekraft8.transitionIn[3], station.placeOut[27]);
    connect(pflegekraft9.transitionIn[1], station.placeOut[28]);
    connect(pflegekraft9.transitionIn[2], station.placeOut[29]);
    connect(pflegekraft9.transitionIn[3], station.placeOut[30]);
    connect(pflegekraft10.transitionIn[1], station.placeOut[31]);
    connect(pflegekraft10.transitionIn[2], station.placeOut[32]);
    connect(pflegekraft10.transitionIn[3], station.placeOut[33]);
    connect(pflegekraft11.transitionIn[1], station.placeOut[34]);
    connect(pflegekraft11.transitionIn[2], station.placeOut[35]);
    connect(pflegekraft11.transitionIn[3], station.placeOut[36]);
    connect(pflegekraft12.transitionIn[1], station.placeOut[37]);
    connect(pflegekraft12.transitionIn[2], station.placeOut[38]);
    connect(pflegekraft12.transitionIn[3], station.placeOut[39]);
    connect(pflegekraft13.transitionIn[1], station.placeOut[40]);
    connect(pflegekraft13.transitionIn[2], station.placeOut[41]);
    connect(pflegekraft13.transitionIn[3], station.placeOut[42]);
    connect(pflegekraft14.transitionIn[1], station.placeOut[43]);
    connect(pflegekraft14.transitionIn[2], station.placeOut[44]);
    connect(pflegekraft14.transitionIn[3], station.placeOut[45]);
    connect(pflegekraft15.transitionIn[1], station.placeOut[46]);
    connect(pflegekraft15.transitionIn[2], station.placeOut[47]);
    connect(pflegekraft15.transitionIn[3], station.placeOut[48]);
    connect(pflegekraft16.transitionIn[1], station.placeOut[49]);
    connect(pflegekraft16.transitionIn[2], station.placeOut[50]);
    connect(pflegekraft16.transitionIn[3], station.placeOut[51]);
    connect(pflegekraft17.transitionIn[1], station.placeOut[52]);
    connect(pflegekraft17.transitionIn[2], station.placeOut[53]);
    connect(pflegekraft17.transitionIn[3], station.placeOut[54]);
    connect(pflegekraft18.transitionIn[1], station.placeOut[55]);
    connect(pflegekraft18.transitionIn[2], station.placeOut[56]);
    connect(pflegekraft18.transitionIn[3], station.placeOut[57]);
    connect(pflegekraft19.transitionIn[1], station.placeOut[58]);
    connect(pflegekraft19.transitionIn[2], station.placeOut[59]);
    connect(pflegekraft19.transitionIn[3], station.placeOut[60]);
    annotation(
      Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-1000, -1000}, {1000, 1000}}, initialScale = 0.1), graphics = {Text(lineColor = {0, 0, 255}, extent = {{-764, 936}, {-298, 844}}, textString = "Pflegefachkraefte", fontName = "MS Shell Dlg 2")}),
      Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-1000, -1000}, {1000, 1000}})));
  end Station20;
