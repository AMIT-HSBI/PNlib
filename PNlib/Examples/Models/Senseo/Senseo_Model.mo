within PNlib.Examples.Models.Senseo;
model Senseo_Model "Top Model"
  extends Modelica.Icons.Example;
  PNlib.Examples.Models.Senseo.Senseo_Maschine senseo_Maschine
    annotation(Placement(transformation(extent={{-32,-56},{68,40}})));
  Water_Tank water_tank
    annotation(Placement(transformation(extent={{60,-64},{108,-16}})));
  PNlib.Examples.Models.Senseo.coffee_cup coffe_cup(color={80,0,0}, hmax=
        0.25)
    annotation(Placement(transformation(extent={{64,-10},{100,26}})));
  Counter amount_cups
    annotation(Placement(transformation(extent={{10,46},{46,82}})));
  Start start(EV_time=1200)
    annotation(Placement(transformation(extent={{-102,-48},{-30,32}})));
  Refill_Water refill_Water
    annotation(Placement(transformation(extent={{2,-98},{38,-72}})));
  Insert_Pad insert_Pad
    annotation(Placement(transformation(extent={{-24,44},{-4,64}})));
  Counter_real counter_real(text="Temperature", hmax=90)
    annotation(Placement(transformation(extent={{66,42},{104,80}})));
  inner PNlib.Settings settings annotation(
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(senseo_Maschine.amount_cups_, amount_cups.levelSensor)
    annotation(Line(
      points={{27.5238,37.6},{27.5238,38},{28,38},{28,51.4}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(refill_Water.refill_[2], water_tank.inTransition1) annotation(
      Line(
      points={{20,-72.65},{20,-68},{84,-68},{84,-52}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(water_tank.refill_, refill_Water.watertank_) annotation(Line(
      points={{105.6,-37.6},{108.8,-37.6},{108.8,-90.2},{39.8,-90.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(water_tank.outTransition1, senseo_Maschine.watertank_)
    annotation(Line(
      points={{67.2,-37.84},{44,-37.84},{44,-38},{42,-38},{42,-37.76},{41.8095,
          -37.76}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(refill_Water.refill_[1], start.refillstart_) annotation(Line(
      points={{20,-73.95},{20,-68},{-84,-68},{-84,-40.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(start.refill_, refill_Water.start_) annotation(Line(
      points={{-89.04,-40.8},{-88.7,-40.8},{-88.7,-90.2},{0.2,-90.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(senseo_Maschine.stopornext_, start.stopornext_) annotation(
      Line(
      points={{-6.7619,-36.8},{-42.24,-36.8}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(start.start_[1], senseo_Maschine.startheating_) annotation(
      Line(
      points={{-44.4,11.6},{-46,11.6},{-46,14.56},{-7.2381,14.56}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(start.start_[2], insert_Pad.insert_) annotation(Line(
      points={{-44.4,15.6},{-44.4,14},{-34,14},{-34,50},{-25,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(insert_Pad.insertpad_, senseo_Maschine.padinsert_) annotation(
      Line(
      points={{-3,50},{10,50},{10,37.6},{10.381,37.6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(senseo_Maschine.coffee_cup_, coffe_cup.levelSensor) annotation(
     Line(
      points={{41.8095,4},{69.22,4},{69.22,4.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(senseo_Maschine.tw_, counter_real.levelSensor) annotation(Line(
      points={{41.8095,28.48},{85,28.48},{85,47.7}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
            -100},{120,80}}),
                      graphics), Icon(coordinateSystem(
          preserveAspectRatio=true, extent={{-100,-100},{120,80}})),
    experiment(StopTime=18000, Tolerance = 1e-6));
end Senseo_Model;
