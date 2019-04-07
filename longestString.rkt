#lang pl untyped

;; Function: 'longestString' ;;
;; Input: Listof Any
;; Because the function can return string and boolean i use with U (union) about the output type;;
;; Output: returns the longest string that is an element of this list, and #f if no such string exists;;; 

;; The function 'longestString' get list of any (can be strings, numbers, symbols)  as parameter and and returns the longest string that is an element of this list, and #f if no such string exists;;
;; The solution is done with tail-recursion ;;

;; Explain the idea- check from the start of the list to end by comparison between two elements:;;
;; if the first elemnt is string and the second no, return the first;;
;; if the first elemnt isn't string and the second yes, return the second;;
;; if the first elemnt and the second are strings, a test is being performed who is longer;;
;; else return #f;

;; Example-  (test (longestString '("yes22" "yes1" "yes4444" "yes333")) => "yes4444") ;;

;; Helper functions:;;

;; The function 'string-length' returns the length of string;;


(: longestString-help : (Listof Any) (U Boolean String) -> (U Boolean String))
(define (longestString-help lst max-string)
  (if(null? lst) max-string
  (let ([first-element (first lst)]) 
  (longestString-help (rest lst)
                      (cond
                        [(and (string? first-element) (not(string? max-string))) first-element]
                        [(and (string? max-string) (not(string? first-element))) max-string]
                        [(and (string? max-string) (string? first-element)) (if (< (string-length max-string) (string-length first-element)) first-element max-string)]
                        [else #f]) ))))

(: longestString :(Listof Any)-> (U Boolean String))
(define (longestString lst )
 (longestString-help lst #f))
  


(test (longestString '(34 uuu 90)) => false) 
(test (longestString '(uu 56 oooo "r" "rRR" "TTT")) => "rRR")
(test (longestString '()) => false)
(test (longestString '("")) => "")
(test (longestString '(34 uuu 90 "")) => "")
(test (longestString '("yes" "yes1" "yes2")) => "yes1")
(test (longestString '("yes1" "yes2" "yes3")) => "yes1")
(test (longestString '("yes" "yes" "yes")) => "yes")
(test (longestString '("yes22" "yes1" "yes4444" "yes333")) => "yes4444")
(test (longestString '(34 60 90)) => false)
(test (longestString '('aviv1 'aviv2 'aviv3)) => false)



  

