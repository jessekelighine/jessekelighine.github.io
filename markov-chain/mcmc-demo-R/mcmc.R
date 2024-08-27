#!/usr/bin/env Rscript

###############################################################################
# -*- encoding: UTF-8 -*-                                                     #
# Author: Jesse C. Chen (jessekelighine.com)                                  #
# Description: MCMC                                                           #
#                                                                             #
# Last Modified: 2024-07-23                                                   #
###############################################################################
options(scipen=999999)
options(tidyverse.quiet=TRUE)
library(conflicted)
library(tidyverse)
###############################################################################

### Functions #################################################################

dtriangle <- function(x) {
  case_when(
    x < 0 ~ 0,
    x > 1 ~ 0,
    x >= 0.5 ~ 4 - 4 * x,
    .default = 4 * x
  )
}

dtriangle2 <- function(x) {
  case_when(
    x < 0.00 ~ 0,
    x < 0.25 ~ 8 * x,
    x < 0.50 ~ 4 - 8 * x,
    x < 0.75 ~ -4 + 8 * x,
    x < 1.00 ~ 8 - 8 * x,
    .default = 0
  )
}

# Run MCMC
mcmc <- function(target_density, trials = 1e3) {
  state <- 0.2
  output_chain <- c(state)
  for (trial in 1:trials) {
    proposal <- runif(1)
    metropolis_ratio <- log(target_density(proposal)) - log(target_density(state))
    if (log(runif(1)) < metropolis_ratio) state <- proposal
    output_chain <- c(output_chain, state)
  }
  return(output_chain)
}

# Compare the MCMC stationary distribution to the theoretical density.
plot_density <- function(chain, target_density) {
  plot <- as_tibble(chain) |>
    ggplot() +
    aes(x = chain) +
    geom_density() +
    geom_function(fun = target_density, linetype = "dashed") +
    xlim(0, 1) +
    ylim(0, 2.2) +
    ylab("density") +
    labs(title = paste0("MCMC Stationary Distribution: ", length(chain), " samples"))
  return(plot)
}

### Main ######################################################################

TARGET_DENSITY <- function(x) dbeta(x, 1.5, 3)
TARGET_DENSITY <- function(x) dnorm(x, 0.5, 0.1)
TARGET_DENSITY <- dtriangle2
TARGET_DENSITY <- dtriangle

ggplot() + geom_function(fun = TARGET_DENSITY)

data <- mcmc(target_density = TARGET_DENSITY, trials = 1e4)

output_seq <- c(
  seq(1e0, 1e1, 1e0),
  seq(1e1, 1e2, 1e1),
  seq(1e2, 1e3, 1e3),
  seq(1e3, 1e4, 1e3),
  1e4
)

for (progress in output_seq) {
  plot <- head(data, n = progress) |> plot_density(target_density = TARGET_DENSITY)
  ggsave(
    filename = paste0("mcmc_density/mcmc_density-", progress, ".pdf"),
    plot = plot,
    width = 20,
    height = 10,
    unit = "cm"
  )
}

system("bash join.sh")
system("open mcmc_density.pdf")
