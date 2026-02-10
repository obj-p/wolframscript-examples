#!/usr/bin/env wolframscript

(* === 02 - Functions and Pattern Matching ===
   Run: wolframscript -file scripts/02-functions-and-patterns.wl

   Wolfram Language has two main ways to define functions:
   1. Immediate assignment (=)  — RHS evaluated at definition time
   2. Delayed assignment (:=)   — RHS evaluated at each call
*)

(* --- Simple function with delayed assignment --- *)
square[x_] := x^2
Print["square[7] = ", square[7]]

(* --- Pattern matching with multiple definitions --- *)
factorial[0] = 1;
factorial[n_Integer /; n > 0] := n * factorial[n - 1]
Print["factorial[10] = ", factorial[10]]

(* --- Pure (anonymous) functions --- *)
double = Function[x, 2 * x];
Print["double[21] = ", double[21]]

(* Shorthand: # is the slot, & marks the function *)
triple = 3 * # &;
Print["triple[5] = ", triple[5]]

(* --- Map, Apply, Select --- *)
numbers = Range[1, 10];
Print["Numbers:  ", numbers]
Print["Squared:  ", Map[square, numbers]]
Print["Evens:    ", Select[numbers, EvenQ]]
Print["Sum:      ", Apply[Plus, numbers]]

(* --- Pattern-based replacement rules --- *)
expr = {1, "hello", 2, "world", 3};
Print["Strings only: ", Cases[expr, _String]]
Print["Doubled ints: ", expr /. n_Integer :> 2 * n]

(* --- Options pattern (common in real packages) --- *)
Options[greet] = {"Excited" -> False};
greet[name_String, OptionsPattern[]] :=
  If[OptionValue["Excited"],
    StringJoin["HELLO, ", ToUpperCase[name], "!!!"],
    StringJoin["Hello, ", name, "."]
  ]

Print[greet["Alice"]]
Print[greet["Bob", "Excited" -> True]]

Exit[0]
