# BATTLESHIP 
## Contributors: Nick McEnroe and Noelle Hemphill
**1. Iteration 3 did not provide an interaction pattern. How did you approach designing this iteration? If you did not get to Iteration 3, reflect on how you think you would’ve approached the design and problem solving process.**

> Although there was no interaction pattern, there was an overall design of how the game should flow.  It was quite tricky to create a spec file, since the outputs would vary based on the "computer" and user input, so we decided to use the render board as our playground tester.  By throwing a board.render method in every step, we could see what the computer was outputting.  We were able to discover bugs, as well as be pleasently surprised when everything worked on the first turn. In terms of our work flow, we decided to take one step at a time, in this order:
  >1. Menu
  >1.Player ship placement
  >1. Computer ship placement
  >1. player shot
  >1. computer shot 
  >
 >We didn't focus on any puts statements or the loop at first, esuring that one round played seamlessly before we added "fluff" methods and a game loop.
<br/>

**2. If you had one more day to work on this project, what would you work on?**

> **Nick:** I would have liked to touch one one of the iteration 4 extensions.  This would have most likely been the smart computer shot.  It would seem like a challenge, but I already had a few ideas on how to approach it. <br />
> **Noelle:** I would have liked to go through and clean up our `valid_placement` method, while I _think_ its fairly clean, I'm sure there was a more concise way to get that working

**3. Describe the pairing techniques you used while working on this project.**

We used both paired programming and asynchronous pairing during this project.  At the beginning, we used a ton of paired programming, getting used to the core methods and details of the game.  While unintentional, this gave us both a better understanding of the basic methods, so when we expanded the actual game file, implementing these methods felt seemless.

**4. Describe how feedback was shared over the course of this project.**

While there were some comments on github, most comments were shared in person.  We both felt that communication was vital to this project, and we both made sure that the other person understood new methods or new game designs that were implemented.

If we absolutely couldn't meet, Slack did suffice. 
