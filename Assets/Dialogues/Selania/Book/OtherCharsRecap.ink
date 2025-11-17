

=== dog_character_recap
+ {are_two_entities_together(DogRecap, PG)} [DogRecap]
~ enableBigDialogue()

dog
-> rewriter_book_with_flow



=== witch_character_recap
+ (check){are_two_entities_together(WitchRecap, PG)} [WitchRecap]
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ enableBigDialogue()

{take_this_book:Un vecchio tronco|Un vecchio tronco, sotto le cui radici ho trovato questo diario.}

//{
//    - (firstStory == StoryEnded) or (firstStory == StoryEnded): E che si ritrova con un paio di gambe.
//    
//}
//{
//    - (firstStory == StoryEnded && firstStory == StoryEnded): E che ora ha anche un busto.
//}



{
    - talking_witch.intro:
        Non è solo un vecchio tronco, comunque. Sembra che venga da qui la voce che mi sento in testa, che mi descrive i luoghi e altre cose di questo posto. Dice che è, anzi, sono tornati a precepirsi. E che saranno la luna e un sorriso.
}

{
    - talking_witch.first_story_ended_check:
        Mi hanno anche detto che posso studiare le persone come un libro, come vorrebbe Mentore, ma potrei anche decidere secondo quello che è giusto per me. Che a volte le persone hanno bisogno di venire contraddette, perché la frizzione genera fuoco e il fuoco brucia il vecchio, dando la possibilità al nuovo di crescere.
}

{
    - talking_witch.second_story_ended_check: 
        Secondo la voce, la storia di {charNameTwo} è stata faticosa per Mentore. Dice che le sue radici sembrano solide, ma il suo tronco ondeggia a ogni accenno di burrasca. E che io posso decidere di essere sostegno, o di lasciarla cadere, e ricominciare.
}
{talking_witch.third_story_ended_check: cose che scopro sul fungo a fine della third storia.}
{talking_witch.fourth_story_ended_check: cose che scopro sul fungo a fine della fourth storia.}
{talking_witch.fifth_story_ended_check: cose che scopro sul fungo a fine della fifth storia.}

-> rewriter_book_with_flow