= Next Generation Matrix

The next generation matrix is a method used to derive the basic reproduction number, $R_0$, for a compartmental model of the spread of infectious diseases.

== Formal Definition

Let $x = (x_1, ..., x_n)^T$ be the number of individuals in each compartment, where the first $m < n$ compartments contain infected individuals.

Let $cal(F)_i(x)$ be the rate of appearance of new infections in compartment $i$, and $cal(V)_i(x) = cal(V)_i^-(x) - cal(V)_i^+(x)$ be the rate of transfer of individuals out of compartment $i$ minus the rate of transfer into compartment $i$ by all other means.

The system is described by $d x_i / d t = cal(F)_i(x) - cal(V)_i(x)$.

We define the matrices $F$ and $V$ as the Jacobian matrices of $cal(F)$ and $cal(V)$ with respect to the infected compartments, evaluated at the disease-free equilibrium (DFE) $x_0$:

$
  F = [frac(partial cal(F)_i, partial x_j) (x_0)] quad text("and") quad V = [frac(partial cal(V)_i, partial x_j) (x_0)]
$

for $i, j = 1, ..., m$.

The basic reproduction number $R_0$ is defined as the spectral radius (dominant eigenvalue) of the next generation matrix $K = F V^(-1)$:

$
  R_0 = rho(F V^(-1))
$

== Example: SEIR Model

Let's apply this to the SEIR model. The infected compartments are $E$ and $I$. The equations for these compartments are:

$
  frac(d E, d t) & = frac(beta S I, N) - sigma E \
  frac(d I, d t) & = sigma E - gamma I
$

At the DFE, $S = N$ and $E = I = 0$.

The new infections appear in compartment $E$. Thus:

$
  cal(F) = vec(frac(beta S I, N), 0)
$

The transitions are:

$
  cal(V) = vec(sigma E, -sigma E + gamma I)
$

Evaluating the Jacobians at the DFE ($S=N$):

$
  F = mat(0, beta; 0, 0) quad text("and") quad V = mat(sigma, 0; -sigma, gamma)
$

The inverse of $V$ is:

$
  V^(-1) = frac(1, sigma gamma) mat(gamma, 0; sigma, sigma) = mat(1/sigma, 0; 1/gamma, 1/gamma)
$

The next generation matrix is:

$
  K = F V^(-1) = mat(0, beta; 0, 0) mat(1/sigma, 0; 1/gamma, 1/gamma) = mat(beta/gamma, beta/gamma; 0, 0)
$

The eigenvalues of $K$ are $beta/gamma$ and $0$. Thus, the spectral radius is:

$
  R_0 = frac(beta, gamma)
$

This matches the result we expect for the SEIR model.
