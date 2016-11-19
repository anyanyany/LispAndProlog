question_addition_procedure():-
	[read_database],
	[write_database],
	read_questions(Questions),
	display_question_list(Questions),
	read_user_question(Questions, NewQuestions),
	write_questions(NewQuestions).

display_question_list([Element | [Rest]]):-
	display_question(Element), nl,
	display_question_list(Rest).
display_question_list([]).

display_question(pytanie(Number, Text)):-
	write(Number), write(') '), write(Text).

read_user_question(Questions, NewQuestions):-
	write('Dodaj nowe pytanie do bazy danych. W tym celu wpisz je w nastepujacej formie:\n'),
	write('pytanie(tresc_pytania).\n\n'),
	write('Przykladowo: pytanie(\'Czy lubi placki?\').\nPamietaj o kropce na koncu!'), nl,
	read(Question), get_free_question_number(Questions, Number),
	transform_question(Number, Question, NewQuestion), display_question(NewQuestion),
	append(Questions, NewQuestions, NewQuestion).

transform_question(Number, pytanie(Text), pytanie(Number, Text)).
get_question_number(pytanie(Num, _), Number):-
	Number is Num+1.

get_free_question_number([_ | [Rest]], Number):-
	get_free_question_number(Rest, Number).
get_free_question_number([Elem, []], Number):-
	get_question_number(Elem, Number).


