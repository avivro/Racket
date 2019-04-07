#lang pl untyped

;; In this question required to implement stack data structure;;
;; There are 2 variant:
;;1. EmptyKS-empty stack. this should be a variant of the data type (constructor). 
;;2.Push –the push operation. this too should be a variant of the data type. The push operation should take as input a symbol (key), a string (value);;

;; Helper functions:;;

;; 1. search-stack function-  the search operation  take as input a symbol (key) and a keyed-stack and return the first (LIFO, last in first out) value that is keyed accordingly;;
;; If the key does not appear in the original stack, return a #f value;;
;; Because the function can return string and boolean i use with U (union) about the output type;;

;; 2. pop-stack function - the pop operation take as input a keyed-stack and return the keyed-stack without its first (keyed) value;;
;; If the original stack was empty,return a #f value ;;

( define-type KeyStack
[ EmptyKS ]
[ Push  Symbol String KeyStack ])


(: search-stack : Symbol KeyStack -> (U Boolean String) )
( define ( search-stack symbol-required stack )
( cases stack
[( EmptyKS  ) #f ]
[( Push symbol-current str-current next-keystack ) (if (eq?  symbol-required symbol-current) str-current (search-stack symbol-required next-keystack)) ]))


(: pop-stack  : KeyStack -> (U Boolean KeyStack) )
( define ( pop-stack stack )
( cases stack
[( EmptyKS  ) #f ]
[( Push symbol-current str-current next-keystack )  next-keystack]))


(test (EmptyKS) => (EmptyKS)) 
(test (Push 'b "B" (Push 'a "A" (EmptyKS))) => (Push 'b "B" (Push 'a "A" (EmptyKS)))) 
(test (Push 'a "AAA" (Push 'b "B" (Push 'a "A"  (EmptyKS)))) => (Push 'a "AAA" (Push 'b "B" (Push 'a "A" (EmptyKS))))) 
(test (search-stack 'a (Push 'a "AAA" (Push 'b "B" (Push 'a "A" (EmptyKS))))) => "AAA") 
(test (search-stack 'c (Push 'a "AAA" (Push 'b "B" (Push 'a "A" (EmptyKS))))) => #f)
(test (pop-stack (Push 'a "AAA" (Push 'b "B" (Push 'a "A" (EmptyKS))))) => (Push 'b "B" (Push 'a "A" (EmptyKS)))) 
(test (pop-stack (EmptyKS)) => #f) 