% Load question file and display it to the user line by line
read_questions(Questions):-
	open('questions.pl',read,Str),
	read_database(Str,Q),
	delete(Q, Questions),
	close(Str).

read_animals(Animals):-
	open('animals.pl',read,Str),
	read_database(Str,A),
	delete(A,Animals),
	close(Str).

read_database(Stream,[]):-
	at_end_of_stream(Stream).

read_database(Stream,[H,T]):-
	\+ at_end_of_stream(Stream),
	read(Stream, H),
	read_database(Stream, T).

% Delete last element from list
delete([_, []], []).
delete([X, Xs], [X, Last]) :- delete(Xs, Last).

% Append element to list
% append(list, new_list, element)
append([], [X, []], X).
append([X, Xs], [X, New], Elem):- append(Xs, New, Elem).

% Show all questions to the user
list_questions():-
	read_questions(Questions),
	display_questions(Questions, 1).

list_animals():-
	read_animals(Animals),
	display_questions(Animals, 1).

display_questions([], _).
display_questions([Q1|[Q]], Number):-
	write(Number), write('. '),
	write(Q1), nl,
	N is Number+1,
	display_questions(Q, N).

% Get question info	
get_question_text(Number, Text):-
	[questions],
	pytanie(_, Number, Text).
get_question_text(Predicate, Text):-
	[questions],
	pytanie(Predicate, _, Text).

get_question_number(Predicate, Number):-
	[questions],
	pytanie(Predicate, Number, _).
