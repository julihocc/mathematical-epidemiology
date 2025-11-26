= The SIR Model

The SIR model is one of the simplest compartmental models, and many models are derivatives of this basic form. The model consists of three compartments:

- **S**: The number of **susceptible** individuals. When a susceptible and an infectious individual come into "infectious contact", the susceptible individual contracts the disease and transitions to the infectious compartment.
- **I**: The number of **infectious** individuals. These are individuals who have been infected and are capable of infecting susceptible individuals.
- **R**: The number of **removed** (and immune) or deceased individuals. These are individuals who have been infected and have either recovered from the disease and entered the removed compartment, or died. It is assumed that the number of deaths is negligible with respect to the total population. This compartment may also be called "recovered" or "resistant".

== The Differential Equations

The model is defined by the following system of ordinary differential equations:

$
  frac(d S, d t) & = - beta S I \
  frac(d I, d t) & = beta S I - gamma I \
  frac(d R, d t) & = gamma I
$

where $beta$ is the transmission rate and $gamma$ is the recovery rate.

== Phase Plane Analysis

We can analyze the dynamics of the epidemic by looking at the relationship between $I$ and $S$ directly, eliminating time $t$. By dividing the equation for $d I / d t$ by the equation for $d S / d t$, we get:

$
  frac(d I, d S) = frac(beta S I - gamma I, - beta S I) = -1 + frac(gamma, beta S) = -1 + frac(1, R_0) frac(N, S)
$

Integrating this equation with respect to $S$, we obtain the phase plane trajectory:

$
  I(S) = -S + frac(N, R_0) ln S + C
$

where $C$ is a constant determined by the initial conditions $S(0)$ and $I(0)$.

=== Epidemic Peak

The maximum number of infected individuals occurs when $d I / d t = 0$, which implies $S = gamma / beta = N / R_0$. This threshold is known as the herd immunity threshold. If the initial susceptible population is greater than this value, the epidemic will grow; otherwise, it will decline immediately.

== Final Size of the Epidemic

The total number of individuals infected during the epidemic can be found by analyzing the limit as $t -> infinity$. Since $I(infinity) = 0$, the final state is determined by $S(infinity)$.

Dividing the equation for $d S / d t$ by $d R / d t$:

$
  frac(d S, d R) = - frac(beta S I, gamma I) = - R_0 frac(S, N)
$

Integrating gives:

$
  ln S = - frac(R_0, N) R + C'
$

Using $S(0) approx N$ and $R(0) = 0$, we find:

$
  S(infinity) = N e^(- R_0 (R(infinity)) / N)
$

Since $R(infinity) = N - S(infinity)$ (assuming $I(infinity)=0$), we get the transcendental equation for the final size:

$
  ln(frac(S_0, S_infinity)) = R_0 (1 - frac(S_infinity, N))
$

== Computational Approach

We can simulate the SIR model using the Julia programming language and the `DifferentialEquations.jl` package.

```julia
using DifferentialEquations
using Plots

function sir_model!(du, u, p, t)
    S, I, R = u
    beta, gamma = p
    N = S + I + R

    du[1] = -beta * S * I / N
    du[2] = beta * S * I / N - gamma * I
    du[3] = gamma * I
end
```

The full script is available in `scripts/sir_model.jl`.

== Python Implementation

We can also simulate the SIR model using Python with `scipy` and `matplotlib`.

```python
import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

def sir_model(u, t, beta, gamma):
    S, I, R = u
    N = S + I + R

    dSdt = -beta * S * I / N
    dIdt = beta * S * I / N - gamma * I
    dRdt = gamma * I

    return [dSdt, dIdt, dRdt]
```

The full script is available in `scripts/sir_model.py`.

