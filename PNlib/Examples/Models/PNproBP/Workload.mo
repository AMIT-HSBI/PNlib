within PNlib.Examples.Models.PNproBP;
model Workload
  Real cap;
  Modelica.Blocks.Interfaces.IntegerInput u annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,0})));
  Integer[3] color;
protected
  Real help1;
algorithm
  when  u==0 then
    help1:=time;
    color:={255,0,0};
  elsewhen u>0 then
    cap:=cap + time - help1;
    color:={128,255,0};
  end when;

  annotation (Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.05),
                   graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor=DynamicSelect({128,255,0},color),
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.05)));
end Workload;
