VAR vilmuth_happy = false
VAR vilmuth_neutral = false
VAR vilmuth_fear = false
VAR vilmuth_shock = false
VAR proceed = false
VAR shipName = "testShipName"

EXTERNAL getName()




-> thing

=== thing ===
~ vilmuth_shock = true
The solitary planet in this system is a frozen rocky earthlike. Its surface consists of various research stations, to skip over some incredibly relevant details...

You're now alone in a room with the three remaining survivors of this planet. A dark haired engineer in red. A long haired fellow with an eyepatch in blue and a sullen faced cook in yellow. Convenient color coding.

After little investigation, it becomes clear that a mimic-type hostile zenos has ravaged that settlements on this world and that one of these three is an impostor but even they do no know who.

You could shoot all 3 but the risk is that if you shoot the wrong one first, the real enemy gives you a nasty nip on the neck.

Let's figure out it out.
 
+ [What's your favourite memory from childhood?]
    
    -> story



=== story

The three look at one another, immediate clueing into the test.

Red: "I think my favorite would have to be the summer vacations spent with my family at our cabin in the mountains. We used to go hiking, fishing for robotic manta-bears, and just enjoy surviving together."

Blue: "Hmm, that's a tough one. I guess one of my favorite is when I won first place in the school science fair by burning the school down. I remember the warmth of the flames vividly."

Yellow: "Well, childhood memories are such a distant thing for me, you know? But if I had to choose, I'd say it was the time I went camping with my friends and we roasted marshmallows over the fire. Such a quintessential experience."

Revolting answers. Perhaps their lives are not worth saving. No no, we go again.


+ [What's your favourite food?]->food


===food


Red: "Ah, if we're talking comfort food, nothing beats a good old-fashioned plate of replicated lasagna! The way those synthesized layers of pasta and protein mesh together with a hint of simulated Italian seasoning, it's like a culinary hug from the printer at grandma's."

Blue: "Ortolans. There's nothing like crushing the bones and organs of a tiny bird in your mouth while your shame is covered by a cloth. My family are from a French ethno-reserve, it's normal."

Yellow: "Favorite food, you say? Well, I must say, I find myself inexplicably drawn to pizza. It can include any food really. Even pineapple! It's the melting pot of food options."

You point your pistol at all three in quick succession. Squeezing at the trigger but just managing to hold back.


[You’re in a desert walking along in the sand when all of the sudden you look down, and you see a tortoise, it’s crawling toward you. You reach down, you flip the tortoise over on its back. The tortoise lays on its back, its belly baking in the hot sun, beating its legs trying to turn itself over, but it can’t, not without your help. But you’re not helping. Why is that?]->voight
 
 ===voight
 Red: "Yeah yeah, we've all heard the tortoise one. Wasn't in the book though was it? I help the tortoise. I'm a human damnit!"
 
 Blue: Sweats and gets a little fidgety "I mean, it's a desert, it might be my own source of nutrients, I can't kill it any other way, it's cruel but this is just my way of surviving..."
 
 Yellow:"Ah, an ethical dilemma. I am no helping because that is the story you have told as the narrator. I can choose to alter the story and either help or not but the manner in which I respond determines my humanity in your eyes. Was thisss human enough for you?"
 
 Right, let's settle this.
 
 [Shoot red]->red
 [Shoot blue]-> blue
 [Shoot yellow]->yellow
 
 ===red
 You shoot red square in the face and they drop to the ground. Twitching briefly before ceasing all movement. If that guy was a shapeshifter, he's taking a long time for his encore.
 
 
 Shit. What now?
 You don't have time to discuss it.
 
 [Shoot Blue]->blue2
 [Shoot yellow]->yellow2
 
 ===red2
 You quickly aim for the red dressed potential human.
 
 'Nonononon you've got-'
 
 BANG. You shoot the human and they drop, humanly to the floor. Yep, that was a normal human. Whoops.
 
 'buaahahahahaha' - A guttural laughter fills the room as the third and final human contorts and snaps as it expands. Swelling and growing innummerable hands, eyes, teeth and tongues. Making its way toward you. 
 
 'You just shot the last two humans left alive on this planet. And now before I'
 
 BANG. BANG. BANG.
 
 You interrupt the monstrosity before it begins monologeuing. We don't have time for that. A bullet nicks a limb that had morphed into a kind of revolting meaty snake that was in the middle of digesting a leg.
 
 The pile of innards and entrails screeches, flails and ultimately dies.
 
 Fuck, I need to learn to read people. I can't keep shooting at people based on poor character judgements.
 
 [Every day is a school day]->END
 
 ===blue
 You pop a slug into blue's forehead and their head erupts. No green slime. Seems like maybe you just shot an innocent man based on a few weird questions.
 
 Everybody makes mistakes.
 
 You'd better rethink this before you get eaten.
 
 [Shoot red]->red2
 [shoot yellow]->yellow2
 
 ===blue2
 Okay, first one was practice. You aim at the clearly alien one dressed in blue and pop right into their eyepatch. They didn;t even see it coming.
 
 They drop as stone dead as they guy in ..red. Okay I'll stop!
 
 Yeah shit, nah - that one was human too. Darn, I mean they said some weird things but I guess that's not grounds for murder?
 
 'buuuuaaauaahahahahaha' - A spluttering guffaw fills the room as the third and final human distorts its from into that of an undulating mass of bone and muscle. It twists and sprouts hair, toes and countless armpits and orifices.
 
 'You just shot the last two humans left alive on this planet. And I will'
 
 BANG. BANG. BANG. BANG BANG BANG.
 
Always talkers flesh mutants. A bullet finally catches a limb that had morphed into an elbow that was trying to force one of the human's skulls into a distended nostril.
 
 The pile of innards and entrails screeches, flails and ultimately dies.
 
 'My therapist said that each day is a new beginning but today has just gone from bad to worse. Maybe I need to drink less coffee'
 
 [Chalk this one up to experience]->END
 
 ===yellow
 You blast yellow's head off with your pistol and their body erupts in viscera and blood. Horrific bladed tentacles emerge and swing at you as a creature of unimaginable grotesquery rises to fill the room. It swiftly murders the other two: engulfing red with a gangantuan whale-like mouth filled with sawing teeth, hile blue is swept up with a tentacle and squeezed into mush like a toddler squeezing the life out of a hot-dog. 
 
 You tumble as you step back blasting at new heads and growths that slither and writhe toward you.
 
 A hooved limb covered in limpet suckers and pinky toes grabs onto your ankle with a wet glrup, you reach for your Glerber serrated hunting spoon from your boot and sever the limb grasping your ankle.
 
 The creature stops. Stone dead.
 
 Huh. Well, we killed the right one.
 
 [It's the limbs. Shoot the limbs]
->END     

===yellow2
The chef has already started mutating into a horrific abomination of meat and organs that really should be on the inside. 

You blast at the creature but not before it tears the last human into small digestible chunks and feeds those chunks into various mouths and orifices erupting from a mountain of bulbous pulsating flesh.

Finally a stray round strikes at one of the many appendages of the xenos filth and it stops moving.

[Shoot the limbs. It's the first lesson in ship captaincy]->END





=== function getName() ===
~ return "The dreaded error method! What a truly horrifying name"



