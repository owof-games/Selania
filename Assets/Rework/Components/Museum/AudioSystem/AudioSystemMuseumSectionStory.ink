LIST listCharacters = Mentor, PG, FirstCharacter, SecondCharacter, ThirdCharacter, FourthCharacter, TheFrog, FifthCharacter, TheKitchenFrog

VAR contentsBedroom = (PG)

VAR settings_gamerMode = false
LIST ink_possibileLevels = ink_empty, ink_low, ink_normal, ink_medium, ink_high
VAR firstChar_InkLevel = ink_empty
VAR secondChar_InkLevel = ink_empty
VAR thirdChar_InkLevel = ink_empty
VAR fourthChar_InkLevel = ink_empty
VAR fifthChar_InkLevel = ink_empty
VAR firstChar_relationshipIndicator = 0
VAR secondChar_relationshipIndicator = 0

-> main

= main

@interact

Playing kitchen ambient sounds #ambientSounds:kitchenSounds
Playing kitchen soundtrack #soundtrack:kitchen
Playing pond ambient sounds #ambientSounds:pondSounds
Playing normal soundtrack #soundtrack:normal

-> main