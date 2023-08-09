within PNlib.Functions.Random;

function randomtriangular "generates a triangular distributed random number according to a, b and c"
  input Real a "Lower limit";
  input Real b "Upper limit";
  input Real c "Most likely value";
  input Real r128 "A random number with a uniform distribution on the interval (0,1]";
  output Real delay;
protected
  Real r128_ = r128;
  Real help;
algorithm
  if r128_ < 10^(-10) then
    r128_ := 10^(-10);
  end if;
  help := (c - a)/(b - a);
  if r128_ <= help then
    delay := sqrt(r128_*(b - a)*(c - a)) + a;
  else
    delay := b - sqrt((1 - r128_)*(b - a)*(b - c));
  end if;
end randomtriangular;
