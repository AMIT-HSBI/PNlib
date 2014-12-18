within PNlib.Functions.Random;
impure function randomexp
  "generates a exponential distributed random number according to lambda"
  input Real lambda;
  output Real delay;
protected
  Real zg;
  Real h_lambda;
algorithm
  zg := 0;
  h_lambda := lambda;
  while zg / 32767 < 10 ^ (-10) loop
    zg := random();
  end while;
  if lambda <= 0 then
    h_lambda := 10 ^ (-10);
  end if;
  delay := -Modelica.Math.log(zg / 32767) * 1 / h_lambda;
end randomexp;
