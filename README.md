# PNlib

[![Test][test-badge]][test-link]

Free Modelica library for modelling xHPN.

## Library description

The advanced Petri Net library, called PNlib, enables the modeling of extended
hybrid Petri Nets (xHPN). It comprises

  * discrete (PD) and continuous places (PC),
  * discrete (TD), stochastic (TS), and continuous transitions (TC), and
  * test (TA), inhibitor (IA), and read arcs (RA).

![iconsxHPN][pnlib-img]

The main package PNlib is divided into the following sub-packages:

  * _Interfaces_: contains the connectors of the Petri net component models.
  * _Blocks_: contains blocks with specific procedures that are used in the Petri
    net component models.
  * _Functions_: contains functions with specific algorithmic procedures which
    are used in the Petri net component models.
  * _Constants_: contains constants which are used in the Petri net component
    models.
  * _Examples_: contains several examples and unit tests.

## Compatibility

  * Coverage with OpenModelica master and latest PNlib release:

    ![Pnlib omc-master](https://libraries.openmodelica.org/branches/history/master/PNlib.svg)

  * OpenModelica coverage reports:

      * Release: [Nightly coverage reports][coverage-link]
      * Master: [Latest commit][gh-pages-link]

  * Works in Dymola 2017/2019/2020

## License

This package is licensed with the [3-Clause BSD License][license-link].

## Development and contribution

```
Hochschule Bielefeld – University of Applied Sciences and Arts (HSBI)
Faculty of Engineering and Mathematics
```

  * Sabrina Proß
  * Lennart Ochel
  * Timo Lask
  * Bernhard Bachmann

You may report feedback, issues or feature-requests using
[GitHub Issues][issues].

[test-badge]: https://github.com/AMIT-HSBI/PNlib/actions/workflows/Test.yml/badge.svg
[test-link]: https://github.com/AMIT-HSBI/PNlib/actions/workflows/Test.yml
[pnlib-img]: PNlib/Resources/Images/iconsxHPN.png "xHPN: Extended Hybrid PetriNets"
[coverage-link]: http://libraries.openmodelica.org/branches/master/PNlib/PNlib.html
[license-link]: https://github.com/AMIT-HSBI/PNlib/blob/v3.0.0/LICENSE
[issues]: https://github.com/AMIT-HSBI/PNlib/issues
[gh-pages-link]: https://amit-hsbi.github.io/PNlib/stable/PNlib_master/PNlib_master.html
