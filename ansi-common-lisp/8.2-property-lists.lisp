;; In CL every symbol has a property-list, or `plist'

(get 'alizarin 'color)
(get 'alizarin 'color "green")

(setf (get 'alizarin 'color) 'red)

(get 'alizarin 'color)

(setf (get 'alizarin 'transparency) 'high)

(symbol-plist 'alizarin)

;; package -> name       -> "FOO"
;;         -> package    -> hosting
;;         -> value      0x11223344
;;         -> function   #<function>
;;         -> plist      (color red)

;; Notice that property-list are not represented as assoc-lists,
;; though they are used the same way.  It uses `eql' to compare keys.
;; 
;; In CL, property-list aren't used very much. They have largely been
;; superseded by hash tables.
