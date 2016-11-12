
:- consult('getyesno.pl').  % Use ensure_loaded if available.

% Main control procedures

start :-
   write('Program rozpoznaje zwierz�tka'),nl,
   write('Odpowiadaj na pytania Y dla tak i N dla nie.'),nl,
   clear_stored_answers,
   try_all_possibilities.

try_all_possibilities :-     % Backtrack through all possibilities...
   animal_may_be(D),
   explain(D),
   fail.

try_all_possibilities.       % ...then succeed with no further action.


animal_may_be(eagle) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,yes),
   user_says(can_fly,yes),
   user_says(is_predatory,yes),!.
   
animal_may_be(parrot) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,yes),
   user_says(can_fly,yes),
   user_says(is_predatory,no),
   user_says(has_colorful_feathers,yes),!.

animal_may_be(pigeon) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,yes),
   user_says(can_fly,yes),
   user_says(is_predatory,no),
   user_says(has_colorful_feathers,no),!.

animal_may_be(ostrich) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,yes),
   user_says(can_fly,no),
   user_says(hides_head,yes),!.

animal_may_be(penguin) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,yes),
   user_says(can_fly,no),
   user_says(hides_head,no),
   user_says(lives_on_pole,yes),!.

animal_may_be(chicken) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,yes),
   user_says(can_fly,no),
   user_says(hides_head,no),
   user_says(lives_on_pole,no),!.

animal_may_be(jaguar) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,no),
   user_says(is_mammal,yes),
   user_says(is_carnivorous,yes),
   user_says(runs_fast,yes),!.

animal_may_be(hyena) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,no),
   user_says(is_mammal,yes),
   user_says(is_carnivorous,yes),
   user_says(runs_fast,no),!.

animal_may_be(elephant) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,no),
   user_says(is_mammal,yes),
   user_says(is_carnivorous,no),
   user_says(has_trunk,yes),!.

animal_may_be(giraffe) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,no),
   user_says(is_mammal,yes),
   user_says(is_carnivorous,no),
   user_says(has_trunk,no),
   user_says(has_long_neck,yes),!.

animal_may_be(zebra) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,no),
   user_says(is_mammal,yes),
   user_says(is_carnivorous,no),
   user_says(has_trunk,no),
   user_says(has_long_neck,no),
   user_says(has_stripes,yes),!.

animal_may_be(horse) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,no),
   user_says(is_mammal,yes),
   user_says(is_carnivorous,no),
   user_says(has_trunk,no),
   user_says(has_long_neck,no),
   user_says(has_stripes,no),!.

animal_may_be(tyrannosaur) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,no),
   user_says(is_mammal,no),
   user_says(is_reptile,yes),
   user_says(is_carnivorous,yes),
   user_says(is_extinct,yes),!.

animal_may_be(crocodile) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,no),
   user_says(is_mammal,no),
   user_says(is_reptile,yes),
   user_says(is_carnivorous,yes),
   user_says(is_extinct,no),!.

animal_may_be(turtle) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,no),
   user_says(is_mammal,no),
   user_says(is_reptile,yes),
   user_says(is_carnivorous,no),
   user_says(wear_house_on_its_back,yes),!.

animal_may_be(iguana) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,no),
   user_says(is_mammal,no),
   user_says(is_reptile,yes),
   user_says(is_carnivorous,no),
   user_says(wear_house_on_its_back,no),!.

animal_may_be(bee) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,no),
   user_says(is_mammal,no),
   user_says(is_reptile,no),
   user_says(can_fly,yes),
   user_says(makes_honey,yes),!.

animal_may_be(mosquito) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,no),
   user_says(is_mammal,no),
   user_says(is_reptile,no),
   user_says(can_fly,yes),
   user_says(makes_honey,no),
   user_says(drinks_blood,yes),!.

animal_may_be(dragonfly) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,no),
   user_says(is_mammal,no),
   user_says(is_reptile,no),
   user_says(can_fly,yes),
   user_says(makes_honey,no),
   user_says(drinks_blood,no),!.

