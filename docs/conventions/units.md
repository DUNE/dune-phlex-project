# Units (CLHEP)

Status: proposed, not yet adopted. A full proposal by Brett Viren (BNL) and Gavin S. Davies (University of Mississippi) is going to the Phlex Adoption Working Group in September 2026, and this page will be replaced by that proposal once it is presented.

## The idea in brief

All Phlex-era DUNE code and configuration would use the CLHEP system of units, as Geant4, Gaudi and the Wire-Cell Toolkit already do. Every number that carries a unit is multiplied by a unit constant when it enters the code and divided by one when it leaves:

```cpp
double energy = 1*units::GeV;
```

```python
drift_speed = 1.6*units.mm/units.us
```

This removes ambiguity about what a stored number means, and it creates a "units firewall" between DUNE code and external packages, LArSoft first of all, that use other base units.

Phlex itself says nothing about units, so the convention has to come from DUNE. The proposed implementation is Brett Viren's three packages:

- [hep-units](https://github.com/brettviren/hep-units): the CLHEP system of units for C++, Python and Jsonnet;
- [boost-config](https://github.com/brettviren/boost-config): configuration loading;
- [hep-config](https://github.com/brettviren/hep-config): configuration that accepts unit strings such as `"100 * MeV"`, so JSON, YAML and FHiCL files can carry units too.

Last verified: 2026-09-22.
