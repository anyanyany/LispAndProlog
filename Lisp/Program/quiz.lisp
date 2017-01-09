(defun ask (question_text)
    (print question_text)
    (setq user_answer (string-downcase (write-to-string (read))))
    (if (not (equal user_answer "yes"))
        (setq user_answer "no")
    )
    (return-from ask user_answer)
)

(defmacro ask_questions (for questions_number in questions_list using question_data and saved_answers expect expected_answer)
    (let ((questions (gensym)) (question_dict (gensym)) (expected (gensym)) (answers (gensym)))
        `(let ((questions ,questions_list) (answers ,saved_answers) (question_dict ,question_data) (expected ,expected_answer))
        (block question_asking_loop
            (loop for q in questions
                do (loop for d in question_dict
                    do (setq qnum (nth 0 d))
                    do (setq qtxt (nth 1 d))
                    do (when (equal q qnum)
                        (setq answer (gethash qnum answers))

                        ;; Ask question and get the answer (store it too)
                        (when (not answer)
                            (setq answer (ask qtxt))
                            (setf (gethash qnum answers) answer)
                        )

                        ;; Check if it was the question we were looking for?
                        (if (not (equal answer expected))
                            (return-from question_asking_loop "no")
                        )
                    )
                )
            )
            )
        )
    )
)

(defun ask_about (animal data)
    (setq yes_questions (nth 1 animal))
    (setq no_questions (nth 2 animal))
    (setq questions (nth 0 data))
    (setq saved_answers (nth 1 data))
    (setq is_end (gethash 999 saved_answers))

    (when (not is_end)
        (setq is_ok (ask_questions for q in yes_questions using questions and saved_answers expect "yes"))
        (if (not is_ok)
            (setq is_ok (ask_questions for q in no_questions using questions and saved_answers expect "no"))
        )
        (when (not is_ok)
            (print (concatenate 'string "Twoim zwierzeciem jest " (nth 0 animal)))
            (setf (gethash 999 saved_answers) "yes")
        )
    )
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
    (print "Zaczynamy quiz!")
    (print "Odpowiedzi yes/no")
    (setq saved_answers (make-hash-table))
    (setq animals (read_animals))
    (setq questions (read_questions))
    ; (ask_about (nth 0 animals) questions)
    (foreach animal in animals apply #'ask_about with (list questions saved_answers))
)

(load "read_database.lisp")
(quiz)
