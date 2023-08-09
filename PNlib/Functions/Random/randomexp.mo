within PNlib.Functions.Random;

function randomexp "generates a exponential distributed random number according to lambda"
  input Real lambda;
  input Real r128 "A random number with a uniform distribution on the interval (0,1]";
  output Real delay;
protected
  Real lambda_ = lambda;
  Real r128_ = r128;
algorithm
  if r128_ < 10^(-10) then
    r128_ := 10^(-10);
  end if;
  if lambda_ <= 0 then
    lambda_ := 10^(-10);
  end if;
  delay := -Modelica.Math.log(r128_)/lambda_;
end randomexp;
