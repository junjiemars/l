(defun copy-file (from to)
  (with-open-file (in from :direction :input
                      :element-type 'unsigned-byte)
    (with-open-file (out to :direction :output
                         :if-exists :overwrite
                         :element-type 'unsigned-byte)
      (do ((i (read-byte in nil -1)
              (read-byte in nil -1)))
          ((minusp i))
        (declare (fixnum i))
        (write-byte i out)))))
