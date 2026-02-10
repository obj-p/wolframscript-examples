#!/usr/bin/env wolframscript

(* === 06 - File I/O and External Data ===
   Run: wolframscript -file scripts/06-file-io.wl
*)

outputDir = FileNameJoin[{DirectoryName[$InputFileName], "..", "output"}];
If[!DirectoryQ[outputDir], CreateDirectory[outputDir]];

(* --- Write and read a CSV --- *)
tableData = {
  {"Name", "Age", "Score"},
  {"Alice", 28, 95},
  {"Bob", 34, 82},
  {"Charlie", 22, 91}
};
csvPath = FileNameJoin[{outputDir, "people.csv"}];
Export[csvPath, tableData, "CSV"];
Print["Wrote: ", csvPath]

imported = Import[csvPath, "CSV"];
Print["Read back: ", imported]

(* --- JSON round-trip --- *)
config = <|
  "version" -> "1.0",
  "settings" -> <|"verbose" -> True, "maxIter" -> 100|>,
  "tags" -> {"math", "demo"}
|>;
jsonPath = FileNameJoin[{outputDir, "config.json"}];
Export[jsonPath, config, "JSON"];
Print["Wrote JSON: ", jsonPath]

readBack = Import[jsonPath, "RawJSON"];
Print["Read JSON:  ", readBack]

(* --- Read a plain text file --- *)
txtPath = FileNameJoin[{outputDir, "hello.txt"}];
Export[txtPath, "Hello from WolframScript!\nLine two.\nLine three.", "Text"];
lines = ReadList[txtPath, String];
Print["Lines: ", lines]

(* --- Working with the filesystem --- *)
Print["Current directory: ", Directory[]]
Print["Script location:   ", $InputFileName]
Print["Files in output/:  ", FileNames["*", outputDir]]

Exit[0]
