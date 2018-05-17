
(defclass sculpture ()
  (height width depth))


(defclass statue (sculpture)
  (subject))


(defclass metalwork ()
  (metal-type))


(defclass casting (metalwork)
  (metalwork))


(defclass cast-statue (statue casting)
  ())
