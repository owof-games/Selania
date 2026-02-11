/*
 * MUSEUM - MOVE OBJECTS FROM ROOM
*/

// must have a list with the PG in it (both list and list item identifying the PG are configurable on InkBridge)
LIST listCharacters = PG

LIST Items = Item1, Item2, ToggleItem1, ToggleItem2

// there must be a variable for each room.
// the variable name is the prefix (configurable in the InkBridge) + the room name
// the variable is a list, containing the contents of that room
VAR contentsRoom1 = (PG, Item1, Item2, ToggleItem1, ToggleItem2)
VAR contentsRoom2 = ()

-> start

= start
@interact
+ [Item1]
+ [Item2]
+ [ToggleItem1]
    {contentsRoom1 has Item1:
        ~ contentsRoom1 -= Item1
        ~ contentsRoom2 += Item1
    - else:
        ~ contentsRoom1 += Item1
        ~ contentsRoom2 -= Item1
    }
+ [ToggleItem2]
    {contentsRoom1 has Item2:
        ~ contentsRoom1 -= Item2
        ~ contentsRoom2 += Item2
    - else:
        ~ contentsRoom1 += Item2
        ~ contentsRoom2 -= Item2
    }
-
-> start