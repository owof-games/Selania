/*
 * MUSEUM - ROOM MOVEMENT
*/

// must have a list with the PG in it (both list and list item identifying the PG are configurable on InkBridge)
LIST listCharacters = PG

LIST Items = Item1, Item2

// there must be a variable for each room.
// the variable name is the prefix (configurable in the InkBridge) + the room name
// the variable is a list, containing the contents of that room
VAR contentsRoom1 = (PG, Item1)
VAR contentsRoom2 = (Item2)

-> start

= start
@interact
+ {contentsRoom1 has (PG, Item1)} [Item1]
  ~ contentsRoom1 -= PG
  ~ contentsRoom2 += PG
+ {contentsRoom2 has (PG, Item2)} [Item2]
  ~ contentsRoom1 += PG
  ~ contentsRoom2 -= PG
-
-> start