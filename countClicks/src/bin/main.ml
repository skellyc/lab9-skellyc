(* file: checks.ml
 * author: Bob Muller
 *
 * CSCI 1103 Computer Science 1 Honors
 *
 * An example using the Animation library with repetition.
   This particular example draws a checkerboard.

   Run:
   > cd src
   > dune exec bin/main.exe
*)
let displayWidth = 800.
let displayHeight = displayWidth
let size = 3

let side = displayWidth /. (float size)

(* Make exactly one empty scene *)
let empty = Image.empty displayWidth displayHeight

type model = { counts : int array array
             ; clicks : int
             }

let initialModel = { counts = Array.make_matrix size size 0
                   ; clicks = 0
                   }

(* addColumnOfChecks : int -> float -> int -> Image.t -> Image.t *)
let addColumnOfChecks col side n image =
  let x = side *. float (col - 1) in
  let emptyColumn = Image.empty side displayHeight in
  let rec addChecks row image =
    match row = 0 with
    | true  -> image
    | false ->
      let y = side *. float (row - 1) in
      let check = Image.rectangle side side (Color.random ()) in
      let newImage = Image.placeImage check (0., y) image
      in
      addChecks (row - 1) newImage in
  let newColumn = addChecks n emptyColumn
  in
  Image.placeImage newColumn (x, 0.) image

(* checks : int -> Image.t *)
let checks n =
  let side = displayWidth /. (float n) in
  let rec addColumns col image =
    match col = 0 with
    | true  -> image
    | false ->
      let newImage = addColumnOfChecks col side n image
      in
      addColumns (col - 1) newImage
  in
  addColumns n empty

let image =
  let _ = Random.self_init ()
  in
  checks size

(* finished : model -> bool *)
let finished model = model.clicks = size

(* update : model -> float -> float -> string -> model *)
let update model x y event = (* YOUR CODE HERE *)
  model

(* view : model -> Image.t *)
let view model = image

(* finishUp : model -> Image.t *)
let finishUp model = (* YOUR CODE HERE *)
  Image.rectangle displayWidth displayHeight Color.red

let go () =
  Animate.start
    initialModel
    ~name:"Count Clicks"
    ~width:displayWidth
    ~height:displayHeight
    ~onMouse: update
    ~stopWhen: finished
    ~view:view
    ~viewLast:finishUp

let s = go ()
