; Name : Hari Kiran Jana
; Net ID: Hxj190018
; Class: 4337.HON
; Date: 02/28/2022


; This file contains the functions that were asked to be implemented in Project1.

#lang racket
(provide (all-defined-out))


; Question 1.
; This function takes two numbers and validates if one of the number is divisible by the other,
(define (divisible-by-x? x)
(lambda (y) (if(= 0(modulo y x))
               #t
               #f)))

; Question 2.
; This function takes a function as an argument and pefroms that operation on the number 4.
(define (function-4 Function)
  (Function 4))

; Question 3
(define (my-map function list) ; Defining the function with two arguments a function and list.
   (cond
     [(empty? list) empty] ; checking if the list is empty.
         [else (cons(function (first list))  ; if not empty then appending values to list.
              (my-map function (rest list)))])) ; recursive call to the my-map function.

;Question 4
(define (pair-up list1 list2) ; pairs up elements in two lists.
(cond ((null? list1) '()) ; check if the first and second list are empty. if they are then return empty list.
      ((null? list2) '())
   (else ;if not empty then get first element from 1st and 2nd list.
    (cons (list( car list1) (car list2))
          (pair-up(cdr list1) (cdr list2)))))) ;recursive call using cdr which returns the list without the first element.

;Question 5

; Main classify function that uses two helpers and recursive calls.
(define (classify function list)
    (cons (helper1 function list) (cons (helper2 function list) '() ) ) )

(define (helper1 function list) ; helper1 takes in the fucntion and the list.
    (cond 
        ((null? list) list) ;checks if the list is empty.
        ((function (car list)) (cons (car list) (helper1 function (cdr list)))) ; recursive call without the first element.
        (#t (helper1 function (cdr list))) ) )

(define (helper2 function list)
    (cond 
        ((null? list) list) ; checks if the list is null.
        ((function (car list)) (helper2 function (cdr list))) ; just directly calls the fucntion on the list. 
        (#t (cons (car list) (helper2 function (cdr list)))))) ;if true then recursivly call the next elements of the list.  

;Question 6
(define(is-member? element list)
  (cond ((null? list) #f) ; If list is empty then false.
        ((equal? element (car list)) #t) ; If the element is the first element return true.
     (else(is-member? element (cdr list))))) ;recursive call using the first element.

;Question 7
 (define(is-sorted? function list) 
   (if( <= (length list) 1) #t ; if list is length 1 then 
      (if(function (car list) (car (cdr list))) ; recursive call the function.
         ( is-sorted? function (cdr list)) #f)))
                 
                                   
; Question 8
(define (my-flatten list)
  (cond ((null? list) '()) ; checks if the list is empty.
        ((pair? (car list)); checks if the lists are a pair.
         (append (my-flatten (car list)) (my-flatten (cdr list)))) ;appends the first element and then the rest. 
        (else (cons (car list) (my-flatten (cdr list)))))); 
  
     
;Question 9
(define (upper-threshold list number) ; Function that removes elements 
  (cond ((null? list) '()) ; checking if the list is empty.
        (( < (car list) number) (cons (car list) (upper-threshold (cdr list) number))) ; adding all the numbers that are less than the limit to a list.
    (else (upper-threshold (cdr list) number)))) ;recursive call.

;Question 10
(define(my-list-ref list element)
  (cond ((null? list) (error"ERROR: Index out of bounds")) ;if the list is null then we throw an error that gives an out of bound error.
        ((= element 0 ) (car list)) ; if the elements position is 0  then we return the number.
        (else (my-list-ref (cdr list) (- element 1))))) ; else we do a recurssive call through the list.

  



