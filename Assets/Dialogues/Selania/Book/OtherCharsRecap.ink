
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
    ~ temp mentorName = translator(mentor_ActualName)
    ~ enableBigDialogue()

{
    - the_witch_and_the_frog.bookUpdate:
        Abbiamo spiegato a {player_name} l'importanza del lavoro di Franco La Rana, che fa in modo che ogni pianto venga ascoltato, ogni dolore alleviato. Privo di padroni e leggi se non quella della cura delle altre persone.
}    

{
    - the_witch_and_the_mentor.bookUpdate:
        {mentorName} ha chiesto a {player_name} di intercedere con noi, per sapere cosa noi pensiamo di {mentorName}. Noi abbiamo risposto a {player_name} che {mentorName} sta facendo un buon lavoro, ma che così come l'acqua non può essere incendio, così {mentorName} non può essere qualcosa che non è. Dopo uno scambio con {player_name}, {mentorName} ha detto che deve essere difficile avere una voce in testa, ma che magari fa sentire meno solə.
}
{
    - about_the_book.bookUpdate:
        Abbiamo anche informato {player_name} che il libro che stringe ora in mano viene aggiornato da noi mano a mano che le cose accadono, anche con ricerche altrui. E speriamo la cosa non {player_pronouns has him:gli|{player_pronouns has her:le|lə}} crei dispiacere, ma la memoria è come neve in primavera.
}

{witch_feedback.fifth_story_ended_check: cose che scopro sul fungo a fine della fifth storia.}

{witch_feedback.fourth_story_ended_check: cose che scopro sul fungo a fine della fourth storia.}

{witch_feedback.third_story_ended_check: cose che scopro sul fungo a fine della third storia.}

{
    - witch_feedback.second_story_ended_check.bookUpdate: 
        Abbiamo detto a {player_name} che la storia di {charNameTwo} è stata faticosa per {mentorName}, che le sue radici sembrano solide, ma il suo tronco ondeggia a ogni accenno di burrasca. E che {player_name} può decidere di essere sostegno, o di lasciarla cadere, e ricominciare.
}

{
    - witch_feedback.first_story_ended_check.bookUpdate:
        Abbiamo detto a {player_name} che può studiare le persone come un libro, come vorrebbe {mentorName}, ma che può anche decidere secondo quello che è giusto per {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}. Che a volte le persone hanno bisogno di venire contraddette, perché la frizzione genera fuoco e il fuoco brucia il vecchio, dando la possibilità al nuovo di crescere.
}

{
    - witch_intro.bookUpdate:
        {player_name} ha scoperto che non siamo solo un vecchio tronco, comunque. Attraverso il tronco può parlare con la voce che si sente in testa, che descrive i luoghi e altre cose di questo posto. E abbiamo detto a {player_name} che saremo la luna e un sorriso.
}

{take_this_book:Un vecchio tronco.|Un vecchio tronco, sotto le cui radici è stato trovato questo diario.}

-> rewriter_book_with_flow