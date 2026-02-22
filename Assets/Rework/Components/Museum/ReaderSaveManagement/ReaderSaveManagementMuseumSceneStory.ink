LIST listCharacters = PG

LIST Items = CheckStatus, Bed

VAR contentsRoom = (PG, CheckStatus, Bed)
VAR status = 0

-> main

= main

@interact
+ [Bed]
  Ora verrà salvato il gioco. #speaker:... #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:witch_first_quarter
  @save
  Questa riga si trova subito dopo il comando di salvataggio. #speaker:... #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:witch_first_quarter
+ [CheckStatus]
  Lo status corrente è {status}. #speaker:... #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:witch_first_quarter
  Scegli uno status #speaker:... #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:witch_first_quarter
  ++ 0
    ~ status = 0
  ++ 1
    ~ status = 1
  ++ 2
    ~ status = 2
-

-> main