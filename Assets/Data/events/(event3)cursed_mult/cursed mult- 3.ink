VAR vilmuth_happy = false
VAR vilmuth_neutral = false
VAR vilmuth_fear = false
VAR vilmuth_shock = false
VAR proceed = false
VAR shipName = "testShipName"

EXTERNAL getName()



VAR event_name = ""
~event_name = "Ex-Mult"

-> multiverse

=== multiverse ===
~ vilmuth_shock = true
You recieve a hail (a message but in space). It appears to be you, uhh us -ourselves from some other wayward universe. It’s always someone worse off, good universes leave other universes alone.

+[Ignore hail]-> ignore
+[Take the call]->yello
+[Have the boys use the parallel-universe cannon]->nukem

===yello
You decide to answer the call and an image of yourself wearing a thong, a christmas jumper and a pair of oven mitts appears on screen. Alternate you is batting at something off-screen while barking. 

It's just as you expected, a nightmare universe full of snakes. Presumably they need to drink hydrochloric acid every 7 minutes to survive, and a sentient moon has commandeered their brains. 

Alternate-you speaks:

'Bonjour, nous avons remarqué que vous vous êtes approché trop près d'une de nos poches arrière interdimensionnelles. S'il vous plaît, ne nous parlez pas avec votre sale langage parallèle, prenez ces canards en caoutchouc et allez vous faire foutre. Aéroglisseur.'

Great, they also talk in some kind of insane ancient language.

+[End this call immediately!]->ignore
+[Try to establish some form of communication]->answer


===ignore
We don't have the time and resources to play hero to every dying universe, charity begins in your home universe.

Apparently, your choice to ignore the call was exactly what this parallel universe needed as they immediately teleport a vast quantity of ducks into your cargo hold.

On the viewing screen, you see a whale pop into view, the whale turns into a couch, then a slice of lemon, then a brick, then the concept of a world sat on the back of elephants, then general anxiety. 

A small fart is heard by everyone within their own skulls and at that, the interaction appears to be complete.

At least you can sell the ducks.

+[Ignorance is bliss.]->END

 === nukem
You're well-equipped to deal with such quarrelsome lesser universes. We'll wipe these bastards out of every conceivable dimension.
 
You nod at a nearby supplicant and several engineers scuttle into the room lugging cables and various devices with them. A large red button is placed before you.
 
+[Smack it with satisfying spin and THWACK!] ->thwack
+[Is it wise to eradicate an entire universe? Seems a little overkill for a nuisance call. Call it off.] ->nah

===nah
You decide not to fire on an entire unsuspecting universe. Who knows, it could have even genocided it (unigenocide?).
That would really be a big ethical no-no in most circles.
A faux pas.
Gauche perhaps.

The engineers seem disappointed.

+[Answer the hail after all] ->answer
+[Make your excuses and just ignore it. It's lunchtime.]-> excuses

===excuses
You might not be a killer but it's not your job to go around giving handouts to every universe suffering from existential threats.

You opt to hang up and think no more of it. In fact, let's have the crew clean the deck as a treat.

->END

===answer
You try to speak their language. You try throwing your shoe at the screen, screaming about men's rights, and eating a sticker. Nothing works.

Finally, you feel obligated to offer help with various gesticulations.

This is apparently an interdimensional faux-pas, your act of kindness enrages them and they open fire.

Fortunately, their weapons work by launching themselves as ammunition. 

Let's hope nobody spots a copy of their own half-liquified face stuck to a window.

This is why a text wil always beat a call. What an afternoon.->END

===thwack
The air around you sizzles and you experience a hallucinatory flash of events. A history of all things, emotions, permutations of matter and being hyper-compressed to an instant. It leaves an after taste of chocolate marmite, marshmallows and a little git of panic. 

Something in your gut is giving you the rumblies.
 
+[Well, are they... gone?]->gone


===gone
An engineer is pushed forwards from a group of anxious peers.

He rubs his neck anxiously.

'Well, sir it’s like this. We haven’t really used the parallel universe cannon before and it seems we might have overdone it a touch.’
+[Overdone it?]->overdone

===overdone
'We may have wiped them all out sir.
All of them. All of the parallel universes in the entire multiverse.'

You ponder as the scapegoat squirms, fearful of retribution.

'Everyone makes mistakes. Try not to let it happen again.'

Everyone feels a little better. Multiverses are so tedious anyway.->END






=== function getName() ===
~ return "The dreaded error method! What a truly horrifying name"


