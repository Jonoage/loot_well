VAR food = -1
VAR vilmuth_happy = false
VAR vilmuth_neutral = false
VAR vilmuth_fear = false
VAR vilmuth_shock = false
VAR vilmuth_hide = false
VAR proceed = false
VAR cash = -1
VAR crew = 0
VAR happiness = 0
VAR cleanliness = -1
VAR violence = -1
VAR deaths = -1
VAR dopabro = false
VAR dopabroken = false
EXTERNAL getName()
VAR event_name = ""
~event_name = "Ex-Mult"
 ~ vilmuth_neutral = true
-> multiverse
=== multiverse
'Lord, we have a hail. It appears to ourselves from some other wayward universe. It’s always someone worse off sire, good universes leave other universes alone, only weak universes pester their betters'


[Ignore hail]

[Take the call]

[Have the boys use the parallel-universe cannon]->nukem

===nukem
'We're well-equipped to deal with such quarrelsome lesser universes lord. We'll wipe these bastards out of every conceivable dimension.'

Vilmuth nods at a comm relay and several engineers scuttle into the room lugging cables and various devices with them. A large red button is placed before you.

[Smack it with satisfying spin and THWACK]->thwack
[Is it wise to eradicate an entire universe? Seems a little overkill for a nuisance call. Call it off.]->nah

===nah
You decide not to unigenocide an entire universe. That would really be a big ethical no-no in most circles. A faux pas at least.

The engineers seem a little dejected.

[Answer the hail]->answer
[Make your excuses]->excuses

===excuses
You might not be a killer but it's not your job to go around giving handouts to every universe suffering from existential threats. 

You opt to hang up and think no more of it. In fact, let's have the crew clean the deck as a treat.

~ cleanliness = 10
[cleanliness + 10]
->END

===answer
You answer the hail and it's just as you expected. Nightmare universe: full of snakes, drinking water is painful, moon is haunted. You wanted to be a hero so here we are. 

You feel obligated to offer the void traveller's food. 

This seemingly enrages them and they open fire on you.

Fortunately, their weapons seem to be based on launching themselves as ammunition. How did their civilis- 

You know what, forget it.

Have some goons clean up the viscera and foist a lie about spontaenous orbital meat clouds onto the crew and hope they don't ever see a copy of their own half-liquified face.
~cleanliness = -10
~happiness = -5
-> END

===thwack
The air around you sizzles and you experience a hallucinatory flash of events. A history of all things, emotions, permutations of matter and being hyper-compressed to an instant. It leaves a taste of chocolate marmite marshmallow and existential chilli tuna sandwiches on your tongue. Not bad.

[Well, are they... gone?]->gone

===gone
The engineers push one of their pack to fore to reply. 

He rubs his neck anxiously.
‘Well sir it’s like this. We haven’t really used the PUC before and it seems we might have overdone it a touch.’

[Overdone it?]->overdone

===overdone
'We may have wiped them all out sir. [AHEM] All of 'em. All of the parallel universes in the entire multiverse.'

You ponder as the scapegoat squirms, fearful of retribution.

'Very good lad. We are all fine and we can't know for sure that we've just eradicated unfathomable near-infinities of lives. All we’ve done is increase the weight and grounded nature of our own existence. Seems like a win-win for me. Vilmuth, promote this fellow at once.'

Everyone feels a little better. Multiverses are boring anyway.

[happiness +20]
[violence +3]
~happiness = 20
~violence = 3




-> END




~proceed = true
-> END
