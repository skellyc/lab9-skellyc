(* file: main.ml
  author: Bob Muller

  CSCI 1103 Computer Science 1 Honors

   Lab Material for working with Two-dimensional arrays.

   run:

   > cd src
   > dune exec bin/main.exe
*)

let yes = [| [| 2; 1; 3; 4|]
           ; [| 4; 3; 1; 2|]
           ; [| 1; 2; 4; 3|]
           ; [| 3; 4; 2; 1|]
          |]
let no1  = [| [| 2; 1; 3; 4|]
            ; [| 4; 3; 1; 2|]
            ; [| 2; 1; 4; 3|]
            ; [| 3; 4; 2; 1|]
           |]
let no2  = [| [| 2; 1; 3; 4|]
            ; [| 4; 2; 1; 3|]
            ; [| 1; 3; 4; 2|]
            ; [| 3; 4; 2; 1|]
           |]

(* isSudokuSolved : int array array -> bool *)
let isSudokuSolved a = (* YOUR CODE HERE *)
  failwith "isSudokuSolved isn't written yet."

let test1 () = isSudokuSolved yes
let test2 () = not(isSudokuSolved no1)
let test3 () = not(isSudokuSolved no2)

let go () =
  Lib.run_test "test1" test1;
  Lib.run_test "test2" test2;
  Lib.run_test "test3" test3

let s = go ()
