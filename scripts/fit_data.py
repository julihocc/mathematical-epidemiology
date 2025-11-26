import sys
import os

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../src")))

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from mathematical_epidemiology.fitting import fit_sir

# Data: Influenza in a boarding school (1978)
data = {
    "day": np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]),
    "infected": np.array(
        [1, 3, 6, 25, 73, 222, 294, 258, 237, 191, 125, 69, 27, 11, 4]
    ),
}
N = 763

# Fit the model
(beta_opt, gamma_opt), (t_fine, I_opt), R0 = fit_sir(data, N)

print(f"Optimal beta: {beta_opt:.4f}")
print(f"Optimal gamma: {gamma_opt:.4f}")
print(f"R0: {R0:.4f}")

# Plot
plt.figure(figsize=(10, 6))
plt.scatter(data["day"], data["infected"], color="red", label="Observed Data")
plt.plot(t_fine, I_opt, color="blue", label=f"Fitted SIR Model (R0={R0:.2f})")
plt.xlabel("Day")
plt.ylabel("Infected Students")
plt.title("Influenza in a Boarding School (1978)")
plt.legend()
plt.grid(True)
plt.savefig("assets/influenza_fit.png")
