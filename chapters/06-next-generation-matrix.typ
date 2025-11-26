= Next Generation Matrix

The next generation matrix is a method used to derive the basic reproduction number, $R_0$, for a compartmental model of the spread of infectious diseases.

== Methodology

1. Identify the infected compartments.
2. Linearize the system about the disease-free equilibrium.
3. Decompose the Jacobian matrix into transmission ($F$) and transition ($V$) matrices.
4. Calculate $R_0$ as the spectral radius of $F V^(-1)$.
