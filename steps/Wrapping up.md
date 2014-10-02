So, what is a class anyways?
============================
We've got one more thing to go over before we finish. The first line of the code we gave you, ```class MyMonster: Monster```, tells the computer we are defining a new class called ```MyMonster```. The ```: Monster``` after that tells the computer ```MyMonster``` inherits from ```Monster```. But what does this all mean?

A class is a special way to break up ideas into code. In this game we have a ```Monster``` class. This class hold all the information necessary for a monster to exist. It organizes a ```Monster```'s variables and functions in a way that is easy to understand and reusable. It's so reusable that when we write ```MyMonster```, we choose to inherit ```Monster```'s code. This means you did not have to write functions to handle being attacked, losing health, and all the other things we handled for you.

If this class business does not make sense to you -- dont worry. It's a concept that makes more sense as you program more. Prace makes perfect.

Last minute refresher
=====================
Variables store information for later. We used variables to store things like our monster's element and it's nickname.

Functions are pieces of code that can be called from other parts of the program. Every step we created a new function. We made functions to set up our monster (```addToBattle```) and teach it moves (```tackleMove```, ```elementalMove```, and ```swipeMove```).

If-then-else statements allow our code to react to things. We used one to check if our elemental move would work against our opponent. If it would, we used it but if it wouldn't we used tackle instead.

For-loops allow code to be repeated even if we do not know how many times we will want to repeat it yet. We used a for-loop while writing ```swipeMove``` since it could hit a randomized amount of times.

Congratulations!
================
You've done it! You have coded your own monster and won all three battles. In the first battle you learned how to call a function. In the second battle you learned how to use if-then-else statements. In the third and final battle you used a for-loop. These basic concepts are the core of all programming languages. Congratulations -- you have just begun your journey as a programmer!