VAR vilmuth_happy = false
VAR vilmuth_neutral = false
VAR vilmuth_fear = false
VAR vilmuth_shock = false
VAR proceed = false
VAR shipName = "testShipName"

EXTERNAL getName()




-> blind

=== blind ===
~ vilmuth_shock = true
A series of derelicts litter the edge of the system. No life signs. A broadcast emanates from within one cluster.

An entity calling itself inkblot makes several attempts at conversation but it's like conversing with a browser extension that offers facts about cats.

'Want to browse without hassle? Try NordicSurfSpaceShark and baste your traffic with the finest antifreeze for only seven installments of eleventy nine fifty five.'

 
+ [Address inkblot]
    
    -> address



=== address

'Unknown intelligence. Submit all advertising data, weapons, personally identifiable information, foodstuffs and valuables to us at once.'

It responds with an eerily guttural voice:

-'What are you buying? There are over seventeen mirrors in the mirror world. Get your tanks off my lawn Jeremy.'


+ [Berate inkblot angrily]->berate
+ [Answer honestly]->honest




===berate
~ vilmuth_neutral = true
You mock the voice mercilessly in a tirade that leaves you sweating and breathless. Several nearby people are visibly shaking, others vomiting.

The voice pauses for a moment before responding with total ignorance.

-'I declare bankruptcy! Blood alone moves the wheels of history. My hovercraft is full of eels.'



 +[We need to find out what is going on here]   -> investigate
 +[Initiate bombardment]-> bombs   
 
 ===honest
 'I am in the market for a new summer bow tie.
 
 Now that I have answered your questions. Tell me, what is your purpose and credit score?'
 
 It replies:'My favourite animal is the kakapo, I once saw one in Sweden. Potatoes potatoes potatoes. You've got to be poor to eat potatoes. Really poor.'
 
 +[Initiate bombardment]->bombs
     
=== bombs ===
You initiate a bombardment that ignites the entire 'fleet' if it can be called that. Several small vessels take flight into the abyss.

Guess you'll never know what the this place truly was.

I love a good orbital bombardment as much as the next person but it may be prudent to consider solving some situations with more composure.



+ [Hey I'm in charge]-> impudence
+ [Consider the advice]-> consider
===impudence
'If I want to scour every planet in every system we jump to, I will do just that. Rightfully, wrongly, it doesn't matter. I decide. I make the decisions. I hold the keys. I am running the show.'

Sure. You're the boss. Just don't expect the most interesting scenarios when you're running it all 'murder hobo'


+[Bomb this dialogue]->END
===consider
'I have often thought of the voices silenced and the lives ended or otherwise ruined by my actions. 

Perhaps I go to far in my sudden and immediate ending of billions of lives and property?'

Thanks for considering that minute possibility.

+[No. It's the universe that is wrong]->END

=== investigate
You send a thousand drones to board a nearby space hulk.  

Each labyrinthine room is reportedly some form of trap or alien mockery of existence.

One room violently expels radiation in all directions anytime someone blinks.

Another fills rapidly with kittens until all occupants are smothered.

For clarity, by drones, I meant paid workers.

One room possesses minds, projecting a virtual life into hundreds of brains. Joyful, meaningful lives full of acceptance, love and respect. Decades of blissful summer days, warmed with the wealth of the victim's wildest dreams. 
Then, it is torn away. Visions of burning loved ones, homes filled with blood. All-pervading clouds of pain. Endless torment repeated for unknown imperceptible eternities.

Those killed by kitten suddenly seem quite lucky.

+[So it's a nightmare maze made by sadist aliens?]->nightmare

===nightmare
It's not only a nightmare. We managed to capture a number of large crablike creatures populating the vessels. 

They seem to be devoid of sentience but are highly capable of murdering anything and everything in their immediate vicinity with their pincers. 

Convergent evolution loves a crab.


+[Consider the lobster]->lobster

==lobster
You circle a cage with a snarling, hissing clawed crustacean.
 
It tries to read you. It clearly seeks to use our weaknesses and psychoses against us with psychic chicanery. Classic. 

This cage is fitted with anti-chicanery technology. The hard-shelled creature recieve a jolt of electricity for its efforts.

You chuckle and kick the cage, startling the impulsive creature. 

'It's afraid.'

+[Let's keep him]->keep
+[Let's add it to the menu]->menu
+[Wipe them out. All of them]->bombs

===keep
You will keep this... thing. In a public spot for people to jeer at. You may even introduce it into the fighting pits for some mild entertainment.

->END
===menu
Pan fried, deep fried, stir-fried. Space-pineapple shrimp, asteroidal lemon shrimp, imitation coconut shrimp, pepper shrimp, shrimp soup, galactic shrimp stew, shrimp salad, shrimp and potatoes, shrimp burger, shrimp sandwich. That- that's about it.

->END




=== function getName() ===
~ return "The dreaded error method! What a truly horrifying name"


