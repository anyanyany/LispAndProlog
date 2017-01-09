(defun quiz_start ()
    (load "quiz.lisp")
    (quiz)
)

(defun add_question ()
    (print "Question add")
    ;; TODO: Add question!
)
(defun add_animal ()
    (print "Animal add")
    ;; TODO: Add animal!
)

(defun main ()
    (print "Witaj w programie ZGANIJ-JAKIE-TO-ZWIERZE")
    (print "[1] Rozpocznij quiz")
    (print "[2] Dodaj pytanie")
    (print "[3] Dodaj zwierze")
    (print ">")

    (setq user_answer (string-downcase (write-to-string (read))))
    (if (equal user_answer "1") (quiz_start))
    (if (equal user_answer "2") (add_question))
    (if (equal user_answer "3") (add_animal))
)

(main)
