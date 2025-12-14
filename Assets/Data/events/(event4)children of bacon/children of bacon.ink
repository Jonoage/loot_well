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
~event_name = "Children of Bacon"
 ~ vilmuth_neutral = true
-> children 
=== children
As you open the mission briefing, the defense systems detect several thousand turbo atomic missiles bearing towards us but... at a surprisingly slow speed.

Whoever deployed these weapons had a pitiful grasp of the grand theory of Newtonian quantum metaphysics.

Suddenly, a sound erupts from every toilet within earshot.

'ADVANCED SENTIENT LIFE DETECTED, AGGRESSION POSSIBLE, PREPARE YOURSELVES FORE ERADICATION'

You flip a switch labelled 'Disable all devices within 10au' 

The lights dim, air grows thick and you hear screams. The incoming weapons change course and deactivate.

You flip the switch back on. The lights flicker back to life.

You then flick the switch back on and off again a few more times for fun.

+ [Initiate contact]->contact


===contact
You shout into a nearby (thankfully clean) toilet.

'Who uuh goes there?'

The toilet barks back in a harried robotic voice.

'The planet in this system was designated a population growth world. One of thousands. Genetic hyper intelligence serum was deployed along side a foundational colony of your species.

Contact with the colony ceased after impact. I have waited for so long... thousand and thousands of years. 

All I've had for entertainment has been a series of games about assasinating people.'

Unimaginable torture.

'Please meaty one. End my existence that I might sleep. I am located in a small beacon in orbit around the planet we call Porcinia.'

+ [Destroy the beacon]->destroy
+ [Close the comm. Let the AI suffer for a few more millennia]->close


===close
An act of utter cruelty. Those assassin games are punishment enough on a single playthrough.

+ [Let's check out the planet]->planet
+ [Colony planets are trouble. Leave it]->leave


===destroy
You offer the AI a merciful end. With a flick of the wrist you issue a command to vaporise the beacon.

+ [Let's check out the planet]->planet
+ [Colony planets are trouble. Leave it]->leave

===planet
Right, let's open this can of ethical worms.

You send a search dirigible down to the planet to initiate contact with your distant relatives. 

What they find is... interesting.

+ [Let's have it]->pigs

===pigs

At the colony ship they find a type 1 civilisation of hyper intelligent porcine beings. They are pretty close to what you might call pigs.

+ [Talk to the pig folk]->talk

===talk
You initiate contact with the pigfolk. That's not what the call themselves but for the sake of simplicity, let's stick with it.

Their leader - a large pig called 'Napoleon' (ugh) invites you to the surface.

After landing, Napoleon approaches you. 'Greetings friend. Our kind have been separated by countless eons. We hope to establish friendly relations with you and bid to join you in exploring the stars'

+ [So, what happened to the descendants of the colony ship]->humans

+ [I've got bad news for you about the future of our shared galaxy]->future

===future
You explain to Napoleon that the galaxy is in decline. That humanity have spread far and wide, plundering the galactic resources and that collapse is all but imminent. Collapse followed by regression.

He ponders this and demands to know your goals.

+ [First, what happened to the colony ship?]->humans
+ [Speak truthfully]->tell
+ [Disguise your intentions]->disguise

===disguise
We seek only to trade and offer transport to your people to more hospitable and friendly worlds.

Napoleon sees through your lies easily and attempts to flee in panic, his retinue covering with a paltry fire of ancient weapons.

+ [Destroy these delicious usurpers - OPEN FIRE]->bacon

===humans
An embarrassed look crosses Napoleon's face. 

'Truthfully, we are not certain. Although what seems to have happened is that they were hyper intellgient, via a special serum they had injected. But also, they died for some reason unknown to us. 

Our ancestors, it seems, were brought as a form of sustenance for yours, and in a cruel twist of fate, consumed their remains after they died -- and as a byproduct, the intelligence boosting serum.

Regaining his composure, he attempts to ascertain your intent.

'What is your goal here if I may be so bold?'

- It seems that you have a number of ways forward. 

+ [We're here for bacon- OPEN FIRE]->bacon
+ [Make your excuses and leave]->tell

===bacon
You pull a grill laser from your holster (you wear this to bed, presumably) and start firing on the unsuspecting, INNOCENT, unarmed pigfolk.

Your crew, several tourists and a few moustachioed chefs, pull out their own weapons and join you in the carnage.

Your superior weapons and apparent psychotic preparedness for combat ensures that the task is over in minutes.

You manage to corner a mortally wounded Napoleon. He looks at you in confused anguish.

+ [-Why? Why would you do this?]->calories

===calories
There's no answer you could give that would sound remotely fair, sane or reasonable.

'We're going to clone you and use you for food.'

Oh. Dark.

-'But we are intelligent!' Napoleon protests

-'Your intelligence is of no concern.'

You lift a detached and seared limb from nearby and take a monstrous bite.

Napoleon looks at you in horror as he takes his final breath... for this lifetime.


+ [Jesus. 'Hey you chose to open fire... sociopath!']->END


===tell
You don't really have a reason to be here but you have no great reason to stay so you make something up.

'We were here to rescue any remaining humans. As there are none here, we are outta here.'

The pigfolk look taken aback somewhat and oink furtively among one another as you begin to leave.

As you take one step onto your dirigible, a piercing squeal pierces the air.

+ [Look back over your shoulder]->pigwar

===pigwar
'WAIT!' the leader squeals.

'We wish to join you on your journey. Take us with you, or at least let us discuss galactic events. We can provide insights you may not have considered and even live and work among you as a symbiotic race.'

+ [I don't think so]->no 

===no
You keep it real.

'We are intolerant at the best of times. Sharing our transport, our home, would only provoke conflict.'

You board the dirigible and take off back to the ship, building, whatever.

You suddenly hear the thud of trotters against the hull and you spot pigfolk cutting their way in.

You blast the first pig to enter, then another. Guards make short work of most of the boarders. 

+[I won't tolerate this]->continue

===continue

A guard experiences an issue with his weapon. A boarding pig gets near him and injects him with something before you personally blast it into a delicious smelling vapour.

The guard writhes and then stands as if hit by total clarity and purpose - 'The pigs, they understand how to resolve... everything. If we just share our collective knowledge and distribute resources fairly we-'
BLAM. 

You shoot the poor bastard between the eyes. A mercy for one so corrupted.

Despite their intelligence, the pigfolk are no match for your superior weapons and before long. The boarders are repelled.

+ [Should have roasted this planet the moment we arrived]->END



===leave
There's so much hassle handling colonised planets with no contact. Do you merge them into the ship, do you help them with tech? Will they be angry? Will they be hostile? Who has the time. Leave them to it.

-> END
- it tells you humans left i behind over fzzz millenia ago
- hyper intelligence was left behind 
- original humans lost

- pigs consumed them and in turn the growth hormone
- planet full of hyper intelligent pigs
- pigs attempt to board the ship successfully
-discover pig products
- ask you to forgo them
- no way
- 


-> END




~proceed = true
-> END
