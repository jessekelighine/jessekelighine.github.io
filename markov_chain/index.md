---
title:  "Markov Chain Monte Carlo"
author: "[`jessekelighine.com`](https://jessekelighine.com)"
header-includes:
	<link rel="icon" href="../resources/sheep_color.png">
---

> **Definition (Markov Property)**<br/>
>
> Let $S$ be a finite or countable set (state space).
> Let $\{X_{0},X_{1},...\}$ be a sequence of random variables whose ranges are in $S$.
> The sequence is said to satisfy the *Markov property* if
> $$
	\begin{aligned}
		\phantom{=}& \Pr\{X_{n+1}=j\mid X_0=i_{0},...,X_n=i_{n}\} \\
		\mathrel{=}& \Pr\{X_{n+1}=j\mid X_n=i_{n}\} \\
		\mathrel{=}& P_{ij} 
	\end{aligned}
  $$
> for all $i_{0},...,i_{n},j\in S$ and $n\in\mathbb{N}$.
> The probability $P_{ij}$ is called the *transition probability* from $i$ to $j$.
> The matrix $P$ whose $(i,j)$-entry equals $P_{ij}$ is called the *transition matrix*.

> **Definition (Markov Chain)**<br/>
>
> A dequence of random variables $\{X_{t}\}_{t=1}^{\infty}$ is a *Markov Chain* is it satisfies the *Markov property*.

```r
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
```
