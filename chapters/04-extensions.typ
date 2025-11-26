= Extensions to the SIR Model

The basic SIR model can be extended in many ways to account for more complex disease dynamics.

== The SIS Model

Some infections, for example, those from the common cold and influenza, do not confer any long-lasting immunity. Such infections do not have a recovered state and individuals become susceptible again after recovering from the infection.

The model equations are:

$
  frac(d S, d t) & = - frac(beta S I, N) + gamma I \
  frac(d I, d t) & = frac(beta S I, N) - gamma I
$

Since $S + I = N$ is constant, we can substitute $S = N - I$:

$
  frac(d I, d t) = (beta - gamma) I - frac(beta, N) I^2
$

This is a logistic equation. The disease-free equilibrium $I=0$ is unstable if $R_0 = beta/gamma > 1$, leading to an endemic equilibrium:

$
  I^* = N (1 - frac(1, R_0))
$

== The SEIR Model

For many important infections, there is a significant incubation period during which the individual has been infected but is not yet infectious themselves. During this period the individual is in compartment **E** (for exposed).

The system of equations is:

$
  frac(d S, d t) & = - frac(beta S I, N) \
  frac(d E, d t) & = frac(beta S I, N) - sigma E \
  frac(d I, d t) & = sigma E - gamma I \
  frac(d R, d t) & = gamma I
$

where $sigma$ is the rate at which exposed individuals become infectious. The average incubation period is $1/sigma$.

== Vital Dynamics

In a population with vital dynamics, new births provide more susceptible individuals to the population, sustaining an epidemic or allowing new outbreaks to occur.

Assuming a constant total population $N$, where the birth rate equals the death rate $mu$:

$
  frac(d S, d t) & = mu N - frac(beta S I, N) - mu S \
  frac(d I, d t) & = frac(beta S I, N) - gamma I - mu I \
  frac(d R, d t) & = gamma I - mu R
$

In this model, the effective reproduction number becomes:

$
  R_0 = frac(beta, gamma + mu)
$

If $R_0 > 1$, the system approaches an endemic equilibrium where the disease persists in the population.
== Computational Examples

We can simulate the SEIR model numerically.

=== Julia Example

```julia
using DifferentialEquations
using Plots

function seir_model!(du, u, p, t)
    S, E, I, R = u
    beta, sigma, gamma = p
    N = S + E + I + R

    du[1] = -beta * S * I / N
    du[2] = beta * S * I / N - sigma * E
    du[3] = sigma * E - gamma * I
    du[4] = gamma * I
end

u0 = [990.0, 10.0, 0.0, 0.0]
p = (0.5, 0.2, 0.1) # beta, sigma, gamma
tspan = (0.0, 160.0)
prob = ODEProblem(seir_model!, u0, tspan, p)
sol = solve(prob)
plot(sol)
```

=== Python Example

```python
import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

def seir_model(u, t, beta, sigma, gamma):
    S, E, I, R = u
    N = S + E + I + R

    dSdt = -beta * S * I / N
    dEdt = beta * S * I / N - sigma * E
    dIdt = sigma * E - gamma * I
    dRdt = gamma * I
    return [dSdt, dEdt, dIdt, dRdt]

u0 = [990, 10, 0, 0]
t = np.linspace(0, 160, 160)
beta, sigma, gamma = 0.5, 0.2, 0.1

sol = odeint(seir_model, u0, t, args=(beta, sigma, gamma))
plt.plot(t, sol)
plt.legend(['S', 'E', 'I', 'R'])
plt.show()
```
