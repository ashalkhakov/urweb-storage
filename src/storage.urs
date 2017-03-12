type storage

(* returns an integer (number of items) *)
val length
    : storage -> transaction int

(* gets n-th key *)
val key : storage -> int -> transaction string

(* get item by key (if exists) *)
val getItem : storage -> string -> transaction (option string)
				   
(* put new item by key, overriding whatever was there previously *)
val setItem : storage -> string -> string -> transaction unit

val getValue : a ::: Type -> read a -> storage -> string -> transaction a
val setValue : a ::: Type -> show a -> storage -> string -> a -> transaction unit
val getJson : a ::: Type -> Json.json a -> storage -> string -> transaction a
val setJson : a ::: Type -> Json.json a -> storage -> string -> a -> transaction unit
					     
(* remove item by key *)
val removeItem : storage -> string -> transaction unit

(* remove all items *)
val clear : storage -> transaction unit

val getLocalStorage : unit -> transaction (option storage)
val getSessionStorage : unit -> transaction (option storage)