animal_may_be(spider) :-
   user_says(lives_on_land,yes),
   user_says(is_bird,no),
   user_says(is_mammal,no),
   user_says(is_reptile,no),
   user_says(can_fly,no),!.

animal_may_be(platypus) :-
   user_says(lives_on_land,no),
   user_says(can_swim,yes),
   user_says(is_mammal,yes),
   user_says(is_oviparous,yes),!.

animal_may_be(dolphin) :-
   user_says(lives_on_land,no),
   user_says(can_swim,yes),
   user_says(is_mammal,yes),
   user_says(is_oviparous,no),!.

animal_may_be(shark) :-
   user_says(lives_on_land,no),
   user_says(can_swim,yes),
   user_says(is_mammal,no),
   user_says(has_fins,yes),
   user_says(is_predatory,yes),!.

animal_may_be(electriceel) :-
   user_says(lives_on_land,no),
   user_says(can_swim,yes),
   user_says(is_mammal,no),
   user_says(has_fins,yes),
   user_says(is_predatory,no),
   user_says(electrocutes,yes),!.

animal_may_be(ray) :-
   user_says(lives_on_land,no),
   user_says(can_swim,yes),
   user_says(is_mammal,no),
   user_says(has_fins,yes),
   user_says(is_predatory,no),
   user_says(electrocutes,no),!.

animal_may_be(jellyfish) :-
   user_says(lives_on_land,no),
   user_says(can_swim,yes),
   user_says(is_mammal,no),
   user_says(has_fins,no),!.

animal_may_be(bivalvia) :-
   user_says(lives_on_land,no),
   user_says(can_swim,no),
   user_says(lives_in_shell,yes),
   user_says(makes_pearls,yes),!.

animal_may_be(seasnail) :-
   user_says(lives_on_land,no),
   user_says(can_swim,no),
   user_says(lives_in_shell,yes),
   user_says(makes_pearls,no),!.

animal_may_be(crab) :-
   user_says(lives_on_land,no),
   user_says(can_swim,no),
   user_says(lives_in_shell,no),
   user_says(is_shellfish,yes),
   user_says(walks_sideways,yes),!.

animal_may_be(notostraca) :-
   user_says(lives_on_land,no),
   user_says(can_swim,no),
   user_says(lives_in_shell,no),
   user_says(is_shellfish,yes),
   user_says(walks_sideways,no),
   user_says(has_three_eyes,yes),!.

animal_may_be(crayfish) :-
   user_says(lives_on_land,no),
   user_says(can_swim,no),
   user_says(lives_in_shell,no),
   user_says(is_shellfish,yes),
   user_says(walks_sideways,no),
   user_says(has_three_eyes,no),!.

animal_may_be(starfish) :-
   user_says(lives_on_land,no),
   user_says(can_swim,no),
   user_says(lives_in_shell,no),
   user_says(is_shellfish,no),!.


   

% Case knowledge base
%   (information supplied by the user during the consultation)


:- dynamic(stored_answer/2).

% (Clauses get added as user answers questions.)


% Procedure to get rid of the stored answers
% without abolishing the dynamic declaration

clear_stored_answers :- retract(stored_answer(_,_)),fail.
clear_stored_answers.


% Procedure to retrieve the user's answer to each question when needed,
% or ask the question if it has not already been asked

user_says(Q,A) :- stored_answer(Q,A).

user_says(Q,A) :- \+ stored_answer(Q,_),
                  nl,nl,
                  ask_question(Q),
                  get_yes_or_no(Response),
                  asserta(stored_answer(Q,Response)),
                  Response = A.


% Texts of the questions


ask_question(walks_sideways) :-
	write('Czy chodzi bokiem?'),nl.

ask_question(hides_head) :-
	write('Czy chowa g�ow� w piasek?'),nl.

ask_question(makes_honey) :-
	write('Czy daje mi�d?'),nl.

ask_question(is_predatory) :-
	write('Czy jest drapie�ny?'),nl.

ask_question(is_reptile) :-
	write('Czy jest gadem?'),nl.

ask_question(is_oviparous) :-
	write('Czy jest jajorodny?'),nl.

ask_question(is_carnivorous) :-
	write('Czy jest mi�so�erny?'),nl.

