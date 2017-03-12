# Ur/Web Storage

Client-side local storage support in Ur/Web

## Features

* use the local storage to persist some data between page invocations
* helpers on top of raw API for JSON / showable (de)serialization

## Usage examples

On the client (e.g. inside `active`'s `code` block):

```
(* obtain the storage handle (we don't care about old browsers) *)
storage <- Storage.getLocalStorage ();
storage <- return (Option.unsafeGet storage);
(* get the existing value *)
v0 <- Storage.getItem storage "my_key";
alert (show v0);
(*  set the new value *)
Storage.setItem storage "my_key" "another value"
```
Please see the tests for a working example.

## Getting started

### Quick tutorial

You will have to put this library somewhere, and refer to its `.urp`
file in your own project file via the `library` directive.

### Running tests

Since the test are browser-only, they are not automated, yet.
