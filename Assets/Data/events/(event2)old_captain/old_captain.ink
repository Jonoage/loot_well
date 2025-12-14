VAR vilmuth_happy = false
VAR vilmuth_neutral = false
VAR vilmuth_fear = false
VAR vilmuth_shock = false
VAR proceed = false
VAR shipName = "testShipName"

EXTERNAL getName()




-> Oldboss

=== Oldboss ===
~ vilmuth_shock = true
While you are pre-occupied with some quality videogames - a large, overweight, sweaty man barges into your office.
 
+ [Who dares disturb me during wellness hour?!]
    
    -> wellness



=== wellness ===
~ vilmuth_fear = true
'Who in the flying shit are YOU?' the rotund oaf barks.

Your guards sieze the man and you give the signal to hold him in place.

+ [I dictate the running of this vessel you blithering imbecile.]


-> imbecile

===imbecile
~ vilmuth_neutral = true
'You? You're..??' 

The man's face roils with barely controllable rage.

'I AM THE CAPTAIN OF THIS SHIP. RELEASE ME AT ONCE!!' He growls. 

Collecting some level of composure he turns his attention to the 8ft tall behemoths currently restraining him. 

'DO YOU NOT RECOGNISE ME? GUARDS, UNHAND ME AND TAKE THIS FOOL TO THE HOLDING CELLS.'

 +[Captain? Isn't this a casino or space station or something?]   -> lunatics
 +[Ask the guards for their input]   -> why
     
=== lunatics ===
~ vilmuth_fear = true
The corpulent man's rage boils over anew.

'I have only just managed to crawl out from cheese storage! Your lowly thugs cast me down into the cheese pits and assumed me dead! Yet here I AM. How do you have the gall to take ownership of my vessel.'

Now that he mentions it, this man REEKS of cheese. Far more than even your average citizen.

+ [The man writhes in continued anger]-> outrage

=== why
The guards shrug. 

'We listen to whoever pays.'

You nod and send all the guards nearby an immediate cash bonus.

'What can you offer us monetarily?

The man can barely contain himself and begins to berate you but a guard gives him a belt to the back of his head to calm his nerves.

As the man regains his senses, his stench assaults your nostrils.

+ [Good lord man, you smell abhorrent.]-> lunatics

=== outrage 
~ vilmuth_neutral= true
'How did this even happen?!' He shrieks. 'I bought this ship using my family's inheritence! That seat is MY SEAT.'

You make a mental note to have the seat washed.

+ [Smile.] -> smile

===smile===
~ vilmuth_shock= true
'Do you expect me to hand over control of a.... star.. building, with millions of human souls aboard, to a man who utterly howls of stinking bishop?

+ [Gaurds, have this corrupted cheesemonger thrown back into the pits. And this time, lock the door.] -> guards
~proceed = true
-> END

=== function getName() ===
~ return "The dreaded error method! What a truly horrifying name"

===guards
~ vilmuth_fear = true
The man kicks, shrieking and wailing as the guards drag him out of sight, mind and smell.

'Burn everything that man touched on his way here.'

~proceed = true
-> END
