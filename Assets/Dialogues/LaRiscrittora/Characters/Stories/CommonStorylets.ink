=== common_storylets
    {
        - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(SecondCharacter, PG) && not first_second_chit_chat:
            -> first_second_chit_chat
        
        - else:
            ->->
    }



->->


=== first_second_chit_chat
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

    {charNameOne}: Quindi non ricordi come sei arrivato qui?
    {charNameTwo}: Sì no boh.
    {charNameTwo}: No.
    {charNameTwo}: A un certo punto ero nella stazione.
    {charNameOne}: Pensi ci abbiano rapito?
    {charNameTwo}: Sarebbe DIVERTENTISSIMO!
    {charNameOne}: Bimbo, dobbiamo rivedere la tua idea di divertente!
    {charNameTwo}: Magari è stata {charNameFive}.
    {charNameOne}: Naa, mi sembra troppo grigia.
    {charNameOne}: E ligia ai doveri.
    {are_two_entities_together(Mentor, PG):{charNameFive}: Guardate che so anche divertirmi.}
    {are_two_entities_together(Mentor, PG):{charNameOne}: Come? E non dirmi col giardinaggio!}
    {are_two_entities_together(Mentor, PG):{charNameFive}: Io. Ehm. Io.}
    {charNameOne}: Comunque se fosse davvero un rapimento, credo dormirei tutto il tempo.
    {charNameOne}: Devo dormire!
    {charNameTwo}: No no no.
    {charNameTwo}: Che noia.
    {charNameTwo}: Io vorrei capire TUTTO di questo posto. Tutto!
    {charNameOne}: E tu che faresti, {name}?
    
            + [L'idea di dormirmela per qualche giorno non mi dispiace!]
                    ~ firstYellow ++
                    ~ secondBlue --
                    ~ playerYellow ++
                {charNameTwo}: Voi persone vecchie siete noiose.
                {charNameTwo}: Nemmeno la nonna pensa così tanto a dormire!
                {charNameOne}: Perché tua nonna è in pensione, e non deve pensare costantemente a PRODURRE!
  
            + [Sicuramente sono team: capiamo tutto!]
                    ~ firstYellow ++
                    ~ secondBlue --
                    ~ playerBlue ++
                {charNameTwo}: Sìì! E il nostro team batte il team SIAMO NOIOSI E DORMIAMO DI {charNameOne}!
                {charNameOne}: Sarò noiosa, ma tu arriverai ai quindici anni più ansioso di un coniglio, nanetto.

            + [Credo rimarrei a piangere terrorizzata in un angolino.]
                    ~ firstPurple ++
                    ~ secondRed --
                    ~ playerGreen ++
                {charNameTwo}: Come i bambini piccoli. No no no.
                {charNameOne}: Mi ci riconosco, totale.
                
            + [Spero per loro che non mi leggano nella mente.]
                    ~ firstPurple --
                    ~ secondYellow ++
                    ~ playerRed ++
                {charNameTwo}: Ah ah ah sarebbe divertentissimo!
                {charNameTwo}: Ora provo a pensare tantissimo alla cacca!
                {are_two_entities_together(Mentor, PG):{charNameFive}: {charNameTwo}!}
                {charNameOne}: La mia mente è limpida e innocente.
                {charNameOne}: Non posso certo dire come quella di un bambino, ascoltando le cose che dice {charNameTwo}.
                
            + [Magari chiedo loro quale sia il senso della vita.]
                    ~ firstPurple ++
                    ~ playerPurple ++
                    ~ secondYellow --
                {charNameTwo}: Fai sembrare {charNameFive} interessante così.
                {are_two_entities_together(Mentor, PG):{charNameFive}: Il tuo obiettivo segreto è farmi arrabbiare, vero?}
                {are_two_entities_together(Mentor, PG):{charNameOne}: A dirla tutta a me non sembra mica tanto segreto.}
                {charNameOne}: A me sarebbe una risposta che risolverebbe una marea di problemi.
            -    
    {charNameOne}: Bene, direi che abbiamo tutte qualcosa a cui pensare.
    {charNameOne}: Tipo, a dove farmi un pisolino.

->->