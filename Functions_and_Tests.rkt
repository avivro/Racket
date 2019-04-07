#lang pl untyped


(: is-odd? : Natural -> Boolean)
;; Function:is-odd? ;;
;; Input: Natural number:
;; Output: type output is boolean. if the input is odd return true and if the input is even return false; 
;; The purpose: The idea is like Ping Pong game. if the number is equal to zero, an immediate response is received otherwise function:is-even? call with the original input less 1. ;;
;; The function  execute (value of input+1) times until receiving a reply  by  running is-odd?/is-even? (Ping Pong) and get a boolean value.
;; For negative numbers, the function entered into an infinite loop like (test (not (is-odd? -5))) :;;
;; Example-  (is-odd? 1)-> #t ;;

(define (is-odd? x)
  (if (zero? x) false (is-even? (- x 1))))

(: is-even? : Natural -> Boolean)
;; Function: is-even? ;;
;; Input: Natural number:
;; Output: type output is boolean. if the input is even return true and if the input is odd return false; 
;; The purpose: The idea is like Ping Pong game. if the number is equal to zero, an immediate response is received otherwise function:is-odd? call with the original input less 1. ;;
;; The function  execute (value of input+1) times until receiving a reply  by  running is-odd?/is-even? (Ping Pong) and get a boolean value.
;; For negative numbers, the function entered into an infinite loop like (test (not (is-even? -5))) :;;
;; Example-  (is-odd? 1)-> #t ;;
(define (is-even? x)
  (if (zero? x) true (is-odd? (- x 1)))) 

;; tests --- is-odd?/is-even?
;;(test (not (is-odd? -5)))
;;(is-even? -5)
(test (not (is-odd? 12)))
(test (is-even? 12))
(test (not (is-odd? 0)))
(test (is-even? 0))
(test (is-odd? 1))
(test (not (is-even? 1))) 


(: every? : (All (A) (A -> Boolean) (Listof A) -> Boolean))
;; Function: every? that is template function for A type  ;;
;; Input: function for the first element (input A type and return boolean type) and the second element is List of A elements:
;; Output: type output is boolean. If at every run of the function (first element) on the A-element in the list,return true so every? return true , otherwise return false; 
;; The purpose: The idea is check condition about all the elements in the list ;;
;; Returns true if all pass pred.
(define (every? pred lst)
  (or (null? lst)
      (and (pred (first lst))
          (every? pred (rest lst))))) 

;; An example for the usefulness of this polymorphic function
(: all-even? :   (Listof Natural) -> Boolean)
;; Function: all-even? ;;
;; Input:list of numbers:
;; Output: type output is boolean. execution 'every?' function with is-even?(condition) and the original list;;
;; if all if the numbers in the list are even( or the list is empty return true, otherwise return false; 
;; The purpose: The idea is using is-even? function for check condition for all numbers in the list ;;
;; For list with negative numbers, the function entered into an infinite loop like (test (not (all-even? (list -1 4 1 6)))) ;;

(define (all-even? lst)
  (every? is-even? lst))

;; tests
(test (all-even? null))
(test (all-even? (list 0)))
(test (all-even? (list 2 4 6 8)))
(test (not (all-even? (list 1 3 5 7))))
(test (not (all-even? (list 1))))
(test (not (all-even? (list 2 4 1 6))))
;;(test (not (all-even? (list -1 4 1 6))))
 
(: every2? : (All (A B) (A -> Boolean) (B -> Boolean) (Listof A) (Listof B) -> Boolean))
;; Function: every2? that is template function for A and types ;;
;; Input: 4 parameters- first element: function (input A type and return boolean type), second element: function (input B type and return boolean type) third element:list1 of type A and fourth  element: list 2 of type B:
;; Output: type output is boolean.
;;If at every run of the function1 (first element) on the A-element (in list1 )return true and every run of the function2 (second element) on the B-element (in list2 ) so every2? return true , otherwise return false; 
;; The purpose: The idea is check 2 conditions about all the elements in list1 (condtion1) and list 2(condtion2) ;;

(define (every2? pred1 pred2  lst1 lst2)
  (or (null? lst1)
      ;; both lists assumed to be of same length;;
      (and (pred1 (first lst1))
           (pred2 (first lst2))
           (every2? pred1 pred2 (rest lst1) (rest lst2)))))

(: all-even-two? :  (Listof Natural) (Listof Natural) -> Boolean)
;; Function: all-even-two? ;;
;; Input: list1 of numbers list2 of numbers:
;; The purpose: The idea is using is-even? function for check condition for all numbers in  list1 and list 2 ;;
;; Output: type output is boolean. if all the numbers in the list1 and list 2 are even or the list is empty return true, otherwise return false; 
;; For list with negative numbers, the function entered into an infinite loop (when the first list is not empty) like (test (not (all-even-two? (list -6 4 6 8) (list 2 4 6 8))))  :;;
(define (all-even-two? lst1 lst2)
  (every2? is-even? is-even? lst1 lst2))

;; tests
(test (all-even-two? null null))
(test (all-even-two? null (list 2 4 6 8)))
(test (all-even-two? (list 0) (list 2 4 6 8 9))) ;;  lists with diffrents length (wrong implementaion)
(test (not (all-even-two? (list 2 4 6 8) (list 1 3 5 7))))
(test (not (all-even-two? (list 1) (list 5))))
(test (not (all-even-two? (list 2 4 1 6) (list 2 4 6 8))))
(test (all-even-two? null (list -1 4 6 8)))
;;(test (not (all-even-two? (list -6 4 6 8) (list 2 4 6 8))))