within PNlib.Examples.Models.PNproBP;
model Workload
  Real cap(start=0);
  parameter Integer max_tokens = 1;
  Modelica.Blocks.Interfaces.IntegerInput u annotation(Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,0})));
  Integer[3] color;
//protected
  Real help1;
  Real help2 = time - help1;
  Real help3 = (max_tokens - u) * help2;
  Integer i(start = 0);
algorithm
  when pre(u)==u and u <> max_tokens  then
    help1:=time;
    color:={255,0,0};
  elsewhen pre(u) <> max_tokens and pre(u) <> u then
    cap:= cap + help3;
    color:={128,255,0};
    i:= i+1;
  end when;

  annotation(Icon(coordinateSystem(
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
