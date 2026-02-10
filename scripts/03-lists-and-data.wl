#!/usr/bin/env wolframscript

(* === 03 - Lists and Data Structures ===
   Run: wolframscript -file scripts/03-lists-and-data.wl
*)

(* --- Lists are the fundamental collection --- *)
fruits = {"apple", "banana", "cherry", "date"};
Print["First:  ", First[fruits]]
Print["Last:   ", Last[fruits]]
Print["Length: ", Length[fruits]]

(* --- Associations (key-value maps) --- *)
person = <|"name" -> "Alice", "age" -> 30, "city" -> "Portland"|>;
Print["Name: ", person["name"]]
Print["Keys: ", Keys[person]]

(* Merge associations *)
extra = <|"language" -> "Wolfram", "age" -> 31|>;
merged = Join[person, extra];  (* later keys override *)
Print["Merged: ", merged]

(* --- Datasets (typed tabular data) --- *)
data = {
  <|"name" -> "Alice",   "score" -> 95, "grade" -> "A"|>,
  <|"name" -> "Bob",     "score" -> 82, "grade" -> "B"|>,
  <|"name" -> "Charlie", "score" -> 91, "grade" -> "A"|>,
  <|"name" -> "Diana",   "score" -> 78, "grade" -> "C"|>
};
ds = Dataset[data];

(* Query a dataset *)
Print["All names:    ", Normal[ds[All, "name"]]]
Print["Mean score:   ", N[ds[Mean, "score"]]]
Print["A students:   ", Normal[ds[Select[#grade == "A" &], "name"]]]

(* --- Sorting and grouping --- *)
sorted = SortBy[data, -#score &];
Print["Top scorer:   ", sorted[[1]]["name"]]

grouped = GroupBy[data, #grade &];
Print["By grade:     ", Map[Length, grouped]]

(* --- Nest and Fold (functional iteration) --- *)
Print["Nest:  ", Nest[# + 1 &, 0, 10]]           (* apply +1 ten times *)
Print["Fold:  ", Fold[Plus, 0, {1, 2, 3, 4, 5}]]  (* cumulative sum *)

Exit[0]
