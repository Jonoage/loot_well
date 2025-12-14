VAR food = -1
VAR vilmuth_happy = false
VAR vilmuth_neutral = false
VAR vilmuth_fear = false
VAR vilmuth_shock = false
VAR vilmuth_hide = false
VAR proceed = false
VAR cash = -1
VAR crew = 0
VAR cleanliness = -1
VAR violence = -1
VAR deaths = -1
VAR dopabro = false
VAR dopabroken = false
EXTERNAL getName()
VAR event_name = ""
~event_name = "Bizarre Relic"
 ~ vilmuth_neutral = true
-> Relic
=== Relic
'Lord an artifact of note is floating dormant in this system. It appears to be a relic of technology, it’s unclear whether it is of our species creation or another’s and frankly, the risk of danger, death and contamination is the same either way. What do you suggest we do with it?'

  
+ [Destroy it.] -> destroy
+ [Let's a have a jolly good look at it] -> look


===destroy===
'Very good captain. I will demand the crew enact strict decontaminatory protocols during processing.'

  
+ [Protocols?]-> protocols


=== protocols ===
~ vilmuth_neutral = true
'Blow it up. We're going to blow it up.'

Vilmuth taps a series of buttons into his comm link. You pull up a screen and watch as a small dot explodes with the force of 10 Tsar bombas.

  
-> END

=== look
You have the object brought aboard and within minutes, half the crew are insensate - friends biting one another, enemies making out, cats and dogs living together, mass hysteria. 

Your sealed chamber seems to protect you and a few goons from the effects. What's the plan? 

  
+ [Hope this all blows over.]-> winchester
+ [Have some of your specialists destroy the relic.]-> violent
+ [Ascertain its goals]-> goals

=== winchester 
~ vilmuth_hide= true
'There's no way we're destroying a class 2 relic.' you exclaim. 

'Seal the bulkheads and spray the crew with a a nutrient paste for a few weeks. Let's see if it cools off.'

It does cool off. After some bruised egos, unexpected marriages and high vet bills, you are able to sell the relic to a passing warmonger who can make better use of it.

[food -20]
~food = -20
[cash +100]
~cash = 100
 
  
 -> END

=== violent 
~ vilmuth_hide= true
An assault team is prepped and after some emotionally turbulent poetry readings, they finally snap out of it vaporise the relic. The entire ship feels the effect immediately. It's a relief for some and a climactic denial for others.

Everyone is glad not to controlled by some kind of cursed artifact though which is nice.

 
[violence -20]
~violence = -20

  
-> END

===goals===
~ vilmuth_hide= true
You attempt to communicate with the relic using a voice relay. 

  
+ [Dear uhh... object. What is your purpose? What do you require?]-> require


===require
To your immediate surprise, the device levitates and forces the entire crew to respond in an eerie chorus.

'This Dopabro emotional resonance battery's 500000 day free trial period has expired. Please either purchase a license or remove it from your cargo hold'

  
+ [I wish to purchase a license]-> purchase
+ [IGNORE]-> ignore
+ [Try to mess with the regex]-> regex

=== function getName() ===
~ return "The dreaded error method! What a truly horrifying name"

===purchase

The device and crew gleefully chirp up again,

'An annual galactic license for this unit can be automatically deducted from your immediate vicinity. The cost is 1m living souls. Confirm?'

  
+ [*sigh* Confirm]-> confirm

===confirm
~crew = -1
Suddenly the device blinks out of existence. 1 million crew members, mostly the good looking ones (classic) vanish along with it. This is going to really mess with the economy. You notice that a new Dopabro booth has appeared within the ship.

  
~dopabro = true
-> END

===ignore
You decide to ignore the device as it angrily repeats its demands at you, insisting mildly that you should pay.

Sure the crew are considerably less predictable but are humans ever really predictable?

After some time, the device vanishes but its effects linger considerably.

[violence +15]
~violence = 15

  
-> END

===regex
You have some technerds try to tinker with the device to enable its effects without paying. This appears to enrage it somewhat but your people are nothing if not persistent.

You gain access to a Dopabro booth although it seems to be somewhat unreliable.
~ dopabroken = true
~proceed = true

  
-> END
