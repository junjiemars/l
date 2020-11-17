;;; 12.15. Environmental Queries and Settings

(scheme-version)

(scheme-version-number)

(petite?)

(threaded?)

(interactive?)

(get-process-id)

(getenv "SHELL")

(getenv "ZZZ")
(putenv "ZZZ" "___")
(string=? "___" (getenv "ZZZ"))



