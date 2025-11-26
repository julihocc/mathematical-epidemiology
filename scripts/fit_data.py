import numpy as np
from scipy.integrate import odeint
from scipy.optimize import minimize
import matplotlib.pyplot as plt
import pandas as pd

# Data: Influenza in a boarding school (1978)
# Day: 0 to 14
# Infected students
data = {
    "day": np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]),
    "infected": np.array(
        [1, 3, 6, 25, 73, 222, 294, 258, 237, 191, 125, 69, 27, 11, 4]
    ),
}
df = pd.DataFrame(data)

# Total population
N = 763


# SIR Model
def sir_model(u, t, beta, gamma):
    S, I, R = u
    dSdt = -beta * S * I / N
    dIdt = beta * S * I / N - gamma * I
    dRdt = gamma * I
    return [dSdt, dIdt, dRdt]


# Loss function (Least Squares)
def loss(params):
    beta, gamma = params
    I0 = data["infected"][0]
    S0 = N - I0
    R0 = 0
    u0 = [S0, I0, R0]

    t = data["day"]
    sol = odeint(sir_model, u0, t, args=(beta, gamma))
    I_pred = sol[:, 1]

    return np.sum((I_pred - data["infected"]) ** 2)


# Fit the model
initial_guess = [2.0, 0.5]
result = minimize(loss, initial_guess, bounds=[(0, 10), (0, 10)])
beta_opt, gamma_opt = result.x

print(f"Optimal beta: {beta_opt:.4f}")
print(f"Optimal gamma: {gamma_opt:.4f}")
print(f"R0: {beta_opt / gamma_opt:.4f}")

# Plot
t_fine = np.linspace(0, 14, 100)
u0 = [N - data["infected"][0], data["infected"][0], 0]
sol_opt = odeint(sir_model, u0, t_fine, args=(beta_opt, gamma_opt))
I_opt = sol_opt[:, 1]

plt.figure(figsize=(10, 6))
plt.scatter(data["day"], data["infected"], color="red", label="Observed Data")
plt.plot(
    t_fine,
    I_opt,
    color="blue",
    label=f"Fitted SIR Model (R0={beta_opt / gamma_opt:.2f})",
)
plt.xlabel("Day")
plt.ylabel("Infected Students")
plt.title("Influenza in a Boarding School (1978)")
plt.legend()
plt.grid(True)
plt.savefig("assets/influenza_fit.png")
