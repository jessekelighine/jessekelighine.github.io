#!/bin/bash

find mcmc_density -name "mcmc_density*pdf" | sort -V | xargs pdfjoin "mcmc_density/mcmc_density.pdf"
ln -sF "mcmc_density/mcmc_density.pdf" "mcmc_density.pdf"
find mcmc_density -name "mcmc_density-*pdf" | xargs rm
