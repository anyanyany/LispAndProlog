;;; Set of funtions for reading database

(defun read_animals () "Reads animals stored in a database file"
    (defvar animal_strings (read_database "animals.lisp"))
    (defvar animals nil)
    (loop for animal in animal_strings
        do (setq animals (append animals (list (read-from-string animal))))
    )
    (return-from read_animals animals)
)

(defun read_questions () "Reads questions stored in a database file"
    (defvar question_strings (read_database "questions.lisp"))
    (defvar questions nil)
    (loop for question in question_strings
        do (setq questions (append questions (list (read-from-string question))))
    )
    (return-from read_questions questions)
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
            do (format out "~a~%" obj)
        )
    )
)
