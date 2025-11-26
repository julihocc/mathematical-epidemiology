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
plt.legend(["S", "E", "I", "R"])
plt.title("SEIR Model Simulation")
plt.xlabel("Time")
plt.ylabel("Population")
plt.savefig("assets/seir_plot_python.png")
