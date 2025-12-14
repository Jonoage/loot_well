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
The bridge crew report a derelict series of vessels on the edge of the system. Their layout is clearly xenos and yet no life signs register. A broadcast emanantes from a beacon within the cluster.

Something calling itself inkblot attempts speech with the crew but cannot stay on track within normal conversational boundaries. 

It's like conversing with a browser extension that offers facts about cats.

 
+ [Address inkblot]
    
    -> address



=== address

'Unknown intelligence. I am the captain of this vessel. Submit all advertising data, weapons, personally identifiable information, foodstuffs and valuables to us at once or we will annhilate your fleet.'

It responds with an oddly human voice:

-'What are you wearing? Want to grab some smoothies? Where is the best beach around here?'


+ [Berate inkblot angrily]->berate
+ [Answer honestly]->honest




===berate
~ vilmuth_neutral = true
'You dare question my rank and caloric intake? My clothes are no business of yours! Relinquish your goods and answers immediately or I will open fire.

The voice pauses for a moment before responding:

-'Hey head over to my place later. We can watch a romcom! I love a pajama party. Can you bring snacks?'

The voice pays little heed to the content of any message, but always replies. 

 +[Let's investigate]   -> investigate
 +[Initiate bombardment]-> bombs   
 
 ===honest
 'I am wearing the garb of the highest ranking member of this ship: a heavily patterned short sleeve shirt. A pair of formal dress jorts and my academy sandals. The other details are a trifle. I do not care for smoothies at this time, unless they are fruit only. The nearest beach is around 5 light years away on a lifeless planet orbiting a class G2 main-sequence yellow dwarf star.
 
 Now that I have answered your questions. Tell me, what is your purpose and current mission?'
 
 It replies:'My favourite animal is the kakapo, I once saw one in Sweden. Potatoes potatoes potatoes. You've got to be poor to eat potatoes. Really poor.'
 
 [Initiate bombardment]->bombs
     
=== bombs ===
You initiate a bombardment that ignites the entire 'fleet' if it can be called that. Several small vessels take flight into the abyss, faster than we are able to track them.

Guess we'll never know what the hell this place truly was.

Vilmuth leans in to you and offers his advice

'Sire, I love a good orbital bombardment as much as the next man but it may be prudent to consider solving some situations with a mote more...composure'



+ [Punish his impudence]-> impudence
+ [Consider his advice]-> consider
===impudence
You overstep your mark Vilmuth. If I want to scour every planet in every system we jump to, I will do so. Rightfully, wrongly, it doesn't matter. I decide. I make the decisions. I hold the keys. I am running the show.

As a punitive measure, I am ordering you to wear a frog costume of the most belittling design our lowliest janitor can muster and the entire crew are to refer to you as "Mr smelly froggy" in a babying voice, until we next jump.

Are we clear?

He winces with internal agony and regret - he nods.

[Give the janitor access to unlimited alcohol until the costume is complete]->END
===consider
I have often thought of the voices silenced and the lives ended or otherwise ruined by such actions. Perhaps I go to far in my sudden and immediate ending of billions of lives and property?

Vilmuth demurely slinks back into his advisory cot with a pleased nod.

[No. It's the universe that is wrong]->END

=== investigate
A scout fleet board a nearby hulk and report that the entire structure is labyrinthine. 

Each room is some form of trap or alien mockery of existence.

One room violently expels radiation anytime someone blinks.

Another fills rapidly with kittens until all occupants are smothered or crushed.

Some rooms possess the minds of the soldiers, projecting a separate life into their brains, a joyful, meaningful existence full of acceptance, love and respect. Decades of blissful summer days, warmed with the wealth of the soldier's wildest dreams. Then it is torn apart, atom by atom, burning loved ones, homes filled with blood, pestilence and horror, all-pervading clouds of pain and hatred, for eternities - shredding any sense of sanity. 

Death by kitten doesn't seem so bad in comparison.

[So it's a nightmare maze? That's it?]->nightmare

===nightmare
It's not only a nightmare. The scouts managed to capture a number of large crablike creatures populating the vessels. 

They seem to be devoid of sentience but are highly capable of murdering anything and everything in their immediate vicinity with their pincers. 

Convergent evolution loves a crab.


[Consider the lobster]->lobster

==lobster
You circle a cage with a snarling, hissing clawed crustacean. Vilmuth looks on in contempt, his mouth fizzing with drool a touch.

And then, he smiles.

'It tries to read us lord, but it cannot make use of our contempt. It seeks to divide us and use our weaknesses and psychoses against us.

He chuckles.

'Pathetic ganglia brained runt! Humanity was glassing worlds before your kind defaulted to such a basic genetic template. I am surprised you even evolved to use oxygen, filthy exoskeletal parasite!'

Vilmuth kicks the cage and startles the impulsive creature. One of its many eyes pops and it squeals in agony.

[Let's keep this monstrosity and make sport of it]->keep
[Let's add their kind to the menu]->menu
[Eradicate it, and the entire fleet of vessels]->bombs

===keep
You will keep this... thing. In a public spot for people to jeer at. You may even introduce it into the fighting pits for some mild entertainment.

->END
===menu
Pan fried, deep fried, stir-fried. Space-pineapple shrimp, asteroidal lemon shrimp, imitation coconut shrimp, pepper shrimp, shrimp soup, galactic shrimp stew, shrimp salad, shrimp and potatoes, shrimp burger, shrimp sandwich. That- that's about it.

->END




=== function getName() ===
~ return "The dreaded error method! What a truly horrifying name"


