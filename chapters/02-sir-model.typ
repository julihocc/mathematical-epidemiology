= The SIR Model

The SIR model is one of the simplest compartmental models, and many models are derivatives of this basic form. The model consists of three compartments:

- **S**: The number of **susceptible** individuals. When a susceptible and an infectious individual come into "infectious contact", the susceptible individual contracts the disease and transitions to the infectious compartment.
- **I**: The number of **infectious** individuals. These are individuals who have been infected and are capable of infecting susceptible individuals.
- **R**: The number of **removed** (and immune) or deceased individuals. These are individuals who have been infected and have either recovered from the disease and entered the removed compartment, or died. It is assumed that the number of deaths is negligible with respect to the total population. This compartment may also be called "recovered" or "resistant".

== The Differential Equations

The model is defined by the following system of ordinary differential equations:

$
frac(d S, d t) &= - beta S I \
frac(d I, d t) &= beta S I - gamma I \
frac(d R, d t) &= gamma I
$

where $beta$ is the transmission rate and $gamma$ is the recovery rate.

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

