#lang pl untyped


;; Function: 'short&long-lists' ;;
;; Input: list of lists
;; Because the function can return Listof and null i use with U (union) about the output type- Listof (Listof (U null  String)));;
;; The function short&long-lists function that consumes a list of lists (where the type of the elements in the inner lists may be any type). The function returns a list of lists – such that for each inner list lst (in the original list) the following is done – 1. If lst contains at least one string, then lst is replaced with a list of size two, containing the shortest string and the longest string in lst, and 2. Otherwise, lst is replaced with a null;;


;; Example-  (test (short&long-lists '(("2" L) (v gggg "aviv") ())) => '(("2" "2") ("aviv" "aviv") ())) ;;


;; The solution is done with help function;;

;; Helper functions:;;

;; The function filter returns a list with the elements of lst for which pred produces a true value. The pred procedure is applied to each element from first to last.;;

;; The function sort-by-length-with-filter returns a sort list by length after using filter function on the original list ;;
;; example: (sort-by-length-with-filter '(1 "yes55555" "yes22" "yes4444" "yes333" "yes1"))-> '("yes1" "yes22" "yes333" "yes4444" "yes55555") ;;

;; The function make-list-of-size-two returns a list contains the first and the last elements;;
;; example: (make-list-of-size-two '(1 "yes55555" "yes22" "yes4444" "yes333" "yes1"))-> '(1 "yes1") ;;

;; The function  helper-short&long-list execute '(make-list-of-size-two (sort-by-length-with-filter lst))' for each element of the list;;
;; example: (helper-short&long-list '(1 "yes55555" "yes22" "yes4444" "yes333" "yes1"))-> '("yes1" "yes55555")  ;;

;; The function  short&long-lists execute helper-short&long-list for each list of the original input- list of lists;;
;; example: (short&long-lists '((any "Benny" 10 "OP" 8) (any Benny OP (2 3))))-> '(("OP" "Benny") ()) ;;


;; ! Because '(last lst)' does'nt work, I use with (list-ref lst (- (length lst) 1)) at make-list-of-size-two function for get the last element;;
;; (last '(1 2 3 4 5 6 7 8 9 10))-> last: unbound identifier in: last  ;;


(: sort-by-length-with-filter : (Listof Any) -> (U Listof String null))
(define (sort-by-length-with-filter lst)
  (sort (filter string? lst) ;;Returns a list with the elements of lst for which pred produces a true value. The pred procedure is applied to each element from first to last. it's means that return only list of string or null;;
        (lambda (s1 s2)
          (< (string-length s1) (string-length s2)))))

(: make-list-of-size-two : (U Listof String null) -> (U Listof String null))
(define (make-list-of-size-two lst)
  (cond
    [(null? lst) lst ]
    [else (list (first lst) (list-ref lst (- (length lst) 1)))]))


(: helper-short&long-list : (Listof Any) -> (U Listof String null))
(define (helper-short&long-list lst)
  (make-list-of-size-two (sort-by-length-with-filter lst)))


(: short&long-lists :(Listof (Listof Any))-> (Listof (Listof (U null  String))))
(define (short&long-lists lst-of-lst )
 (map (lambda (lst)
         (helper-short&long-list lst)) lst-of-lst))


(test (short&long-lists '((any "Benny" 10 "OP" 8) (any Benny OP (2 3)))) => '(("OP" "Benny") ())) 
(test (short&long-lists '(("2 5 5" 1 "5gg" L) (v gggg "f") ())) => '(("5gg" "2 5 5") ("f" "f") ()))
(test (short&long-lists '(("2" L) (v gggg "aviv") ())) => '(("2" "2") ("aviv" "aviv") ()))
(test (short&long-lists '(("2" L) (v gggg "") ())) => '(("2" "2") ("" "") ()))
(test (short&long-lists '(() () ())) => '(() () ()))
(test (short&long-lists '((1 2 3) (aviv any 6) (9))) => '(() () ()))