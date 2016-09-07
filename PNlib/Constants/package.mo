within PNlib;
package Constants "contains constants which are used in the Petri net component models"
  constant Real inf = 3.40282e+038
  "Biggest Real number such that inf and -inf are representable on the machine";
  constant Integer Integer_inf = 1073741823
  "Biggest Integer number such that Integer_inf and -Integer_inf are representable on the machine";
  constant Real eps=1.e-15 "Biggest number such that 1.0 + eps = 1.0";
  constant Real almost_eps=1.e-9;
end Constants;
