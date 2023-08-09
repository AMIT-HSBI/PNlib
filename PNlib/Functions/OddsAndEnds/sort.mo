within PNlib.Functions.OddsAndEnds;

function sort "Sort elements of vector in ascending or descending order"
  extends Modelica.Icons.Function;
  input Real v[:] "Vector to be sorted";
  input Boolean ascending = true "= true if ascending order, otherwise descending order";
  output Real sorted_v[size(v, 1)] = v "Sorted vector";
  output Integer indices[size(v, 1)] = 1:size(v, 1) "sorted_v = v[indices]";
  /* shellsort algorithm; should be improved later */
protected
  Integer gap;
  Integer i;
  Integer j;
  Real wv;
  Integer wi;
  Integer nv = size(v, 1);
  Boolean swap;
algorithm
  gap := div(nv, 2);
  while gap > 0 loop
    i := gap;
    while i < nv loop
      j := i - gap;
      if j >= 0 then
        if ascending then
          swap := sorted_v[j + 1] > sorted_v[j + gap + 1];
        else
          swap := sorted_v[j + 1] < sorted_v[j + gap + 1];
        end if;
      else
        swap := false;
      end if;
      while swap loop
        wv := sorted_v[j + 1];
        wi := indices[j + 1];
        sorted_v[j + 1] := sorted_v[j + gap + 1];
        sorted_v[j + gap + 1] := wv;
        indices[j + 1] := indices[j + gap + 1];
        indices[j + gap + 1] := wi;
        j := j - gap;
        if j >= 0 then
          if ascending then
            swap := sorted_v[j + 1] > sorted_v[j + gap + 1];
          else
            swap := sorted_v[j + 1] < sorted_v[j + gap + 1];
          end if;
        else
          swap := false;
        end if;
      end while;
      i := i + 1;
    end while;
    gap := div(gap, 2);
  end while;
  annotation(
    Documentation(info = "<HTML>
<h4>Syntax</h4>
<blockquote><pre>
           sorted_v = Vectors.<b>sort</b>(v);
(sorted_v, indices) = Vectors.<b>sort</b>(v, ascending=true);
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>sort</b>(..) sorts a Real vector v
in ascending order and returns the result in sorted_v.
If the optional argument \"ascending\" is <b>false</b>, the vector
is sorted in descending order. In the optional second
output argument the indices of the sorted vector with respect
to the original vector are given, such that sorted_v = v[indices].
</p>
<h4>Example</h4>
<blockquote><pre>
  (v2, i2) := Vectors.sort({-1, 8, 3, 6, 2});
       -> v2 = {-1, 2, 3, 6, 8}
          i2 = {1, 5, 3, 4, 2}
</pre></blockquote>
</HTML>"));
end sort;
