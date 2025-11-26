using LinearAlgebra

# Define matrices F and V
beta, gamma, sigma = 0.5, 0.1, 0.2
F = [0 beta; 0 0]
V = [sigma 0; -sigma gamma]

# Calculate NGM: K = F * V^-1
K = F * inv(V)

# Calculate eigenvalues
evals = eigvals(K)
R0 = maximum(abs.(evals))
println("R0: ", R0)
