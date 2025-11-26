= Vaccination

Vaccination is a method of controlling the spread of infectious diseases.

== Herd Immunity

Herd immunity occurs when a large percentage of a population has become immune to an infection, whether through previous infections or vaccination, thereby providing a measure of protection for individuals who are not immune.

If a proportion $p$ of the population is vaccinated (and assumed immune), the effective susceptible population becomes $S = N(1 - p)$. The effective reproduction number under vaccination, $R_v$, is:

$
  R_v = R_0 (1 - p)
$

To stop the spread of the disease, we need $R_v < 1$. This gives us the condition for the critical vaccination coverage $p_c$:

$
  R_0 (1 - p_c) < 1 arrow.double 1 - p_c < frac(1, R_0) arrow.double p_c > 1 - frac(1, R_0)
$

Thus, the threshold for herd immunity is:

$
  p_c = 1 - frac(1, R_0)
$

== Pulse Vaccination

Pulse vaccination is a strategy where a fraction of the population is vaccinated in repeated pulses (e.g., every $T$ years) rather than continuously. This can be more effective in eradicating a disease than continuous vaccination.

The theoretical condition for eradication under pulse vaccination is often derived by analyzing the stability of the disease-free periodic solution. If the period $T$ and the vaccination fraction $p$ are chosen such that the effective reproduction number averaged over the period is less than 1, the disease can be eradicated.
