% Start quiz

:- dynamic(stored_answer/2).
clear_stored_answers :- retract(stored_answer(_,_)),fail.
clear_stored_answers.

user_says(Q,A):-
	stored_answer(Q,A).

user_says(Q,A):-
	\+ stored_answer(Q,_),
	nl,nl,
	get_question_text(Q, Text),
	write(Text), nl,
	get_yes_or_no(Response),
	asserta(stored_answer(Q,Response)),
	Response = A.

start_quiz():-
	[read_database],
	[getyesno],	
	clear_stored_answers,
	read_animals(Animals),
	traverse_and_ask_question(Animals, no).

% Go through all animals and ask questions regarding each one of them	
traverse_and_ask_question(_, yes). % TODO: Tutaj dopisac przegladanie reszty zwierzat tym razem bez zadawania pytan
traverse_and_ask_question([], no):-
	write("Przykro mi, ale nie znam Twojego zwierzecia..."), nl,
	write("Moze uzupelnisz moja baze danych? :)"), nl.
traverse_and_ask_question([Animal | [Rest]], no):-
	ask_questions(Animal, Result),
	traverse_and_ask_question(Rest, Result).

% Ask all questions regarding your one, chosen animal
ask_questions(zwierze(Name, QuestionsYes, QuestionsNo), FinalResult):-
	ask_question_yes(QuestionsYes, Name, yes, Result),
	ask_question_no(QuestionsNo, Name, no, Result, FinalResult).

% Ask one specific question
% Answer is used to store last answer to question
% Result holds true only is we are sure about animal user was thinking about
ask_question_yes([], _, yes, yes):-!.
ask_question_yes([Qnum | Rest], Name, yes, Result):-
	user_says(Qnum, Answer),
	ask_question_yes(Rest, Name, Answer, Result).
ask_question_yes(_, _, no, no).

ask_question_no([], Name, no, yes, yes):-
	write('Twoim zwierzeciem jest '), write(Name), nl,
	!.
ask_question_no([Qnum | Rest], Name, no, yes, Result):-
	user_says(Qnum, Answer),
	ask_question_no(Rest, Name, Answer, yes, Result).
ask_question_no(_, _, yes, _, no).
ask_question_no(_, _, no, no, no).
