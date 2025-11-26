using DifferentialEquations
using Plots

function seir_model!(du, u, p, t)
    S, E, I, R = u
    beta, sigma, gamma = p
    N = S + E + I + R

    du[1] = -beta * S * I / N
    du[2] = beta * S * I / N - sigma * E
    du[3] = sigma * E - gamma * I
    du[4] = gamma * I
end

u0 = [990.0, 10.0, 0.0, 0.0]
p = (0.5, 0.2, 0.1) # beta, sigma, gamma
tspan = (0.0, 160.0)
prob = ODEProblem(seir_model!, u0, tspan, p)
sol = solve(prob)
plot(sol)
savefig("assets/seir_plot.png")
