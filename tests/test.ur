fun index () = return <xml>
  <head>
    <title>HTML Local Storage Example</title>
  </head>
  <body>
    <active code={
	       storageOpt <- Storage.getLocalStorage ();
	       storage <- return (Option.unsafeGet storageOpt);
	       foo <- source "";
	       res_init <- Storage.getItem storage "LocalStorageKey";
	       res <- source (Option.get "" res_init);
	       let
		   fun retrieve (): transaction unit =
		       v <- Storage.getItem storage "LocalStorageKey";
		       case v of
			   None => set res "Failed to retrieve from storage"
			 | Some v => set res v
		   fun save (): transaction unit =
		       v <- get foo;
		       Storage.setItem storage "LocalStorageKey" v
	       in
		   return <xml>
		     <section>
		       <article>
			 <h1>Web Storage example</h1>

			 
			 <label>New value for storage:</label>
			 <ctextbox source={foo}></ctextbox>
			 <br/>
			 
			 <button value="Save Text to Local Storage" onclick={fn _ => save ()}>
			 </button>
			 <br/>		 
			 
			 <h2>Storage contents</h2>
			 <dyn signal={v <- signal res; return <xml><p>{[v]}</p></xml>}></dyn>
			 <p>Try reloading the page to see if storage is persistent!</p>
			 <button value="Retrieve Text From Local Storage" onclick={fn _ => retrieve ()}></button>
		     </article>
		   </section>
		       </xml>
	       end}>
    </active>
  </body>
</xml>
