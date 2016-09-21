within PNlib;
model RevisionHistory
extends Modelica.Icons.ReleaseNotes;
annotation(Documentation(
info="<html>
<h1>ReleaseNotes</h1>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
    <tr>
      <th>Version</th>
      <th>Date</th>
      <th>Author</th>
      <th>Comment</th>
    </tr>
    <tr>
      <td valign=\"top\">1.0</td>
      <td valign=\"top\">2012-05-15</td>
      <td valign=\"top\">S. Proß</td>
      <td valign=\"top\">Initial release.</td>
    </tr>
    <tr>
      <td valign=\"top\">1.1</td>
      <td valign=\"top\">2015-01-13</td>
      <td valign=\"top\">Lennart Ochel</td>
      <td valign=\"top\"><ul>
        <li>This is basically an adaptation of PNlib version 1.0 to Modelica 3.3 to remove tool dependencies (e.g. impure instead of __Dymola_pure annotation).</li>
        <li>New function PNlib.Functions.Random.initRandom is introduced to make stochastic simulations reproducible.</li>
      </ul></td>
    </tr>
    <tr>
      <td valign=\"top\">1.2</td>
      <td valign=\"top\">2015-10-19</td>
      <td valign=\"top\">Lennart Ochel</td>
      <td valign=\"top\"><ul>
        <li>Added support for 64-bit systems</li>
        <li>Revised some internal algorithm to archive less complex equation system structure</li>
        <li>Minor bug fixes</li>
      </ul></td>
    </tr>
</table>
</html>"));
end RevisionHistory;
