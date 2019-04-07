#lang pl untyped

;; Function: plPrefixContained ;;
;; Input: 5 strings:
;; Because the function can return string and boolean i use with U (union) about the output type;;
;; Output: return the first elemnt that begin with "pl", if does'nt exist the function return #f;;; 
;; The purpose: The idea is use Helper function- 'helperTemplate' that use with cond for find the first element that satisfies the condition. if the element is at least length=|1| and begin with "pl" the function return this element;;

;; Example-  (test (plPrefixContained "yyyt" "TplT" "plTT" "PlPl" "plplpl") => "plTT") ;;


;;Helper functions:;;

;;To avoid duplicate code I used an helper function to be used to test the template- (and (>(string-length s1)1) (string-ci=? (substring s1 0 2) "pl")) :;;


(: helperTemplate : String -> Boolean)
(define (helperTemplate s)
  (cond
    [(and (>(string-length s)1) (string-ci=? (substring s 0 2) "pl")) #t ]
    [else #f]))



(: plPrefixContained : String String String String String -> (U Boolean String) )
(define (plPrefixContained s1 s2 s3 s4 s5)
  (cond
    [(helperTemplate s1) s1]
    [(helperTemplate s2) s2]
    [(helperTemplate s3) s3]
    [(helperTemplate s4) s4]
    [(helperTemplate s5) s5]
    [else #f]))

(test (plPrefixContained  "pl" "opl" "lpTT" "lpl" "lol") => "pl") 
(test (plPrefixContained "yyyt" "TplT" "plTT" "PlPl" "plplpl") => "plTT")
(test (plPrefixContained "yypl" "opl" "lpTT" "lpl" "lol") => false)
(test (plPrefixContained "" "" "" "" "") => false)
(test (plPrefixContained "yypl" "opl" "lpTT" "lpl" "") => false)
(test (plPrefixContained "pl1" "pl2" "pl3" "pl4" "pl5") => "pl1")
(test (plPrefixContained "arpl1" "arpl2" "arpl3" "pl4" "pl5") => "pl4")
(test (plPrefixContained "arpl1" "arpl2" "arpl3" "arpl4" "pl5") => "pl5")


