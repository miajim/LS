**Keeping score**
Since score is a numeric value (unlike the move options), there isn't much
complexity to it in the context of this game, so I don't think there's much
value in creating its own class. Score is also closely associated with the
player, so it should probably be an instance variable of player objects to
indicate and update the current state.

**Adding a class for each move**
I don't think it's entirely necessary to create a class for each move, since
the logic could've been accomplished using a case statement and strings
representing the moves within Move#beats?. Perhaps if more moves were added
or if moves had additional functionality, then it could make sense to create and
maintain subclasses of the Move class.

**Keep track of a history of moves**
This was easily accomplished by setting the @moves attribute within the Player
(Human/Computer) class to an array. The moves should be associated with each
object, thus it makes sense to store the values in an instance variable.

**Computer personalities**
It was easy to implement a case statement within the computer class for this;
if the computer personalities required more capabilities, then I think it
would make sense to create individual classes that subclass-ed from the Computer
class.