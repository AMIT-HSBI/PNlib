within PNlib.Examples.Models.FiliP;

model AllgemeineParameter
  Real Stunde(displayUnit = "Stunde") = time/24;
  Real Tag(displayUnit = "Tag") = time;
  parameter Real BeginFruehschicht = 6;
  parameter Real BeginSpaetschicht = 12.3;
  parameter Real BeginNachtschicht = 20.25;
  parameter Real DauerFruehschicht = 8.2;
  parameter Real DauerSpaetschicht = 8.2;
  parameter Real DauerNachtschicht = 10;
end AllgemeineParameter;
