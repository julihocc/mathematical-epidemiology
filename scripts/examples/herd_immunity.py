import numpy as np
import matplotlib.pyplot as plt

R0 = 2.5
p = np.linspace(0, 1, 100)
Rv = R0 * (1 - p)

plt.plot(p, Rv, label="Rv")
plt.axhline(y=1.0, color="r", linestyle="--", label="Threshold")
plt.xlabel("Vaccination Coverage (p)")
plt.ylabel("Effective R0")
plt.title("Herd Immunity Threshold")
plt.legend()
plt.savefig("assets/herd_immunity_python.png")
