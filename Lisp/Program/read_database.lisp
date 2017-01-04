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

(defmacro ask (question_text and expect answer_text)
    (let ((question (gensym)) (answer (gensym)) (user_answer (gensym)))
        `(let ((question ,question_text) (answer ,answer_text))
            (print question)
            (setq user_answer (string-downcase (write-to-string (read))))
            (if (not (equal user_answer answer))
                ;; TODO: save answer miss :(
                (print "Nie tego sie spodziewalem! :(")
            )
        )
    )
    ;; TODO: Return miss or hit info
)

(defmacro ask_questions (for questions_number in questions_list using question_data expect expected_answer)
    (let ((questions (gensym)) (question_dict (gensym)) (expected (gensym)))
        `(let ((questions ,questions_list) (question_dict ,question_data) (expected ,expected_answer))
            (loop for q in questions
                do (loop for d in question_dict
                    do (setq qnum (nth 0 d))
                    do (setq qtxt (nth 1 d))
                    do (if (equal q qnum)
                        ;; TODO: Save answers!
                        (ask qtxt and expect expected)
                    )
                )
            )
        )
    )
)

(defun ask_about (animal questions)
    (setq yes_questions (nth 1 animal))
    (setq no_questions (nth 2 animal))
    (ask_questions for q in yes_questions using questions expect "yes")
    (ask_questions for q in no_questions using questions expect "no")
)

(defmacro foreach (element in list apply function with parameters)
    ;; Macro for applying function to each element in list with other optional parameters
    ;; function parameter has to be provided in form of function hadle
    ;; e.g. #'function_name

    (let ((element_list (gensym)) (fun (gensym)) (params (gensym)))
        `(let ((element_list ,list) (fun ,function) (params ,parameters))
            (loop for e in element_list
                do (funcall fun e params)
            )
        )
    )
)

(defun quiz ()
    (setq animals (read_animals))
    (setq questions (read_questions))
    ; (ask_about (nth 0 animals) questions)
    (foreach animal in animals apply #'ask_about with questions)
)

(quiz)
