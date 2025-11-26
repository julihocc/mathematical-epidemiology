import numpy as np


def sir_model(u, t, beta, gamma):
    """
    SIR Model differential equations.

    Args:
        u (list): State vector [S, I, R]
        t (float): Time
        beta (float): Transmission rate
        gamma (float): Recovery rate

    Returns:
        list: Derivatives [dS/dt, dI/dt, dR/dt]
    """
    S, I, R = u
    N = S + I + R

    dSdt = -beta * S * I / N
    dIdt = beta * S * I / N - gamma * I
    dRdt = gamma * I

    return [dSdt, dIdt, dRdt]
