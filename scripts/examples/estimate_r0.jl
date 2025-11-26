using LsqFit

# Synthetic data (early exponential growth)
t = 0:1:10
I_data = 10 .* exp.(0.5 .* t) # r = 0.5

# Model: I(t) = I0 * exp(r * t)
@. model(t, p) = p[1] * exp(p[2] * t)
p0 = [10.0, 0.5]

fit = curve_fit(model, t, I_data, p0)
r_est = fit.param[2]
gamma = 0.1
R0_est = 1 + r_est / gamma
println("Estimated R0: ", R0_est)
