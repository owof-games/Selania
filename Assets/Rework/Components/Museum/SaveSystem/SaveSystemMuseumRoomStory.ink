LIST listCharacters = PG
LIST listObjects = ToRoom1, ToRoom2, QueryState, ChangeState, SaveRewritings
LIST story_endedStories = first, second, third, fourth, fifth

VAR settings_gamerMode = false
LIST ink_possibileLevels = ink_empty, ink_low, ink_normal, ink_medium, ink_high
VAR firstChar_InkLevel = ink_empty
VAR secondChar_InkLevel = ink_empty
VAR thirdChar_InkLevel = ink_empty
VAR fourthChar_InkLevel = ink_empty
VAR fifthChar_InkLevel = ink_empty
VAR firstChar_relationshipIndicator = 0
VAR secondChar_relationshipIndicator = 0
VAR glyph_actualActiveSigil = ()
VAR glyph_actualSigilUses = 0



VAR contentsRoom1 = (PG, ToRoom2, QueryState, ChangeState, SaveRewritings)
VAR contentsRoom2 = (ToRoom1, QueryState, ChangeState, SaveRewritings)

VAR state = 0

-> main

= main

@interact
+ {contentsRoom1 has PG} [ToRoom2]
  ~ contentsRoom1 -= PG
  ~ contentsRoom2 += PG
+ {contentsRoom2 has PG} [ToRoom1]
  ~ contentsRoom1 += PG
  ~ contentsRoom2 -= PG
+ [QueryState]
    TheWitch, , witch_first_quarter: Lo stato corrente è {state}.
+ [ChangeState]
    TheWitch, , witch_first_quarter: Incremento lo stato {state}.
    ~ state += 1
    TheWitch, , witch_first_quarter: Ora lo stato vale {state}.
+ [SaveRewritings]
  ~ randomizeCompleteStories()
  TheWitch, , witch_first_quarter: Ora le storie completate sono: {story_endedStories}.
-


-> main


=== function randomizeCompleteStories()
~ story_endedStories = ()
~ _randomizeCompleteStoriesInner(RANDOM(0, LIST_COUNT(LIST_ALL(story_endedStories))))

=== function _randomizeCompleteStoriesInner(count)
{count:
  - 0:
    ~ return
  - else:
    ~ story_endedStories += LIST_RANDOM(LIST_ALL(story_endedStories))
    ~ _randomizeCompleteStoriesInner(count - 1)
}