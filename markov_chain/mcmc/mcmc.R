#!/usr/bin/env Rscript

###############################################################################
# -*- encoding: UTF-8 -*-                                                     #
# Author: jessekelighine.com                                                  #
#                                                                             #
#                                                                             #
# Last Modified: 2022-Nov-30                                                  #
###############################################################################
library("ggplot2")
###############################################################################

rm(list=ls()); gc()
options(scipen=999999)
set.seed(1234)

### Functions #################################################################

# triangle distribution density function.
dtriangle <- ( function ( x ) {
  if ( x > 1 | x < 0 ) return(0)
  if ( x >= 0.5 ) return( 4 - 4 * x )
  return( 4 * x )
} ) |> Vectorize(vectorize.args="x")

# traingle distribution with two peaks
dtriangle2 <- ( function ( x ) {
  if ( x < 0.00 ) return( 0 )
  if ( x < 0.25 ) return( 8 * x )
  if ( x < 0.50 ) return( 4 - 8 * x )
  if ( x < 0.75 ) return( -4 + 8 * x )
  if ( x < 1.00 ) return( 8 - 8 * x )
  return(0)
} ) |> Vectorize(vectorize.args="x")

# run MCMC for with `trials` number of trials.
mcmc <- function ( trials, target.den=dtriangle ) {
  output <- c()
  x <- 0.2
  for ( trial in 1:trials ) {
    y <- runif(1)
    if ( runif(1) < min(c((target.den(y))/(target.den(x)),1)) ) { x <- y }
    output <- c(output,x)
  }
  return( output )
}

# compare the MCMC stationary distribution to the theoretical density.
plot.density <- function ( chain, target.den=dtriangle ) {
  plot <- as.data.frame(chain) |> ggplot() +
    aes(x=chain) +
    geom_density() +
    geom_function(fun=target.den,linetype="dashed") +
    xlim(0,1) +
    ylim(0,2.2) +
    ylab("density") +
    labs(title=paste0("MCMC Stationary Distribution: ",length(chain)," samples"))
  return( plot )
}

### Main ######################################################################

TARGET.DEN <- function ( x ) dbeta(x,1.5,3)
TARGET.DEN <- function ( x ) dnorm(x,0.5,0.1)
TARGET.DEN <- dtriangle2
TARGET.DEN <- dtriangle
ggplot() + geom_function(fun=TARGET.DEN)

data <- mcmc(1e4, target.den=TARGET.DEN)

output.seq <- c(seq(1e0,1e1,1e0),
                seq(1e1,1e2,1e1),
                seq(1e2,1e3,1e3),
                seq(1e3,1e4,1e3),
                1e4)

for ( progress in output.seq ) {
  plot <- plot.density(head(data,n=progress),target.den=TARGET.DEN)
  ggsave(paste0("mcmc_density/mcmc_density-",progress,".pdf"),
         plot=plot, width=20, height=10, unit="cm")
}
system("bash join.sh")
system("open mcmc_density.pdf")
