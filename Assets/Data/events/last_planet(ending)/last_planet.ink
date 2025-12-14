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
-> last
=== last
This is it lord, the rightmost planet at the very edge of the galaxy. After this, there is only void. Do we progress? Is there value to be discovered out there? Is it more dangerous to stay?


[Investigate this last of planets]-> planet

[You know what? Glass it.]->glass

[The planet is irrelevant, let's just continue on into the void]->yougo

===planet
One planet should be the same as any. Its position at the outermost edge of a spiral arm should not impact the solar system of the planet itself, besides there are numerous 'outermost' systems at the edge of the disk. What makes this one even remotely remarkable?

[let's find out]->search
===search
You send a research dirigible down to the planet. Armed to the teeth of course, but also loaded up with ducks, salt, copper wire and toilet paper for trade.

The search party sends back a comms filled with static, screaming, laughter... panic. 

'Captain. You... you'd better come see this personally. There's... something you need to see. I NEED SCISSORS... 61!'

The comm snaps off and contact cannot be re-established.

You are left with 2 choices.

[We go to the planet. Ready a strike team]->yougo
[Ignore this nonsense and head on to the void]->void

===yougo
Vilmuth jumps up shaken.

'Sire I will admit something to you that I would not normally indulge. I have had visions of this... planet. Visions of you walking its surface.'

[Tell me more]-> visions
[Have you lost your mind Vilmuth?]->mental

===void
'This message reeks of foreboding. I will not waste another recon crew on it. We take it, as a sign to move on.'

Vilmuth is visibly agitated. He stands up in a flurry.

'Sire something tells me we need to know what is down on this world. I will admit something to you that I would not normally indulge. I have had visions of this... planet. Visions of you walking its surface.'

[Tell me more]-> visions
[Have you lost your mind Vilmuth?]->mental

===visions
I have had them ever since you joined this ship. Fitful waking dreams. You stand in a canyon, its walls lined with giant xenoid faces carved into the rock. A sphere on a dais at the end of the canyon beckons you to reach within its depths and when you finally reach it and touch the shimmering black surface...

[yes?]->visions2

===visions2
I awake. That is all sire. I know not what it means but I know that it is THIS planet and that it calls to you and you alone. You must travel to its surface and seek answers.

[I will travel to the surface. Prepare a strike team.]->strike
[This is foolishness]->traitor

===traitor
Vilmuth looks around the room, something is wrong.

He reaches into his robe and withdraws a coiled pistol aiming directly at your forehead.

'NONE OF YOU FUCKING PRICKS MOVE, OR I'LL EXECUTE EVER MOTHERFUCKING LAST ONE OF YOU - STARTING WITH HIM' he gestures at you with the weapon.

[Vilmuth...]->foiled

===foiled
You couldn't just head on down could you? Couldn't trust someone who has had your back through painful, tortuous decisions, necessary cruelties, downright villainy! You had to fuck up at the last bastarding step you motherless algae encrusted, incongruent fuck!

[Reach for your own weapon]->uhoh
[Micro gesture to security]->security

===security
You flare your nostrils by 5%. Raise an eyebrow 2% and aggressively waggle your tongue from side to side 400%.

Security recognise the code for attempted coup. They storm into the room, weapons pointed at Vilmuth. The leader opens his mouth and shouts:

'Drop the HHZZAAEEARRGH'

Vilmuth laughs maniacally as the entire security force drop dead simultaneously.

[Not good]->notgood

===notgood
It seems like he planned for this eventually, what he did not plan for was that one of the officers would blast Vilmuth's foot off as they dropped their melee weapon during their death-fall.

Who carries a battle-axe to a hostage situation? (RIP Lieutenant Don Plogsworth)

The loss of a foot buys enough distraction for you to tackle Vilmuth and wrestle the weapon off of him.

[Blast him]->blast
[Lock him up]->imprison

===blast
You aren't familiar with this particular weapon but you're familiar enough with pointing the angry end at a target and pulling a trigger.

A projectile erupts from the weapon with a sound like a koala being crushed in a hydraulic press and Vilmuth pulls a contorted expression as he begins to dissolve somewhat slowly.

You call in reinforcements and a specialist janitorial team.

You instruct them to keep the foot. You will have it mounted on the wall later.

[Rest up]->rest

===imprison
You pick the foot up and smack Vilmuth across the face with it. 

Satisfying.

You summon more guards and a clean up crew.

We can interrogate this clown later.

However, as the guards begin to drag Vilmuth to the holding cells, a snap like a book being dropped on the floor pierces the room.

Vilmuth's head now paints the ceiling, walls and unfortunate guards carrying him.

Interrogation will have to wait until we can figure out how to repair head explosions. In fact, let's just cancel that altogether.

[Rest up]->rest

===rest
With Vilmuth gone, you're free to consider your course once again.

His words rattled you and you consider what the best approach is for you, for the families and workers of this crew, for the humans living in the galaxy. 

[Set a course for the void]->voidbound
[Set a course back towards the inner galaxy]->galaxybound

===voidbound
Once you set off in this direction, there's no turning back. You're on your own. No more events, no more adventures. No resources. No people. No planets. Nothing.

You travel as far as your systems can take you and try to eke out a life outside of the sytem on whateer you have.

It'll be tough. You won't be able to survive forever, probably. But it's a noble cause, an attempt to get out, to try something else, to reach for something out there.

[We're voidbound. Let's go]->voidbound2
[Reconsider]->rest

===voidbound2
Committed to breaking the systemic problems of a toxic universe, you forge a new path into the stars.

How long can you last?

Your jumps from here on will not provoke events. You'll have to survive with what you have.

To be clear, this is one potential ending. Progressing further will not provoke any additional narrative.
->END

===galaxybound
Living outside of the system is unrealistic. Can it really be worth it? Would we be changing one form of doom for another?

We have to try to live within the confines of a flawed and finite galaxy. Even if we get out there and find a way to live for a while in the void, it doesn't fix anything for humanity. Billions are still headed toward inevitable collapse.

Let's just have fun for a while, do what we can to enjoy what we have and make lives easier for other people around us.

We'll get to see old friends again, keep going reliving adventures and getting resources, you might even say we were in an endless mode of some kind.

[That sounds real nice]->galaxybound2
[Reconsider]->rest

===galaxybound2
Committed to living as best you can within an unchangeable galaxy, you'll be retreading old events and playing on a coasting voyage where you'll still pickup resources and benefit from certain events.

That said, the galactic resources are finite. You are unlikely to be able to last forever.

This is a potential ending, you're free to continue on but there will be no new narrative beats, unless you've not hit them on the way here.

Events with Vilmuth will be presented as though he were still alive and faithful because I can't make an entierly separate version of the entire game without him in it.


Thanks for taking the time to play 'Give Me Some Space'. I hope you enjoyed it. 


Anyway, Take care pal.
- Baby Cannon

->END

===uhoh
Wrong call, the last of many CAPTAIN. You think millions of people want to sail into that featureless abyss? Humanity is doomed and you couldn't just let it be. Couldn't just cruise the systems. Couldn't reject the summons. Couldn't walk down the path I'd set for you, to at least die and let everyone else exist!

Vilmuth squeezes the trigger and a sound not unlike a gazelle being forced through a sieve is emitted from it.

[FNARGHSZSHLP]->ouch

===ouch
The right-hand side of your head starts to feel... fizzy. Like, a thousand friendly bees gently stinging you as they cross your skull. You feel like you are turning inside out and as your insides peel out into the world, tiny fires are set on every inch of you. 

To the outside world, you are frozen in place - slowly being turned into soup.Really cheap soup that is not even emulsified. You are beyond help.

Vilmuth has spun around and hit everyone else in the room with the same weapon to the same effect.

He has taken control.

Your death will take 6 months and every moment of it will present a fresh agony beyond even my creative abilities. 

[Darn]->darn

===darn
Darn is right. Vilmuth sought control through cunning and trickery, which to be fair is how he always presented himself. Could you have dealt with him earlier? No I didn't have the budget for that level of detail.

Could you have handled the ending situation differently? Yeah, you can go back and look if you like. Or, you know - you can ponder its meaning. Call it a day and go and play Balatro for like 500 hours (that's what I am doing right now).

Thanks for taking the time to play Give me some space. I hope you enjoyed it. 

Don't forget to hit that bell!

NL voice 'Uhh nice way to call out 95% percent of streamers who aren't me bro'
People who don't watch NL 'What the hell is this text bro?'

Anyway, Take care pal.
- Baby Cannon
->END

===strike
'NO! No. You must go alone captain. I know this to be the case. Go alone and head to a canyon on the arid peninsula I have marked on your map.'

[Very well. I will discover the truth of it]->trap
[So specific? How can you know this?]->traitor

===trap
You load up a transport vessel and travel to the coordinates laid out by Vilmuth. The planet appears to be lifeless and as you step out of the carrier vessel the temperature within the canyon is almost intolerable.

You see a dark orb shimmering in the distance.

[Head to it]->orb

===orb
As you take your first steps off of the transport, the air shatters with a bang as the transport explodes into a million shards of superheated metal and plastic. You are knocked some distance and fell into unconsciousness.

An unknown length of time later...

You heart palpitates with dread. 

You are unable to communicate with the ship, all that is left is the orb.

[continue...]->orb2

===orb2
As you get within fifteen meters or so, the orb resolves into what appears to be... a large black beach ball, crudely tethered to a nearby rock.

You finally reach it and find a single long-range communicator taped to it.

Shaking, you pick the device up and press the activator.

[Hello?]->ahoy

===ahoy
'Greetings captain.'

Vilmuth's sly voice cackles over the comms.

[Vilmuth?! WHAT IS THIS?]->vilmuth

===vilmuth
Captain, or should iI say, old friend? This conversation if what I would describe as a delicious dessert for me and a highly unpalatable apperetif for you.

Don't go acting all surprised. Did you really think I was going to let you be the captain for the rest of our extended lifespans? That I'd let you take this ship out into the lifeless void between galaxies?

This was always my plan, and quite frankly I am both amused and a little disgusted that you fell for it.

[Why me?]->victim

===victim
Oh don't go playing the victim. I have orchestrated the tactful deaths, replacements and reassignment of various predecessors and ladder climbers to get to where I am. You can't say you didn't do the same and with relish.

[Why let me live? Why not just KILL ME?]->kill

===kill
Killing you was going to happen one way or another. I thought the blast might get you but I did (successfully) intend for you to survive, and for us to have this delightful conversation. I can't reveal this plan to anyone else of course and it's nice to get it off my chest, but I would have been able to move on even if you had perished.

[What if I hadn't come down here?]->final

===final
Let's just say I had contingencies. Oh but I didn't even get to tell you about the psychosis causing neurotoxins I put into the sandwiches of the recon crew! You see, it's simply a case of taking butter and adding...

[So this is it? I'm just going to die of dehydration here?]->death

===death
Well, it's just always about you you YOU isn't it? I can't even lord it over you with the beauty of my magnificent plan. I'm going to be the last person you speak to and the only topic you can think of is yourself? 

Hedonism will get you nowhere. Look at you, you didn't even think to argue about bringing down a support team? Maybe rescuing the recon crew? 

You deserve this death, a solitary withering where even your bodie's nutrients and water will provide nothing to your environment, just as you lived your life.

[I tried to make people's lives a little better...]->failure

===failure
That may be true. Maybe in the next life, you'll focus a little harder on that and find inner peace or some nonsense. Look at me being philosophical!

Anyway, it's time for me to confirm your death to the crew. Become anointed and to take a long deep bath in melted butter.

I am terrible at goodbyes so uhhh, have a nice death!

[Shit.]->shit

===shit
As the orb beside you deflates, you consider how you could have made any number of decisions and walked away more... alive. You look up to the sky and see your final hope of ever seeing another human being blink out of existence.

Piss.

I guess it's time to die.

[Die.]->dead

===dead
This was just one of a few endings - it could have gone a whole bunch of different ways and honestly this was one of the worst ones.

Thanks for playing 'Give me some space'.

You can play the game from the beginning, go back a little bit and try out some different endings, argue with people on the internet about meanings and allegory or you can go outside and touch grass.

Take care pal. 
- Baby Cannon
->END

===glass
Vilmuth looks at you aghast.

'GLASS it sire? But.. why??'

In all likelihood, it's 

Vilmuth looks filled with apprehension. You've never seen him lose his cool like this, esepecially over a lifeless, worthless rock. This would be one glassing among many. Why might he be so freaked out?


[Mock him]->mock
[Slam that bitch (hit 'Glass Planet' button)]-> slam

===slam
You spin and bash the button marked 'GLASS PLANET' with a flourish. A brief flash illuminates the viewing window and as you peer out, you can see that what was once a lifeless dustball of a planet is now a lifeless ball of magma. 

You take a picture for the album.

Vilmuth roils with rage.

'HOW? How could you...'

[I know more than you think I do traitor]->paradox
[I just love blowing stuff up]->traitor

===paradox
Vilmuth's eyes flicker with cognition and possibilities.

You've tinkered with time haven't you? You've seen the outcomes here.

I need a variable here that checks to see if the player has played the game before.

If not, I have underestimated your vision. 

[I know about your plans to overthrow me and yes, I have seen this before and intend to make a change. Please don't explode your own head]->paradox2
[I've not seen this before but even a child could have foreseen your desire to overthrow me eventually]->idiot

===idiot
You imbecile Vilmuth. I would have given you a ship to command. You could have had any number of choices with how to progress. Instead you plan to usurp me? KILL me? Take my ship?

->myship

===myship
'YOUR ship' he explodes.

I have lived on this ship since it was built. I have connived and schemed my way to this position from echelon to echelon, underling to leader, informant to confidant. This is MY ship.

He stares into your eyes.

And then.

In an instant.

His head is replaced with a fine red mist. You even get some of it in your mouth. 

It tastes like a rotten banana but maybe not as bad.

[I hate bananas]->rest


===paradox2
You plead with Vilmuth, barter, offer solace, a personal ship


===mock
'Vilmuth you sentimental bastard. This planet is nothing. This is not a milestone or a marker, there are a thousand just like it. Glass it dispassionately, contemptuously. Hell, cast down a few political enemies and glass them on it.

Vilmuth fidgets nervously.

You live on a barge the size of this planet. On any given warp we may never return, we might travel back and forth past this system a thousand times. Why hesitate so?

[He lifts his head solemnly]->solemn
-> END

===solemn







-> END




~proceed = true
-> END
