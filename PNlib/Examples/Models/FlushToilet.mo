within PNlib.Examples.Models;
model FlushToilet "Model of a flush toilet"
  extends Modelica.Icons.Example;
  PD Lever(nIn=1,
    maxTokens=1,
    nOut=1) "Lever of the toilet"   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-62,46})));
  TD pushing(
    nOut=1,
    arcWeightIn={1},
    nIn=1,
    delay=3) "visitor pushes the lever" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-62,68})));
  TD lifting(
    nOut=1,
    nIn=1,
    delay=0.02) "Lift the flush valve flapper"
               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-62,22})));
  PD FlushValveFlapper(
    nIn=1,
    nOut=3,
    maxTokens=1)                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-62,-8})));
  TC flowing(
    nOut=1,
    nIn=3,
    arcWeightIn={0,1,2.5},
    maximumSpeed=5) "Water flows in the bowl"
                    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-62,-72})));
  PC WaterInBowl(nIn=1, nOut=1) "Water in the toilet bowl"
                              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-62,-96})));
  TA TA1(testValue=0)
         annotation (Placement(transformation(
        extent={{-7.99999,-3.00001},{7.99999,3.00003}},
        rotation=-90,
        origin={-71,-42})));
  PC WaterInTank(
    nOut=1,
    nIn=1,
    maxMarks=12,
    startMarks=12) "Water in the toilet tank"
                                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-14,-14})));
  PC LevelOfFloat(
    nOut=3,
    nIn=1,
    maxMarks=30,
    startMarks=30) "Level of the float" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={16,-14})));
  TD opening(
    nOut=1,
    nIn=1,
    arcWeightIn={6},
    delay=0.1) "Open the tank fill valve"
    annotation (Placement(transformation(extent={{62,-40},{82,-20}})));
  PD TankFillValve(
    nIn=1,
    nOut=2,
    maxTokens=1)
    annotation (Placement(transformation(extent={{88,-40},{108,-20}})));
  TC filling(
    nIn=1,
    nOut=2,
    arcWeightOut={2.5,1},
    arcWeightIn={0},
    maximumSpeed=6) "Water flows to the toilet tank"
    annotation (Placement(transformation(extent={{64,30},{44,10}})));
  TA TA3(testValue=0)
    annotation (Placement(transformation(extent={{98,16},{80,22}})));
  IA IA1(testValue=6)
    annotation (Placement(transformation(extent={{32,-34},{48,-28}})));
  TA TA2(testValue=29.9)
    annotation (Placement(transformation(extent={{32,-60},{48,-54}})));
  TD closing(
    nIn=2,
    arcWeightIn={1,29.999},
    delay=0.1) "Close the tank fill valve"
                        annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={76,-74})));
  TD sinking(nIn=1, delay=2) "Sink the flush valve flapper"
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-98,22})));
  TC Sewer(nIn=1, maximumSpeed=4) "Sewer"
                                         annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-62,-118})));
  inner Settings settings1(scale=5, timeFire=0.1,
    animateMarking=1,
    animatePlace=1,
    animateTransition=1,
    animatePutFireTime=1,
    animateHazardFunc=1,
    animateSpeed=1,
    animateWeightTIarc=1,
    animateTIarc=1)
    annotation (Placement(transformation(extent={{42,66},{74,98}})));
  PD Visitor(
    nOut=1,
    nIn=1,
    startTokens=1,
    maxTokens=1) "Visitor of the toilet"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-62,88})));
  TS entering(
    nOut=1,
    nIn=1,
    h=1/10) "Visitor enters the toilet" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-62,108})));
  IA IA2 annotation (Placement(transformation(
        extent={{-10.5,-3.5},{10.5,3.5}},
        rotation=90,
        origin={-37.5,70.5})));
