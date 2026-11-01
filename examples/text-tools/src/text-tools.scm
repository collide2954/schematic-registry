(ns text-tools)

(define (words s)
  (filter (lambda (w) (not (= w ""))) (string-split s)))

(define (slugify s)
  (re-replace (re-replace (string-downcase s) #"[^a-z0-9]+" "-") #"^-+|-+$" ""))

(define (title-case s)
  (string-join " " (map (lambda (w) (str (string-upcase (substring w 0 1)) (substring w 1))) (words s))))
