
   lives_on_land(eagle).
   is_bird(eagle).
   can_fly(eagle).
   is_predatory(eagle).

   lives_on_land(parrot).
   is_bird(parrot).
   can_fly(parrot).
   not(is_predatory(parrot)).
   has_colorful_feathers(parrot).

   lives_on_land(pigeon).
   is_bird(pigeon).
   can_fly(pigeon).
   not(is_predatory(pigeon)).
   not(has_colorful_feathers(pigeon)).

   lives_on_land(ostrich).
   is_bird(ostrich).
   not(can_fly(ostrich)).
   hides_head(ostrich).


   lives_on_land(penguin).
   is_bird(penguin).
   not(can_fly(penguin)).
   not(hides_head(penguin)).
   lives_on_pole(penguin).


   lives_on_land(chicken).
   is_bird(chicken).
   not(can_fly(chicken)).
   not(hides_head(chicken)).
   not(lives_on_pole(chicken)).


   lives_on_land(jaguar).
   not(is_bird(jaguar)).
   is_mammal(jaguar).
   is_carnivorous(jaguar).
   runs_fast(jaguar).


   lives_on_land(hyena).
   not(is_bird(hyena)).
   is_mammal(hyena).
   is_carnivorous(hyena).
   not(runs_fast(hyena)).


   lives_on_land(elephant).
   not(is_bird(elephant)).
   is_mammal(elephant).
   not(is_carnivorous(elephant)).
   has_trunk(elephant).


   lives_on_land(giraffe).
   not(is_bird(giraffe)).
   is_mammal(giraffe).
   not(is_carnivorous(giraffe)).
   not(has_trunk(giraffe)).
   has_long_neck(giraffe).


   lives_on_land(zebra).
   not(is_bird(zebra)).
   is_mammal(zebra).
   not(is_carnivorous(zebra)).
   not(has_trunk(zebra)).
   not(has_long_neck(zebra)).
   has_stripes(zebra).


   lives_on_land(horse).
   not(is_bird(horse)).
   is_mammal(horse).
   not(is_carnivorous(horse)).
   not(has_trunk(horse)).
   not(has_long_neck(horse)).
   not(has_stripes(horse)).


   lives_on_land(tyrannosaur).
   not(is_bird(tyrannosaur)).
   not(is_mammal(tyrannosaur)).
   is_reptile(tyrannosaur).
   is_carnivorous(tyrannosaur).
   is_extinct(tyrannosaur).


   lives_on_land(crocodile).
   not(is_bird(crocodile)).
   not(is_mammal(crocodile)).
   is_reptile(crocodile).
   is_carnivorous(crocodile).
   not(is_extinct(crocodile)).


   lives_on_land(turtle).
   not(is_bird(turtle)).
   not(is_mammal(turtle)).
   is_reptile(turtle).
   not(is_carnivorous(turtle)).
   wear_house_on_its_back(turtle).


   lives_on_land(iguana).
   not(is_bird(iguana)).
   not(is_mammal(iguana)).
   is_reptile(iguana).
   not(is_carnivorous(iguana)).
   not(wear_house_on_its_back(iguana)).


   lives_on_land(bee).
   not(is_bird(bee)).
   not(is_mammal(bee)).
   not(is_reptile(bee)).
   can_fly(bee).
   makes_honey(bee).


   lives_on_land(mosquito).
   not(is_bird(mosquito)).
   not(is_mammal(mosquito)).
   not(is_reptile(mosquito)).
   can_fly(mosquito).
   not(makes_honey(mosquito)).
   drinks_blood(mosquito).


   lives_on_land(dragonfly).
   not(is_bird(dragonfly)).
   not(is_mammal(dragonfly)).
   not(is_reptile(dragonfly)).
   can_fly(dragonfly).
   not(makes_honey(dragonfly)).
   not(drinks_blood(dragonfly)).


   lives_on_land(spider).
   not(is_bird(spider)).
   not(is_mammal(spider)).
   not(is_reptile(spider)).
   not(can_fly(spider)).


   not(lives_on_land(platypus)).
   can_swim(platypus).
   is_mammal(platypus).
   is_oviparous(platypus).


   not(lives_on_land(dolphin)).
   can_swim(dolphin).
   is_mammal(dolphin).
   not(is_oviparous(dolphin)).


   not(lives_on_land(shark)).
   can_swim(shark).
   not(is_mammal(shark)).
   has_fins(shark).
   is_predatory(shark).


   not(lives_on_land(electriceel)).
   can_swim(electriceel).
   not(is_mammal(electriceel)).
   has_fins(electriceel).
   not(is_predatory(electriceel)).
   electrocutes(electriceel).


   not(lives_on_land(ray)).
   can_swim(ray).
   not(is_mammal(ray)).
   has_fins(ray).
   not(is_predatory(ray)).
   not(electrocutes(ray)).


   not(lives_on_land(jellyfish)).
   can_swim(jellyfish).
   not(is_mammal(jellyfish)).
   not(has_fins(jellyfish)).


   not(lives_on_land(bivalvia)).
   not(can_swim(bivalvia)).
   lives_in_shell(bivalvia).
   makes_pearls(bivalvia).


   not(lives_on_land(seasnail)).
   not(can_swim(seasnail)).
   lives_in_shell(seasnail).
   not(makes_pearls(seasnail)).


   not(lives_on_land(crab)).
   not(can_swim(crab)).
   not(lives_in_shell(crab)).
   is_shellfish(crab).
   walks_sideways(crab).


   not(lives_on_land(notostraca)).
   not(can_swim(notostraca)).
   not(lives_in_shell(notostraca)).
   is_shellfish(notostraca).
   not(walks_sideways(notostraca)).
   has_three_eyes(notostraca).


   not(lives_on_land(crayfish)).
   not(can_swim(crayfish)).
   not(lives_in_shell(crayfish)).
   is_shellfish(crayfish).
   not(walks_sideways(crayfish)).
   not(has_three_eyes(crayfish)).


   not(lives_on_land(starfish)).
   not(can_swim(starfish)).
   not(lives_in_shell(starfish)).
   not(is_shellfish(starfish)).
