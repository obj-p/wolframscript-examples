#!/usr/bin/env wolframscript

(* === 05 - Plotting and Graphics Export ===
   Run: wolframscript -file scripts/05-plotting.wl

   Without a notebook, plots are exported to files.
   Check the output/ directory after running.
*)

outputDir = FileNameJoin[{DirectoryName[$InputFileName], "..", "output"}];
If[!DirectoryQ[outputDir], CreateDirectory[outputDir]];

(* --- 2D plot --- *)
plot1 = Plot[{Sin[x], Cos[x]}, {x, 0, 2 Pi},
  PlotLegends -> {"sin(x)", "cos(x)"},
  PlotLabel -> "Trig Functions",
  AxesLabel -> {"x", "y"}
];
Export[FileNameJoin[{outputDir, "trig-functions.png"}], plot1, ImageResolution -> 150];
Print["Exported: trig-functions.png"]

(* --- Parametric plot --- *)
plot2 = ParametricPlot[
  {Sin[3 t] Cos[t], Sin[3 t] Sin[t]}, {t, 0, 2 Pi},
  PlotLabel -> "Rose Curve",
  PlotStyle -> Red
];
Export[FileNameJoin[{outputDir, "rose-curve.png"}], plot2, ImageResolution -> 150];
Print["Exported: rose-curve.png"]

(* --- 3D plot --- *)
plot3 = Plot3D[Sin[x] Cos[y], {x, -Pi, Pi}, {y, -Pi, Pi},
  PlotLabel -> "sin(x)cos(y)",
  ColorFunction -> "Rainbow"
];
Export[FileNameJoin[{outputDir, "surface-3d.png"}], plot3, ImageResolution -> 150];
Print["Exported: surface-3d.png"]

(* --- Bar chart from data --- *)
data = <|"Mon" -> 3, "Tue" -> 7, "Wed" -> 5, "Thu" -> 9, "Fri" -> 6|>;
plot4 = BarChart[Values[data],
  ChartLabels -> Keys[data],
  PlotLabel -> "Daily Widget Count",
  ChartStyle -> "Pastel"
];
Export[FileNameJoin[{outputDir, "bar-chart.png"}], plot4, ImageResolution -> 150];
Print["Exported: bar-chart.png"]

Print["All plots saved to output/"]

Exit[0]
