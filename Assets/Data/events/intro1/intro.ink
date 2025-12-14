VAR vilmuth_happy = false
VAR vilmuth_neutral = false
VAR vilmuth_fear = false
VAR vilmuth_shock = false
VAR showShipOptions = false
-> Intro

=== Intro ===
~ vilmuth_neutral = true
After a lengthy boarding process, you step into a room with a single occupant awaiting your arrival.


The tall gaunt man smirks at you wryly.
~ vilmuth_happy = true
"A pleasure to meet you captain. My name is Vilmuth and my role is to assist you in all things.

Might I ask, how was your transfer from the Euphoria planets of the internal sector?" 
 
+ [I think I saw someone getting killed on my way in here, is that normal?]
    
    -> normal
+ [Glare contemptfully] -> glare


=== normal ===
~ vilmuth_neutral = true
Quite normal captain. You are perhaps less worldly than I expected. I do hope you're not ...squeamish?

+ [Lives are a resource Vilmuth. Your wisdom is less evident than I expected.]


-> grin

===grin
~ vilmuth_happy = true
Vilmuth grins, enjoying the barb as a sign of promise.
    -> pace
    
=== glare ===
~ vilmuth_shock = true
You glare at the toad before you. 

His attempts to undermine your authority should be noted for later, should you need reasons to liberate his favourite lung.
+[Await reasons for the pancreas. Sneer a little.]-> pace


=== pace
~ vilmuth_fear = true
Vilmuth speaks up again, less boisterously than before.

"We await your instruction, my lord. As I understand it, our pace is at your discretion and our resources are under your control."

You nod - this feels right.

+ [...and our course?] -> course

===course===
~ vilmuth_neutral = true
Our course has been set. We are to jump repeatedly and to chart the last vestiges of the galaxy. To determine the end of it and the beginning of the void.

+ [And how will we know when we reach the void?] -> void

===void
~ vilmuth_happy = true
Vilmuth smiles worryingly.

"We won't."

+ [...] -> ship


===ship
~ vilmuth_neutral = true
As lord commander of this ship, it is tradition to have you rename it. This incurs an enormous bureaucratic and financial expense and has the side benefit of confusing everyone aboard.

Did you have any names in mind?
~showShipOptions = true

+ [You'd better believe it.] -> END

