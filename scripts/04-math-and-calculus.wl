#!/usr/bin/env wolframscript

(* === 04 - Symbolic Math and Calculus ===
   Run: wolframscript -file scripts/04-math-and-calculus.wl

   This is where wolframscript really shines — full CAS from the CLI.
*)

(* --- Solving equations --- *)
solutions = Solve[x^2 - 5 x + 6 == 0, x];
Print["x^2 - 5x + 6 = 0 -> ", solutions]

(* System of equations *)
system = Solve[{2 x + y == 10, x - y == 1}, {x, y}];
Print["System solution: ", system]

(* --- Calculus --- *)
Print["d/dx sin(x^2) = ", D[Sin[x^2], x]]
Print["Integral of x*e^x = ", Integrate[x * Exp[x], x]]
Print["Definite integral 0..Pi of sin(x) = ", Integrate[Sin[x], {x, 0, Pi}]]

(* --- Limits --- *)
Print["lim x->0 sin(x)/x = ", Limit[Sin[x]/x, x -> 0]]
Print["lim x->Inf (1+1/x)^x = ", Limit[(1 + 1/x)^x, x -> Infinity]]

(* --- Series expansion --- *)
series = Series[Exp[x], {x, 0, 5}];
Print["e^x Taylor: ", series]
Print["Normal form: ", Normal[series]]

(* --- Linear algebra --- *)
mat = {{1, 2}, {3, 4}};
Print["Determinant:  ", Det[mat]]
Print["Inverse:      ", Inverse[mat]]
Print["Eigenvalues:  ", Eigenvalues[mat]]

(* --- Differential equations --- *)
sol = DSolve[{y'[t] == -2 y[t], y[0] == 5}, y[t], t];
Print["y' = -2y, y(0)=5 -> ", sol]

Exit[0]
