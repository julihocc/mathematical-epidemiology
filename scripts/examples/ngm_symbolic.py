import sympy as sp

beta, gamma, sigma = sp.symbols("beta gamma sigma")
F = sp.Matrix([[0, beta], [0, 0]])
V = sp.Matrix([[sigma, 0], [-sigma, gamma]])

# Calculate NGM: K = F * V^-1
K = F * V.inv()

# Calculate eigenvalues
evals = K.eigenvals()
R0 = max(evals.keys())
print(f"R0: {R0}")
