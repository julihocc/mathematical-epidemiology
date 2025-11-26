using DifferentialEquations
using Plots

# Define the SIR model
function sir_model!(du, u, p, t)
    S, I, R = u
    beta, gamma = p
    N = S + I + R
    
    du[1] = -beta * S * I / N
    du[2] = beta * S * I / N - gamma * I
    du[3] = gamma * I
end

# Parameters
beta = 0.5
gamma = 0.1
p = (beta, gamma)

# Initial conditions
S0 = 990.0
I0 = 10.0
R0 = 0.0
u0 = [S0, I0, R0]

# Time span
tspan = (0.0, 160.0)

# Solve the ODE
prob = ODEProblem(sir_model!, u0, tspan, p)
sol = solve(prob)

# Plot the results
plot(sol, label=["S" "I" "R"], xlabel="Time", ylabel="Population", title="SIR Model Simulation")
savefig("assets/sir_plot.png")