equation
  connect(pushing.outPlaces[1], Lever.inTransition[1])  annotation (Line(
      points={{-62,63.2},{-62,56.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(lifting.outPlaces[1], FlushValveFlapper.inTransition[1])
                                                            annotation (Line(
      points={{-62,17.2},{-62,2.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowing.outPlaces[1], WaterInBowl.inTransition[1])
                                                            annotation (Line(
      points={{-62,-76.8},{-62,-85.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(FlushValveFlapper.outTransition[1], TA1.inPlace)
                                                    annotation (Line(
      points={{-62.6667,-18.8},{-62.6667,-31.8312},{-63.0101,-31.8312}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(TA1.outTransition, flowing.inPlaces[1])  annotation (Line(
      points={{-63.0101,-50.3709},{-63.0101,-48.6876},{-62.6667,-48.6876},{
          -62.6667,-67.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(WaterInTank.outTransition[1], flowing.inPlaces[2])
                                                         annotation (Line(
      points={{-14,-24.8},{-14,-56},{-62,-56},{-62,-67.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(LevelOfFloat.outTransition[1], flowing.inPlaces[3])
                                                            annotation (Line(
      points={{15.3333,-24.8},{15.3333,-60},{-62,-60},{-62,-67.2},{-61.3333,
          -67.2}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(opening.outPlaces[1], TankFillValve.inTransition[1])
                                                        annotation (Line(
      points={{76.8,-30},{87.2,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(TankFillValve.outTransition[1], TA3.inPlace)
                                                annotation (Line(
      points={{108.8,-30.5},{114,-30.5},{114,19},{99.4286,19}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(TA3.outTransition,filling. inPlaces[1]) annotation (Line(
      points={{78.5714,19},{60,19},{60,20},{58.8,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(filling.outPlaces[1], LevelOfFloat.inTransition[1])
                                                           annotation (Line(
      points={{49.2,20.5},{16,20.5},{16,-3.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(IA1.outTransition,opening. inPlaces[1]) annotation (Line(
      points={{49.2698,-31},{67.2,-31},{67.2,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(LevelOfFloat.outTransition[2], IA1.inPlace)
                                                   annotation (Line(
      points={{16,-24.8},{16,-31},{30.7302,-31}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(filling.outPlaces[2],WaterInTank. inTransition[1])
                                                        annotation (Line(
      points={{49.2,19.5},{-14,19.5},{-14,-3.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(LevelOfFloat.outTransition[3], TA2.inPlace)
                                                   annotation (Line(
      points={{16.6667,-24.8},{16,-24.8},{16,-57},{30.7302,-57}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(TankFillValve.outTransition[2], closing.inPlaces[1])
                                                           annotation (Line(
      points={{108.8,-29.5},{114,-29.5},{114,-58},{76.5,-58},{76.5,-69.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(TA2.outTransition, closing.inPlaces[2])    annotation (Line(
      points={{49.2698,-57},{76,-57},{76,-69.2},{75.5,-69.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(WaterInBowl.outTransition[1], Sewer.inPlaces[1])      annotation (
      Line(
      points={{-62,-106.8},{-62,-113.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Lever.outTransition[1], lifting.inPlaces[1]) annotation (Line(
      points={{-62,35.2},{-62,26.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(FlushValveFlapper.outTransition[2], sinking.inPlaces[1])
                                                              annotation (Line(
      points={{-62,-18.8},{-62,-24},{-98,-24},{-98,17.2}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(Visitor.outTransition[1], pushing.inPlaces[1])   annotation (Line(
      points={{-62,77.2},{-62,72.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(entering.outPlaces[1], Visitor.inTransition[1]) annotation (Line(
      points={{-62,103.2},{-62,98.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(FlushValveFlapper.outTransition[3], IA2.inPlace) annotation (Line(
      points={{-61.3333,-18.8},{-61.3333,-20},{-61.3333,-24},{-36,-24},{-36,48},
          {-35.803,48},{-35.803,48.3636}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(IA2.outTransition, entering.inPlaces[1]) annotation (Line(
      points={{-35.803,72.697},{-35.803,96},{-35.803,120},{-62,120},{-62,112.8}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (                                                       Diagram(
        coordinateSystem(preserveAspectRatio=true, extent={{-125,-125},{125,125}}),
        graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-125,-125},{125,125}})),
    experiment(StopTime=100),
    __Dymola_experimentSetupOutput,
                Documentation(info="<html>
  <p>
 This is a hybrid model of a flush toilet represented by the xHPN formalism.
 A visitor enters the toilet; thereby, the time between two visitors is not exactly known so that it is modelled by a stochastic transition with an exponential distributed delay (TS, T1).
 The visitor (PD, P1) pushes (TD, T2) the lever (PD, P2) which lifts the flush valve flapper (PD, P3). Then the water can flow (TC, T5) from the tank (PC, P4)
 to the bowl (PC, P5) and afterwards to the sewer (TC, T6). When the water flows to the bowl, the float (PC, P6) sinks in the toilet tank.
 If the float falls below a specific level (IA), the tank fill-valve (PD, P7) is opened (TD, T7) and new water can flow (TC, T9) into the tank.
 This causes also that the float rises and when a specific level is reached (TA), the tank fill-valve is closed (TD, T8).
 If the lever has returned to its starting position, the flush valve flapper sinks back to the bottom (TD, T4) and no water can flow into the bowl anymore.
 </p>
 </html>"));
end FlushToilet;
