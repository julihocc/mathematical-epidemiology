import numpy as np
from scipy.optimize import curve_fit

# Synthetic data
t = np.arange(0, 11)
I_data = 10 * np.exp(0.5 * t)


# Model
def model(t, I0, r):
    return I0 * np.exp(r * t)


popt, pcov = curve_fit(model, t, I_data)
r_est = popt[1]
gamma = 0.1
R0_est = 1 + r_est / gamma
print(f"Estimated R0: {R0_est:.4f}")
