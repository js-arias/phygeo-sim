# Simulations with `PhyGeo`

This repository contains the data and instructions
to make some simulations to test the behavior
of the method implemented in [PhyGeo](https://github.com/js-arias/phygeo).

There are only the input files,
as well as the final results,
as the intermediate files are too large for this repository.

## Geographic data

The geographic data model is an equal area pixelation of the Earth,
with 120 pixels in the equatorial ring.

### Paleogeographic models

Three different models were used for the simulations
and inferences.
The first is a homogeneous sphere
without any geographic features,
which was used without time stages
and with time stages every 5 million years.
The second is a model with the current geographic landscape
and time stages every 5 million years,
but without any change in the landscape.
The third is a full paleogeographic model,
using the plate motion model from Müller et al. (2022)
and the paleolandscape model of Cao et al. (2017)
for the time stages between 0-400 Ma
and from 405 to 540 from the PaleoMap model.
The model has time stages every 5 million years.

- `no-landscape/nomotion-motion-120.tab`:
  Motion model for the homogeneous sphere
  (no motion).
- `no-landscape/nomotion-landscape-120.tab`:
  Landscape model for the homogeneous sphere
  (two pixel types,
  both used with the same prior).

### Landscape priors

For the homogeneous sphere model,
the pixel priors are all identical.

Key | Prior | Environment
--- | ----- | -----------
  1 | 1.000 | ocean
  3 | 1.000 | land

- `no-landscape/model-pix-prior.tab`:
  This file contains the definition of the pixel priors
  used in the analysis without landscape.

### Projects

In each directory,
a project is defined with the plate motion model
and the landscape model
used for the respective experiment.
The projects are called `project.tab`.

## Experiments

### Homogeneous sphere

In the experiments using the homogeneous sphere models,
the objective is to test the inference of the $\lambda$ parameter.
The first experiment is stored in the directory `no-landscape`.
The file `terms50-100.sh`
contains the bash script to run all the simulations
and the inference.

In the directory `no-landscape/strat`,
the simulations used in the homogeneous sphere are used,
but this time the inference was made
with a time-stratified model
(but not movement).
The objective is to test if the results
are modified by the use of an inference with time stratification
(that is,
by including internodes along the branches
that cross each time stage).

## References

References are also available as BiBTeX in the file `biblio.bib`.

Cao, W. et al.
(2017)
Improving global paleogeography since the late Paleozoic using paleobiology.
Biogeosciences, 14, 5425-5439.
DOI: [10.5194/bg-14-5425-2017](https://doi.org/10.5194/bg-14-5425-2017).

Müller, R. D. et al.
(2022)
A tectonic-rules-based mantle reference frame since 1 billion years ago – implications for supercontinent cycles and plate–mantle system evolution.
Solid Earth, 12, 1127-1159.
DOI: [10.5194/se-13-1127-2022](https://doi.org/10.5194/se-13-1127-2022).

Scotese, C.S., Wrigth, N.
(2018)
PALEOMAP Paleodigital elevation models (PaleoDEMs) for Phanerozoic.
URL: <https://www.earthbyte.org/paleodem-resource-scotese-and-wright-2018/>.
