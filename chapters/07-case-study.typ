= Case Study: Influenza in a Boarding School

In this chapter, we apply the SIR model to a real-world dataset: an influenza outbreak in a boarding school in 1978. The data was reported by the British Medical Journal (4th March 1978).

== The Data

The school had a total population of $N = 763$ students. The outbreak lasted for about two weeks. The number of infected students was recorded daily.

#figure(
  table(
    columns: (auto, auto),
    inset: 10pt,
    align: horizon,
    [*Day*], [*Infected Students*],
    [0], [1],
    [1], [3],
    [2], [6],
    [3], [25],
    [4], [73],
    [5], [222],
    [6], [294],
    [7], [258],
    [8], [237],
    [9], [191],
    [10], [125],
    [11], [69],
    [12], [27],
    [13], [11],
    [14], [4],
  ),
  caption: [Daily number of infected students during the influenza outbreak.],
)

== Model Fitting

We fit the SIR model to this data by estimating the parameters $beta$ and $gamma$. We use the Least Squares method to minimize the difference between the observed number of infected students and the model's prediction.

The optimization problem is:

$
  min_(beta, gamma) sum_(i=0)^14 (I_text("model")(t_i, beta, gamma) - I_text("observed")(t_i))^2
$

Using Python and `scipy.optimize`, we found the optimal parameters to be:

- $beta approx 2.18$
- $gamma approx 0.44$

This yields a basic reproduction number of:

$
  R_0 = frac(beta, gamma) approx 4.95
$

== Results

The fitted model captures the dynamics of the outbreak very well, as shown in the figure below.

#figure(
  image("../assets/influenza_fit.png", width: 80%),
  caption: [SIR model fitted to the influenza data.],
)

The high $R_0$ value explains the rapid spread of the infection within the closed environment of the boarding school.
