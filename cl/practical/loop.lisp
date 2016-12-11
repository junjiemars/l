
#||

(loop for i from 1 to 10 collecting i)

(loop for x across "the quick brown fox jumps over the lazy dog"
   couting (find x "aeiou"))


(loop for i below 10
   and a = 0 then b
   and b =1 then (+ b a)
   finally (return a))

||#     
