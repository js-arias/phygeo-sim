#!/bin/bash

pgs infer -i neogene-slow project.tab
pgs infer -i neogene-avg project.tab
pgs infer -i neogene-fast project.tab

pgs freq -i neogene-slow-infer-particles.tab -o got-neogene-slow.tab -kde 1000 project.tab 
pgs freq -i neogene-avg-infer-particles.tab -o got-neogene-avg.tab -kde 1000 project.tab
pgs freq -i neogene-fast-infer-particles.tab -o got-neogene-fast.tab -kde 1000 project.tab

pgs unrot -i want-neogene-slow.tab project.tab
pgs unrot -i want-neogene-avg.tab project.tab
pgs unrot -i want-neogene-fast.tab project.tab

pgs cmp -got got-neogene-slow.tab -want unrot-want-neogene-slow.tab -trees neogene-slow-trees.tab -o pix-unrot-neogene-slow.tab -plot nodes-unrot-neogene-slow.png project.tab
pgs cmp -got got-neogene-avg.tab -want unrot-want-neogene-avg.tab -trees neogene-avg-trees.tab -o pix-unrot-neogene-avg.tab -plot nodes-unrot-neogene-avg.png project.tab
pgs cmp -got got-neogene-fast.tab -want unrot-want-neogene-fast.tab -trees neogene-fast-trees.tab -o pix-unrot-neogene-fast.tab -plot nodes-unrot-neogene-fast.png project.tab

pgs infer -i paleogene-slow project.tab
pgs infer -i paleogene-avg project.tab
pgs infer -i paleogene-fast project.tab

pgs freq -i paleogene-slow-infer-particles.tab -o got-paleogene-slow.tab -kde 1000 project.tab
pgs freq -i paleogene-avg-infer-particles.tab -o got-paleogene-avg.tab -kde 1000 project.tab
pgs freq -i paleogene-fast-infer-particles.tab -o got-paleogene-fast.tab -kde 1000 project.tab 

pgs unrot -i want-paleogene-slow.tab project.tab
pgs unrot -i want-paleogene-avg.tab project.tab
pgs unrot -i want-paleogene-fast.tab project.tab

pgs cmp -got got-paleogene-slow.tab -want unrot-want-paleogene-slow.tab -trees paleogene-slow-trees.tab -o pix-unrot-paleogene-slow.tab -plot nodes-unrot-paleogene-slow.png project.tab
pgs cmp -got got-paleogene-avg.tab -want unrot-want-paleogene-avg.tab -trees paleogene-avg-trees.tab -o pix-unrot-paleogene-avg.tab -plot nodes-unrot-paleogene-avg.png project.tab
pgs cmp -got got-paleogene-fast.tab -want unrot-want-paleogene-fast.tab -trees paleogene-fast-trees.tab -o pix-unrot-paleogene-fast.tab -plot nodes-unrot-paleogene-fast.png project.tab

pgs infer -i cretaceous-slow project.tab
pgs infer -i cretaceous-avg project.tab
pgs infer -i cretaceous-fast project.tab

pgs freq -i cretaceous-slow-infer-particles.tab -o got-cretaceous-slow.tab -kde 1000 project.tab
pgs freq -i cretaceous-avg-infer-particles.tab -o got-cretaceous-avg.tab -kde 1000 project.tab
pgs freq -i cretaceous-fast-infer-particles.tab -o got-cretaceous-fast.tab -kde 1000 project.tab 

pgs unrot -i want-cretaceous-slow.tab project.tab
pgs unrot -i want-cretaceous-avg.tab project.tab
pgs unrot -i want-cretaceous-fast.tab project.tab

pgs cmp -got got-cretaceous-slow.tab -want unrot-want-cretaceous-slow.tab -trees cretaceous-slow-trees.tab -o pix-unrot-cretaceous-slow.tab -plot nodes-unrot-cretaceous-slow.png project.tab
pgs cmp -got got-cretaceous-avg.tab -want unrot-want-cretaceous-avg.tab -trees cretaceous-avg-trees.tab -o pix-unrot-cretaceous-avg.tab -plot nodes-unrot-cretaceous-avg.png project.tab
pgs cmp -got got-cretaceous-fast.tab -want unrot-want-cretaceous-fast.tab -trees cretaceous-fast-trees.tab -o pix-unrot-cretaceous-fast.tab -plot nodes-unrot-cretaceous-fast.png project.tab

pgs infer -i jurassic-slow project.tab
pgs infer -i jurassic-avg project.tab
pgs infer -i jurassic-fast project.tab

pgs freq -i jurassic-slow-infer-particles.tab -o got-jurassic-slow.tab -kde 1000 project.tab
pgs freq -i jurassic-avg-infer-particles.tab -o got-jurassic-avg.tab -kde 1000 project.tab
pgs freq -i jurassic-fast-infer-particles.tab -o got-jurassic-fast.tab -kde 1000 project.tab 

pgs unrot -i want-jurassic-slow.tab project.tab
pgs unrot -i want-jurassic-avg.tab project.tab
pgs unrot -i want-jurassic-fast.tab project.tab

pgs cmp -got got-jurassic-slow.tab -want unrot-want-jurassic-slow.tab -trees jurassic-slow-trees.tab -o pix-unrot-jurassic-slow.tab -plot nodes-unrot-jurassic-slow.png project.tab
pgs cmp -got got-jurassic-avg.tab -want unrot-want-jurassic-avg.tab -trees jurassic-avg-trees.tab -o pix-unrot-jurassic-avg.tab -plot nodes-unrot-jurassic-avg.png project.tab
pgs cmp -got got-jurassic-fast.tab -want unrot-want-jurassic-fast.tab -trees jurassic-fast-trees.tab -o pix-unrot-jurassic-fast.tab -plot nodes-unrot-jurassic-fast.png project.tab

pgs infer -i triassic-slow project.tab
pgs infer -i triassic-avg project.tab
pgs infer -i triassic-fast project.tab

pgs freq -i triassic-slow-infer-particles.tab -o got-triassic-slow.tab -kde 1000 project.tab
pgs freq -i triassic-avg-infer-particles.tab -o got-triassic-avg.tab -kde 1000 project.tab
pgs freq -i triassic-fast-infer-particles.tab -o got-triassic-fast.tab -kde 1000 project.tab 

pgs unrot -i want-triassic-slow.tab project.tab
pgs unrot -i want-triassic-avg.tab project.tab
pgs unrot -i want-triassic-fast.tab project.tab

pgs cmp -got got-triassic-slow.tab -want unrot-want-triassic-slow.tab -trees triassic-slow-trees.tab -o pix-unrot-triassic-slow.tab -plot nodes-unrot-triassic-slow.png project.tab
pgs cmp -got got-triassic-avg.tab -want unrot-want-triassic-avg.tab -trees triassic-avg-trees.tab -o pix-unrot-triassic-avg.tab -plot nodes-unrot-triassic-avg.png project.tab
pgs cmp -got got-triassic-fast.tab -want unrot-want-triassic-fast.tab -trees triassic-fast-trees.tab -o pix-unrot-triassic-fast.tab -plot nodes-unrot-triassic-fast.png project.tab
