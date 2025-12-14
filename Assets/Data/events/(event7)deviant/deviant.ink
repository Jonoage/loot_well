VAR vilmuth_happy = false
VAR vilmuth_neutral = false
VAR vilmuth_fear = false
VAR vilmuth_shock = false
VAR proceed = false
VAR shipName = "testShipName"

EXTERNAL getName()


VAR event_name = ""
~event_name = "The Deviant"

-> disbelief

=== disbelief ===
~ vilmuth_shock = true
A man is dragged kicking and screaming before you. The guards toss him down and ensure that the bedraggled fiend cannot escape or draw close to you.

+[What is the meaning of this?]-> explain

 === explain
 A guard the size of an airport steps forward sheepishly.
 
 Apologies for bothering you with such a triviliality but this loathsome wretch has been caught…. tainting various objects, not to mention at least a year’s worth of soft furnishings and food supplies!
 
 +[How does this affect me?]->mememe
 +[Tainted?]->tainted
 
 === mememe
The giant cows guiltily.

'Of course, this is beneath your remit but it’s come to our attention that this little tossbag has violated some of your own..... personal effects.'

+[VIOLATED?]->tainted


===tainted
'How exactly has he 'violated' things?'

The guard summons the words, fighting back a revulsion reserved for finding body parts in your cereal.

'We don’t know the specifics but it’s believed he uhh… copulated with your pillow. Well, all of your pillows.... and your toothbrush.... toiletries, several breakfast items and potentially.. your gloves.'

+[Not the gloves]->reply

===reply
You stand, ready to commit this miscreant to a life of scraping the rust from the engines using his teeth. 

- The man squeals in protest.

'I didn't, I didn't it was not me sir!'

BIFF

The guard delivers a rib-crunching blow to the man’s solar plexus.

+[Hear him out]-->hear1

+[Feed him to the mosquitos on the entomology deck]->kill
+[Feed him to the giant mosquitos on the etymology deck]->kill2

===kill
The man screams in despair, he hates needles, bugs and dying. We won't understand his reasoning or the truth of what happened.

But really, who even cares? 

Wrap this one up in a neat little bow. Justice has been served.

+[I am going to need a new pair of gloves.]->END

===kill2
The man howls with agonised dread. He hates being lectured to, learning and the history of words and their meanings. Truly a fate worse than death, those mosquitos will suck every drop of attention in this man's body until he is nought but a husk.

Don't bang other people's pillows, a lesson for us all.

+[I need to install auto-kill weapons in my bedroom]->END

===kill3
Having heard a trillion stories from professional con artists, liars, bastards, thieves and people who need 3 credits because their aunt is sick and they need a fare to get to the hospital but their leg is hurt and their comms are down - you know when you are being spun a line.

'ENOUGH.' you bark.

'Guards for the love of pangea 2 would you please just take this walking sack of rancid fat and execute him?'

The guards nod, somewhat ashamedly, and immediately deny his consciousness with a merciless gesture of compliance to the sternum. They drag the man away.

You hear a distant boom and decide to lock the doors and buy new...everything.

+[Problem solved.]->END

===hear1
You hold up a hand to prevent the guard from tearing the man in half.

'Okay fella, explain yourself'

Ignoring the pain of fractured bone at the opportunity of reprieve, the man begins to sputter his reply,

- 'I was enthralled by an entity other than myself. It compelled me to act in such a way that I was unable to resist! Please sir, I wouldn't do this! I am a simple streamer and I focus on good wholesome cozy sims, I would never do this!'

+[I don't believe him. Kill him]->kill3
+[Hmm]->hear2


===hear2
The guard smacks the man to the ground with a chop to the back of his neck.

'My lord! The fool even boasted about this on his stream' barks the guard.

He proffers you a device and sure enough, a clip surfaces of the man boasting about ransacking his dignity all over your life-preserving eternity treatments at your victual station. 

'My words were not my own! In fact that is not even me but a genetically identical clone. At that timestamp, I was dutifully feeding my grandmother's man-eating toads. You can verify her visitation logs at the prison deck!'

+[Verify and validate]->hear3
+[Bullshit. Unexist this dolt]->kill3

===hear3
The guards display a valid visitation log but upon checking the video feeds from the timestamp, a person who is clearly not this man is seen handing over the documents to the prison staff.

'Can you explain why the person in the video at the prison has no arms while you clearly have 2?'

The man sweats golfball-sized droplets onto the deck.

'Well of course the video was edited by the same person who cloned and psychically manipulated me. In fact, I theorise that there is a cabal of insidious beings who threaten to use underlings like me to mock you and take control of your finances! Yes, that must be it, an upper-echelon society of bitter psychics who can't be seen and who clone and use regular folk and I bet they are xenoid affiliated and using xenoid tech! 

+[If you belive that, you'll buy anything]->kill3
+[Consider his claims carefully]->hear4

===hear4
As you begin to critique his version of events, you notice that he has managed to slip an arm our of his restraints and is rubbing his stomach in a way that nauseates you to look at.

He is gaining immense pleasure from this oration.

'Okay I think we're done here.'

As you motion the guards to have his organs replaced without anaesthetic, the man's stomach begins to make a sound that scrapes at your sanity.

+[Steel yourself]->steel

===steel
The man's stomach explodes, launching viscera across the room and knocking over the guards.

As you try to make sense of the scene, some form of half-robotic but otherwise slimy creature, slithers its way towards you from a heap of ruptured flesh.

It hisses as it leaps towards you but a guard catches it midair and crushes it underfoot.

+[Christ!]->christ

===christ
Well, maybe a cabal did want you dead.

'Guards, thank you for saving my life but in future, please refrain from bringing deranged weaponised maniacs within 10 metres of me. You can consider your annual bonus lost at any rate. You can earn it back by finding anyone involved in this and having them placed into vats of ever-so-slightly corrosive liquid until they dissolve'

+[Don't speak to strangers]->END







=== function getName() ===
~ return "The dreaded error method! What a truly horrifying name"


