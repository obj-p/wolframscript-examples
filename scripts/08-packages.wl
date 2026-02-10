#!/usr/bin/env wolframscript

(* === 08 - Packages and Code Organization ===
   Run: wolframscript -file scripts/08-packages.wl

   Demonstrates how to structure reusable code using BeginPackage/EndPackage.
   In a real project you'd put the package in a separate .wl file and load it
   with Get[] or Needs[].
*)

(* --- Define a mini package inline for demonstration --- *)
BeginPackage["VectorUtils`"]

magnitude::usage = "magnitude[v] returns the Euclidean norm of vector v."
normalize::usage = "normalize[v] returns the unit vector in the direction of v."
angleBetween::usage = "angleBetween[v1, v2] returns the angle in radians between two vectors."

Begin["`Private`"]

magnitude[v_List] := Sqrt[v . v]

normalize[v_List] := v / magnitude[v]

angleBetween[v1_List, v2_List] :=
  ArcCos[(v1 . v2) / (magnitude[v1] * magnitude[v2])]

End[]
EndPackage[]

(* --- Use the package --- *)
v1 = {3, 4};
v2 = {1, 0};

Print["v1 = ", v1]
Print["v2 = ", v2]
Print["magnitude[v1] = ", magnitude[v1]]
Print["normalize[v1] = ", normalize[v1] // N]
Print["angle between = ", angleBetween[v1, v2] // N, " radians"]

(* --- Loading external packages --- *)
(* In a real project:
   Get["path/to/MyPackage.wl"]           loads by file path
   Needs["MyPackage`"]                    loads from $Path
   <<MyPackage`                           shorthand for Get
*)

(* --- Using built-in add-on packages --- *)
Needs["Developer`"]
packed = Developer`ToPackedArray[Range[1000]];
Print["Packed array? ", Developer`PackedArrayQ[packed]]

Exit[0]
