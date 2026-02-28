LIST listCharacters = PG
LIST listObjects = ToRoom1, ToRoom2, QueryState, ChangeState

VAR contentsRoom1 = (PG, ToRoom2, QueryState, ChangeState)
VAR contentsRoom2 = (ToRoom1, QueryState, ChangeState)

VAR state = 0

-> main

= main

@interact
+ {contentsRoom1 has PG} [ToRoom2]
  ~ contentsRoom1 -= PG
  ~ contentsRoom2 += PG
+ [QueryState]
    Lo stato corrente è {state}. #portrait:chitarra_affectionate #speaker:Chitarra
+ [ChangeState]
    Incremento lo stato {state}. #portrait:chitarra_affectionate #speaker:Chitarra
    ~ state += 1
    Ora lo stato vale {state}. #portrait:chitarra_affectionate #speaker:Chitarra
+ {contentsRoom2 has PG} [ToRoom1]
  ~ contentsRoom1 += PG
  ~ contentsRoom2 -= PG
-


-> main