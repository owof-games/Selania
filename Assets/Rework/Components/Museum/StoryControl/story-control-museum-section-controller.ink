LIST listCharacters = Mentor, PG, FirstCharacter, SecondCharacter, ThirdCharacter, FourthCharacter, TheFrog, FifthCharacter, TheKitchenFrog

LIST ink_possibileLevels = ink_empty, ink_low, ink_normal, ink_medium, ink_high
VAR firstChar_InkLevel = ink_empty
VAR fifthChar_InkLevel = ink_empty

VAR contentsBedroom = (PG)

VAR knowChitarra = false

-> main

= main

@interact

// Qui parla Chitarra. #portrait:chitarra_affectionate #speaker:Chitarra
// Questa è una scritta davvero molto lunga, e che ci metterà parecchio tempo per essere completata. È un'ottima occasione per verificare cosa succede in questi casi, visto che bisogna saltare alla fine del testo. Ora ripeterò un paio di volte tutto questo in modo da avere un testo ancora più lungo. Quindi. Dicevamo. Questa è una scritta davvero molto lunga, e che ci metterà parecchio tempo per essere completata. È un'ottima occasione per verificare cosa succede in questi casi, visto che bisogna saltare alla fine del testo. Ora ripeterò un paio di volte tutto questo in modo da avere un testo ancora più lungo. Quindi. Dicevamo. Questa è una scritta davvero molto lunga, e che ci metterà parecchio tempo per essere completata. È un'ottima occasione per verificare cosa succede in questi casi, visto che bisogna saltare alla fine del testo. Ora ripeterò un paio di volte tutto questo in modo da avere un testo ancora più lungo. Quindi. Dicevamo. #speaker:Mentore
// Qui continua a parlare Chitarra. #portrait:chitarra_affectionate #speaker:Chitarra
// Qua invece parla Mentore. #speaker:Mentore #portrait:mentore_hurry
// E ora c'è una scelta #speaker:Mentore
~ knowChitarra = false
~ firstChar_InkLevel = ink_empty
{charTag(FirstCharacter, "affectionate")}:  Qui parla Chitarra, ma non sai ancora il nome.
                                            Continuo a parlare, non sono serviti tag e mantengo lo stesso personaggio, immagine, ecc.
~ knowChitarra = true
{charTag(FirstCharacter, "affectionate")}:  Qui sono sempre io, ma ora sai il mio nome.
{charTag(FifthCharacter, "hurry")}:         Questa è una scritta davvero molto lunga, e che ci metterà parecchio tempo per essere completata. È un'ottima occasione per verificare cosa succede in questi casi, visto che bisogna saltare alla fine del testo. Ora ripeterò un paio di volte tutto questo in modo da avere un testo ancora più lungo. Quindi. Dicevamo. Questa è una scritta davvero molto lunga, e che ci metterà parecchio tempo per essere completata. È un'ottima occasione per verificare cosa succede in questi casi, visto che bisogna saltare alla fine del testo. Ora ripeterò un paio di volte tutto questo in modo da avere un testo ancora più lungo. Quindi. Dicevamo. Questa è una scritta davvero molto lunga, e che ci metterà parecchio tempo per essere completata. È un'ottima occasione per verificare cosa succede in questi casi, visto che bisogna saltare alla fine del testo. Ora ripeterò un paio di volte tutto questo in modo da avere un testo ancora più lungo. Quindi. Dicevamo.
~ firstChar_InkLevel = ink_normal
{charTag(FirstCharacter, "affectionate")}:  Qui torna a parlare Chitarra, ma ora ha dell'inchiostro.
{charTag(FifthCharacter, "hurry")}:         Qua invece parla Mentore.
                                            E ora c'è una scelta.
~ temp index = 0
+ \ {charTag(PG, "")}: Scelta 1
    ~ index = 1
+ \ {charTag(PG, "")}: Scelta 2
    ~ index = 2
+ \ {charTag(PG, "")}: Scelta 3
    ~ index = 3
-
{charTag(FirstCharacter, "affectionate")}:  Hai fatto la scelta {index}!


-> main




=== function charTag(character, mood)
// questa variabile invece è il nome realmente mostrato nell'interfaccia ("???" appena conosci la personaggia, "Chitarra" quando la conosci, ecc ecc)
~ temp actualCharacterName = charName(character)
~ return "{character}, {actualCharacterName}, {mood}"

=== function charName(character)
{character:
    - PG:
        ~ return "Marta"
    - FirstCharacter:
        {knowChitarra:
            ~ return "Chitarra"
        - else:
            ~ return "???"
        }
    - FifthCharacter:
        ~ return "Mentore"
    - else:
        ~ return "<unknown {character}>"
}