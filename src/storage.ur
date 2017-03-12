type storage = Storage__FFI.storage

val length = Storage__FFI.length
val key = Storage__FFI.key

val getItem = Storage__FFI.getItem				   
val setItem = Storage__FFI.setItem

fun getValue [a ::: Type] (r : read a) (s : storage) (k : string): transaction a =
    v <- getItem s k;
    case v of
	None => error <xml>Expected string, but got null/undefined</xml>
      | Some s => return (readError s)
    
fun setValue [a ::: Type] (sh : show a) (s : storage) (k : string) (v : a): transaction unit =
    setItem s k (show v)
    
fun getJson [a ::: Type] (js : Json.json a) (s : storage) (k : string) : transaction a =
    v <- getItem s k;
    case v of
	None => error <xml>Expected JSON string, but got null/undefined</xml>
      | Some s => return (Json.fromJson s)

fun setJson [a ::: Type] (js : Json.json a) (s : storage) (k : string) (v : a) : transaction unit =
    setItem s k (Json.toJson v)

val removeItem = Storage__FFI.removeItem
val clear = Storage__FFI.clear

val getLocalStorage = Storage__FFI.getLocalStorage
val getSessionStorage = Storage__FFI.getSessionStorage
