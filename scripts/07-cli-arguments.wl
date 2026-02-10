#!/usr/bin/env wolframscript

(* === 07 - Command-Line Arguments ===
   Run: wolframscript -file scripts/07-cli-arguments.wl -- arg1 arg2 arg3

   Use "--" to separate wolframscript flags from your script's arguments.
   Arguments are available in $ScriptCommandLine.
*)

args = $ScriptCommandLine;

Print["All args (including script path): ", args]
Print["Script path: ", First[args]]

(* Drop the script path to get user arguments *)
userArgs = Rest[args];
Print["User arguments: ", userArgs]

If[Length[userArgs] == 0,
  Print["\nUsage: wolframscript -file scripts/07-cli-arguments.wl -- <n>"];
  Print["  Computes the factorial of <n>."];
  Exit[1]
];

(* Parse first argument as an integer *)
n = ToExpression[First[userArgs]];
If[!IntegerQ[n] || n < 0,
  Print["Error: expected a non-negative integer, got: ", First[userArgs]];
  Exit[1]
];

Print[n, "! = ", n!]

Exit[0]
