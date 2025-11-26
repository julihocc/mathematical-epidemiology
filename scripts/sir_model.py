import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

# Define the SIR model
def sir_model(u, t, beta, gamma):
    S, I, R = u
    N = S + I + R
    
    dSdt = -beta * S * I / N
    dIdt = beta * S * I / N - gamma * I
    dRdt = gamma * I
    
    return [dSdt, dIdt, dRdt]

# Parameters
beta = 0.5
gamma = 0.1

# Initial conditions
S0 = 990.0
I0 = 10.0
R0 = 0.0
u0 = [S0, I0, R0]

# Time span
t = np.linspace(0, 160, 160)

# Solve the ODE
sol = odeint(sir_model, u0, t, args=(beta, gamma))
S, I, R = sol.T

# Plot the results
plt.figure(figsize=(10, 6))
plt.plot(t, S, label='S')
plt.plot(t, I, label='I')
plt.plot(t, R, label='R')
plt.xlabel('Time')
plt.ylabel('Population')
plt.title('SIR Model Simulation')
plt.legend()
plt.grid(True)
plt.savefig('assets/sir_plot_python.png')
# plt.show()
