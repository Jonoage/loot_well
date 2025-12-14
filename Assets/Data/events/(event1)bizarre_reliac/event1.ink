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
'An artifact of note has been found floating in this system. It appears to be a relic of technology, it’s unclear whether it is of our species creation or another’s and frankly, the risk of danger, death and contamination is the same either way. What do you suggest we do with it?'

  
+ [Destroy it.] -> destroy
+ [Let's a have a jolly good look at it] -> look


===destroy===
'Very good. The crew will enact strict decontaminatory protocols during processing.'

  
+ [Protocols?]-> protocols


=== protocols ===
~ vilmuth_neutral = true
Blow it up. We're going to blow it up. With explosives.

A small screen appears and you watch as a small dot explodes with the force of 10 Tsar bombas.

  
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

[cash +100]
~cash = 100
 
  
 -> END

=== violent 
~ vilmuth_hide= true
An assault team is prepped and after some emotionally turbulent poetry readings, they finally snap out of it and vaporise the relic. The entire ship feels the effects immediately: a relief for some and an awkward conversation for others.

Everyone is glad not to controlled by a cursed artifact, which is always nice.

  
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
Suddenly the device blinks out of existence. 1 million crew members, (mostly the good looking ones) vanish along with it. I'm sure the economy will trickle itself back to normalcy.

  
~dopabro = true
-> END

===ignore
You decide to ignore the device as it angrily repeats its demands at you, insisting mildly that you should pay.

After some time, the device vanishes but its legal team will be in touch.

  
-> END

===regex
You have some technerds try to tinker with the device to enable its effects without paying. This appears to enrage it somewhat but your people are nothing if not persistent.

You gain access to its valuable innards. It screams as they are removed but an engineer mutes it before it becomes unpleasant.

  
-> END
