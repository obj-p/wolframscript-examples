#!/usr/bin/env wolframscript

(* === 01 - Basics ===
   Run: wolframscript -file scripts/01-basics.wl
*)

(* Print output with Print[] *)
Print["Hello from WolframScript!"]

(* Basic arithmetic — the kernel evaluates symbolically by default *)
Print["2 + 2 = ", 2 + 2]
Print["100! = ", 100!]

(* Variables *)
x = 42;
y = 3.14;
Print["x * y = ", x * y]

(* Symbolic computation — no numeric assignment needed *)
expr = Expand[(a + b)^5];
Print["(a + b)^5 = ", expr]

(* Simplification *)
Print["Simplified: ", Simplify[Sin[x]^2 + Cos[x]^2]]

(* String operations *)
greeting = StringJoin["Wolfram", " ", "Language"];
Print[greeting]
Print["Reversed: ", StringReverse[greeting]]

(* Exit with explicit code *)
Exit[0]
