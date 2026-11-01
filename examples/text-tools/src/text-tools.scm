(ns text-tools)

(define (words s)
  (filter (lambda (w) (not (= w ""))) (string-split s)))

(define (slugify s)
  (string-join "-" (words (string-downcase s))))

(define (title-case s)
  (string-join " " (map (lambda (w) (str (string-upcase (substring w 0 1)) (substring w 1))) (words s))))
