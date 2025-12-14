VAR vilmuth_happy = false
VAR vilmuth_neutral = false
VAR vilmuth_fear = false
VAR vilmuth_shock = false
VAR proceed = false
VAR shipName = "testShipName"

EXTERNAL getName()




-> Intro2

=== Intro2 ===
~ vilmuth_shock = true
{getName()}! A marvelous choice overseer. I think we can safely assume there's no duplicates in the fleet.

I believe that settles it. We can get right to the nitty gritty business of getting this wretched barge moving. Except...
 
+ [Except what?]
    
    -> manual



=== manual ===
~ vilmuth_fear = true
Well, we have food, and cretins to man the unpleasantly deadly physical work.

+ [Spit it out you fool!]


-> fuel

===fuel
~ vilmuth_neutral = true
The engines are empty and they must be filled by executive order. There are... unpleasantries involved my commandant but those are all nicely abstracted away. To you it will be but the click of a few buttons.
 +[WHAT?!]   -> what
     +[The very notion of such toil sickens me]   -> toil
=== what ===
~ vilmuth_fear = true
Only the first jump should require your direct gaze, I assure you. After that we can accrue some wealth and focus on enriching ourselves and having other drones deal with the labour.
+ [As long as I can remain seated, I will not have you served as a rotisserie feast]-> feast


=== toil 
~ vilmuth_neutral= true
Me too sire. Fear not, we shall employ the dregs aboard the ship to carry out the dirty work while we focus on efficiency and sweet sweet rubber ducks.

+ [hmm?] -> duckies

===duckies===
~ vilmuth_shock= true
Oh nothing. Just that our currency is a finite supply of rubber ducks but there's no time to explain that now. Let's get on with our first jump of the ship.
~proceed = true
-> END

=== function getName() ===
~ return "The dreaded error method! What a truly horrifying name"

===feast
~ vilmuth_fear = true
Vilmuth laughs nervously.

Shall we get on with our first jump, oh handsome one?

~proceed = true
-> END
