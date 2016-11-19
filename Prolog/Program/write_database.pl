write_questions(Questions):-
	open('questions.pl', write, Stream),
	write_question_database(Stream, Questions),
	close(Stream).

write_animals(Animals):-
	open('animals.pl', write, Stream),
	write_database(Stream, Animals),
	close(Stream).

write_database(Stream, [Element | [Rest]]):-
	write(Stream, Element), write(Stream, '.'), nl(Stream),
	write_database(Stream, Rest).
write_database(_, []).
	
write_question_database(Stream, [pytanie(Num, Text) | [Rest]]):-
	write(Stream, 'pytanie('), write(Stream, Num), write(Stream, ', \''),
	write(Stream, Text), write(Stream, '\').'), nl(Stream),
	write_question_database(Stream, Rest).
write_question_database(_, []).
