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

- `nomotion-motion-120.tab`:
  Motion model for the homogeneous sphere
  (no motion).
- `nomotion-landscape-120.tab`:
  Landscape model for the homogeneous sphere
  (two pixel types,
  both used with the same prior).
- `nomotion-motion-120-5.tab`:
  Motion model for the homogeneous sphere
  with time slices each 5 million years
  (no motion).
- `nomotion-landscape-120.tab`:
  Landscape model for the homogeneous sphere
  with time slices each 5 million years
  (two pixel types,
  both used with the same prior).
- `muller-motion-120-5.tab`:
  This file contains the pixelated version of the plate motion model,
  with e120 pixelation,
  and time slices for each 5 million years,
  from 600 Ma to present.
- `muller-landscape-cao-paleomap-120-5.tab`:
  This file contains the pixelated version of the paleolandscape model,
  with e120 pixelation,
  and time slices for each 5 million years,
  from 540 Ma to present.
- `cao-landscape-nomotion-120-5.tab`:
  This file contains the pixelated version of the paleolandscape model,
  with e120 pixelation,
  and time slices for each 5 million years,
  from 540 Ma to present,
  but with the present time stage in all time stages.

### Landscape priors

For the homogeneous sphere model,
the pixel priors are all identical.

Key | Prior | Environment
--- | ----- | -----------
  1 | 1.000 | ocean
  3 | 1.000 | land

The landscape model for the full model
and the model with the current landscape
use the following priors:

Key | Prior | Environment
--- | ----- | -----------
  1 | 0.001 | oceanic plateaus
  2 | 0.005 | continental shelf
  3 | 1.000 | lowlands
  4 | 1.000 | highlands
  5 | 0.001 | ice sheets

- `no-landscape/model-pix-prior.tab`:
  This file contains the definition of the pixel priors
  used in the analysis without landscape.

- `no-landscape/strat/model-pix-prior.tab`:
  This file contains the definition of the pixel priors
  used in the analysis without landscape.

- `muller-model/model-pix-prior.tab`:
  This file contains the definition of the pixel priors
  used in the analysis with a full landscape.

- `muller-model/no-motion/model-pix-prior.tab`:
  This file contains the definition of the pixel priors
  used in the analysis with the current landscape.

- `muller-model/no-landscape/model-pix-prior.tab`:
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

### Full paleogeographic model

In the experiments using the full paleogeographic models,
the objective is to test the inference of the $\lambda$ parameter
as well as the inference of the ancestral pixels.
The first experiment is in the directory `muller-model`,
and the file `terms50-100.sh` is the bash script
to run the full simulation and inference.

For the second experiment,
executed in the directory `muller-model/no-motion`
the same data generated in the simulation
with the full model is used,
but the inference model is a time stratified model
without any change in the current landscape.
As biogeographers using such a model
would argue that the inferred pixels
should be considered pixels in a particular location,
independent of the time stage,
the simulated pixels with the full model
are rotated to the current coordinates.
The file `terms50-100.sh`
is the bash script used for the inference.

For the third experiment,
the data produced with the full data model was used,
but the inference was made without any landscape
(and therefore,
without any motion).
This experiment is stored in the directory `muller-model/no-landscape`,
and the bash script is `terms50-100.sh`.

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