ask_question(is_bird) :-
	write('Czy jest ptakiem?'),nl.

ask_question(is_shellfish) :-
	write('Czy jest skorupiakiem?'),nl.

ask_question(is_mammal) :-
	write('Czy jest ssakiem?'),nl.

ask_question(is_extinct) :-
	write('Czy jest to wymar�y gatunek?'),nl.

ask_question(has_long_neck) :-
	write('Czy ma d�ug� szyj�?'),nl.

ask_question(has_colorful_feathers) :-
	write('Czy ma kolorowe upierzenie?'),nl.

ask_question(has_stripes) :-
	write('Czy ma paski?'),nl.

ask_question(has_fins) :-
	write('Czy ma p�etwy?'),nl.

ask_question(has_trunk) :-
	write('Czy ma tr�b�?'),nl.

ask_question(has_three_eyes) :-
	write('Czy ma troje oczu?'),nl.

ask_question(lives_on_pole) :-
	write('Czy mieszka na biegunie?'),nl.

ask_question(wear_house_on_its_back) :-
	write('Czy nosi sw�j dom na plecach?'),nl.

ask_question(drinks_blood) :-
	write('Czy pije krew?'),nl.

ask_question(electrocutes) :-
	write('Czy razi pr�dem?'),nl.

ask_question(runs_fast) :-
	write('Czy szybko biega?'),nl.

ask_question(can_fly) :-
	write('Czy umie lata�?'),nl.

ask_question(can_swim) :-
	write('Czy umie p�ywa�?'),nl.

ask_question(makes_pearls) :-
	write('Czy wytwarza per�y?'),nl.

ask_question(lives_on_land) :-
	write('Czy �yje na l�dzie?'),nl.

ask_question(lives_in_shell) :-
	write('Czy �yje w muszli?'),nl.


% Explanations 

explain(dolphin) :-
	write('To jest Delfin.'),nl.
explain(platypus) :-
	write('To jest Dziobak.'),nl.
explain(pigeon) :-
	write('To jest Go��b.'),nl.
explain(hyena) :-
	write('To jest Hiena.'),nl.
explain(jaguar) :-
	write('To jest Jaguar.'),nl.
explain(mosquito) :-
	write('To jest Komar.'),nl.
explain(horse) :-
	write('To jest Ko�.'),nl.
explain(crab) :-
	write('To jest Krab.'),nl.
explain(crocodile) :-
	write('To jest Krokodyl.'),nl.
explain(chicken) :-
	write('To jest Kura.'),nl.
explain(iguana) :-
	write('To jest Legwan.'),nl.
explain(bivalvia) :-
	write('To jest Ma��.'),nl.
explain(jellyfish) :-
	write('To jest Meduza.'),nl.
explain(eagle) :-
	write('To jest Orze�.'),nl.
explain(spider) :-
	write('To jest Paj�k.'),nl.
explain(parrot) :-
	write('To jest Papuga.'),nl.
explain(penguin) :-
	write('To jest Pingwin.'),nl.
explain(ray) :-
	write('To jest P�aszczka.'),nl.
explain(notostraca) :-
	write('To jest Przekopnica.'),nl.
explain(bee) :-
	write('To jest Pszczo�a.'),nl.
explain(crayfish) :-
	write('To jest Rak.'),nl.
explain(shark) :-
	write('To jest Rekin.'),nl.
explain(starfish) :-
	write('To jest Rozgwiazda.'),nl.
explain(elephant) :-
	write('To jest S�o�.'),nl.
explain(ostrich) :-
	write('To jest Stru�.'),nl.
explain(seasnail) :-
	write('To jest �limak morski.'),nl.
explain(tyrannosaur) :-
	write('To jest Tyranozaur.'),nl.
explain(dragonfly) :-
	write('To jest Wa�ka.'),nl.
explain(electriceel) :-
	write('To jest W�gorz elektryczny.'),nl.
explain(zebra) :-
	write('To jest Zebra.'),nl.
explain(turtle) :-
	write('To jest ��w.'),nl.
explain(giraffe) :-
	write('To jest �yrafa.'),nl.




