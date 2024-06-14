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

## Simulation setup

All simulations are run using the same setup.
The simulations use the program `pgs`,
which is available as part of [PhyGeo](https://github.com/js-arias/phygeo).
The simulations are divided into five time periods
that correspond to geological periods:
the Neogene (23-0 Ma),
the Paleogene (66-23 Ma),
the Cretaceous (145-66 Ma),
the Jurassic (201-145 Ma),
and the Triassic (251-201 Ma).
At each time period,
the diffusion is divided into three groups:
slow ($\lambda$ between 100 and 1000),
average (10-100),
and slow (1-10).
For each combination of time period
and diffusion group,
50 trees were simulated.

For each simulated tree,
a random starting root is selected
for the specified time period,
and then a particle evolves in the tree
using a $\lambda$ value selected at random
from the diffusion group.
To produce the ancestral particles,
100 pixels are selected at random
using the spherical normal,
with a mean equal to the simulated particle
and a $\lambda$ of 100
(this value is used because it produces geographic points
that are similar to the observed ones).
The pixel locations are conditioned
by the pixel prior at the time period of the particle.
The simulation produces tree output files:
files with suffix `-lambda.tab`
store the simulated $\lambda$ values;
files with suffix `-particles.tab`
store the inferred particles;
and files with suffix `-trees.tab`
store the simulated trees.

The particle files are not stored
in this repository
as they are too large;
nevertheless,
the files used in the inference to test the results
are a process of these files,
which are prefixed as `want-`,
and contain the pixel frequencies
of the simulated pixels at each node.
In the particular case of the inference with the current landscape,
this frequency file was rotated to the present coordinates
and stored with the prefix `unrot-`.
To reduce their size,
the files are zipped in this repository.

The inference phase produces a file suffixed
`-infer-lambda.tab`
for the inferred $\lambda$ values
and a file suffixed `-infer-particles.tab`
for the inferred particles.
To process the particle files,
the particles are transformed into a continuous distribution
using a spherical normal KDE with a $\lambda$ of 1000
that produces files stored with the prefix `got-`.
These files,
the particle files and the KDE files
are too large for the repository.
Nevertheless,
the resulting files prefixed `pix-`,
which is a table with the total number
of correctly inferred pixels per node,
as well as a graph with the proportion of retrieved nodes
(prefixed `nodes-`),
are stored in this repository.

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
