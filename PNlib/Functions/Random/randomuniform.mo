within PNlib.Functions.Random;
function randomuniform "generates a uniform distribution random number according to a, b and c"
  input Real a "Lower limit";
  input Real b "Upper limit";
  input Real r128 "A random number with a uniform distribution on the interval (0,1]";
  output Real timeValue;
protected
  Real r128_ = r128;
algorithm
  if r128_ < 10 ^ (-10) then
    r128_ := 10 ^ (-10);
  end if;
  timeValue:=(b-a)*r128_+a;
end randomuniform;
