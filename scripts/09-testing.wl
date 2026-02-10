#!/usr/bin/env wolframscript

(* === 09 - Unit Testing ===
   Run: wolframscript -file scripts/09-testing.wl

   Wolfram has built-in testing via VerificationTest and TestReport.
   No packages needed — it's part of the core language.
*)

(* ---- Individual VerificationTest examples ----

   VerificationTest[input, expected]
   Returns a TestResultObject with pass/fail info.
*)

Print["=== Individual Tests ==="]

t1 = VerificationTest[2 + 2, 4];
Print["2 + 2 == 4:  ", t1["Outcome"]]

t2 = VerificationTest[Expand[(a + b)^2], a^2 + 2 a b + b^2];
Print["Expand:      ", t2["Outcome"]]

t3 = VerificationTest[1/0, ComplexInfinity];
Print["1/0:         ", t3["Outcome"]]

(* ---- TestReport: batch run with summary ---- *)

Print["\n=== TestReport (batch) ==="]

report = TestReport[{

  (* Arithmetic *)
  VerificationTest[100!, Factorial[100]],
  VerificationTest[GCD[12, 8], 4],
  VerificationTest[PrimeQ[17], True],

  (* Symbolic math *)
  VerificationTest[D[x^3, x], 3 x^2],
  VerificationTest[Integrate[2 x, x], x^2],
  VerificationTest[Limit[Sin[x]/x, x -> 0], 1],

  (* List operations *)
  VerificationTest[Sort[{3, 1, 2}], {1, 2, 3}],
  VerificationTest[Length[Range[50]], 50],
  VerificationTest[Total[{1, 2, 3, 4}], 10],

  (* String operations *)
  VerificationTest[StringLength["hello"], 5],
  VerificationTest[StringReverse["abc"], "cba"],

  (* Linear algebra *)
  VerificationTest[Det[{{1, 0}, {0, 1}}], 1],
  VerificationTest[Inverse[{{1, 0}, {0, 1}}], {{1, 0}, {0, 1}}],

  (* Deliberate failure to show what failures look like *)
  VerificationTest[2 + 2, 5]
}];

Print["Tests passed:  ", report["TestsSucceededCount"]]
Print["Tests failed:  ", report["TestsFailedCount"]]
Print["Total tests:   ", report["TestsSucceededCount"] + report["TestsFailedCount"]]
Print["All passed?    ", report["AllTestsSucceeded"]]

(* ---- Inspecting failures ---- *)
failed = report["TestsFailed"];
If[Length[failed] > 0,
  Print["\n=== Failed Tests ==="];
  Do[
    result = report["TestResults"][id];
    Print["  Test #", id, ": expected ", result["ExpectedOutput"],
          ", got ", result["ActualOutput"]],
    {id, Keys[failed]}
  ]
];

(* ---- Testing your own functions ---- *)

Print["\n=== Testing Custom Functions ==="]

magnitude[v_List] := Sqrt[v . v];
normalize[v_List] := v / magnitude[v];

customReport = TestReport[{
  VerificationTest[magnitude[{3, 4}], 5],
  VerificationTest[magnitude[{0, 0, 0}], 0],
  VerificationTest[normalize[{0, 3, 4}], {0, 3/5, 4/5}]
}];

Print["Custom tests passed: ", customReport["TestsSucceededCount"], "/3"]
Print["All passed?          ", customReport["AllTestsSucceeded"]]

(* Exit with non-zero if any tests failed *)
If[!report["AllTestsSucceeded"] || !customReport["AllTestsSucceeded"],
  Print["\nSome tests failed (expected — one deliberate failure above)."];
  Exit[1],
  Exit[0]
]
