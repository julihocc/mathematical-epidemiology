using Plots

R0 = 2.5
p = 0:0.01:1
Rv = R0 .* (1 .- p)

plot(p, Rv, label="Rv", xlabel="Vaccination Coverage (p)", ylabel="Effective R0")
hline!([1.0], label="Threshold", linestyle=:dash)
savefig("assets/herd_immunity.png")
