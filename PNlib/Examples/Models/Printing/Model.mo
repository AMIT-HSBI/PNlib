within PNlib.Examples.Models.Printing;
model Model "Top model"
  extends Modelica.Icons.Example;
 inner Real speed=start_Stop.speed;
 inner Boolean reStart=start_Stop.reStart;
 inner Boolean start=start_Stop.Start.t>0;
 Real orders__;
 Real exemplars__;
 Real maculation__;
 Real paper__;
 Real duration__;
  PNlib.Examples.Models.Printing.PrintingMachine printing_machine
    annotation(Placement(transformation(extent={{-44,-50},{64,18}})));
  PNlib.Examples.Models.Printing.Start_Stop start_Stop(number_exemplars=
        30000)
    annotation(Placement(transformation(extent={{-36,34},{6,80}})));
  PNlib.Examples.Models.Printing.Maculation maculation(time_between_macus=
        9000, time_macu=1200)
    annotation(Placement(transformation(extent={{-28,-122},{56,-80}})));
  Counter maculation_(hmax=40000, text="maculation")
    annotation(Placement(transformation(extent={{62,-86},{108,-40}})));
  Counter exemplars_(
    color={0,255,0},
    text="exemplars",
    hmax=start_Stop.number_exemplars)
    annotation(Placement(transformation(extent={{50,16},{92,58}})));
  PNlib.Examples.Models.Printing.Role_change role_change(display_time=200)
    annotation(Placement(transformation(extent={{-120,-54},{-58,4}})));
  Counter orders_(
    color={0,255,0},
    hmax=25,
    text="orders")
    annotation(Placement(transformation(extent={{-82,52},{-46,88}})));
  Counter role_(
    hmax=20000,
    color={85,170,255},
    text="meters on role")
    annotation(Placement(transformation(extent={{-116,6},{-80,42}})));
  Counter paper_(
    hmax=60000,
    color={85,170,255},
    text=" paper")
    annotation(Placement(transformation(extent={{84,18},{126,60}})));
  Counter duration_(
    color={0,255,0},
    hmax=15000,
    text="duration")
    annotation(Placement(transformation(extent={{14,54},{48,88}})));
  inner Components.Settings settings
    annotation (Placement(transformation(extent={{-122,-122},{-102,-102}})));
equation
  when reStart then
    orders__=orders_.levelSensor_;
    exemplars__=exemplars_.levelSensor_;
    maculation__=maculation_.levelSensor_;
    paper__=paper_.levelSensor_;
    duration__=duration_.levelSensor_;
  end when;
  connect(maculation.macuBundle_, maculation_.levelSensor)
                                                       annotation(Line(
      points={{53.9,-101.42},{85,-101.42},{85,-79.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(printing_machine.number_exemplars_, exemplars_.levelSensor)
                                                                 annotation (
      Line(
      points={{53.2,5.76},{71,5.76},{71,22.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(role_change.rolle_, printing_machine.drucken_) annotation(Line(
      points={{-64.82,-16.3},{-32.12,-16.3},{-32.12,-16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(role_change.rollenwechsel_, maculation.ausschleussen_)   annotation (
      Line(
      points={{-64.82,-33.7},{-40,-34},{-40,-101},{-25.9,-101}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(maculation.makulatur_, printing_machine.maku_)
                                                     annotation(Line(
      points={{-2.8,-82.1},{-2.8,-49.184},{-3.5,-49.184}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(printing_machine.ausschleussen, maculation.buendelinMakuPresse_)
    annotation(Line(
      points={{29.98,-49.184},{30,-66},{30,-82.1},{30.8,-82.1}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(orders_.levelSensor, start_Stop.orders_)   annotation(Line(
      points={{-64,57.4},{-64,54.7},{-33.9,54.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(role_change.meter_role_, role_.levelSensor)       annotation (
      Line(
      points={{-98.3,-1.8},{-98.3,-4.5},{-98,-4.5},{-98,11.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(start_Stop.rollen_wechsel_, role_change.start_)     annotation (
     Line(
      points={{-33.9,43.2},{-76.6,43.2},{-76.6,-1.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(printing_machine.papier_total_, paper_.levelSensor)
                                                             annotation(Line(
      points={{53.2,-5.12},{105,-5.12},{105,24.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(start_Stop.time_counter_, duration_.levelSensor) annotation(Line(
      points={{3.9,54.7},{31,54.7},{31,59.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(printing_machine.exemplare_, start_Stop.exemplare_)
                                                            annotation(Line(
      points={{-14.3,16.64},{-14.3,36.32},{-15,36.32},{-15,36.3}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-125,-125},
            {125,125}}),
                      graphics={
        Rectangle(
          extent={{-110,120},{114,92}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-108,118},{-84,110}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Orders"),
        Text(
          extent={{-106,106},{-80,98}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString=DynamicSelect("0",realString(orders__,1,0))),
        Text(
          extent={{-68,118},{-36,110}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Exemplars"),
        Text(
          extent={{-66,106},{-32,98}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString=DynamicSelect("0",realString(exemplars__,1,0))),
        Text(
          extent={{-18,118},{14,110}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Maculation"),
        Text(
          extent={{-16,106},{16,98}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString=DynamicSelect("0",realString(maculation__,1,0))),
        Text(
          extent={{36,118},{60,110}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Paper"),
        Text(
          extent={{38,106},{62,98}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString=DynamicSelect("0",realString(paper__,1,0))),
        Text(
          extent={{78,118},{106,110}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Duration"),
        Text(
          extent={{84,106},{108,98}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString=DynamicSelect("0",realString(duration__,1,0)))}), Icon(coordinateSystem(preserveAspectRatio=true,
          extent={{-125,-125},{125,125}})),
    experiment(StopTime=32000, Tolerance = 1e-6),
    __Dymola_experimentSetupOutput);
end Model;
