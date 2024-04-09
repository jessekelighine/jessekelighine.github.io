---
title: "Fisher Information"
author: "[`jessekelighine.com`](https://jessekelighine.com)"
date:   "2024-04-08"
header-includes:
	<link rel="icon" href="../resources/sheep_color.png">
---

$$
\DeclareMathOperator{\E}{\text{\textrm{\textbf{E}}}}
\DeclareMathOperator{\var}{\text{\textrm{\textbf{Var}}}}
\newcommand{\given}[1][]{\,#1|\,}
\newcommand{\iidto}{\overset{\text{\scriptsize iid}}{\sim}}
\newcommand{\dto}{\overset{d}{\longrightarrow}}
\newcommand{\pto}{\overset{p}{\longrightarrow}}
\newcommand{\symbT}{\top}
\newcommand{\T}{^{\symbT}}
\newcommand{\inv}{^{-1}}
\newcommand{\invT}{^{-\symbT}}
$$

**Fisher Information** is defined as follows:
$$
\mathcal{I}_{\theta}
\coloneqq
\E
\left[
\left(
\frac{\partial}{\partial\theta}\log f(x\given\theta)
\right)
\left(
\frac{\partial}{\partial\theta}\log f(x\given\theta)
\right)\T
\given[\middle]
\theta
\right]
$$
where $f(\cdot\given\theta)$ is the likelihood function of the random variable $x$ with parameter $\theta$.
The expectation is taken with respect to the random variable $x$.

In this note,
we talk about what Fisher Information is,
its relation to *maximum likelihood*,
its conflicting intuitions,
and *Cramér-Rao bound*, an inequality closely related to Fisher Information. [^introduction]

[^introduction]: I this note, I shall assume the knowledge of maximum likelihood estimation and linear algebra.

# What are we trying to do?

The goal is simple:
we want to have a way of measuring "how informative a parameter is to the likelihood function."
If a certain parameter is very important in shaping the likelihood function,
we expect our estimate of it to be more "precise."
In contrast, if a parameter does not change the shape of the likelihood much,
then we would expect the estimate of such parameter "poor,"
since likelihood functions under different true parameters look the same to us.

We will later see that **Fisher Information** achieves precisely this purpose
in the context of maximum likelihood estimation.

# Variance of Score Function

Let's first define some notation.
Let $\ell(x\given\theta)\coloneqq\log f(x\given\theta)$ be the log-likelihood function.
We use Newton's notation to denote differentiation with respect to the parameter,
that is,
$$ 
\dot\ell(x\given\theta)
\coloneqq \frac{\partial}{\partial\theta} \ell(x\given\theta)
= \frac{\partial}{\partial\theta} \log f(x\given\theta).
$$
Notice that $\dot\ell(x\given\theta)$ has mean zero:
$$
\begin{aligned}
\E\dot\ell(x\given\theta)
&= \int_{\mathcal{X}} \left[ \frac{\partial}{\partial\theta} \log f(x\given\theta) \right] f(x\given\theta) dx \\
&= \int_{\mathcal{X}} \dot f(x\given\theta) dx 
= \frac{\partial}{\partial\theta} \int_{\mathcal{X}} f(x\given\theta) dx = 0.
\end{aligned}
$$ 
Thus, we have $\var\dot\ell(x\given\theta) = \E\dot\ell(x\given\theta)\dot\ell(x\given\theta)\T$, [^leibniz]
which is the definition of **Fisher Information**.
This observation gives us the first intuition of Fisher Information:

> **Intuition 1**:
> Large Fisher Information means large variance in the score function $\dot\ell(x\given\theta)$. [^large-information]
> And a large variation in the score function means that our maximum likelihood estimate,
> which solves the problem $$\arg\max_{\theta\in\Theta}\ell(x\given\theta)$$
> via first order condition $$\dot\ell(x\given\theta)=0,$$
> also has a large variance.
> This means that a large Fisher Information is *bad*.

[^leibniz]: We shall assume that Leibniz rule of differentiation is always satisfied for interchanging integration and differentiation.
[^large-information]:
	A large covariance matrix means the variance is large along every direction.
	Click [here](https://jessekelighine.com/covariance-matrix) to see an intuitive explanation.

# Information Equality

Before jumping to conclusion,
let's consider $\E\ddot\ell(x\given\theta_0)$,
the expected Hessian matrix of the log-likelihood function.
It turns out $\E\ddot\ell(x\given\theta_0)$ and $\var\dot\ell(x\given\theta_0)$ only differ by a negative sign:
$$
\begin{aligned}
\E\ddot\ell(x\given\theta)
&= \int_{\mathcal{X}} \left[ \frac{\partial^2}{\partial\theta\partial\theta\T} \log f(x\given\theta) \right] f(x\given\theta) dx \\
&= \int_{\mathcal{X}} \left[ \frac{\ddot f(x\given\theta)}{f(x\given\theta)} - \frac{\dot f(x\given\theta)\dot f(x\given\theta)\T}{f(x\given\theta)^2} \right] f(x\given\theta) dx \\
&= \underbrace{\frac{\partial^2}{\partial\theta^2} \int_{\mathcal{X}} f(x\given\theta) dx}_{=0} - \int_{\mathcal{X}} \dot\ell(x\given\theta)\dot\ell(x\given\theta)\T f(x\given\theta) dx
= -\var\dot\ell(x\given\theta)
\end{aligned}
$$
This result is sometimes referred to as *information equality*.
The equality states that the asymptotic variance of $\hat\theta$ is simply the negative of the Hessian of the log-likelihood function.

However, this means that we can also defined **Fisher Information** as $-\E\ddot\ell(x\given\theta)$,
which yields another intuition:

> **Intuition 2**:
> A large Fisher information is actually *good*,
> since it is the Hessian matrix of the log-likelihood function.
> A larger Hessian implies a larger curvature,
> meaning that the log-likelihood function is more "defined" or "pointy" for our parameter,
> which naturally leads to a better estimation.

This is in direct conflict with **Intuition 1**,
how do we resolve this?

# Maximum Likelihood

Let's be precise.
Suppose we have the data set $\{x_{i}\}_{i=1}^{n}\iidto f(\cdot\given\theta_0)$.
Then we denote the joint log-likelihood as
$$
\ell(\{x_i\}\given\theta) \coloneqq \sum_{i=1}^{n} \ell(x_i\given\theta).
$$
We want to derive the asymptotic distribution of the maximum likelihood estimator $\hat\theta$ as $n\to\infty$.
By mean value theorem, we have
$$
\underbrace{\dot\ell(\{x_i\}\given\hat\theta)}_{=0} - \dot\ell(\{x_i\}\given\theta_{0}) = \ddot\ell(\{x_i\}\given\bar\theta) (\hat\theta - \theta_0)
$$
where $\bar\theta$ is a value between $\theta_0$ and $\hat\theta$.
Supposing we already have the consistency result $\hat\theta\pto\theta_0$,
we have
$$
\begin{aligned}
\sqrt{n} ( \hat\theta - \theta_0 )
&= - \left[ \frac{ \ddot\ell(\{x_i\}\given\bar\theta) }{ n } \right]\inv \left( \frac{ \dot\ell(\{x_i\}\given\theta_{0}) }{ \sqrt{n} } \right) \\
&\dto - \E\left[\ddot\ell(x\given\theta_0)\right]\inv \mathcal{N}(0,\var\dot\ell(x\given\theta_0)).
\end{aligned}
$$
Now we know the asymptotic distribution of $\sqrt{n}(\hat\theta-\theta_0)$ is a normal distribution centered at $0$ with variance
$\E[\ddot\ell(x\given\theta_0)]\inv\var\dot\ell(x\given\theta_0)\E[\ddot\ell(x\given\theta_0)]\inv$.

Notice this this result confirms with both of our intuitions:
we have $\var\dot\ell(x\given\theta)$ in the nominator (in concord with **Intuition 1**),
and $\E\ddot\ell(x\given\theta_0)$ in the denominator (in concord with **Intuition 2**).
Hence, it is a trade-off between these two effects we found in the two intuitions.
And by *information equality*, we obtain the famous maximum likelihood result:
$$
\sqrt{n} ( \hat\theta - \theta_0 ) \dto \mathcal{N}(0,\mathcal{I}_{\theta}\inv).
$$
Therefore, a **"larger"** Fisher Information is what we really want.
This does not mean that **Intuition 2** is correct and **Intuition 1** is wrong,
it is a result of both intuitions combined.

Note that the maximum likelihood result achieves what we set out to do in the first place.
We now know that the estimation quality of $\hat\theta$ depends on the size of $\mathcal{I}_{\theta}$:
the larger $\mathcal{I}_{\theta}$ is, the more precise the estimation,
i.e., under the same number of samples $n$, a larger $\mathcal{I}_{\theta}$ yields a more precise result. [^precision]

[^precision]:
	In some contexts (mostly in Bayesian statistics),
	the inverse of a covariance matrix is called the *precision matrix*.
	Thus, we can view Fisher Information as the precision matrix of the asymptotic distribution.
	I find this name particularly fitting in this context.

# Cramér-Rao Bound

Now we know that Fisher Information tells us the precision of our estimation,
but can we do better?
Can we be more precise?
The answer is **NO**, given that we want the estimation to be unbiased. [^unbiasedness-of-mle]
This result is called Cramér-Rao bound,
stating that any other unbiased estimation of $\theta_0$ must have variance larger than $\mathcal{I}_{\theta}\inv$.

[^unbiasedness-of-mle]:
	Maximum likelihood estimation is not always unbiased,
	but the order of the bias is small $O(1/n)$.

Suppose $\tilde\theta=t(\{x_i\})$ is an unbiased estimator for $\theta_0$,
it's straightforward via some algebra to see that
we have the covariance between $\dot\ell(\{x_i\}\given\theta)$ and $t(\{x_i\})-\theta$ as an identity matrix of dimension $k$:
$$
\begin{aligned}
\E [t(\{x_i\})-\theta] \dot\ell(\{x_i\}\given\theta)\T
= I_k,
\end{aligned}
$$
where $k$ is the length of $\theta_0$.

A slight variation of Cauchy-Schwarz inequality states that
for random vectors $v$ and $u$ both with mean $0$, we have that
$\E(vv\T) - \E(vu\T)\E(uu\T)\inv\E(uv\T)$
is positive definite. [^cauchy-scharz]
If we plugin $v=t(\{x_i\})-\theta$ and $u=\dot\ell(\{x_i\}\given\theta)$,
we have
$$
\var t(\{x_i\}) - (n\mathcal{I}_{\theta})\inv
$$
is positive definite.
Therefore, $\var{t(\{x_i\})}$ is larger than $(n\mathcal{I}_{\theta})\inv$. [^positive-definite]

What does it mean to be compared to $(n\mathcal{I}_\theta)\inv$?
When $n$ is sufficiently large, we have the approximation
$$
\hat\theta - \theta_0 \overset{A}{\sim} \mathcal{N}(0,(n\mathcal{I}_\theta)\inv)
$$
Hence, we can see that the variance of our maximum likelihood estimator is approximately $(n\mathcal{I}_{\theta})\inv$,
which beats every other unbiased estimator.

In a nutshell:

> 1. **Maximum likelihood** is the best method
>    in the sense that it produces the most precise estimator.
> 2. **Fisher Information** is a reasonable definition of "information,"
>    as it describes the best "precision" under all unbiased estimators of $\theta$.

[^cauchy-scharz]:
	Note $\E(v+Au)(v+Au)\T$ is positive definite.
	Let $A=-\E{vu\T}(\E{uu\T})\inv$ and we obtain the desired result.

[^positive-definite]:
	If you are not sure what does positive definiteness have to do with the concept of "larger" (i.e., concept of size),
	Click [here](https://jessekelighine.com/covariance-matrix) to see an intuitive explanation.
