#!/bin/bash

pgs infer -i neogene-slow project.tab
pgs infer -i neogene-avg project.tab
pgs infer -i neogene-fast project.tab

pgs freq -i neogene-slow-infer-particles.tab -o got-neogene-slow.tab -kde 1000 project.tab 
pgs freq -i neogene-avg-infer-particles.tab -o got-neogene-avg.tab -kde 1000 project.tab
pgs freq -i neogene-fast-infer-particles.tab -o got-neogene-fast.tab -kde 1000 project.tab

pgs cmp -got got-neogene-slow.tab -want want-neogene-slow.tab -trees neogene-slow-trees.tab -o pix-neogene-slow.tab -plot nodes-neogene-slow.png project.tab
pgs cmp -got got-neogene-avg.tab -want want-neogene-avg.tab -trees neogene-avg-trees.tab -o pix-neogene-avg.tab -plot nodes-neogene-avg.png project.tab
pgs cmp -got got-neogene-fast.tab -want want-neogene-fast.tab -trees neogene-fast-trees.tab -o pix-neogene-fast.tab -plot nodes-neogene-fast.png project.tab

pgs infer -i paleogene-slow project.tab
pgs infer -i paleogene-avg project.tab
pgs infer -i paleogene-fast project.tab

pgs freq -i paleogene-slow-infer-particles.tab -o got-paleogene-slow.tab -kde 1000 project.tab
pgs freq -i paleogene-avg-infer-particles.tab -o got-paleogene-avg.tab -kde 1000 project.tab
pgs freq -i paleogene-fast-infer-particles.tab -o got-paleogene-fast.tab -kde 1000 project.tab 

pgs cmp -got got-paleogene-slow.tab -want want-paleogene-slow.tab -trees paleogene-slow-trees.tab -o pix-paleogene-slow.tab -plot nodes-paleogene-slow.png project.tab
pgs cmp -got got-paleogene-avg.tab -want want-paleogene-avg.tab -trees paleogene-avg-trees.tab -o pix-paleogene-avg.tab -plot nodes-paleogene-avg.png project.tab
pgs cmp -got got-paleogene-fast.tab -want want-paleogene-fast.tab -trees paleogene-fast-trees.tab -o pix-paleogene-fast.tab -plot nodes-paleogene-fast.png project.tab

pgs infer -i cretaceous-slow project.tab
pgs infer -i cretaceous-avg project.tab
pgs infer -i cretaceous-fast project.tab

pgs freq -i cretaceous-slow-infer-particles.tab -o got-cretaceous-slow.tab -kde 1000 project.tab
pgs freq -i cretaceous-avg-infer-particles.tab -o got-cretaceous-avg.tab -kde 1000 project.tab
pgs freq -i cretaceous-fast-infer-particles.tab -o got-cretaceous-fast.tab -kde 1000 project.tab 

pgs cmp -got got-cretaceous-slow.tab -want want-cretaceous-slow.tab -trees cretaceous-slow-trees.tab -o pix-cretaceous-slow.tab -plot nodes-cretaceous-slow.png project.tab
pgs cmp -got got-cretaceous-avg.tab -want want-cretaceous-avg.tab -trees cretaceous-avg-trees.tab -o pix-cretaceous-avg.tab -plot nodes-cretaceous-avg.png project.tab
pgs cmp -got got-cretaceous-fast.tab -want want-cretaceous-fast.tab -trees cretaceous-fast-trees.tab -o pix-cretaceous-fast.tab -plot nodes-cretaceous-fast.png project.tab

pgs infer -i jurassic-slow project.tab
pgs infer -i jurassic-avg project.tab
pgs infer -i jurassic-fast project.tab

pgs freq -i jurassic-slow-infer-particles.tab -o got-jurassic-slow.tab -kde 1000 project.tab
pgs freq -i jurassic-avg-infer-particles.tab -o got-jurassic-avg.tab -kde 1000 project.tab
pgs freq -i jurassic-fast-infer-particles.tab -o got-jurassic-fast.tab -kde 1000 project.tab 

pgs cmp -got got-jurassic-slow.tab -want want-jurassic-slow.tab -trees jurassic-slow-trees.tab -o pix-jurassic-slow.tab -plot nodes-jurassic-slow.png project.tab
pgs cmp -got got-jurassic-avg.tab -want want-jurassic-avg.tab -trees jurassic-avg-trees.tab -o pix-jurassic-avg.tab -plot nodes-jurassic-avg.png project.tab
pgs cmp -got got-jurassic-fast.tab -want want-jurassic-fast.tab -trees jurassic-fast-trees.tab -o pix-jurassic-fast.tab -plot nodes-jurassic-fast.png project.tab

pgs infer -i triassic-slow project.tab
pgs infer -i triassic-avg project.tab
pgs infer -i triassic-fast project.tab

pgs freq -i triassic-slow-infer-particles.tab -o got-triassic-slow.tab -kde 1000 project.tab
pgs freq -i triassic-avg-infer-particles.tab -o got-triassic-avg.tab -kde 1000 project.tab
pgs freq -i triassic-fast-infer-particles.tab -o got-triassic-fast.tab -kde 1000 project.tab 

pgs cmp -got got-triassic-slow.tab -want want-triassic-slow.tab -trees triassic-slow-trees.tab -o pix-triassic-slow.tab -plot nodes-triassic-slow.png project.tab
pgs cmp -got got-triassic-avg.tab -want want-triassic-avg.tab -trees triassic-avg-trees.tab -o pix-triassic-avg.tab -plot nodes-triassic-avg.png project.tab
pgs cmp -got got-triassic-fast.tab -want want-triassic-fast.tab -trees triassic-fast-trees.tab -o pix-triassic-fast.tab -plot nodes-triassic-fast.png project.tab

