% Load question file and display it to the user line by line
read_questions(Questions):-
	open('questions.pl',read,Str),
	read_questions(Str,Questions),
	close(Str).

read_questions(Stream,[]):-
	at_end_of_stream(Stream).

read_questions(Stream,[H,T]):-
	\+ at_end_of_stream(Stream),
	read(Stream, H),
	read_questions(Stream, T).

% Show all questions to the user
list_questions():-
	read_questions(Questions),
	write_questions(Questions).

write_questions([_, []]):-
	!.

write_questions([Q1,[Q2|Q]]):-
	write(Q1), nl,
	write_questions([Q2|Q]).

% Display question asked for certain feature
show_question_value(P):-
	[questions],
	pytanie(P, _, T),
	write(T), nl.
