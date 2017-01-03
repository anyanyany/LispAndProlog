;;; Set of funtions for reading database

(defun read_animals () "Reads animals stored in a database file"
    (read_database "animals.lisp")
)

(defun read_questions () "Reads questions stored in a database file"
    (read_database "questions.lisp")
)

(defun read_database (filename)
    (with-open-file (stream filename)
        (loop for line = (read-line stream nil)
            while line
            collect line
        )
    )
)

(defun save_animals (animals) "Saves animals to a database file"
    (save_database animals "animals.lisp")
)

(defun save_questions (questions) "Saves questions to a database file"
    (save_database questions "questions.lisp")
)

(defun save_database (objects filename)
    (with-open-file (out filename
                     :direction :output
                     :if-exists :supersede
                     :if-does-not-exist :create)
        (loop for obj in objects
            while obj
            do (format out "~a~%" obj)
        )
    )
)

(defmacro ask_questions (for questions_number in questions_list conditional test)
    (loop for questions_number in questions_list
        do (print questions_number)
    )
)

(defmacro ask_about (animal questions)
    (let ((yes_questions (gensym)))
    `(let ((yes_questions (nth 2 ,animal)))
        (print yes_questions)
        (ask_questions for q in ,yes_questions if (= 1 1))
        (setq questions_list 42)
    ))
)

;; TODO: Remove this after testing!
(defvar animals (read_animals))
(print animals)
;(print (read_questions))
(save_database (read_animals) "list.lisp")

(ask_about (nth 0 animals) (read_questions))

