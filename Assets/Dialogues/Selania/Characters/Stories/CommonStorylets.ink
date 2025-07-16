=== common_storylets
    {
        - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(SecondCharacter, PG) && not first_second_chit_chat:
            -> first_second_chit_chat
        
        - else:
            ->->
    }



->->


=== first_second_chit_chat
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)

    Quindi non ricordi come sei arrivato qui? #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC: {ink_tag_c(firstCharacterInkLevel)}  #inkD: {ink_tag_d(firstCharacterInkLevel)}

    Sì no boh. #speaker:{secondChar_tag()}#inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC: {ink_tag_c(secondCharacterInkLevel)}  #inkD: {ink_tag_d(secondCharacterInkLevel)}
    No.
    A un certo punto ero nella stazione.
    Pensi ci abbiano rapito? #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC: {ink_tag_c(firstCharacterInkLevel)}  #inkD: {ink_tag_d(firstCharacterInkLevel)}

     Sarebbe DIVERTENTISSIMO! #speaker:{secondChar_tag()}#inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC: {ink_tag_c(secondCharacterInkLevel)}  #inkD: {ink_tag_d(secondCharacterInkLevel)}
    Bimbo, dobbiamo rivedere la tua idea di divertente! #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC: {ink_tag_c(firstCharacterInkLevel)}  #inkD: {ink_tag_d(firstCharacterInkLevel)}

    Magari è stata {charNameFive}. #speaker:{secondChar_tag()}#inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC: {ink_tag_c(secondCharacterInkLevel)}  #inkD: {ink_tag_d(secondCharacterInkLevel)}
    Naa, mi sembra troppo grigia. #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC: {ink_tag_c(firstCharacterInkLevel)}  #inkD: {ink_tag_d(firstCharacterInkLevel)}

    E ligia ai doveri.
    {are_two_entities_together(Mentor, PG):Guardate che so anche divertirmi.} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState
    {are_two_entities_together(Mentor, PG):Come? E non dirmi col giardinaggio!} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC: {ink_tag_c(firstCharacterInkLevel)}  #inkD: {ink_tag_d(firstCharacterInkLevel)}
    {are_two_entities_together(Mentor, PG): Io. Ehm. Io.}
    Comunque se fosse davvero un rapimento, credo dormirei tutto il tempo. #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC: {ink_tag_c(firstCharacterInkLevel)}  #inkD: {ink_tag_d(firstCharacterInkLevel)}
    Devo dormire! 
    No no no. #speaker:{secondChar_tag()}#inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC: {ink_tag_c(secondCharacterInkLevel)}  #inkD: {ink_tag_d(secondCharacterInkLevel)}
    Che noia.
    Io vorrei capire TUTTO di questo posto. Tutto!
    E tu che faresti, {name}? #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC: {ink_tag_c(firstCharacterInkLevel)}  #inkD: {ink_tag_d(firstCharacterInkLevel)}

    
            + [L'idea di dormirmela per qualche giorno non mi dispiace!]
                    ~ firstYellow ++
                    ~ secondBlue --
                    ~ playerYellow ++
                 Voi persone vecchie siete noiose. #speaker:{secondChar_tag()}#inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC: {ink_tag_c(secondCharacterInkLevel)}  #inkD: {ink_tag_d(secondCharacterInkLevel)}
                 Nemmeno la nonna pensa così tanto a dormire!
                Perché tua nonna è in pensione, e non deve pensare costantemente a PRODURRE! #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC: {ink_tag_c(firstCharacterInkLevel)}  #inkD: {ink_tag_d(firstCharacterInkLevel)}

  
            + [Sicuramente sono team: capiamo tutto!]
                    ~ firstYellow ++
                    ~ secondBlue --
                    ~ playerBlue ++
                 Sìì! E il nostro team batte il team SIAMO NOIOSI E DORMIAMO DI {charNameOne}! #speaker:{secondChar_tag()}#inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC: {ink_tag_c(secondCharacterInkLevel)}  #inkD: {ink_tag_d(secondCharacterInkLevel)}
                Sarò noiosa, ma tu arriverai ai quindici anni più ansioso di un coniglio, nanetto. #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC: {ink_tag_c(firstCharacterInkLevel)}  #inkD: {ink_tag_d(firstCharacterInkLevel)}


            + [Credo rimarrei a piangere terrorizzata in un angolino.]
                    ~ firstPurple ++
                    ~ secondRed --
                    ~ playerGreen ++
                 Come i bambini piccoli. No no no. #speaker:{secondChar_tag()}#inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC: {ink_tag_c(secondCharacterInkLevel)}  #inkD: {ink_tag_d(secondCharacterInkLevel)}
                Mi ci riconosco, totale. #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC: {ink_tag_c(firstCharacterInkLevel)}  #inkD: {ink_tag_d(firstCharacterInkLevel)}

                
            + [Spero per loro che non mi leggano nella mente.]
                    ~ firstPurple --
                    ~ secondYellow ++
                    ~ playerRed ++
                 Ah ah ah sarebbe divertentissimo!#speaker:{secondChar_tag()}#inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC: {ink_tag_c(secondCharacterInkLevel)}  #inkD: {ink_tag_d(secondCharacterInkLevel)}
                 Ora provo a pensare tantissimo alla cacca!
                {are_two_entities_together(Mentor, PG): {charNameTwo}!}#inkA: offState #inkB:offState #inkC:offState  #inkD:offState
                La mia mente è limpida e innocente. #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC: {ink_tag_c(firstCharacterInkLevel)}  #inkD: {ink_tag_d(firstCharacterInkLevel)}

                Non posso certo dire come quella di un bambino, ascoltando le cose che dice {charNameTwo}.
                
            + [Magari chiedo loro quale sia il senso della vita.]
                    ~ firstPurple ++
                    ~ playerPurple ++
                    ~ secondYellow --
                 Fai sembrare {charNameFive} interessante così. #speaker:{secondChar_tag()}#inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC: {ink_tag_c(secondCharacterInkLevel)}  #inkD: {ink_tag_d(secondCharacterInkLevel)}
                {are_two_entities_together(Mentor, PG):Il tuo obiettivo segreto è farmi arrabbiare, vero?}#inkA: offState #inkB:offState #inkC:offState  #inkD:offState
                {are_two_entities_together(Mentor, PG):A dirla tutta a me non sembra mica tanto segreto.} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC: {ink_tag_c(firstCharacterInkLevel)}  #inkD: {ink_tag_d(firstCharacterInkLevel)}
                A me sarebbe una risposta che risolverebbe una marea di problemi. #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC: {ink_tag_c(firstCharacterInkLevel)}  #inkD: {ink_tag_d(firstCharacterInkLevel)}

            -    
    Bene, direi che abbiamo tutte qualcosa a cui pensare.#inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC: {ink_tag_c(firstCharacterInkLevel)}  #inkD: {ink_tag_d(firstCharacterInkLevel)}

    Tipo, a dove farmi un pisolino.

->->