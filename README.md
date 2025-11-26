# Mathematical Epidemiology Ebook

This repository contains the source code for an ebook on Mathematical Epidemiology, written in Typst. It also includes Julia scripts for computational examples.

## Structure

- `main.typ`: The main entry point for the book.
- `chapters/`: Contains the content of the book, organized by chapter.
- `scripts/`: Contains Julia scripts for simulations.
- `assets/`: Contains images and figures.
- `template.typ`: Defines the document styling.

## Building the Book

To build the book, you need to have [Typst](https://typst.app/) installed. Run the following command:

```bash
typst compile main.typ
```

## Running Simulations

To run the simulations, you need to have [Julia](https://julialang.org/) installed. You also need to install the `DifferentialEquations` and `Plots` packages.

```julia
using Pkg
Pkg.add("DifferentialEquations")
Pkg.add("Plots")
```

Then you can run the scripts, for example:

```bash
julia scripts/sir_model.jl
```

## AI Disclosure

This project was developed with the assistance of an AI system (Google's Gemini). The AI contributed to drafting the content, deriving mathematical formulas, and writing the code examples.
