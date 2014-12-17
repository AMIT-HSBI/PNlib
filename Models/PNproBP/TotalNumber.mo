within PNlib.Models.PNproBP;
model TotalNumber
  Integer total;
  Modelica.Blocks.Interfaces.IntegerInput u annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,0})));

algorithm
  when u>pre(u) then
    total:=total + (u - pre(u));
  end when;
  annotation (Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.05),
                   graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={170,255,213},
          fillPattern=FillPattern.Solid), Text(
          textString=DynamicSelect(" ",realString(total,0,0)),
          extent={{2,12},{2,-4}},
          lineColor={0,0,0},
          fillColor={170,255,213},
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.05)));
end TotalNumber;
