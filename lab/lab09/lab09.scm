(define (over-or-under num1 num2) 
  (cond ((< num1 num2) -1)
        ((= num1 num2) 0)
        ((> num1 num2) 1)
  )
)

(define (make-adder num)
  (lambda (inc) (+ num inc))
)

(define (composed f g)
  (lambda (x) (f (g x)))
)

(define (repeat f n) 
  (if (= n 1)
    f
    (composed (repeat f (- n 1)) f)
  )
)

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 
  (if (= b 0)
    a
    (gcd b (modulo a b))
  )
)

(define (duplicate lst)
  (if (null? lst)  
    '()  
    (append (list (car lst) (car lst)) (duplicate (cdr lst)))
  )
)

(expect (duplicate '(1 2 3)) (1 1 2 2 3 3))

(expect (duplicate '(1 1)) (1 1 1 1))

(define (deep-map fn s)
  (cond  
    ((null? s)
     '()
    )
    ((list? (car s))
      (cons (deep-map fn (car s))
            (deep-map fn (cdr s))
      )
    )
    (else
      (cons (fn (car s))
        (deep-map fn (cdr s)))
    )
  )
)

(define foo (lambda (x y z) (if x y z)))

(foo 1 2 (print 'hi))