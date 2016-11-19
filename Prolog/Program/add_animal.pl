animal_addition_procedure():-
	[read_database],
	[write_database],
	read_animals(Animals),
	read_user_animal(Animals, NewAnimals),
	write_animals(NewAnimals).

display_animal_list([Element | [Rest]], Number):-
	write(Number), write(') '),
	display_animal(Element), nl,
	Number2 is Number+1,
	display_animal_list(Rest, Number2).
display_animal_list([], _).

display_animal(zwierze(Name, YesQuestions, NoQuestions)):-
	write(Name), nl,
	show_animal_questions(YesQuestions, ' :Y'),
	show_animal_questions(NoQuestions, ' :N').

show_animal_questions([Question | Rest], Answer):-
	get_question_text(Question, Text),
	write('\t'), write(Text), write(Answer), nl,
	show_animal_questions(Rest, Answer).
show_animal_questions([], _).

read_user_animal(Animals, NewAnimals):-
	write('Dodaj swojego zwierzaka do bazy. W tym celu wpisz go w nastepujacej formie:\n'),
	write('zwierze(nazwa_zwierzaka, [numery_pytan_z_odpowiedzia_na_tak], [numery_pytan_z_odpowiedzia_na_nie]).\n\n'),
	write('Przykladowo: zwierze(przekopnica, [9, 17], [26, 24, 27, 1]).\nPamietaj o kropce na koncu!'), nl,
	read(Animal), display_animal(Animal),
	append(Animals, NewAnimals, Animal).
