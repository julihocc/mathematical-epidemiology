import numpy as np
from scipy.integrate import odeint
from scipy.optimize import minimize
from .models import sir_model


def fit_sir(data, N):
    """
    Fit the SIR model to observed data.

    Args:
        data (dict): Dictionary with 'day' and 'infected' arrays.
        N (int): Total population.

    Returns:
        tuple: (optimal_params, fitted_curve, R0)
    """

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

    initial_guess = [2.0, 0.5]
    result = minimize(loss, initial_guess, bounds=[(0, 10), (0, 10)])
    beta_opt, gamma_opt = result.x

    # Generate fitted curve
    t_fine = np.linspace(data["day"][0], data["day"][-1], 100)
    I0 = data["infected"][0]
    u0 = [N - I0, I0, 0]
    sol_opt = odeint(sir_model, u0, t_fine, args=(beta_opt, gamma_opt))
    I_opt = sol_opt[:, 1]

    return (beta_opt, gamma_opt), (t_fine, I_opt), beta_opt / gamma_opt
