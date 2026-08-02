// thread to show and handle Franco
=== franco_pond
    { debug_frog: Entro in franco2 }
    + { are_two_entities_together(Franco, PG) && entity_location(PG) == Pond } [Franco]

    // check if Franco is tired
    { frog_tiredValue > 0:
        -> franco_is_tired
    }

    // check franco special storylets
    -> franco_special_storylets ->

    // check if it's possible to give a gift
    { not franco_can_give_a_gift():
        -> franco_cant_give_a_gift
    }

    // check if there's a suspended gift
    { frog_suspended_gift:
        -> franco_has_a_suspended_gift
    }

    // check for completed missions
    -> franco_update_completed_missions ->
    { frog_updatedMissions:
        -> franco_provide_gift_for_completed_mission
    }

    // check for current mission, if any
    { frog_currentMission:
        -> franco_solicit_current_mission
    }

    // check if Franco is tired (again)
    -> franco_update_tiredness ->
    { frog_tiredValue > 0:
        -> franco_is_tired
    }

    // assign a mission between the available ones
    -> franco_assign_available_mission

-> main



= franco_is_tired

    {charTag(Franco, "party")}:                     Girino!
    {charTag(Franco, "neutral")}:                   Franco è stanchino ora.
                                                    Torna più tardi e provo a darti una zampa.
    {charTag(Franco, "question")}:                  Basta che poi me la restituisci, sennò non so come grattare la schiena di zio Gracco.

-> main



= franco_cant_give_a_gift

    {charTag(Franco, "party")}:                     Girino!
    {charTag(Franco, "neutral")}:                   Per ora non ho modo di aiutarti, ma non ti preoccupare: vedo di ricordarmi che ti meriti un premio.
                                                    E appena la situazione si aggiorna, potrai ritirarlo!

-> main



= franco_has_a_suspended_gift

    {charTag(Franco, "party")}:                       Ehi girino!
    { shuffle:
                                                    - Hai ancora quel dono di prima da prendere!
                                                    - Devo ancora darti quel dono!
                                                    - Te lo ricordi che c'ho qui una cosa per te, vero?
                                                    - Franco La Rana ha qui qualcosa che è tuo!
                                                    - Ricordati che se ti serve c'ho qui il tuo dono!
    }

-> franco_wants_to_give_you_a_gift



= franco_update_tiredness
    ~ temp dice = RANDOM(1,5)
    { dice == 5:
        ~ frog_tiredValue = frog_maxTiredValue
        ~ frog_justPaused = true
    }
->->



/*
 * SPECIAL STORYLETS
 */



= franco_special_storylets

    // compute special storylet for third char: there's been a problem with the gifted object, with the ingredient in the kitchen, or with the universal ingredient in the kitchen
    ~ temp thirdCharDiscrepancy = frog_third_char_object_gift == thirdChar_giftedObject && thirdChar_giftedObject != ()
    ~ thirdCharDiscrepancy = thirdCharDiscrepancy || frog_third_char_object_ingredient == kitchen_thirdCharExtraIngredient && frog_third_char_object_ingredient != ()
    ~ thirdCharDiscrepancy = thirdCharDiscrepancy || frog_third_char_object_ingredient == universalIngredient

    {   // Prima presentazione
        - grimoire_franco hasnt grimFrancoFirst:
            -> franco_special_storylets_intro ->

        - are_two_entities_together(PG, Franco) && special_mission_one_contents && entity_location(PG) == Pond && grimoire_franco hasnt grimFrancoSpecialMissionOneFeedback:
            -> franco_special_storylets_feedback_mission_one_closed ->

        - thirdCharDiscrepancy && grimoire_franco hasnt grimFrancoThirdIngredientFailure:
            -> franco_special_storylets_third_ingredient_failure ->

        - not franco_special_storylets_open_kitchen && player_accessiblePlaces has Kitchen:
            -> franco_special_storylets_open_kitchen ->

        - not franco_special_storylets_open_library && player_accessiblePlaces has Nest:
            -> franco_special_storylets_open_library ->

        - not franco_special_storylets_open_nest && player_accessiblePlaces has Library:
            -> franco_special_storylets_open_nest ->

        - are_two_entities_together(PG, Franco) && achievements_fullLore ==  Discovered && grimoire_franco hasnt grimFrancoAllDocuments:
            -> franco_special_storylets_allDocumentsFounded ->
    }

->->



= franco_special_storylets_intro

    ~ temp charNameTwo = translator(secondChar_ActualName)

    {charTag(Franco, "question")}:                  Ma dove avevo messo quel.
    {charTag(Franco, "party")}:                     Eccola cra!
    {charTag(Franco, "neutral")}:                   No.
                                                    No no no questo è disgustoso.
                                                    Eppure.
    {charTag(Franco, "party")}:                     Ehi!
                                                    Tu devi essere {player_name}!
    {charTag(Franco, "neutral")}:                   Io sono Franco La Rana!
                                                        ~ frog_nameDiscovered = true
    {charTag(Franco, "party")}:                     {charNameTwo} mi ha parlato di te.
                                                    Ha una bella testolina quel girino!
    { are_two_entities_together(SecondCharacter, PG):
        {charTag(SecondCharacter, "energy")}:       Anche la tua mi piace, Franco!
    }
    {charTag(Franco, "neutral")}:                   Sei qui sicuramente qui per il dono.
    {charTag(Franco, "party")}:                     Come si dice: chi dorme non piglia lombrichi.
    {charTag(Franco, "neutral")}:                   Dovrei averlo qui.
    {charTag(Franco, "question")}:                  No.
                                                    Dove l'ho messo?
                                                    L'avranno preso i gemelli?
    {charTag(Franco, "neutral")}:                   Facciamo così: mentre lo cerco ti do qualcosa da fare.
                                                    Ma non una cosa da fare qualsiasi.
    {charTag(Franco, "party")}:                     Qualcosa di utile per chi vive questo posto.
    {charTag(Franco, "neutral")}:                   Come dice zia Graaak: una zampa vale l'altra.
    {charTag(Franco, "question")}:                  Non che zia Graaak sia particolarmente brava negli affari.
                                                    Ma sempre meglio di mio cugino Braaak, che ha venduto una foglia di loto intera per una biscia.
    {charTag(Franco, "neutral")}:                   Al funerale erano tutti molto molto imbarazzati.
                                                    Tranne la biscia: quella aveva ancora fame.
    {charTag(Franco, "party")}:                     Insomma: tu aiuti me, e io aiuto te.
                                                    Ad esempio dandoti dei consigli sulle cose da donare a una persona.
    {charTag(Franco, "neutral")}:                   O recuperando una pianta che hai già usato.
    { are_two_entities_together(FirstCharacter, PG):
        {charTag(FirstCharacter, "affectionate")}:  Livello di confusione: sì.
    }
    { are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "jester")}:        Rana: mi sento ubriaco e non ho manco bevuto!
    }

    ~ grimoire_franco += grimFrancoFirst

->->



= franco_special_storylets_third_ingredient_failure

    ~ temp charNameThree = translator(thirdChar_ActualName)

    {charTag(Franco, "question")}:                          Franco si fa delle domande, ma non trova delle risposte.
    {charTag(Franco, "neutral")}:                           Ed è strano girino, perché Franco ha sempre delle risposte.
                                                            Anche se non sono sempre giuste.
    {
        - frog_third_char_object_gift == thirdChar_giftedObject:
                                                            Ho visto che hai dato a {charNameThree} il dono che ti ho consigliato, ma ha reagito male.
        - frog_third_char_object_ingredient == universalIngredient:
                                                            Ho visto che cucinando con {charNameThree} hai aggiunto la Zandelia, che dovrebbe piacere a tutti, ma lui ha reagito male.
        - else:
                                                            Ho visto che cucinando con {charNameThree} hai aggiunto l'ingrediente che ti ho consigliato, ma ha reagito male.
    }
    {charTag(Franco, "neutral")}:                           Franco è triste per questa cosa, sai?
                                                            Perché vuole davvero aiutare tutti.
                                                            Ed è sicuro di aver dato a {player_name} il giusto consiglio.
    { are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "jester")}:                Pensavi di avere davanti un libro aperto, vero Franchì?
    }
    { are_two_entities_together(FirstCharacter, PG):
        {charTag(FirstCharacter, "annoyed")}:               Franco, non ti crucciare: per sapere di cosa ha bisogno, {charNameThree} dovrebbe farsi delle domande.
                                                            E non credo sia il suo forte.
        { are_two_entities_together(ThirdCharacter, PG):
            {charTag(ThirdCharacter, "bored")}:             Almeno non sono la regina delle paranoie.
        }
    }
    {charTag(Franco, "question")}:                          Cosa è andato storto?
    {charTag(Franco, "neutral")}:                           A parte il naso di zia Graaak.
    {charTag(Franco, "reading")}:	                        Franco indagherà su questa cosa, promesso.
    {charTag(Franco, "neutral")}:                           Non il naso di zia Graaak, ovvio, ma quell'altra cosa.
                                                            Quella.
    {charTag(Franco, "question")}:                          Quale?
    {charTag(Franco, "party")}:                             Ma ciao girino!

    ~ grimoire_franco += grimFrancoThirdIngredientFailure

->->



=== franco_special_storylets_open_kitchen
    ~ temp charNameOne = translator(firstChar_ActualName)

    {charTag(Franco, "party")}:                     Girino!
    {charTag(Franco, "neutral")}:                   Ora che {charNameOne} ti ha aperto la cucina, posso darti delle dritte anche su quale ingrediente aggiungere quando cucini con una persona!
    {charTag(Franco, "party")}:                     Non è una cosa francosissima?!?
                                                    Che è tipo bellissima, solo più bagnaticcia.

->->



=== franco_special_storylets_open_library
    ~ temp charNameTwo = translator(secondChar_ActualName)

    {charTag(Franco, "party")}:                     Girino!
    {charTag(Franco, "neutral")}:                   {charNameTwo} ti ha aperto la biblioteca, e io ora ti apro la possibilità di conoscere quale racconto amano le persone che vuoi aiutare!
                                                    Così ne potete parlare.
                                                    O gracchiare.
    {charTag(Franco, "question")}:                  Qui gracchiano tutti molto poco.
    {charTag(Franco, "party")}:                     Craack.

->->



=== franco_special_storylets_open_nest
    ~ temp charNameThree = translator(thirdChar_ActualName)

    {charTag(Franco, "party")}:                     Girino!
    {charTag(Franco, "neutral")}:                   Ho saputo che {charNameThree} ha aperto il nido.
                                                    Qui non posso fare miracoli, perché quei sigilli sono un graaaack casino.
    {charTag(Franco, "party")}:                     Ma posso recuperartene uno che hai utilizzato.
    {charTag(Franco, "neutral")}:                   Uno ce la faccio.
                                                    Poi sono troppo pesanti per le mie zampine.

->->



=== franco_special_storylets_feedback_mission_one_closed

    {charTag(Franco, "party")}:                     Ehi girino, grazie ancora per prima.
    {charTag(Franco, "neutral")}:                   Euforbo all'inizio era confuso, si è portato il sigillo in camera.
                                                    Poi è venuto in soggiorno a fare le sue cose, e quando i suoi fratelli gli hanno dato noia <>

    {
        - glyph_earthFireSigils has nest_francoChosenSigil:
                                                    all'inizio si è agitato, ma poi ha iniziato a nuotare veloce veloce e a scaricare la tensione.
        - glyph_earthAirSigils has nest_francoChosenSigil:
                                                    ha preso un grande respiro e poi si è messo a cucinare con Tullio, e si è rilassato.
        - glyph_earthWaterSigils has nest_francoChosenSigil:
                                                    li ha ignorati, si è messo le sue cuffie preferite e ha iniziato a disegnare, ed era tutto felice.
        - glyph_earthAetherSigils has nest_francoChosenSigil:
                                                    si è avvicinato a Giulio, e si è messo a leggere con lui.
    }

                                                    Per il resto della serata l'ho visto più sereno.
    {charTag(Franco, "party")}:                     Ha anche riso a una mia battuta!

    ~ grimoire_franco += grimFrancoSpecialMissionOneFeedback

->->



=== franco_special_storylets_allDocumentsFounded
    {charTag(Franco, "party")}:                         Girino!
                                                        Hai trovato tutti i documenti della vecchia congrega!
    {charTag(Franco, "question")}:                      E tu mi dirai: "Come fai a saperlo, Franco?"
    {charTag(Franco, "neutral")}:                       E io ti dirò: "Perché Franco sa tutto! Tranne nuotare."
                                                        Soprattutto se è Franco a fare le cose.
    {charTag(Franco, "question")}:                      Anche se non me le ricordo proprio tutte tutte.
                                                        Tipo come quando apro il frigo e poi non ricordo perché l'ho aperto.
                                                        E poi ci trovo dentro la tessera della palestra a cui non sono mai andato.
                                                        E zia Graaak che si fa un pisolino.
    {charTag(Franco, "neutral")}:                       Una volta ha dormito così tanto che quando si è svegliata aveva altri centoquindici nipotini!
                                                        Mia sorella è molto pratica, e quindi li ha chiamati per numero.
                                                        Uh, una lettera di Euforbo!
    {charTag(Franco, "reading")}:	                    "Papà, devi dire a {player_name} che abbiamo messo in giro noi i documenti!"
    {charTag(Franco, "party")}:                         Giusto!
    {charTag(Franco, "neutral")}:                       Ero lì che mi dicevo: "Mmm, quando mi spiegano le cose tutte assieme mi distraggo, e a quel punto non capisco proprio nulla."
                                                        Ma ho pensato fosse importante per te conoscere quella storia.
    {charTag(Franco, "question")}:                      E a quel punto mi son detto: "Ok Franco, facciamo un gioco. Ogni volta che {player_name} fa certe cose, metti un nuovo documento sulla panchina."
                                                        E ho fatto anche uno schema molto colorato che spiegava quando dovevo darti i documenti.
    {charTag(Franco, "neutral")}:                       Ma poi me lo sono dimenticato.
                                                        Fino a quando poco fa Euforbo non mi ha detto "Ehi papà, ho trovato una logica per dare quei vecchi appunti a {player_name}".
                                                        E visto che sa che a volte mi distraggo, ha fatto tutto lui il lavoro.
                                                        Devo ringraziarlo.
    {charTag(Franco, "party")}:                         Magari gli compro il prossimo "Starview Galley".

    ~ grimoire_franco += grimFrancoAllDocuments

->->



/*
 * COMPUTE GIFTS
 */



// get the available gifts for a character, even those that aren't yet available because the corresponding area is not open
=== function _franco_available_potential_gifts_for_char_internal(storyStatus, ref giftedObject, grimoireList, grimoireKitchenItem, grimoireNovelItem)

    // a char whose story is not ongoing surely has no valid gifts
    {storyStatus != story_storyStarted:
        ~ return ()
    }

    // check which gifts we can potentially receive
    ~ temp achievableGifts = (cultivableGift, ingredientGift, bookGift)

    // remove the gifts that are no longer needed
    {giftedObject:
        ~ achievableGifts -= cultivableGift
    }

    {grimoireList has grimoireKitchenItem:
        ~ achievableGifts -= ingredientGift
    }

    {grimoireList has grimoireNovelItem:
        ~ achievableGifts -= bookGift
    }

    // return the result
    ~ return achievableGifts


// get the available gifts for a character, even those that aren't yet available because the corresponding area is not open
=== function franco_available_potential_gifts_for_char(character)

    {character:
        - FirstCharacter:
            ~ return _franco_available_potential_gifts_for_char_internal(firstChar_storyStatus, firstChar_giftedObject, grimoire_firstChar, grimFirstCharKitchenEnded, grimFirstCharNovel)
        - SecondCharacter:
            ~ return _franco_available_potential_gifts_for_char_internal(secondChar_storyStatus, secondChar_giftedObject, grimoire_secondChar, grimSecondCharKitchenEnded, grimSecondCharNovel)
        - ThirdCharacter:
            ~ return _franco_available_potential_gifts_for_char_internal(thirdChar_storyStatus, thirdChar_giftedObject, grimoire_thirdChar, grimThirdCharKitchenEnded, grimThirdCharNovel)
        - FourthCharacter:
            ~ return _franco_available_potential_gifts_for_char_internal(fourthChar_storyStatus, fourthChar_giftedObject, grimoire_fourthChar, grimFourthCharKitchenEnded, grimFourthCharNovel)
        - FifthCharacter:
            ~ return _franco_available_potential_gifts_for_char_internal(fifthChar_storyStatus, fifthChar_giftedObject, grimoire_fifthChar, grimFifthCharKitchenEnded, grimFifthCharNovel)
    }



// get the available gifts for a character, excluding those that aren't yet available because the corresponding area is not open
=== function _franco_available_gifts_for_char_internal(storyStatus, ref giftedObject, grimoireList, grimoireKitchenItem, grimoireNovelItem)

    ~ temp potentialGifts = _franco_available_potential_gifts_for_char_internal(storyStatus, giftedObject, grimoireList, grimoireKitchenItem, grimoireNovelItem)

    {player_accessiblePlaces hasnt Kitchen:
        ~ potentialGifts -= ingredientGift
    }

    {player_accessiblePlaces hasnt Library:
        ~ potentialGifts -= bookGift
    }

    ~ return potentialGifts



// get the available gifts for a character, excluding those that aren't yet available because the corresponding area is not open
=== function franco_available_gifts_for_char(character)

    {character:
        - FirstCharacter:
            ~ return _franco_available_gifts_for_char_internal(firstChar_storyStatus, firstChar_giftedObject, grimoire_firstChar, grimFirstCharKitchenEnded, grimFirstCharNovel)
        - SecondCharacter:
            ~ return _franco_available_gifts_for_char_internal(secondChar_storyStatus, secondChar_giftedObject, grimoire_secondChar, grimSecondCharKitchenEnded, grimSecondCharNovel)
        - ThirdCharacter:
            ~ return _franco_available_gifts_for_char_internal(thirdChar_storyStatus, thirdChar_giftedObject, grimoire_thirdChar, grimThirdCharKitchenEnded, grimThirdCharNovel)
        - FourthCharacter:
            ~ return _franco_available_gifts_for_char_internal(fourthChar_storyStatus, fourthChar_giftedObject, grimoire_fourthChar, grimFourthCharKitchenEnded, grimFourthCharNovel)
        - FifthCharacter:
            ~ return _franco_available_gifts_for_char_internal(fifthChar_storyStatus, fifthChar_giftedObject, grimoire_fifthChar, grimFifthCharKitchenEnded, grimFifthCharNovel)
    }



// check whether franco can give any kind of gift to the player
=== function franco_can_give_a_gift()

// either a character can receive a gift
~ temp characterCanReceiveGift = franco_available_gifts_for_char(FirstCharacter) || franco_available_gifts_for_char(SecondCharacter) || franco_available_gifts_for_char(ThirdCharacter) || franco_available_gifts_for_char(FourthCharacter) || franco_available_gifts_for_char(FifthCharacter)
// or a cultivable can be recovered
~ temp cultivableCanBeRecovered = frog_recoverableCultivables != () && frog_recoveredCultivables == ()
// or a sigil can be recovered
~ temp sigilCanBeRecovered = frog_recoveredSigil == () && glyph_usedSigils != ()

~ return characterCanReceiveGift || cultivableCanBeRecovered || sigilCanBeRecovered



/*
 * GIFT MANAGEMENT
 */



=== franco_wants_to_give_you_a_gift

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    {charTag(Franco, "party")}:                         Bene girino, direi che è il momento che Franco ti dia una zampa!

    // hint about gifts that cannot yet be given
    { franco_available_potential_gifts_for_char(FirstCharacter) && not franco_available_gifts_for_char(FirstCharacter):
        {charTag(Franco, "neutral")}:                   Ti dico che per ora non ho consigli utili su {charNameOne}, ma mi sto attivando per aiutarti, parola di Franco!
    }

    { franco_available_potential_gifts_for_char(SecondCharacter) && not franco_available_gifts_for_char(SecondCharacter):
        {charTag(Franco, "neutral")}:                   Non ho dritte su {charNameTwo}, solo rovesci, ma se torni più avanti sono sicuro che qualcosa di nuovo te lo posso dare.
    }

    { franco_available_potential_gifts_for_char(ThirdCharacter) && not franco_available_gifts_for_char(ThirdCharacter):
        {charTag(Franco, "neutral")}:                   Ci sono cose di {charNameThree} che per ora mi sono un mistero misterioso, ma se torni più tardi te le posso smisterare.
        {charTag(Franco, "question")}:                  O smistare?
    }
    // non serve fare la stessa cosa per Mostro e Nonna, perché a questo punto tutti i luoghi sono aperti.

    // let the player choose which gifts they want (or if they don't want it yet)
                                                            Come vuoi che ti aiuti?


    - (top)
    +   {charTag(PG, "neutral")}:                           Mi servirebbe un consiglio su {charNameOne}.
        -> franco_wants_to_give_you_a_gift_first_character
    +   {charTag(PG, "neutral")}:                           Vorrei una mano con {charNameTwo}.
        -> franco_wants_to_give_you_a_gift_second_character
    +   {charTag(PG, "neutral")}:                           Cosa potresti offrirmi per {charNameThree}?
        -> franco_wants_to_give_you_a_gift_third_character
    +   {charTag(PG, "neutral")}:                           Apprezzerei un aiuto con {charNameFour}.
        -> franco_wants_to_give_you_a_gift_fourth_character
    +   {charTag(PG, "neutral")}:                           Qualche dritta su {charNameFive}?
        -> franco_wants_to_give_you_a_gift_fifth_character
    +   {frog_recoverableCultivables && not frog_recoveredCultivables}  \ {charTag(PG, "neutral")}:         Puoi aiutarmi a recuperare una pianta che ho già utilizzato?
        {charTag(Franco, "party")}:                         Certo che craack!
                                                            Ma.
                                                            Lo posso fare solo una volta.
        + + {charTag(PG, "neutral")}:                       Ok, voglio usare ora questa occasione!
            -> franco_cultivable_recovery
        + + {charTag(PG, "neutral")}:                       Mmm, ci ragiono su.
            -> top
    +   {frog_recoveredSigil == () && glyph_usedSigils != ()}  \ {charTag(PG, "neutral")}:                  Puoi aiutarmi a recuperare un sigillo che ho già utilizzato?
        {charTag(Franco, "party")}:                         Certo che craack!
                                                            Ma.
        {charTag(Franco, "neutral")}:                       Lo posso fare solo una volta.
                                                            E dandotene uno a caso.
        {charTag(Franco, "question")}:                      I sigilli sono più strani delle capre, e non so fare di meglio.
        + + {charTag(PG, "neutral")}:                       Ok, voglio usare ora questa occasione!
            -> franco_sigil_recovery
        + + {charTag(PG, "neutral")}:                       Mmm, ci ragiono su.
            -> top
    +   {charTag(PG, "neutral")}:                           Vorrei pensarci ancora un po'.
        {charTag(Franco, "neutral")}:                       Mi trovi qui girino.
        { shuffle:
                                                          - Continuo a contare tutte le onde!
                                                          - Intanto sonnecchio sulla ninfea.
                                                          - Nel mentre scrivo a Babbo Navale.
                                                          - Continuo a leggere "<i>Lezioni di nuoto per girini</i>".
                                                          - Devo decidere cosa cucinare per il compleanno dei gemelli.
        }
        ~ frog_suspended_gift = true
        -> main



=== franco_wants_to_give_you_a_gift_first_character

    {debug_frog: passo da franco_giftsFirstChar.}
    ~ temp charNameOne = translator(firstChar_ActualName)

    { are_two_entities_together(FirstCharacter, PG):
        {charTag(FirstCharacter, "neutral")}:                   Se resto mi sembra di barare.
        {charTag(FirstCharacter, "annoyed")}:                   Anche se non ha senso, visto che lo stai facendo tu, {player_name}.
        ~ move_entity(FirstCharacter, Forest)
    }

    { shuffle once:
        - {charTag(Franco, "party")}:                           Uh, mi piace {charNameOne}, è sempre così gentile con me!
        - {charTag(Franco, "party")}:                           {charNameOne} ha una bella testolina.
                                                                Piena di girini che corrono alla svelta.
        - {charTag(Franco, "party")}:                           {charNameOne} andrebbe molto d'accordo con Tullio.
                                                                Anche lui è un artista.
        - {charTag(Franco, "party")}:                           Ottimamente!
    }

    <- franco_wants_to_give_you_a_gift_common_dispatch(FirstCharacter, -> book)
    + -> main

    = book
        ~ temp charNameOne = translator(firstChar_ActualName)
        { library_readStories has Aza:
            {charTag(Franco, "party")}:                         Franco vede, vede vede...
            {charTag(Franco, "neutral")}:                       Uh, devo aprire gli occhi.
                                                                Ma mi dicevano i topi della biblioteca che prima hai letto <b>Luna vergine</b> di Aza.
            {charTag(Franco, "neutral")}:                       Prova a parlare con {charNameOne} e vedrai che avrà sicuramente qualcosa da dirti.
                                                                Anche perché so che ha già letto <b>Luna vergine</b> di Aza.
                                                                Le persone parlano tanto delle cose che leggono.
            {charTag(Franco, "question")}:                      O vedono.
                                                                O ascoltano.
            {charTag(Franco, "party")}:                         Per fortuna io parlo poco.
            ~ frog_first_novel = "<b>Luna vergine</b> di Aza"
            ~ frog_firstCharAchievableGifts -= bookGift

        - else:
            {charTag(Franco, "neutral")}:                       C'è una lettera dei topi della biblioteca.
            {charTag(Franco, "reading")}:	                    "Parola chiave: trasformazione".
                                                                Ah, e dietro c'è scritto: "Lunga".
            {charTag(Franco, "question")}:                      Forse vogliono diventare zucche?
            {charTag(Franco, "neutral")}:                       Ma magari tu ci capisci qualcosa e allora trovi il racconto che ti serve!
            ~ frog_first_novel = "una storia lunga che parli di trasformazione"
            ~ frog_firstCharAchievableGifts -= bookGift
        }

        ->->



=== franco_wants_to_give_you_a_gift_second_character
    ~ temp charNameTwo = translator(secondChar_ActualName)

    { are_two_entities_together(SecondCharacter, PG):
        {charTag(SecondCharacter, "energy")}:                   Uh, Franco sa tantissime cose di me!
        {charTag(SecondCharacter, "emotional")}:                Sicuro che ti aiuta be-nis-si-mo!
        {charTag(SecondCharacter, "neutral")}:                  Ma io vado a fare qualcos'altro.
        ~ move_entity(SecondCharacter, Forest)
    }

    { shuffle once:
        - {charTag(Franco, "party")}:                           Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!
        - {charTag(Franco, "party")}:                           Sì! Voglio chiedere a {charNameTwo} se facciamo lezioni di nuoto assieme!
        - {charTag(Franco, "party")}:                           {charNameTwo} mi sta tanto simpatico.
                                                                Anche se non ho ancora capito quella cosa della elettricità.
        - {charTag(Franco, "party")}:                           Ottimamente!
    }

    <- franco_wants_to_give_you_a_gift_common_dispatch(SecondCharacter, -> book)
    + -> main

    = book
        ~ temp charNameTwo = translator(secondChar_ActualName)
        { library_readStories has Lamia:
            {charTag(Franco, "party")}:                     Prima Gliberia, una delle topoline della biblioteca, ha visto che stavi leggendo <b>Il sassolino</b>.
            {charTag(Franco, "neutral")}:                   Prova a parlare con lui e vedrai che avrà sicuramente qualcosa da dirti.
            {charTag(Franco, "party")}:                     Anche perché è certissimamerrimo che ha già letto <b>Il sassolino</b>!
            {charTag(Franco, "neutral")}:                   A {charNameTwo} piace parlare.
            {charTag(Franco, "party")}:                     Ora mi sta insegnando come non annegare!
            ~ frog_second_novel = "<b>Il sassolino</b> di Lamia"
            ~ frog_secondCharAchievableGifts -= bookGift

        - else:
            {charTag(Franco, "neutral")}:                   Secondo il manuale della biblioteca, {charNameTwo} è uno da fenotipo "ribellione" combinato con "veloce".
            {charTag(Franco, "question")}:                  E tu dirai "Franco la rana, cos'è un fenotipo?"
            {charTag(Franco, "neutral")}:                   E io ti dirò "Un tipo a cui piace tanto il fieno!"
                                                            E poi aggiungerò "Che è un po' diverso dal topognomastico, che è un topo che mastica gli gnomi."
                                                            E so che sono tante informazioni anche per una bella testolina come la tua, girino.
            {charTag(Franco, "party")}:                     Per cui vai pure a cercare questa ribellione in biblioteca e vedrai che farai felice {charNameTwo}!
            ~ frog_second_novel = "qualcosa di veloce che parli di ribellione"
            ~ frog_secondCharAchievableGifts -= bookGift
        }

        ->->



=== franco_wants_to_give_you_a_gift_third_character
    ~ temp charNameThree = translator(thirdChar_ActualName)

    { are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "neutral")}:                   Vi lascio alle vostre chiacchiere, via.
        {charTag(ThirdCharacter, "jester")}:                    Ma se mi fischiano le orecchie vedete che penserò male di voi!
        ~ move_entity(ThirdCharacter, Forest)
    }

    { shuffle once:
        - {charTag(Franco, "neutral")}:                         Uh, non ho ancora capito {charNameThree}, ma posso aiutarti lo stesso!
        - {charTag(Franco, "neutral")}:                         Mi parla sempre del fantacalcio ma ancora non ho capito quando devo schierare i draghi.
        - {charTag(Franco, "neutral")}:                         {charNameThree} mi dice sempre che sono una sagoma, non capisco.
        - {charTag(Franco, "neutral")}:                         Perfetto!
    }

    <- franco_wants_to_give_you_a_gift_common_dispatch(ThirdCharacter, -> book)
    + -> main

    = book
        ~ temp charNameThree = translator(thirdChar_ActualName)
        { library_readStories has Maura:
            {charTag(Franco, "party")}:                         Sembra che tu abbia già letto <b>Polvere</b>.
            {charTag(Franco, "neutral")}:                       Prova a parlare con lui e sono sicuro che avrà qualcosa da commentare!.
            {charTag(Franco, "party")}:                         Anche perché è sicuro che ha letto <b>Polvere</b>!
            {charTag(Franco, "neutral")}:                       L'hanno sentito tutti con quella cosa del licantropo.
            {charTag(Franco, "party")}:                         Se un licantropo mi morde, divento una rana mannnara?
            ~ frog_third_novel = "<b>Polvere</b> di Maura"
            ~ frog_thirdCharAchievableGifts -= bookGift

        - else:
            {charTag(Franco, "neutral")}:                       Secondo l'ultime novità in campo editoriale, {charNameThree} è uno che apprezza le cose rapide, e che bruciano.
            {charTag(Franco, "question")}:                      Che non è una buona idea per un libro.
                                                                Sapevi che i primi libri sapevano volare?
            {charTag(Franco, "party")}:                         Si libravano in aria.
            {charTag(Franco, "neutral")}:                       Ma poi era davvero difficile leggerli mentre si muovevano così tanto.
                                                                Così cugina Sputt li ha addomesticati.
                                                                E ora sonnecchiano tutto il giorno nelle biblioteche.
                                                                Che avevano le teche proprio per non farli scappare.
            {charTag(Franco, "party")}:                         Hai visto quante cose so?
            ~ frog_third_novel = "qualcosa di rapido e che brucia"
            ~ frog_thirdCharAchievableGifts -= bookGift
        }

        ->->



=== franco_wants_to_give_you_a_gift_fourth_character
    ~ temp charNameFour = translator(fourthChar_ActualName)
    TODO: Da scrivere contenuti corretti quando faccio Nonna.
    -> franco_wants_to_give_you_a_gift_close_exchange



=== franco_wants_to_give_you_a_gift_fifth_character
    ~ temp charNameFive = translator(fifthChar_ActualName)
    TODO: Da scrivere contenuti corretti quando faccio Mostro.
    -> franco_wants_to_give_you_a_gift_close_exchange



=== franco_wants_to_give_you_a_gift_common_dispatch(character, -> book)
    ~ temp achievableGifts = franco_available_gifts_for_char(character)
    + {achievableGifts has cultivableGift}  \ {charTag(PG, "neutral")}:                                                 Quale regalo mi consigli?
        -> franco_pick_plant_gift(character, false) ->
    + {achievableGifts has ingredientGift && player_accessiblePlaces has Kitchen}  \ {charTag(PG, "neutral")}:          Che ingrediente dovrei aggiungere mentre cucineremo assieme?
        -> franco_pick_plant_gift(character, true) ->
    + {achievableGifts has bookGift && player_accessiblePlaces has Library}  \ {charTag(PG, "neutral")}:                C'è un racconto che ha a cuore?
        -> book ->
    -

-> franco_wants_to_give_you_a_gift_close_exchange



=== franco_wants_to_give_you_a_gift_close_exchange
    {debug_frog: passo closed_exchange.}

    {charTag(Franco, "party")}:                                     Girino!

    { closed_exchange == 1:

                                                                    Gattino!
                                                                    Bambino!
        {charTag(Franco, "question")}:                              Hai mai visto quante cose piccole finiscono con "ino?"
                                                                    Tranne il pino.
                                                                    Non dovrebbe chiamarsi "pone"?
        {charTag(Franco, "neutral")}:                               Ma non Pino il girino, che è grosso come, uh, una lettera da zia Graaak.
        {charTag(Franco, "reading")}:	                            "Dice Pino di dire a {player_name} quella faccenda delle commissioni finite."
                                                                    "E poi se gli riporti la sua crema solare."
        {charTag(Franco, "neutral")}:	                            Vero!
                                                                    La crema!
                                                                    Anche per noi è importante proteggere la nostra pelle.
                                                                    Poi ci vengono le bolle.
        {charTag(Franco, "party")}:                                 Anche se alcune rane le apprezzano.
        {charTag(Franco, "neutral")}:                               Uh, una lettera di zia Graaak.
        {charTag(Franco, "reading")}:	                            "LE COMMISSIONI! DEVI DIRE CHE NON SONO INFINITE!"
                                                                    "SENNO' POI COME FA UNA PERSONA A DECIDERE QUALE AIUTO VUOLE DA TE?!?"
                                                                    "E QUINDI DEVI SOLO DIRE "NE HO ALCUNE SPECIALI CHE HANNO LE LORO REGOLE, MA LE COMMISSIONI A DISPOSIZIONE ORA SONO SOLO DIECI!"
                                                                    "E SE LE COMMISSIONI SONO SOLO DIECI, QUANTE VOLTE PUOI AIUTARE QUELLA POVERA ANIMA, FRANCO? QUANTE?"
        {charTag(Franco, "question")}:	                            Perdonami {player_name}, ma nella mia famiglia tutti si agitano così velocemente.
                                                                    Sai che quasi quasi mi faccio un pisolino ora?

    - else:

        { shuffle once:
                -   {charTag(Franco, "party")}:                     Facciamo un bel duo noi due.
                                                                    Io il cervello, tu la mano.
                                                                    Hai tantissime dita comunque!
                                                                    A dopo girino!

                -   {charTag(Franco, "party")}:                     Non la senti la soddisfazione di qualcosa di concluso?
                    {charTag(Franco, "question")}:                  E non confuso?
                                                                    Illuso?
                                                                    Escluso?
                                                                    Deluso.
                                                                    Uh, dicevamo?

                -   {charTag(Franco, "neutral")}:                   Come dice sempre Tullio: "Per fortuna che non sai guidare."
                                                                    E come dice sempre Giulio: "Dopo il lavoro bisogna riposare."
                                                                    E ora riposiamo un po', {player_name}!

                -   {charTag(Franco, "party")}:                     Siamo un portento assieme, abbiamo chiuso un'altra commissione!
                    {charTag(Franco, "neutral")}:                   Anche se zia Graaak dice che sono più un tormento.
                                                                    Forse perché da piccolo soffiavo tantissimo.
                                                                    E una volta ho avuto un raffreddore che faceva piovere ovunque.
                                                                    Uh, una lettera di Tullio.
                    {charTag(Franco, "reading")}:	                "Quella è la tormenta, Franco."
                                                                    "Tu sei un tormento di coccole."
                    {charTag(Franco, "party")}:                     Quanto è carino?
                                                                    Devo assolutamente spupazzarlo.

                -   {charTag(Franco, "party")}:                     Un'altra commissione chiusa dal dream team Franco e {player_name}!
                                                                    Chi ci ferma più, a noi?
                    {charTag(Franco, "question")}:                  A parte la polizia, {~per quella cosa dei volantini.|dopo quella faccenda della molotov.|per via di quegli adesivi su Mangione.|per via di quel datacenter in fiamme.|dopo la schedatura alla manifestazione per la Palestina.}
                    {charTag(Franco, "neutral")}:                   Ma è un'altra storia.
                    { are_two_entities_together(PG, FourthCharacter):
                        {charTag(FourthCharacter, "neutral")}:      Non cambiare mai Franco.
                    }

        }

    }


    // resetto lo stato per prepararmi alla nuova commissione (se presente)
    ~ frog_allMissionsCompleted += frog_currentMission
    ~ frog_availableCommonMissions -= frog_currentMission
    ~ frog_updatedMissions -= frog_currentMission
    ~ frog_currentMission = ()
    ~ frog_suspended_gift = false
    ~ frog_justPaused = false


-> main



/*
 * PLANT GIFT
 */



=== franco_pick_plant_gift(character, isKitchenGift)

    ~ temp characterName = translator(character)
    ~ temp usedGifts = ()

    { character:
        - FirstCharacter:
            ~ usedGifts = kitchen_firstCharExtraIngredient + firstChar_giftedObject
            { isKitchenGift:
                -> _franco_pick_plant_gift_internal(characterName, firstChar_favouritesGifts, usedGifts, frog_first_temp_growing_ingredient, frog_first_char_text_ingredient, frog_firstCharAchievableGifts, ingredientGift)
            - else:
                -> _franco_pick_plant_gift_internal(characterName, firstChar_favouritesGifts, usedGifts, frog_first_temp_growing_gift, frog_first_char_text_gift, frog_firstCharAchievableGifts, cultivableGift)
            }
        - SecondCharacter:
            ~ usedGifts = kitchen_secondCharExtraIngredient + secondChar_giftedObject
            { isKitchenGift:
                -> _franco_pick_plant_gift_internal(characterName, secondChar_favouritesGifts, usedGifts, frog_second_temp_growing_ingredient, frog_second_char_text_ingredient, frog_secondCharAchievableGifts, ingredientGift)
            - else:
                -> _franco_pick_plant_gift_internal(characterName, secondChar_favouritesGifts, usedGifts, frog_second_temp_growing_gift, frog_second_char_text_gift, frog_secondCharAchievableGifts, cultivableGift)
            }
        - ThirdCharacter:
            ~ usedGifts = kitchen_thirdCharExtraIngredient + thirdChar_giftedObject
            { isKitchenGift:
                -> _franco_pick_plant_gift_internal(characterName, thirdChar_favouritesGifts, usedGifts, frog_third_temp_growing_ingredient, frog_third_char_text_ingredient, frog_thirdCharAchievableGifts, ingredientGift)
            - else:
                -> _franco_pick_plant_gift_internal(characterName, thirdChar_favouritesGifts, usedGifts, frog_third_temp_growing_gift, frog_third_char_text_gift, frog_thirdCharAchievableGifts, cultivableGift)
            }
        - FourthCharacter:
            ~ usedGifts = kitchen_fourthCharExtraIngredient + fourthChar_giftedObject
            { isKitchenGift:
                -> _franco_pick_plant_gift_internal(characterName, fourthChar_favouritesGifts, usedGifts, frog_fourth_temp_growing_ingredient, frog_fourth_char_text_ingredient, frog_fourthCharAchievableGifts, ingredientGift)
            - else:
                -> _franco_pick_plant_gift_internal(characterName, fourthChar_favouritesGifts, usedGifts, frog_fourth_temp_growing_gift, frog_fourth_char_text_gift, frog_fourthCharAchievableGifts, cultivableGift)
            }
        - FifthCharacter:
            ~ usedGifts = kitchen_fifthCharExtraIngredient + fifthChar_giftedObject
            { isKitchenGift:
                -> _franco_pick_plant_gift_internal(characterName, fifthChar_favouritesGifts, usedGifts, frog_fifth_temp_growing_ingredient, frog_fifth_char_text_ingredient, frog_fifthCharAchievableGifts, ingredientGift)
            - else:
                -> _franco_pick_plant_gift_internal(characterName, fifthChar_favouritesGifts, usedGifts, frog_fifth_temp_growing_gift, frog_fifth_char_text_gift, frog_fifthCharAchievableGifts, cultivableGift)
            }

    }

->->



= _franco_pick_plant_gift_internal(characterName, favouriteGifts, usedGifts, ref growingFlag, ref text, ref achievableGifts, giftKind)

    // used in teh various branches to compute the perfect gift
    ~ temp perfectGift = ()

    {
        // Caso uno: il dono è in crescita:
        - favouriteGifts has greenhouse_chosenCultivable:
            {charTag(Franco, "party")}:                                                             Girino!
            {stopping:
                                                        -                                           Tu hai i superportieri!
                                                                                                    Come zia Graaak, che sa sempre quando sto per respirare.
                                                            {charTag(Franco, "neutral")}:           La pianta che ti serve sta già crescendo in serra.

                                                        -                                           Quello che ti serve sta crescendo proprio ora in serra!
                                                                                                    Sento l'odore fino a qui.
                                                            {charTag(Franco, "question")}:          O forse è solo zia Graaak che non si è ancora lavata.

                                                        -                                           Non so come fai, ma di nuovo quello che ti serve sta crescendo in serra.
                                                            {charTag(Franco, "question")}:          Forse sai parlare con le formiche?
                                                                                                    Nel caso chiedi loro di restituirmi il giroscopio?
                                                            {charTag(Franco, "neutral")}:           Mi serve per girare i girini quando sono a pancia all'aria.

                                                        -                                           Ma che te lo dico a fare: quello che ti serve sta crescendo in serra.
                                                            {charTag(Franco, "neutral")}:           Di nuovo.
                                                                                                    Povero Franco.
                                                                                                    Ormai non serve più nemmeno a piantare le piante.
                                                            {charTag(Franco, "party")}:             Forse potrei fiorare i fiori?

            }
            ~ text = "sta crescendo ora in serra!"
            ~ growingFlag = true

        // Caso due: il dono è nello zaino
        - backpack_findedGifts ^ favouriteGifts != ():
            ~ temp foundFavourites = backpack_findedGifts ^ favouriteGifts
            ~ temp foundFavouriteNotUsed = foundFavourites - usedGifts
            { foundFavouriteNotUsed:
                ~ perfectGift = LIST_RANDOM(foundFavouriteNotUsed)
            - else:
                ~ perfectGift = LIST_RANDOM(foundFavourites)
            }
            -> _franco_get_hint_for_plant(perfectGift, text) ->

        //Caso tre: non abbiamo mai trovato il dono
        - favouriteGifts ^ greenhouse_findedCultivables == ():
            {charTag(Franco, "party")}:                     Girino!
            {stopping:
                                                        -   {charTag(Franco, "neutral")}:   Scusa se ho spiato tra le tue cose ma no, non hai niente di utile.
                                                                                            Ma ora ci penso io.
                                                            {charTag(Franco, "reading")}:	"Care formiche."
                                                                                            "Come avrete visto, ora sono vegetariano."
                                                                                            E in onore di questa nostra nuova amicizia vi chiederei un favore: potreste coltivare qualcosa di utile per {player_name}?"
                                                                                            "Grazie mille."
                                                                                            "PS.: Vi allego un po' del miele di Dora."
                                                            {charTag(Franco, "neutral")}:   Ottimo.
                                                            {charTag(Franco, "party")}:	    La prossima volta che coltivi qualcosa in serra vedrai che sarà la pianta giusta!

                                                        -   {charTag(Franco, "neutral")}:   Di nuovo non hai niente di utile tra le tue cose.
                                                                                            Mando una lettera alle amiche formiche.
                                                            {charTag(Franco, "reading")}:	"Care formiche, qui è sempre Franco che vi scrive."
                                                                                            "Mi diceva Dora che avete passato un periodo difficile."
                                                                                            "Vi mando quindi un po' di terriccio per il nido e l'ultimo libro di zio Gracco."
                                                                                            "Così magari il passato vi sembra migliore."
                                                                                            "Non è che potreste inoltre aiutare {player_name}, e coltivare qualcosa che {characterName} possa apprezzare?"
                                                                                            "Cordialmente."
                                                                                            "Franco La Rana (non Franco Il Rospo, quello non si vede da mesi)."
                                                            {charTag(Franco, "party")}:	    Perfetto: la prossima volta che coltiverai qualcosa, ti arriverà la pianta perfetta.

                                                        -   {charTag(Franco, "neutral")}:   Mi sa che devi coltivare più piante, sennò le formiche poi si arrabbiano con me.
                                                                                            Perché ancora non hai nulla di utile.
                                                            {charTag(Franco, "reading")}:	"Care formiche, sono qui a chiedervi di nuovo di aiutare {player_name}."
                                                                                            "In cambio a questo giro vi invito alla serata karaoke di cugina Sputt."
                                                                                            "Ma vi chiedo di non portare di nuovo "<i>Tintarella di muta</i>", che poi attirate tutti i serpenti."
                                                                                            "E nemmeno "<i>È l'uovo per me</i>", che poi i girini si spaventano."
                                                                                            "Però mi piacerebbe sentire "<i>La canzone di Raganella</i>", se vi va."
                                                                                            "Grazie mille."
                                                                                            "Franco."
                                                            {charTag(Franco, "neutral")}:	Bene: la prossima volta che coltivi qualcosa, ti arriverà la pianta giusta per {characterName}.

                                                        -   {charTag(Franco, "neutral")}:    Di nuovo senza la pianta giusta.
                                                            {charTag(Franco, "reading")}:	"Care formiche, la solita richiesta."
                                                                                            "Una pianta che aiuti {player_name} con {characterName}."
                                                                                            "Ho finito le cose che vi posso offrire, ma spero avrete pazienza con me."
                                                                                            Sai già come funziona, girino.
                                                            {charTag(Franco, "question")}:  Ma come fai ad essere sempre senza piante?
            }
            ~ perfectGift = LIST_RANDOM(favouriteGifts)
            ~ enqueue_cultivable(perfectGift)
            ~ text = "la prossima cosa che crescerà in serra"
            ~ growingFlag = true

        //Caso quattro: abbiamo trovato tutti i doni, ma li abbiamo già consumati.
        - else:
            ~ perfectGift = LIST_RANDOM(favouriteGifts)
            ~ text = ingredientTranslator(perfectGift)

                                                            {charTag(Franco, "party")}:     Girino!
                                                                                            Credo tu abbia fatto l'impossibile: c'erano un sacchissimo di piante a disposizione, ma le hai già consumate tutte in altre situazioni.
            { frog_recoverableCultivables && not frog_recoveredCultivables:
                                                            {charTag(Franco, "neutral")}:   Però non mi hai ancora chiesto di recuperarne una tra quelle che hai già utilizzato.
                                                                                            Ti consiglio di recuperare {ingredientTranslator(perfectGift)}.
                                                            {charTag(Franco, "question")}:  Ricorda però che posso fare un solo recupero!
                -> franco_cultivable_recovery

            - else:
                                                            {charTag(Franco, "neutral")}:   Hai già anche utilizzato il mio superpotere del recupero.
                                                            {charTag(Franco, "party")}:     Però posso dirti una cosa: ho fiducia in te, davvero.
                                                                                            E so già che riuscirai a trovare altri modi per dimostrare quanto tieni a {characterName}.
            }

    }

    // this kind of gift, regardless of the fact that the gift was obtainable or not, cannot be requested again
    ~ achievableGifts -= giftKind

->->



= _franco_get_hint_for_plant(plant, ref text)

    { plant:
        - BaccaDellaAddolorata:
            Pensa alla difficoltà di fare il primo passo, di accogliere il cambiamento. Quale pianta racconta questa cosa?
            ~ text = "qualcosa che parli del fare il primo passo, di accogliere il cambiamento"

        - BarbaDellInciampo:
            C'è una pianta che parla di colpa e responsabilità. Quella è la pianta che ti serve!
            ~ text = "qualcosa che parla di colpa e responsabilità"

        - BastoneDellOzioso:
            Pensa al piacere di viversi le cose per il piacere di farle. Quale pianta racconta questa storia?
            ~ text = "qualcosa che parli del viversi le cose per il piacere di farle"

        - BrinaDellImpossibile:
            Pensa al bisogno di comprendere che le ferite non ci bloccano nel passato. Quale pianta può aiutarlo?
            ~ text = "qualcosa che aiuti a comprendere le ferite che bloccano nel passato"

        - CantoDelleCompagne:
            Pensa al piacere di stare con persone amiche, e chiediti cosa ricordi una festa.
            ~ text = "qualcosa che parli del piacere dello stare con persone amiche"

        - CardoAspinato:
            C'è una pianta che prima è spinosa e rigida, ma poi morbida e vulnerabile. Ti serve quella.
            ~ text = "qualcosa che prima è spinoso e rigido, poi morbido e vulnerabile."

        - EderaDelleAmanti:
            Uh, la mia preferita! Parla di piacere e cibo e amore. Quella è perfetta.
            ~ text = "qualcosa che parli di piacere, cibo e amore."

        - ErbaLiccia:
            C'è una pianta che collega passato, presente e futuro per aiutarci a formare la nostra identità. Lei è quella giusta.
            ~ text = "qualcosa che colleghi passato, presente e futuro."

        - FalsaPalude:
            Pensa a una situazione in cui non ci sono capi, in cui il cambiamento è collettivo. Quale pianta racconta questa cosa?
            ~ text = "qualcosa legato alla collettività, al cambiamento senza capi."

        - LanaNotturna:
            Questa pianta cresce dove non c'è spazio per la vita. Ci ricorda che quando tutto sembra perduto, qualcosa sta sempre cambiando.
            ~ text = "qualcosa legato al vedere la vita anche quando tutto sembra perduto."

        - LicheneDegliAbissi:
            Ci sono relazioni che non sono sane. E c'è una pianta che le racconta. Quale?
            ~ text = "ci sono relazioni che non sono sane. E c'è una pianta che le racconta. Quale?"

        - NonTiScordarDiTe:
            Una pianta tenera, che parla di chi fa parte di noi, delle nostre radici, di come la nostra storia sia anche la storia di chi incontriamo.
            ~ text = "qualcosa che parli di chi fa parte di noi, delle nostre radici."

        - Olobino:
            C'è una pianta che ha tantissimi nomi, difficile da spiegare, e che chiede di essere provata. Quella è la pianta giusta.
            ~ text = "qualcosa che ha tantissimi nomi e che è difficile da spiegare."

        - Spazzata:
            Quella pianta che cresce quando hai tanti pensieri che ti sommergono e feriscono. Quella.
            ~ text = "qualcosa che cresce quando hai tanti pensieri che ti sommergono e ti fanno male."
    }

->->



/*
 * CULTIVABLE RECOVERY
 */



=== franco_cultivable_recovery
    {debug_frog: passo da cultivable_recovery.}
    {charTag(PG, "neutral")}:      Vorrei recuperare...

    + {frog_recoverableCultivables has BaccaDellaAddolorata}    \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(BaccaDellaAddolorata)}.
            ~  frog_recoveredCultivables = BaccaDellaAddolorata
    + {frog_recoverableCultivables has BarbaDellInciampo}       \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(BarbaDellInciampo)}.
            ~  frog_recoveredCultivables = BarbaDellInciampo
    + {frog_recoverableCultivables has BastoneDellOzioso}       \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(BastoneDellOzioso)}.
            ~  frog_recoveredCultivables = BastoneDellOzioso
    + {frog_recoverableCultivables has BrinaDellImpossibile}    \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(BrinaDellImpossibile)}.
            ~  frog_recoveredCultivables = BrinaDellImpossibile
    + {frog_recoverableCultivables has CantoDelleCompagne}      \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(CantoDelleCompagne)}.
            ~  frog_recoveredCultivables = CantoDelleCompagne
    + {frog_recoverableCultivables has CardoAspinato}           \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(CardoAspinato)}.
            ~  frog_recoveredCultivables = CardoAspinato
    + {frog_recoverableCultivables has EderaDelleAmanti}        \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(EderaDelleAmanti)}.
            ~  frog_recoveredCultivables = EderaDelleAmanti
    + {frog_recoverableCultivables has ErbaLiccia}              \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(ErbaLiccia)}.
            ~  frog_recoveredCultivables = ErbaLiccia
    + {frog_recoverableCultivables has FalsaPalude}             \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(FalsaPalude)}.
            ~  frog_recoveredCultivables = FalsaPalude
    + {frog_recoverableCultivables has LanaNotturna}            \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(LanaNotturna)}.
            ~  frog_recoveredCultivables = LanaNotturna
    + {frog_recoverableCultivables has LicheneDegliAbissi}      \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(LicheneDegliAbissi)}.
            ~  frog_recoveredCultivables = LicheneDegliAbissi
    + {frog_recoverableCultivables has NonTiScordarDiTe}        \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(NonTiScordarDiTe)}.
            ~  frog_recoveredCultivables = NonTiScordarDiTe
    + {frog_recoverableCultivables has Olobino}                 \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(Olobino)}.
            ~  frog_recoveredCultivables = Olobino
    + {frog_recoverableCultivables has Spazzata}                \ {charTag(PG, "neutral")}:         ...{ingredientTranslator(Spazzata)}.
            ~  frog_recoveredCultivables = Spazzata

    + Ho cambiato idea
        -> franco_wants_to_give_you_a_gift

    -

    {charTag(Franco, "party")}:                     Signori e signore e signorə, ecco quanto richiesto dal girino: {ingredientTranslator(frog_recoveredCultivables)}!
                                                    Direttamente nella collezione di {player_name}!

    ~ backpack_findedGifts += frog_recoveredCultivables

    //Levo la possibilità di recuperare il coltivabile
    ~ frog_otherGifts -= cultivableRecovery

-> franco_wants_to_give_you_a_gift_close_exchange



/*
 * SIGIL RECOVERY
 */



=== franco_sigil_recovery

    ~ temp sigil = LIST_RANDOM(glyph_usedSigils)
    ~ frog_recoveredSigil += sigil
    ~ glyph_usedSigils -= sigil

    // Levo la possibilità di recuperare il sigillo
    ~ frog_otherGifts -= sigilRecovery

    {charTag(Franco, "party")}:                     E allora girino, eccoti di nuovo a disposizione {sigils_translator(sigil)}!
                                                    Fanne buon uso!

-> franco_wants_to_give_you_a_gift_close_exchange



/*
 * MISSIONS
 */



// aggiorna frog_updatedMissions (elenco delle missioni completate ma non riscattate)
=== franco_update_completed_missions

    // calcola tutte le missioni completate
    ~ temp completedMissions = ()

    //Prima commissione: leggere.
    { grimoire_firstCharacter && grimoire_secondCharacter && grimoire_greenhouse:
        ~ completedMissions += missionOne
    }

    //Seconda commissione: coltivare.
    { LIST_COUNT(greenhouse_findedCultivables) >= 3:
        ~ completedMissions += missionTwo
    }

    //Terza commissione: parlare di mindfulness con Mentore.
    { mindfulness:
        ~ completedMissions += missionThree
    }

    //Quarta commissione: parlare di cose strane con Mentore.
    { little_storylets:
        ~ completedMissions += missionFour
    }

    //Quinta commissione: assistere a una conversazione a due.
    ~ temp fiveMissionTrue = grimoire_firstChar ^ (grimFirstSecondChar, grimFirstThirdChar, grimFirstCharMentor, grimFirstCharFranco) or grimoire_secondChar ^ (grimSecondCharMentorOne, grimSecondCharMentorPeace, grimSecondThirdChar, grimSecondCharFranco, grimSecondCharCarla) or grimoire_thirdChar ^ (grimThirdCharMentor, grimThirdCharFranco) or grimoire_fifthChar ^ (grimMentorFranco)
    { fiveMissionTrue:
        ~ completedMissions += missionFive
    }

    //Sesta commissione: conoscere la strega.
    { grimoire_witch has grimWitchIntro:
        ~ completedMissions += missionSix
    }

    //Settima commissione: leggere una lettera.
    { grimoire_firstChar has grimFirstCharLetterOne or grimoire_secondChar has grimSecondCharLetterOne or grimoire_thirdChar has grimThirdCharLetterOne:
        ~ completedMissions += missionSeven
    }

    //Ottava commissione: leggere un racconto.
    { library_readStories:
        ~ completedMissions += missionEight
    }

    // Nona commissione: non si può generare in automatico (guardare ritratti nuovi in camera da letto)

    //Decima commissione: aggiungere un ingrediente extra in cucina.
    { kitchen_firstCharExtraIngredient or kitchen_secondCharExtraIngredient or kitchen_thirdCharExtraIngredient or kitchen_fourthCharExtraIngredient or kitchen_fifthCharExtraIngredient:
        ~ completedMissions += missionTen
    }


    // togli le missioni già riscattate, e aggiorna quelle completate ma non riscattate
    ~ completedMissions -= frog_allMissionsCompleted
    ~ completedMissions = completedMissions ^ frog_allAvailableMissions
    ~ frog_updatedMissions += completedMissions


    // aggiorna l'achievement di "tutte le missioni di Franco"
    -> achievements_onGame_statusUpdate_GM ->


    {debug_frog: dopo franco_missionsStateUpdater frog_updatedMissions contiene {frog_updatedMissions}.}

->->



=== franco_provide_gift_for_completed_mission

    {
        - frog_updatedMissions has missionOne:
            -> franco_provide_gift_for_completed_mission_One ->

        - frog_updatedMissions has missionTwo:
            -> franco_provide_gift_for_completed_mission_Two ->

        - frog_updatedMissions has missionThree:
            -> franco_provide_gift_for_completed_mission_Three ->

        - frog_updatedMissions has missionFour:
            -> franco_provide_gift_for_completed_mission_Four ->

        - frog_updatedMissions has missionFive:
            -> franco_provide_gift_for_completed_mission_Five ->

        - frog_updatedMissions has missionSix:
            -> franco_provide_gift_for_completed_mission_Six ->

        - frog_updatedMissions has missionSeven:
            -> franco_provide_gift_for_completed_mission_Seven ->

        - frog_updatedMissions has missionEight:
            -> franco_provide_gift_for_completed_mission_Eight ->

        - frog_updatedMissions has missionNine:
            -> franco_provide_gift_for_completed_mission_Nine ->

        - frog_updatedMissions has missionTen:
            -> franco_provide_gift_for_completed_mission_Ten ->
    }

-> franco_wants_to_give_you_a_gift




/*****************************

    Missioni concluse

****************************/

=== franco_provide_gift_for_completed_mission_One
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)


//Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
    {
        - frog_currentMission has missionOne:
        {charTag(Franco, "party")}:                 Hai letto il grimorio!
                                                    Hai una testa grande!

        - else:
        {charTag(Franco, "question")}:              Vediamo vediamo vediamo.
        {charTag(Franco, "neutral")}:               Interessante.
                                                    Ho dimenticato di ordinare del punteruolo.
                                                    Devo assolutamente passare a prenderlo dal fiorista prima che Tullio se ne accorga.
        {charTag(Franco, "party")}:                 Ehi, {player_name}!
        {charTag(Franco, "neutral")}:               Mi diceva zio Gracco che hai trovato un libro.
                                                    E che l'hai letto molto.
        {charTag(Franco, "party")}:                 E come dico sempre ai gemelli: sapere è podere.
                                                    E se il podere ha uno stagno, allora c'è una rana.
                                                    E se c'è una rana, sarà felice di sapere anche lei che {player_name} ha letto il suo libro.
                                                    Sei un bravo girino.
    }

//Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
    ~ frog_currentMission = missionOne

//E poi scrivo la parte comune

    {charTag(Franco, "neutral")}:                   Sei capace di leggere quasi quanto {charNameTwo}.

        {
            - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "energy")}:       Quasi però!
                                                            Perché io sono il più megagrande lettore della scuola!
        }

    {charTag(Franco, "party")}:                             E come dico sempre: la conoscenza è sapere!
                                                            E il sapere è sapore per cui: dimmi come posso aiutarti.

        ->->

=== franco_provide_gift_for_completed_mission_Two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)


//Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
    {
        - frog_currentMission has missionTwo:
        {charTag(Franco, "party")}:                 Hai coltivato le piante in serra!

        - else:
        {charTag(Franco, "question")}:              L'avresti mai detto?
        {charTag(Franco, "neutral")}:               I girini sono future rane.
                                                    Ma se si lanciano sulla terra, non sanno respirare.
                                                    Da piccolo ci ho provato, e mamma Craazia mi ha detto: "Franco, hai il fango sugli occhi! Svegliati!"
                                                    Poi mi sono lavato via il fango e ci ho riprovato.
                                                    A quel punto è arrivato zio Gracco, che mi ha detto: "Non ti azzardare a rifare la algonara con la panna!"
                                                    E mi ha ributtato in acqua.
        {charTag(Franco, "party")}:                 Ma c'è una lettera delle formiche!
        {charTag(Franco, "reading")}:	            "Ci servivano  più piante in serra, era urgente, e {player_name} ci ha aiutate!"
        {charTag(Franco, "neutral")}:	            Ah, le formiche.
                                                    Il rapporto tra me e loro è un po' complicato perché.
                                                    Insomma.
                                                    Di solito le rane mangiano le formiche.
        {charTag(Franco, "party")}:                 Ma poi Giulio mi ha fatto diventare vegetariano.
        {charTag(Franco, "neutral")}:               Ma loro comunque non si fidano.
                                                    Giulio dice sempre: "Con l'arrivo dei gemelli dovremmo fare le formiche, non comprare cose inutili!"
                                                    E allora scavo dei cunicoli per tutto lo stagno.
                                                    E lui mi bacia sulla testa e mi dice: "Fortuna che ti amo."
        {charTag(Franco, "party")}:                 Anche io lo amo tanto.
    }

//Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
    ~ frog_currentMission = missionTwo

//E poi scrivo la parte comune

    {charTag(Franco, "question")}:                  Ma chissà come mai le formiche avevano bisogno di nuove piante.
    {charTag(Franco, "neutral")}:                   Ah, ecco una loro lettera.
    {charTag(Franco, "reading")}:	                "Avevamo fame."
    {charTag(Franco, "party")}:                     Mi sembra una buona motivazione.
            {
                - are_two_entities_together(FirstCharacter, PG):
                    {charTag(FirstCharacter, "affectionate")}:      Il cibo è sempre una motivazione.
            }
    {charTag(Franco, "party")}:                     E a proposito di cose buone: vediamo come posso aiutarti!

            ->->

=== franco_provide_gift_for_completed_mission_Three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


//Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
    {
        - frog_currentMission has missionThree:
        {charTag(Franco, "party")}:                 Hai parlato con {charNameFive}!

        - else:
        {charTag(Franco, "neutral")}:               Questa è facile.
                                                    Mi raccomando Franco, non distrarti.
        {charTag(Franco, "question")}:	            La nostra amica comune, hai presente no?
                                                    Quella che ci spiega le cose.
        {charTag(Franco, "neutral")}:               La voce.
                                                    Ecco.
        {charTag(Franco, "party")}:                 Mi ha spiegato tante cose su {charNameFive}.
        {charTag(Franco, "question")}:	            Sapevi ad esempio che può respirare fino a due minuti sott'acqua?
                                                    {
                                                        - are_two_entities_together(Mentor, PG):
                                                            {charTag(FifthCharacter, "hurry")}:             Eh?
                                                    }
                                                    {
                                                        - are_two_entities_together(FirstCharacter, PG):
                                                            {charTag(FirstCharacter, "curious")}:       Questa me la voglio godere tutta.
                                                    }
        {charTag(Franco, "question")}:	            E che mangia solo pesce?
        {charTag(Franco, "party")}:                 E che le piace giocare?
                                                    {
                                                        - are_two_entities_together(SecondCharacter, PG):
                                                            {charTag(SecondCharacter, "neutral")}:        IM-POS-SI-BI-LE!
                                                            {
                                                                - are_two_entities_together(Mentor, PG):
                                                                    {charTag(FifthCharacter, "hurry")}:             Guarda che sono bravissima a burraco!
                                                                    {charTag(SecondCharacter, "neutral")}:          Ma è una roba da vecchi!
                                                            }
                                                    }
        {charTag(Franco, "question")}:	            E che ha una tasca sotto l'ascella dove conserva le pietre che usa per rompere i gusci?
                                                    {
                                                        - are_two_entities_together(Mentor, PG):
                                                            {charTag(FifthCharacter, "neutral")}:                   A dire il vero ne ho anche una in testa, dove raccolgo le sciocchezze dette dalle rane.
                                                            {charTag(Franco, "neutral")}:                           Ma le rana sono molto sagge, quindi non hai molto da raccogliere.
                                                    }
        {charTag(Franco, "neutral")}:               E.
                                                    Uh, una lettera di Euforbo.
        {charTag(Franco, "reading")}:	            "Papà Franco, quella è la lontra, non {charNameFive}."
        {charTag(Franco, "neutral")}:	            Uh.
                                                    Euforbo.
        {charTag(Franco, "party")}:                 È più furbo di un pesce rosso.
        {charTag(Franco, "neutral")}:               Ma {charNameFive}.
                                                    Di cosa aveva bisogno {charNameFive}?
        {charTag(TheWitch, witch_state())}:         <i>{charNameFive} ama dare consigli per far star bene le persone.</i>
        {charTag(Franco, "question")}:	            <i>{charNameFive} crede di potere esistere solo quando si rende utile.</i>
        {charTag(Franco, "neutral")}:               Esatto.
                                                    Quella roba lì.
        {charTag(Franco, "party")}:                 E tu l'hai fatta felice chiedendole un consiglio su come stare bene!
        {charTag(Franco, "question")}:	            Ma quindi non è {charNameOne} che fa il nido sugli alberi?
                                                    {
                                                        - are_two_entities_together(FirstCharacter, PG):
                                                            {charTag(FirstCharacter, "curious")}:       Esatto!
                                                                                                        E poi ululo alla luna!
                                                            {charTag(Franco, "neutral")}:               Devo subito avvisare Euforbo!
                                                    }
    }

//Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
    ~ frog_currentMission = missionThree

        {charTag(Franco, "neutral")}:               Prima Tullio mi ha detto: "Franco, sei una brava persona, ma devi farti due domande prima di chiedere certe cose a {player_name}."
                                                    Gli ho chiesto quali fossero le due domande, e lui mi ha baciato sulla testa.
                                                    E poi mi ha detto "Per fortuna che sei simpatico."
        {charTag(Franco, "party")}:                 Ci amiamo così tanto.
        {charTag(Franco, "neutral")}:               Però ora {charNameFive} è più felice.
                                                     {
                                                        - are_two_entities_together(Mentor, PG):
                                                            {charTag(FifthCharacter, "neutral")}:                   Vero.
                                                    }
        {charTag(Franco, "party")}:                 E questo posto è un po' più felice.
                                                    E allora io ti rendo un po' più felice: dimmi come posso aiutarti.

            ->->

=== franco_provide_gift_for_completed_mission_Four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


//Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
    {
        - frog_currentMission has missionFour:
        {charTag(Franco, "party")}:                 Rieccoti {player_name}!

        - else:
        {charTag(Franco, "neutral")}:               Quando ero ancora un girino, mamma Craazia mi diceva sempre:
                                                    "Tuo fratello Clodoveo ha preso la mia intelligenza."
                                                    "Tua sorella Boemonda la bellezza di tuo padre."
                                                    E poi continuava così elencando tuttə lə miə centottantasei fradellə.
                                                    E infine.
                                                    "Tu, Franco. Hai delle belle pupille."
        {charTag(Franco, "party")}:                 Mi piacciono le mie pupille, mi fanno vedere tante cose.
        {charTag(Franco, "neutral")}:               Cose strane.
                                                    E le cose strane vanno condivise, così le persone sanno cosa aspettarsi dal mondo.
                                                    Come quando ho scoperto che gli umani chiamano la mia pancia "tronco".
                                                    Come il tronco degli alberi.
                                                    E allora ho capito che noi rane nasciamo girini, diventiamo rane, e poi, quando siamo vecchie, alberi.
        {charTag(Franco, "party")}:                 Bello, vero?
                                                    Il mondo è un po' una grande rana.
    }

//Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
    ~ frog_currentMission = missionFour

        {charTag(Franco, "neutral")}:               E poi.
        {charTag(Franco, "question")}:	            Ma dov'era?
                                                    Questa no.
                                                    Nemmeno questa.
        {charTag(Franco, "neutral")}:               {player_name}, tu non sai quanto sia bravo mio marito Tullio ad allungare lo stagno quando parla.
                                                    Non arriva mai al punto.
                                                    {
                                                    - are_two_entities_together(FirstCharacter, PG):
                                                        {charTag(FirstCharacter, "neutral")}:           Perché tu arrivi sempre al punto, Franco.
                                                        {charTag(Franco, "neutral")}:                   Sì sì, sempre.
                                                                                                        Preciso cone una mosca.
                                                        {charTag(FirstCharacter, "annoyed")}:           Non credo che.
                                                                                                        Ah, lascia perdere.
                                                        {charTag(Franco, "party")}:                     Non perdo mai.
                                                                                                        E Tullio non perde mai la parola.
                                                    }
        {charTag(Franco, "neutral")}:               Nemmeno sui bigliettini.
                                                    Ah, ecco qui.
        {charTag(Franco, "reading")}:	            "Ricordati di recuperare i gemelli al nido."
        {charTag(Franco, "neutral")}:               No, non era questo.
        {charTag(Franco, "reading")}:	            "Ricordati <b>davvero</b> di recuperare i gemelli al nido. Non come quella volta che sono tornati con l'anatra delle otto da soli."
                                                    "A proposito di anatre: le sorelle Qualqui vengono per cena. Mi prendi due etti di termiti e qualche seme? Ti amo."
        {charTag(Franco, "neutral")}:               Dall'arrivo dei gemelli ha un tritone per capello.
                                                    Avere centosedici figli non è una passeggiata.
                                                    Sempre meglio di zia Graaak, che ormai va per il migliaio.
        {charTag(Franco, "neutral")}:               Non hai idea del casino del ricordare tutti i compleanni, {player_name}!
        {charTag(Franco, "question")}:	            Ma io dovevo dirti qualcosa.
                                                    Cosa?
        {charTag(Franco, "party")}:                 Ah sì: che il gossip è importante.
                                                    Per cui grazie per aver parlato con {charNameFive} delle cose insolite che hai incontrato.
                                                    Non sai quanto abbia bisogno quella donna di uscire dal suo guscio.
        {charTag(Franco, "party")}:                 Per cui: vediamo come posso aiutarti!

        ->->

=== franco_provide_gift_for_completed_mission_Five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)


//Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
    {
        - frog_currentMission has missionFive:
        {charTag(Franco, "party")}:                 Ma ciao chiacchieron{player_pronoun has him:e|{player_pronoun has her:a|ə}}!

        - else:
        {charTag(Franco, "party")}:                 Tra qualche sera c'è il karaoke di cugina Sputt.
                                                    Non hai idea delle cose che accadono durante le sue feste, girino!
        {charTag(Franco, "neutral")}:               L'anno scorso ero così ubriaco di grappa d'alghe che ho addirittura...
                                                    Oh, mi vergogno a dirlo.
                                                    No, non posso dirlo.
                                                    Una cosa così stupida.
                                                    Ehi, una lettera di Tullio!
        {charTag(Franco, "reading")}:	            "Diglielo amore, ti supplico, diglielo e lascial{player_pronoun has him:o|{player_pronoun has her:a|ə}} andare."
        {charTag(Franco, "neutral")}:               Uh.
                                                    Insomma, {player_name}!
        {charTag(Franco, "party")}:                 Ho <b>nuotato</b>!
        {charTag(Franco, "question")}:              Non è assurdo?
                                                    Una rana che nuota!
        {charTag(Franco, "neutral")}:               Quando l'ho raccontato ai girini, mi hanno preso per pazzo!
                                                    Anche perché poi ovviamente sono quasi annegato.
                                                    Quest'anno ho promesso che non toccherò la grappa.
                                                    Niente, zero.
                                                    Sennò chissà cosa farò.
        {charTag(Franco, "party")}:                 Magari mi metto addirittura a <b>saltare</b>!
        {charTag(Franco, "question")}:              Te la immagini, girino?
                                                    Una rana che salta?
        {charTag(Franco, "neutral")}:               Ma c'è una lettera di Giulio.
        {charTag(Franco, "reading")}:	            "Di{player_pronoun has him:gli|{player_pronoun has her:lle|llə}} della commissione, Franco, abbi pietà per quella povera creatura!"
        {charTag(Franco, "question")}:              Oggi i mariti sono un po' nervosetti.
    }

//Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
    ~ frog_currentMission = missionFive

        {charTag(Franco, "party")}:                 Avannotti!
                                                    Ora ricordo!
                                                    Era "avannotti".
                                                    Non "ananassi."
        {charTag(Franco, "neutral")}:               Franco, hai sempre la testa tra le alghe.
        {charTag(Franco, "party")}:                 Cosa buffa, {player_name}.
        {charTag(Franco, "neutral")}:               Prima mio marito Tullio e l'altro marito, Giulio, stavano parlando di una partita di pallanuoto tra ananassi.
        {charTag(Franco, "question")}:              E, girino, quanto ero confuso!
                                                    Però a volte ho paura di sembrare tonto come una conchiglia, e quindi non chiedo nulla.
        {charTag(Franco, "party")}:                 Invece sono contento che prima hai visto cosa succede quando due persone parlano tra loro.
        {charTag(Franco, "neutral")}:               Alcune cose si complicano, altre sono più chiare!
                                                    Quindi: non essere come Franco. E se vedi due persone vicine, prova ancora a chiacchierare con loro.
                                                    Però una partita tra ananassi io me la guarderei.
        {charTag(Franco, "question")}:              Dopo lo dico a Giulio, magari ne esce qualcosa.
        {charTag(Franco, "party")}:                 Come quella volta che abbiamo tirato su una band.
                                                    Ci chiamavamo Depeche pond.
        {charTag(Franco, "neutral")}:               Ma non è stata una bella idea quella di mettere gli amplificatori in acqua.
                                                    I ricci sono ancora arrabbiati con noi.
                                                    Ma devo aiutarti, mannaggia alla mia distrazione.
                                                    Zio Gracco lo dice sempre: Franco!
                                                    Zio Gracco è un rospo di poche parole.
        ->->

=== franco_provide_gift_for_completed_mission_Six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)


//Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
    {
        - frog_currentMission has missionSix:
        {charTag(Franco, "party")}:                 Finalmente l'hai conosciuta!

        - else:
        {charTag(Franco, "neutral")}:               Prima c'è stato l'incontro tra genitori e insegnanti.
                                                    Non è facilissimo quando ci sono così tanti girini in giro.
                                                    "Girini in giro", suona bene!
                                                    Potrei farci una canzone trap!
                                                    "Girano i girini col girello nel girotondo".
                                                    "Girano e si agitano e smuovono il fondo!"
                                                    "Sono profondo!"
                                                    E poi?
        {charTag(Franco, "party")}:                 "Ah."
        {charTag(Franco, "question")}:              O è meglio "Yeah"?
        {charTag(Franco, "neutral")}:               Ah no, stavo parlando dell'incontro con gli insegnanti.
                                                    Ci sono anni in cui un incontro dura settimane.
                                                    Una volta c'erano così tanti girini che abbiamo avuto più tempo speso all'incontro che non con le lezioni.
                                                    Ora però ci sono classi più piccole.
                                                    Soprattutto dopo <b>quel</b> fattaccio con l'airone.
                                                    Glielo avevano detto tutti a zio Gracco che non aveva davvero la faccia da critico gastronomico.
                                                    Poveri girini.
        {charTag(Franco, "party")}:                 Però poteva andare peggio, per fortuna ci ha aiutato la nostra amica comune, quella della discarica.
                                                    {
                                                        - are_two_entities_together(SecondCharacter, PG):
                                                            {charTag(SecondCharacter, "emotional")}:        C'è qualcuno nella discarica?!

                                                    }

                                                    {
                                                        - are_two_entities_together(FirstCharacter, PG):
                                                            {charTag(FirstCharacter, "curious")}:           C'è un'altra persona qui in giro?

                                                    }

                                                    {
                                                        - are_two_entities_together(ThirdCharacter, PG):
                                                            {charTag(ThirdCharacter, "bored")}:             Questo posto è pieno di donne.

                                                    }

                                                    {
                                                        - are_two_entities_together(Mentor, PG):
                                                            {charTag(FifthCharacter, "bored")}:             C'è una discarica?!?

                                                    }
    }

//Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
    ~ frog_currentMission = missionSix

        {charTag(Franco, "neutral")}:               Non mi è ancora chiaro perché decida di stare in quella discarica.
        {charTag(TheWitch, witch_state())}:         La discarica è un promemoria delle nostre responsabilità.
        {charTag(Franco, "neutral")}:               Un po' come quando Tullio mi mette i promemoria sul cellulare.
                                                    Ma poi dimentico il cellulare a casa.
        {charTag(Franco, "party")}:                 Ma sono felice che hai parlato con la nostra amica comune!
        {charTag(Franco, "question")}:              E tu dirai: "Ma Franco, come fai a sapere sempre tutto?"
        {charTag(Franco, "neutral")}:               E io ti dirò: "Ma Franco è sempre la prima ruota del gatto, ovvio che sa tutto!"
        {charTag(Franco, "question")}:              E tu dirai: "Ma i gatti non hanno le ruote."
        {charTag(Franco, "neutral")}:               E allora io dirò: "I gatti hanno tante cose, ma non ce le vogliono fare sapere!"
                                                    E poi ti dirò: "Una volta ho conosciuto un gatto con un buffo cappello in testa."
        {charTag(Franco, "question")}:              E quando gli ho chiesto: "Giovandomenico, ma cosa ci fai con un cappello così in testa?"
        {charTag(Franco, "neutral")}:               Lui mi ha detto: "Meow!"
        {charTag(Franco, "party")}:                 I gatti sono così saggi.
        {charTag(Franco, "neutral")}:               Ma zia Graaak dice sempre: tanto va la gatta allo stagno, che ci rimette il girino.
        {charTag(Franco, "reading")}:	            Uh, una lettera di Tullio.
                                                    "Franco, di a quel{player_pronoun has her:la|lə} pover{player_pronoun has him:o|{player_pronoun has her:a|ə}} {player_name} quello che devi dir{player_pronoun has him:gli|{player_pronoun has her:le|lə}}!"
        {charTag(Franco, "question")}:              Uh, è sempre così teso.
        {charTag(Franco, "party")}:                 Comunque {player_name}: sono felice che hai parlato con lei.
                                                    Perché il lavoro che fai è molto delicato.
        {charTag(Franco, "neutral")}:               Molto.
                                                    Ed è bello avere una guida, un'alleata così saggia.
        {charTag(TheWitch, witch_state())}:         <i>La saggezza ha molte facce, e una porta il volto di Franco.</i>
        {charTag(Franco, "party")}:                  E ora quindi è il mio momento di aiutarti.

        ->->

=== franco_provide_gift_for_completed_mission_Seven
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)


//Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
    {
        - frog_currentMission has missionSeven:
        {charTag(Franco, "party")}:                 Hai conosciuto la cagnolina!

        - else:
        {charTag(Franco, "neutral")}:               Mannaggina che sonno, girino.
        {charTag(Franco, "question")}:              Ma sai una cosa?
        {charTag(Franco, "party")}:                 Mi diceva Dora che hai conosciuto la cagnolina della posta!
        {charTag(Franco, "neutral")}:               E che hai letto una lettera.
        {charTag(Franco, "question")}:              Non è ora di frasi un pisolino assieme, che ne dici?
        {charTag(Franco, "neutral")}:               Uh, una lettera di zio Gracco!
        {charTag(Franco, "reading")}:	            "Franco, c'è questo tizio che sembra un recensore magnifico!"
                                                    "E ha definito i miei lombrichi all'amatriciana "sublimi"!"
                                                    "Deve avere ovviamente buon gusto."
                                                    "Avrebbe bisogno di un po' di spazio per dormire, ma qui stiamo attendendo una nuova schiusa."
                                                    "Non è che puoi ospitarlo tu?"
                                                    "Si firma Signor Gufo de Predatoris."
                                                    "Puoi contattarlo tramite la carpa della sera."
                                                    "Anche se l'ultima è sparita da qualche giorno."
        {charTag(Franco, "neutral")}:               Mmm.
        {charTag(Franco, "question")}:              Che cosa strana.
                                                    Non dovrebbe essere "Signore Gufo" invece di "Signor Gufo"?
                                                    Sennò è come se dicessi "Ciao, sono la Ran Franco", no?
    }

//Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
    ~ frog_currentMission = missionSeven

        {charTag(Franco, "neutral")}:               I gemelli stanno facendo lo sciopero del sonno.
                                                    A fatica mi ricordo il mio nome.
                                                    E tutto perché Giulio non vuole prendergli un cane.
        {
            - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "energy")}:       Anche io voglio un caneeeeeeeeeeeeee!
                {charTag(Franco, "party")}:                 Allora sciopera coi gemelli!
        }
        {charTag(Franco, "neutral")}:               Comunque è sempre colpa di Dora l'ape.
                                                    Quella passa il tempo a svolazzare in giro, e poi se ne sta lì sulla riva a bere acqua e raccontare cose.
                                                    E ha detto ai gemelli della cagnolina alla fermata del treno.
                                                    Scusa, sono arrabbiato.
        {charTag(Franco, "party")}:                 Dora è una brava ape, buona come l'alga.
        {charTag(Franco, "neutral")}:               Ma ho sonno!
                                                    E l'altra sera l'ho detto ai gemelli.
                                                    Li ho fatti sedere tutti e centosedici in cerchio.
                                                    "Un cane non sa respirare sott'acqua, punto."
                                                    Ma poi Euforbo, che è il più sveglio dei gemelli, ha un mese e mezzo ma sta già nella classe dei tre mesi, mi dice: "Papà, siamo anfibi."
        {charTag(Franco, "question")}:              "E quindi?" gli chiedo, sperando solo di andare a dormire.
        {charTag(Franco, "neutral")}:               "E quindi sappiamo respirare anche fuori dall'acqua, papà Franco!"
        {charTag(Franco, "party")}:                 E la sorpresa, {player_name}!
                                                    Non ci avevo mai pensato, ma respiro fuori dall'acqua!
                                                    {
                                                        - are_two_entities_together(FirstCharacter, PG):
                                                            {charTag(FirstCharacter, "annoyed")}:           Franco, ma tu come ci sei arrivato all'età adulta?
                                                            {charTag(Franco, "neutral")}:                   Un po' a piedi, un po' col treno.
                                                    }
        {charTag(Franco, "party")}:                 E il mondo ora mi sembra così grande.
                                                    E pieno di possibilità.
                                                    Come quella di avere un cane.
                                                    Ora sto scioperando anche io coi gemelli.
        {charTag(Franco, "neutral")}:               Ma non sai quanto ho sonno!
                                                    E se ora ti aiuto col tuo lavoro, magari Giulio capisce che sono un bravo girino, e ci prende il cane!

        ->->

=== franco_provide_gift_for_completed_mission_Eight
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)


//Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
    {
        - frog_currentMission has missionEight:
        {charTag(Franco, "party")}:                 Ecco qui {player_pronoun has him:il|{player_pronoun has her:la|lə}} campion{player_pronoun has him:e|{player_pronoun has her:essa|essə}} di bibliotecosità!

        - else:
        {charTag(Franco, "neutral")}:               Euforbo ha portato a casa una pulce d'acqua.
                                                    La maestra vuole che imparino a prendersi cura di altre forme di vita.
                                                    Gli altri gemelli hanno già divorato le loro pulci, ma Euforbo ha un altro cuore.
        {charTag(Franco, "question")}:              Che un po' è ovvio: non è che potrebbe condividere il cuore con un altro gemello.
                                                    O con Tullio.
                                                    O con Giulio.
                                                    O con me.
        {charTag(Franco, "neutral")}:               Anche se Tullio mi dice sempre "Ti ho nel cuore".
        {charTag(Franco, "question")}:              Che è una cosa che un po' mi confonde.
        {charTag(Franco, "neutral")}:               Come quando Giulio dice "Euforbo ha la testa sulle spalle."
        {charTag(Franco, "question")}:              Ma è un girino, al massimo ha la testa sull'addome.
                                                    A volte quando condivido questi dubbi, Euforbo mi bacia sulla fronte e mi dice: "Papà, perché non torni a scuola?"
        {charTag(Franco, "neutral")}:               Mamma Craazia diceva sempre che prendo tutto alla lettera.
                                                    Forse per questo mi scrivono così spesso.
        {charTag(Franco, "party")}:                 Ma a proposito di scrivere!
                                                    I topi della biblioteca mi hanno detto che hai portato un po' di movimento.
                                                    Hai addirittura letto dei racconti, e sono così felici
        {charTag(Franco, "neutral")}:               I racconti.
                                                    E i topi.
                                                    E forse anche le lettere.
        {charTag(Franco, "question")}:              Uh, è da un po' che non mi scrivono.
    }

//Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
    ~ frog_currentMission = missionEight

        {charTag(Franco, "neutral")}:               Devo rispondere allo zio!
        {charTag(Franco, "reading")}:	            "Caro zio Gracco."
                                                    "La algonara è stata inventata nemmeno cento schiuse fa."
                                                    "Quindi se ci metto la panna no, non è un crimine contro lo stagno."
                                                    "Tuo nipote Franco."
                                                    "PS: potresti tenere i gemelli sabato? Vorrei andare alla seconda partita degli ananassi con Tullio e Giulio. Grazie mille."
                                                    "PPS: non è che mi passeresti anche la ricetta per la frittura di opilione? Grazie mille!"
        {charTag(Franco, "neutral")}:               Fatto.
                                                    Mi passa tra poco la carpa del pomeriggio, e quella è pignola con la posta.
        {charTag(Franco, "question")}:              Come si dice? Cerca sempre la squama nel batterio.
                                                    O era il batterio nella salamandra?
        {charTag(Franco, "neutral")}:               No, quella era la parola segreta per il karaoke di cugina Sputt.
        {charTag(Franco, "party")}:                 Cugina è una che canta benissimo, girino!
                                                    Ha una voce così forte che a volte vengono a lamentarsi anche i topi della biblioteca.
        {charTag(Franco, "neutral")}:               Forse ora che hai letto si calmano un poco.
                                                    Un po' ti invidio, sai?
                                                    Se tocco la carta i libri si rovinano.
                                                    Però la nostra amica comune a volte mi legge qualche storia.
        {charTag(Franco, "party")}:                 La mia preferita è quella del principe ranocchio.
                                                    Quando lei lo bacia e le vengono tutte le verruche.
                                                    {
                                                        - are_two_entities_together(FirstCharacter, PG):
                                                            {charTag(FirstCharacter, "neutral")}:         Onesto.
                                                    }
        {charTag(Franco, "neutral")}:               Gli umani dovrebbero imparare a lasciarci in pace.
                                                    {
                                                        - are_two_entities_together(SecondCharacter, PG):
                                                            {charTag(SecondCharacter, "melanchonic")}:          Anche io?
                                                            {
                                                                - grimoire_secondChar has grimSecondCharFranco:
                                                                    {charTag(Franco, "neutral")}:               Ma abbiamo già detto che tu sei una rana, {charNameTwo}!
                                                                - else:
                                                                    {charTag(Franco, "neutral")}:               Mmm.
                                                                                                                Io non sono sicuro che tu sei un umano.
                                                                                                                Sei troppo basso.
                                                            }
                                                    {charTag(Franco, "party")}:                                 Ma quando sei qui mi diverto tanto.
                                                                                                                Quindi sono in pace.
                                                }
    {charTag(Franco, "party")}:                     E a proposito di pace: vediamo come posso aiutarti!

        ->->



=== franco_provide_gift_for_completed_mission_Nine
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)


//Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
    {
        - frog_currentMission has missionNine:
        {charTag(Franco, "party")}:                 Hai guardato il ritratto di Giulio!

        - else:
        {charTag(Franco, "neutral")}:               Mi è arrivata una lettera dall'Accademia dei Bei Party.
        {charTag(Franco, "reading")}:	            "Esimio dottor Franco Lelio Arpagone Romualdo Arcezio Nepomiceno Alcuino."
                                                    "Le scriviamo in merito alla sua applicazione fatta per le veci del signor Giulio Igidio Liutprando Rigoberto Odovilio Sulpicio Policarpo Oruccio."
                                                    "E per l'ottava volta le ripetiamo che, per quanto apprezziamo gli sforzi del signor Giulio Il Rospo, noi siamo un'agenzia di viaggi e NON"
                                                    "E ripetiamo NON"
                                                    "Un'accademia di pittura."
                                                    "Per cui NO, non abbiamo borse di studio per il signor Giulio Il Rospo e"
                                                    "NO, non doniamo blocchi di marmo di Craackrara"
                                                    "E NO, non è che escludiamo il signor Giulio Il Rospo dai nostri corsi per un pregiudizio contro le rane."
                                                    "Ma noi non facciamo corsi di alcun tipo perché noi siamo una AGENZIA DI VIAGGI!"
                                                    "Se le interessa, abbiamo un pacchetto famiglia molto conveniente per l'isola dei serpenti."
                                                    "Cordialmente."
                                                    "Lo staff ABP."
                                                    "PS: e comunque i ritratti del signor Giulio Il Rospo sono brutti."
        {charTag(Franco, "party")}:                 {player_name}, questa Accademia è così esclusiva!
                                                    Sono due anni che provo a coronare il sogno di Giulio di diventare pittore.
        {charTag(Franco, "neutral")}:               Tutto questo è crudele.
        {charTag(Franco, "question")}:              Potrei forse andare a parlare loro di persona?
        {charTag(Franco, "party")}:                 Però so che tu hai già visto una delle sue opere, il nuovo ritratto che è appeso in camera tua!
    }

//Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
    ~ frog_currentMission = missionNine

        {charTag(Franco, "neutral")}:               E voglio chiederti cosa ne pensi.
                                                    Ma poi ho paura che mi dici che non ti piace.
                                                    Perché Giulio ci rimarrebbe male.
                                                    E non mi va che lui ci rimanga male.
                                                    Perché poi allora sarebbe penserebbe che è colpa sua se non lo prendono all'Accademia.
                                                    Ma secondo me è una cosa stupida quella di sentirsi in colpa.
                                                    Perché fai le cose che sai fare come le sai fare e per chi le sai fare.
        {charTag(Franco, "question")}:              E se non vanno bene all'Accademia, magari andranno bene in camera tua, no?
        {charTag(Franco, "party")}:                 Sicuramente va bene in camera tua!

        {charTag(Franco, "party")}:                 E a proposito di cose che vanno bene: vediamo come posso aiutarti!

        ->->



=== franco_provide_gift_for_completed_mission_Ten
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)


//Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
    {
        - frog_currentMission has missionTen:
        {charTag(Franco, "party")}:                 Hai completato la commissione!

        - else:
        {charTag(Franco, "neutral")}:               Ti svelo un segreto.
        {charTag(Franco, "question")}:              Sapevi che Franco, questo Franco, non un altro Franco, tipo Franco il postino o Franco il cugino di Pino.
                                                    E neanche quel cugino Franco che ha deciso di fare il poliziotto, e allora zia Graaak l'ha buttato fuori di casa.
        {charTag(Franco, "neutral")}:               No no, questo Franco che vedi qui davanti a te, lo sapevi che è un socio MENSA?
                                                    Non è che la cosa mi rende molto orgoglioso: è un po' snob come posto.
                                                    E poi non penso capiscano proprio proprio bene che il test per entrare è pieno di limiti.
                                                    E che magari non è che una rana non ce la fa ad entrarci perché è stupida, ma perché è una poveraccia.
                                                    Però l'ho fatto perché zio Gracco insisteva.
                                                    Dice che è fondamentale per trovare certi tipi di lavoro.
                                                    E io continuo a dirglielo che non voglio lavorare.
                                                    Soprattutto non in cucina.
                                                    Che è difficilissimo mettere l'ingrediente giusto.
                                                    E al MENSA hanno i corsi per gli ingredienti.
                                                    E anche per scegliere i mestoli.
                                                    Mica per niente si chiama Mestolo, Erbazzone, Nocciola: Scegliere Accuratamente.
                                                    Se gli dico che non mi piacciono le nocciole, mi tolgono la tessera?
        {charTag(Franco, "party")}:                 Però so che tu sai fare le scelte giuste, {player_name}.
                                                    E infatti hai già completato una commissione prima ancora che te lo chiedessi, e aggiunto un ingrediente extra in cucina!

    }

//Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
    ~ frog_currentMission = missionTen

        {charTag(Franco, "question")}:              Non so se lo sapevi già, ma ogni persona ha le sue cose preferite.
                                                    E quelle schiferite.
        {charTag(Franco, "neutral")}:               Per cui non arrabbiarti se qualcosa non è piaciuto.
                                                    Tipo a me non piace il formaggio.
        {charTag(Franco, "question")}:              Fa delle cose strane quando cade in acqua.
                                                    Però con l'ingrediente giusto finisce che magari la persona ti dice anche delle cose molto personali.
        {charTag(Franco, "neutral")}:               Come quando ho messo la grappa nella zuppa di Tullio.
                                                    E poi mi ha detto che vorrebbe comprarsi una moto, ma che le fanno troppo grandi per noi rane.

        {charTag(Franco, "party")}:                 E a proposito di cose grandi: vediamo come posso aiutarti!

        ->->



/*
 * SOLICIT
 */



=== franco_solicit_current_mission

    { frog_currentMission:
        - missionOne:
            -> franco_solicit_current_mission_One ->

        - missionTwo:
            -> franco_solicit_current_mission_Two ->

        - missionThree:
            -> franco_solicit_current_mission_Three ->

        - missionFour:
            -> franco_solicit_current_mission_Four ->

        - missionFive:
            -> franco_solicit_current_mission_Five ->

        - missionSix:
            -> franco_solicit_current_mission_Six ->

        - missionSeven:
            -> franco_solicit_current_mission_Seven ->

        - missionEight:
            -> franco_solicit_current_mission_Eight ->

        - missionNine:
            -> franco_solicit_current_mission_Nine ->

        - missionTen:
            -> franco_solicit_current_mission_Ten ->
    }

-> main



=== franco_solicit_current_mission_One
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)


    {charTag(Franco, "party")}:                         Ehi girino!
    {charTag(Franco, "neutral")}:                       Ricordati di leggere un po' dal tuo libro magico.
                                                        Io ti aspetto qui.
    {charTag(Franco, "question")}:                      Ma hai visto che bella che è questa rana riflessa nell'acqua?
    {charTag(Franco, "party")}:                         Ciao bellezza!

->->


=== franco_solicit_current_mission_Two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)


    {charTag(Franco, "party")}:                         {player_name}!
    {charTag(Franco, "question")}:                      Come sta andando con le piante della serra?
    {charTag(Franco, "neutral")}:                       Torna qui quando ce ne saranno abbastanza per le formiche!

->->


=== franco_solicit_current_mission_Three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {charTag(Franco, "party")}:                         Ma ecco di nuovo qui il mio girino preferito!
    {charTag(Franco, "question")}:                      Hai poi chiesto a {charNameFive} come stare bene?
        {
            - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "hurry")}:         Ma grazie Franco!
                                                        Ho tantissimi consigli da dare a {player_name}!
            {
                - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "annoyed")}:       Non ne dubitavo {charNameFive}.
            }

        }
    {charTag(Franco, "neutral")}:                       Intanto sistemo la posta arretrata.
    {charTag(Franco, "question")}:                      Che poi se deve andare avanti, non dovrebbe essere "avanzata"?
                                                        Però non si muove.
                                                        Forse è quindi "posta fermata"?

->->


=== franco_solicit_current_mission_Four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {charTag(Franco, "party")}:                         {player_name}!
    {charTag(Franco, "neutral")}:                       Le mie spie mi hanno detto che ancora non hai raccontato stranezze a {charNameFive}!
        {
            - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "hurry")}:             Stranezze?
        }
    {charTag(Franco, "neutral")}:                       Uh, non ho davvero delle spie.
                                                        Giusto qualche girino.
                                                        E Dora l'ape.
    {charTag(Franco, "party")}:                         E la nostra amica che a volte mi aiuta a capire meglio le cose.

->->


=== franco_solicit_current_mission_Five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {charTag(Franco, "question")}:                      Girino, sapevi che se metto la zampa nell'acqua si spezza?
                                                        Ma se poi la tiro fuori, è intera!
                                                        E non sento dolore!
    {charTag(Franco, "party")}:                         Questa è magia!
    {charTag(Franco, "neutral")}:                       Continuo a studiare questa cosa mentre tu provi a vedere cosa succede se parli con due persone assieme.
        {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "curious")}:       In che senso scusa?
            {charTag(Franco, "question")}:              In senso diagonale, vedi?
                                                        Ora la zampa è dritta.
                                                        Ora è in acqua ed è spezzata!
        }
    {charTag(Franco, "party")}:                         Se scopro come succede potrei cambiare il mondo!
                                                        E tutti un giorno parleranno di Franco la rana!

->->


=== franco_solicit_current_mission_Six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {charTag(Franco, "neutral")}:                       Parla con la nostra amica comune, girino.
                                                        Intanto resterò qui a scrivere una lettera di scuse a Tullio e Giulio.
    {charTag(Franco, "reading")}:	                    "Cari miei amori. Prometto di non dimenticare mai mai più i gemelli al nido..."

->->


=== franco_solicit_current_mission_Seven
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)


    {charTag(Franco, "party")}:                         Girino!
    {charTag(Franco, "neutral")}:                       Come diceva Gambusia de Filippi: c'è fitoplancton per te.
    {charTag(Franco, "question")}:                      Uh, forse non c'entra molto.
    {charTag(Franco, "neutral")}:                       Fammi sapere quando hai letto la lettera che ti aspetta alla stazione dei treni.

->->


=== franco_solicit_current_mission_Eight
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)


    {charTag(Franco, "neutral")}:                       {player_name}, continuano ad arrivarmi lettere dai topi della biblioteca.
    {charTag(Franco, "question")}:                      Non è che riesci a farci un salto e smuovere qualche racconto?
                                                        Intanto scelgo la canzone per il prossimo karaoke.
    {charTag(Franco, "party")}:                         Quasi quasi a questo giro porto "Il ballo del cra cra".
                                                        O "Craande, Craande, Craande".
                                                        Oppure ripasso anche il balletto con Tullio e Giulio e ci rifacciamo "Craak!... I did it again".

->->

=== franco_solicit_current_mission_Nine
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)


    {charTag(Franco, "reading")}:	                    "E mi rendo conto che le rane non piacciono a tutte le persone."
                                                        "Ma se per questo nemmeno le persone piacciono a tutte le rane."
                                                        "E quindi vi chiedo di accogliere mio marito nella vostra Accademia."
                                                        "Ma senza serpenti."
                                                        "Quelli ci mangiano."
    {charTag(Franco, "question")}:                      {player_name}, mi sa che ancora non hai guardato la nuova opera di Giulio, vero?
    {charTag(Franco, "neutral")}:                       La trovi in camera tua!
    {charTag(Franco, "reading")}:	                    "PS: ma il vostro campus ha ninfee singole o condivise?"

->->

=== franco_solicit_current_mission_Ten
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)


    {charTag(Franco, "neutral")}:                       {player_name}, quelli del MENSA mi stanno dicendo che li ho diffamati.
                                                        Solo perché ho scritto sotto un loro post che non è vero che se c'è internet allora uno è tenuto a sapere che la noce moscata non vola.
                                                        Anche perché ci sono un sacco di cose sbagliate su internet.
                                                        Tipo che tutte le rane nuotano.
    {charTag(Franco, "question")}:                      Ma mi sa invece che tu non hai ancora aggiunto un ingrediente extra in cucina, vero?


->->



/*
 * ASSIGN MISSION
 */



=== franco_assign_available_mission

    //Primo step: verifico se ci sono commissioni da togliere dalla lista perché non sono state raggiunte le condizioni per attivarle.

    //Commissione sei richiede invito strega a parlarle
    { frog_allMissionsCompleted hasnt missionSix && player_accessiblePlaces has Dump:
        {debug_frog: ci sono le condizioni per abilitare missionSix.}
        ~ frog_availableCommonMissions += missionSix
    }


    //Commissione sette richiede la presenza di Ursula alla stazione
    { frog_allMissionsCompleted hasnt missionSeven && (contentsTrainStop has DoggoFirstLetters) or (contentsTrainStop has DoggoSecondLetters) or (contentsTrainStop has DoggoThirdLetters):
        {debug_frog: ci sono le condizioni per abilitare missionSeven.}
            ~ frog_availableCommonMissions += missionSeven
    }

    //Commissione otto richiede che la biblioteca sia aperta
    { frog_allMissionsCompleted hasnt missionEight && player_accessiblePlaces has Library:
        ~ frog_availableCommonMissions += missionEight
        {debug_frog: ci sono le condizioni per abilitare missionEight.}
    }

    //Commissione nove richiede che almeno una riscrittura sia stata conclusa, così che ci sia il ritratto in camera
    { frog_allMissionsCompleted hasnt missionNine && story_endedStories != ():
        ~ frog_availableCommonMissions += missionNine
        {debug_frog: ci sono le condizioni per abilitare missionNine.}
    }

    //Commissione dieci richiede che la cucina sia aperta
    //Dato che devo essere sicura di darla quando c'è la possibilità di chiuderla in tempi decenti, per evitare di assegnarla nel primo atto (3 png da riscrivere) quando hanno già concluso il loro percorso in cucina, faccio due calcoli separati.
    TODO: completare con three, four, five
    { frog_allMissionsCompleted hasnt missionTen && player_accessiblePlaces has Kitchen && ( (grimoire_firstChar hasnt grimFirstCharKitchenEnded && story_endedStories hasnt story_firstCharStoryEnded) or (grimoire_secondChar hasnt grimSecondCharKitchenEnded && story_endedStories hasnt story_secondCharStoryEnded) ):
        ~ frog_availableCommonMissions += missionTen
        {debug_frog: ci sono le condizioni per abilitare missionTen.}
    }

    //Commissione speciale uno richiede l'apertura del nido e che sia stato creato almeno un sigillo. Strega all'inizio ce ne dona tre, per cui il conto è >3.
    { (frog_allMissionsCompleted hasnt specialMissionOne) && (player_accessiblePlaces has Nest) && (glyph_discoveredSigils != ()):
        ~ frog_availableSpecialMissions += specialMissionOne
        {debug_frog: ci sono le condizioni per abilitare specialMissionOne.}
    }

    //Commissione speciale due richiede l'apertura della cucina e che sia vuota.
    { frog_allMissionsCompleted hasnt specialMissionTwo && player_accessiblePlaces has Kitchen && kitchen_kitchenOccupied == false:
        ~ frog_availableSpecialMissions += specialMissionTwo
        {debug_frog: ci sono le condizioni per abilitare specialMissionTwo.}
    }


    // Secondo step, assegno una commissione a caso, passando prima da quelle prioritarie, e poi dalle altre.
    {
        - frog_availableSpecialMissions && frog_pauseSpecialMission <= 0:
            ~ frog_currentMission = LIST_MIN(frog_availableSpecialMissions)

        - frog_availableCommonMissions:
            ~ frog_currentMission = LIST_RANDOM(frog_availableCommonMissions)

        - LIST_COUNT(frog_allMissionsCompleted) < LIST_COUNT(frog_allAvailableMissions):
            {charTag(Franco, "party")}:                         Girino!
            {shuffle:
                                                            -   Per ora non ho commissioni da offrirti, ma non ti preoccupare, qualcosa poi me lo invento! Torna più tardi.
                                                            -   Sono in attesa della carpa che mi porta le commissioni, torna più tardi!
                                                            -   Sembra che per ora tutto vada bene, ma se torni più tardi magari ho nuove cose da farti fare!
            }
            -> main

        - else:
            {charTag(Franco, "party")}:                     Girino!
                                                            Ma sai che hai fatto tuuuuuuutte le commissioni che potevo offrirti?
                                                            Però possiamo rilassarci assieme!
            -> main
    }

    ~ frog_availableSpecialMissions -= frog_currentMission

    //Terzo step: faccio il dispatch effettivo delle commissioni.
    { frog_currentMission:

        - missionOne:
            -> franco_assign_mission_one

        - missionTwo:
            -> franco_assign_mission_two

        - missionThree:
            -> franco_assign_mission_three

        - missionFour:
            -> franco_assign_mission_four

        - missionFive:
            -> franco_assign_mission_five

        - missionSix:
            -> franco_assign_mission_six

        - missionSeven:
            -> franco_assign_mission_seven

        - missionEight:
            -> franco_assign_mission_eight

        - missionNine:
            -> franco_assign_mission_nine

        - missionTen:
            -> franco_assign_mission_ten

        - specialMissionOne:
            -> franco_assign_special_mission_one

        - specialMissionTwo:
            -> franco_assign_special_mission_two
    }



/*
 * DIALOGUES FOR MISSIONS
 */



=== franco_assign_mission_one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)


        {charTag(Franco, "question")}:                  Vediamo vediamo vediamo.
        {charTag(Franco, "neutral")}:                   Interessante.
                                                        Ho dimenticato di ordinare del punteruolo.
                                                        Devo assolutamente passare a prenderlo dal fiorista prima che Tullio se ne accorga.
        {charTag(Franco, "party")}:                     Ehi, {player_name}!
        {charTag(Franco, "question")}:                  Volevi qualcosa?
        {charTag(Franco, "neutral")}:                   Ah sì è vero.
        {charTag(Franco, "question")}:                  Vediamo un po' cosa farti fare.
        {charTag(Franco, "neutral")}:                   Questa è facile.
        {charTag(Franco, "party")}:                     Mi diceva zio Gracco che hai trovato un libro.
        {charTag(Franco, "question")}:                  Ma che non lo stai leggendo molto.
        {charTag(Franco, "party")}:                     E come dico sempre ai gemelli: sapere è podere.
                                                        E se il podere ha uno stagno, allora c'è una rana.
                                                        E se c'è una rana, sarà felice di sapere anche lei che {player_name} ha letto il suo libro.
        {charTag(Franco, "neutral")}:                   Per cui girino: leggi un po' del tuo libro e poi torna da me.

            //@animation:RewriterBook
             -> main

=== franco_assign_mission_two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)


        {charTag(Franco, "question")}:                  L'avresti mai detto?
                                                        I girini sono future rane.
                                                        Ma se si lanciano sulla terra, non sanno respirare.
        {charTag(Franco, "neutral")}:                   Da piccolo ci ho provato, e mamma Craazia mi ha detto: "Franco, hai il fango sugli occhi! Svegliati!"
                                                        Poi mi sono lavato via il fango e ci ho riprovato.
                                                        A quel punto è arrivato zio Gracco, che mi ha detto: "Non ti azzardare a rifare la algonara con la panna!"
                                                        E mi ha ributtato in acqua.
        {charTag(Franco, "party")}:                     Ma c'è una lettera delle formiche!
        {charTag(Franco, "reading")}:	                "Ci servono più piante in serra, è di vitale importanza!"
        {charTag(Franco, "neutral")}:                   Ah, le formiche.
                                                        Il rapporto tra me e loro è un po' complicato perché.
                                                        Insomma.
                                                        Di solito le rane mangiano le formiche.
        {charTag(Franco, "party")}:                     Ma poi Giulio mi ha fatto diventare vegetariano.
        {charTag(Franco, "neutral")}:                   Ma loro comunque non si fidano.
                                                        Giulio dice sempre: "Con l'arrivo dei gemelli dovremmo fare le formiche, non comprare cose inutili!"
                                                        E allora scavo dei cunicoli per tutto lo stagno.
                                                        E lui mi bacia sulla testa e mi dice: "Fortuna che ti amo."
        {charTag(Franco, "party")}:                     Anche io lo amo tanto.
                                                        Per cui facciamo le formiche.
                                                        E facciamole felici: torna quando avrai coltivato almeno tre piante!

            //@animation:RewriterBook
                -> main



=== franco_assign_mission_three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


        {charTag(Franco, "neutral")}:                   Questa è facile.
                                                        Mi raccomando Franco, non distrarti.
        {charTag(Franco, "question")}:                  La nostra amica comune, hai presente no?
                                                        Quella che ci spiega le cose.
        {charTag(Franco, "neutral")}:                   La voce.
                                                        Ecco.
        {charTag(Franco, "party")}:                     Mi ha raccontato tante cose su {charNameFive}.
        {charTag(Franco, "question")}:                  Sapevi ad esempio che può respirare fino a due minuti sott'acqua?
            {
                - are_two_entities_together(Mentor, PG):
                    {charTag(FifthCharacter, "hurry")}:         Eh?
            }
            {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "curious")}:       Questa me la voglio godere tutta.
            }
        {charTag(Franco, "question")}:                  E che mangia solo pesce?
                                                        E che le piace giocare?
            {
            - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "neutral")}:          IM-POS-SI-BI-LE!
            {
                - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "hurry")}:             Guarda che sono bravissima a burraco!
            {charTag(SecondCharacter, "neutral")}:          Ma è una roba da vecchi!
            }
            }
        {charTag(Franco, "question")}:                  E che ha una tasca sotto l'ascella dove conserva le pietre che usa per rompere i gusci?
            {
            - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "neutral")}:           A dire il vero ne ho anche una in testa, dove raccolgo le sciocchezze dette dalle rane.
            {charTag(Franco, "neutral")}:                   Ma le rana sono molto sagge, quindi non hai molto da raccogliere.
            }
        {charTag(Franco, "neutral")}:                   E.
                                                        Uh, una lettera di Euforbo.
                                                        "Papà Franco, quella è la lontra, non {charNameFive}."
                                                        Uh.
                                                        Euforbo.
        {charTag(Franco, "party")}:                     È più furbo di un pesce rosso.
        {charTag(Franco, "neutral")}:                   Ma {charNameFive}.
        {charTag(Franco, "question")}:                  Di cosa aveva bisogno {charNameFive}?
        {charTag(TheWitch, witch_state())}:             <i>{charNameFive} ama dare consigli per far star bene le persone.</i>
                                                        <i>{charNameFive} crede di potere esistere solo quando si rende utile.</i>
        {charTag(Franco, "neutral")}:                   Esatto.
                                                        Quella roba lì.
        {charTag(Franco, "party")}:                     La farà felice.
                                                        Fallo.
                                                        E poi torna pure qui.
            {
            - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "hurry")}:         Fai cosa? Fai cosa, {player_name}?
            }
        {charTag(Franco, "question")}:                  Ma quindi non è {charNameOne} che fa il nido sugli alberi?
            {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "curious")}:           Esatto!
                                                            E poi ululo alla luna!
            {charTag(Franco, "neutral")}:                   Devo subito avvisare Euforbo!
            }


            //@animation:RewriterBook
                -> main


=== franco_assign_mission_four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


        {charTag(Franco, "neutral")}:                   Quando ero ancora un girino, mamma Craazia mi diceva sempre:
                                                        "Tuo fratello Clodoveo ha preso la mia intelligenza."
                                                        "Tua sorella Boemonda la bellezza di tuo padre."
                                                        E poi continuava così elencando tuttə lə miə centottantasei fradellə.
                                                        E infine.
                                                        "Tu, Franco. Hai delle belle pupille."
        {charTag(Franco, "party")}:                     Mi piacciono le mie pupille, mi fanno vedere tante cose.
                                                        Cose strane.
        {charTag(Franco, "neutral")}:                   E le cose strane vanno condivise, così le persone sanno cosa aspettarsi dal mondo.
                                                        Come quando ho scoperto che gli umani chiamano la mia pancia "tronco".
        {charTag(Franco, "party")}:                     Come il tronco degli alberi.
                                                        E allora ho capito che noi rane nasciamo girini, diventiamo rane, e poi, quando siamo vecchie, alberi.
                                                        Bello, vero?
                                                        Il mondo è un po' una grande rana.
        {charTag(Franco, "question")}:                  E allora stavo pensando: perché non racconti a {charNameFive} qualcosa di strano che hai scoperto?
        {charTag(Franco, "party")}:                     Sono sicuro che così si diverte, e magari si rilassa un poco.
    {
        - are_two_entities_together(Mentor, PG):
        {charTag(FifthCharacter, "neutral")}:           In effetti non sarebbe male rilassarmi un poco.
    }

        {charTag(Franco, "neutral")}:                   Io intanto vado a salutare bisnonno Ninfeo.

            //@animation:RewriterBook
                -> main


=== franco_assign_mission_five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(Franco, "neutral")}:                   Tra qualche sera c'è il karaoke di cugina Sputt.
        {charTag(Franco, "party")}:                     Non hai idea delle cose che accadono durante le sue feste, girino!
                                                        L'anno scorso ero così ubriaco di grappa d'alghe che ho addirittura...
                                                        Oh, mi vergogno a dirlo.
        {charTag(Franco, "neutral")}:                   No, non posso dirlo.
                                                        Una cosa così stupida.
        {charTag(Franco, "party")}:                     Ehi, una lettera di Tullio!
        {charTag(Franco, "reading")}:	                "Diglielo amore, ti supplico, diglielo e lascial{player_pronoun has him:o|{player_pronoun has her:a|ə}} andare."
        {charTag(Franco, "neutral")}:                   Uh.
                                                        Insomma, {player_name}!
        {charTag(Franco, "party")}:                     Ho <b>nuotato</b>!
        {charTag(Franco, "question")}:                  Non è assurdo?
        {charTag(Franco, "party")}:                     Una rana che nuota!
                                                        Quando l'ho raccontato ai girini, mi hanno preso per pazzo!
        {charTag(Franco, "neutral")}:                   Quest'anno ho promesso che non toccherò la grappa.
                                                        Niente, zero.
                                                        Sennò chissà cosa farò.
        {charTag(Franco, "party")}:                     Magari mi metto addirittura a <b>saltare</b>!
        {charTag(Franco, "question")}:                  Te la immagini, girino?
                                                        Una rana che salta?
        {charTag(Franco, "neutral")}:                   Ma c'è una lettera di Giulio.
        {charTag(Franco, "reading")}:	                "Da{player_pronoun has him:gli|{player_pronoun has her:lle|llə}} la commissione, Franco, abbi pietà per quella povera creatura!"
        {charTag(Franco, "question")}:	                Oggi i mariti sono un po' nervosetti.
        {charTag(Franco, "neutral")}:                   Pensavo comunque {player_name}: perché non provi a parlare con due persone quando sono assieme?
                                                        Sono abbastanza sicuro che succederà qualcosa di interessante.
                                                        E a volte, quando non c'è comprensione, una voce esterna può essere di grande aiuto.
            {
                - are_two_entities_together(SecondCharacter, PG):
                    {charTag(SecondCharacter, "energy")}:       Io parlo sempre di cose grandi!
            }

            {
                - are_two_entities_together(FirstCharacter, PG):
                    {charTag(FirstCharacter, "annoyed")}:       Diremo cose metafisiche proprio.

            }
        {charTag(Franco, "party")}:                     Magari anche loro si mettono a nuotare!

        //@animation:RewriterBook
            -> main


=== franco_assign_mission_six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)


        {charTag(Franco, "neutral")}:                   Prima c'è stato l'incontro tra genitori e insegnanti.
                                                        Non è facilissimo quando ci sono così tanti girini in giro.
        {charTag(Franco, "party")}:                     "Girini in giro", suona bene!
                                                        Potrei farci una canzone trap!
                                                        "Girano i girini col girello nel girotondo".
                                                        "Girano e si agitano e smuovono il fondo!"
                                                        "Sono profondo!"
        {charTag(Franco, "question")}:                  E poi?
        {charTag(Franco, "party")}:                     "Ah."
        {charTag(Franco, "question")}:                  O è meglio "Yeah"?
        {charTag(Franco, "neutral")}:                   Ah no, stavo parlando dell'incontro con gli insegnanti.
                                                        Ci sono anni in cui un incontro dura settimane.
                                                        Ora però ci sono classi più piccole.
                                                        Soprattutto dopo <b>quel</b> fattaccio con l'airone.
                                                        Glielo avevano detto tutti a zio Gracco che non aveva davvero la faccia da critico gastronomico.
                                                        Poveri girini.
        {charTag(Franco, "party")}:                     Però poteva andare peggio, per fortuna ci ha aiutato la nostra amica comune.
                                                        E visto che alcune cose sono cambiate, perché non provi a parlarle direttamente?
        {charTag(Franco, "neutral")}:                   La trovi dalle parti della discarica.
                                                        Credo potrebbe farti del bene conoscerla direttamente.
            {
            - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "emotional")}:        C'è qualcuno nella discarica?!

            }

            {
            - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "curious")}:           C'è un'altra persona qui in giro?

            }

            {
            - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "bored")}:             C'è una discarica?!?

            }
            {
            - are_two_entities_together(ThirdCharacter, PG):
            {charTag(ThirdCharacter, "jester")}:                Voi la chiamate discarica, ma da me quello è il parco giochi comunale.
            }
        {charTag(Franco, "neutral")}:                   Come dice sempre zia Graaak: "Chi va piano non arriva lontano."
        {charTag(Franco, "question")}:                  O era qualcosa sulla minestra?
        {charTag(Franco, "neutral")}:                   A dopo girino!

            //@animation:RewriterBook
                -> main


=== franco_assign_mission_seven
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)


        {charTag(Franco, "neutral")}:                   Mannaggina che sonno, girino.
        {charTag(Franco, "question")}:                  Ma sai una cosa?
        {charTag(Franco, "neutral")}:                   Mi diceva Dora l'ape che c'è della posta per te in stazione.
                                                        Perché non vai a vedere, e poi torni da me?
                                                        Intanto mi faccio un pisolino.
                                                        Uh, una lettera di zio Gracco!
        {charTag(Franco, "reading")}:	                "Franco, c'è questo tizio che sembra un recensore magnifico!"
                                                        "E ha definito i miei lombrichi all'amatriciana "sublimi"!"
                                                        "Deve avere ovviamente buon gusto."
                                                        "Avrebbe bisogno di un po' di spazio per dormire, ma qui stiamo attendendo una nuova schiusa."
                                                        "Non è che puoi ospitarlo tu?"
                                                        "Si firma Signor Gufo de Predatoris."
                                                        "Puoi contattarlo tramite la carpa della sera."
                                                        "Anche se l'ultima è sparita da qualche giorno."
        {charTag(Franco, "neutral")}:	                Mmm.
        {charTag(Franco, "question")}:                  Che cosa strana.
    {
    - are_two_entities_together(SecondCharacter, PG):
        {charTag(SecondCharacter, "emotional")}:        Più strana di Franco?
                                                        Franco la Rana Strana?
        {charTag(Franco, "party")}:                     Esatto!
    }
        {charTag(Franco, "question")}:                  Non dovrebbe essere "Signore Gufo" invece di "Signor Gufo"?
                                                        Sennò è come se dicessi "Ciao, sono la Ran Franco", no?
                                                        Mi devo fidare?
                                                            +  \ {charTag(PG, "neutral")}:         No!
                                                            +  \ {charTag(PG, "neutral")}:         No?!?
                                                            +  \ {charTag(PG, "neutral")}:         NO!
                                                            +  \ {charTag(PG, "neutral")}:         NOOOOOOO!
                                                            +  \ {charTag(PG, "neutral")}:         Franco, per fortuna che sei divertente. Ma no.
                                                            -
        {charTag(Franco, "question")}:                  Come dice il detto?
                                                        "{player_pronoun has him:Il riscrittore|{player_pronoun has her:La riscrittora|Lə riscrittorə}} ha sempre ragione!"
        {charTag(Franco, "neutral")}:                   Povero zio Gracco.
                                                        Spera sempre di diventare famoso.
                                                        A dopo {player_name}!

            //@animation:RewriterBook
                -> main

=== franco_assign_mission_eight
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)


        {charTag(Franco, "neutral")}:                   Euforbo ha portato a casa una pulce d'acqua.
                                                        La maestra vuole che imparino a prendersi cura di altre forme di vita.
                                                        Gli altri gemelli hanno già divorato le loro pulci, ma Euforbo ha un altro cuore.
        {charTag(Franco, "question")}:                  Che un po' è ovvio: non è che potrebbe condividere il cuore con un altro gemello.
        {charTag(Franco, "neutral")}:                   O con Tullio.
                                                        O con Giulio.
                                                        O con me.
                                                        Anche se Tullio mi dice sempre "Ti ho nel cuore".
        {charTag(Franco, "question")}:                  Che è una cosa che un po' mi confonde.
        {charTag(Franco, "neutral")}:                   Come quando Giulio dice "Euforbo ha la testa sulle spalle."
        {charTag(Franco, "question")}:                  Ma è un girino, al massimo ha la testa sull'addome.
        {charTag(Franco, "neutral")}:                   A volte quando condivido questi dubbi, Euforbo mi bacia sulla fronte e mi dice: "Papà, perché non torni a scuola?"
                                                        Mamma Craazia diceva sempre che prendo tutto alla lettera.
                                                        Forse per questo mi scrivono così spesso.
                                                        Ma a proposito di scrivere!
                                                        I topi della biblioteca hanno bisogno di un po' di movimento.
        {charTag(Franco, "question")}:                  Perché non sposti qualche racconto, e magari lo leggi?
        {charTag(Franco, "party")}:                     Così sono felici.
                                                        I racconti.
                                                        E i topi.
                                                        E forse anche le lettere.
        {charTag(Franco, "question")}:                  Uh, è da un po' che non mi scrivono.

            //@animation:RewriterBook
                -> main

=== franco_assign_mission_nine
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)


        {charTag(Franco, "neutral")}:                   Mi è arrivata una lettera dall'Accademia dei Bei Party.
        {charTag(Franco, "reading")}:	                "Esimio dottor Franco Lelio Arpagone Romualdo Arcezio Nepomiceno Alcuino."
                                                        "Le scriviamo in merito alla sua applicazione fatta per le veci del signor Giulio Igidio Liutprando Rigoberto Odovilio Sulpicio Policarpo Oruccio."
                                                        "E per l'ottava volta le ripetiamo che, per quanto apprezziamo gli sforzi del signor Giulio Il Rospo, noi siamo un'agenzia di viaggi e NON"
                                                        "E ripetiamo NON"
                                                        "Un'accademia di pittura."
                                                        "Per cui NO, non abbiamo borse di studio per il signor Giulio Il Rospo e"
                                                        "NO, non doniamo blocchi di marmo di Craackara"
                                                        "E NO, non è che escludiamo il signor Giulio Il Rospo dai nostri corsi per un pregiudizio contro le rane."
                                                        "Ma noi non facciamo corsi di alcun tipo perché noi siamo una AGENZIA DI VIAGGI!"
                                                        "Se le interessa, abbiamo un pacchetto famiglia molto conveniente per l'Isola dei Serpenti."
                                                        "Cordialmente."
                                                        "Lo staff ABP."
                                                        "PS: e comunque i ritratti del signor Giulio Il Rospo sono brutti."
        {charTag(Franco, "neutral")}:	                {player_name}, questa Accademia è così esclusiva!
        {charTag(Franco, "party")}:                     Sono due anni che provo a coronare il sogno di Giulio di diventare pittore.
        {charTag(Franco, "neutral")}:                   Tutto questo è crudele.
        {charTag(Franco, "question")}:                  Potrei forse andare a parlare loro di persona?
        {charTag(Franco, "party")}:                     Nel mentre ti chiedo un favore: ho appeso uno dei suoi ritratti nella tua camera.
        {charTag(Franco, "question")}:                  Ti andrebbe di darci un'occhiata e dirmi cosa ne pensi?
        {charTag(Franco, "neutral")}:                   Nel mentre rispondo all'Accademia.
                                                        "Cara Accademia dei Bei Party."
                                                        "Sono sicuro che possiamo raggiungere un accordo per far accedere mio marito ai vostri corsi."
                                                        "Vi piacciono le nocciole?"

            //@animation:RewriterBook
                -> main



=== franco_assign_mission_ten
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)


        {charTag(Franco, "neutral")}:                   Ti svelo un segreto.
        {charTag(Franco, "question")}:                  Sapevi che Franco, questo Franco, non un altro Franco, tipo Franco il postino o Franco il cugino di Pino.
                                                        E neanche quel cugino Franco che ha deciso di fare il poliziotto, e allora zia Graaak l'ha buttato fuori di casa.
                                                        No no, questo Franco che vedi qui davanti a te, lo sapevi che è un socio MENSA?
                                                        Non è che la cosa mi rende molto orgoglioso: è un po' snob come posto.
                                                        E poi non penso capiscano proprio proprio bene che il test per entrare è pieno di limiti.
                                                        E che magari non è che una rana non ce la fa a superare il test perché è stupida, ma perché è una poveraccia.
        {charTag(Franco, "neutral")}:                   Però l'ho fatto perché zio Gracco insisteva.
                                                        Dice che è fondamentale per trovare certi tipi di lavoro.
                                                        E io continuo a dirglielo che non voglio lavorare.
                                                        Soprattutto non in cucina.
                                                        Che è difficilissimo mettere l'ingrediente giusto.
                                                        E al MENSA hanno i corsi per gli ingredienti.
                                                        E anche per scegliere i mestoli.
                                                        Mica per niente si chiama Mestolo, Erbazzone, Nocciola: Scegliere Accuratamente.
        {charTag(Franco, "question")}:                  Se gli dico che non mi piacciono le nocciole, mi tolgono la tessera?
        {charTag(Franco, "party")}:                     Però so che tu sai fare le scelte giuste, {player_name}.
        {charTag(Franco, "neutral")}:                   Per cui la tua prossima commissione è: quando sarai in cucina con un'altra persona, aggiungi un ingrediente extra.
                                                        E poi torna da me.
        {charTag(Franco, "party")}:                     Potresti fare molto felice la persona che cucina con te.

            //@animation:RewriterBook
                -> main

//Missioni speciali, con script ad hoc per dare premi o cose del genere.
=== franco_assign_special_mission_one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)


        {charTag(Franco, "party")}:                     Girino!
                                                        Mi serve un favore enorme, grande almeno quanto il cuore di zia Graaak.
        {charTag(Franco, "neutral")}:                   Che il medico dice che è un problema.
                                                        Il cuore, non zia Graaak.
        {charTag(Franco, "party")}:                     Lei è adorabile, quando non mi sgrida.
        {charTag(Franco, "neutral")}:                   E ora mi sgriderebbe perché ho perso il filo.
        {charTag(Franco, "party")}:                     Vediamoci sulla spiaggia!

        ~ move_entity(earthGlyph, Nest)
        ~ move_entity(Franco, Nest)

    //@animation:RewriterBook
    -> main

=== franco_assign_special_mission_one_contents
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)


        {charTag(Franco, "party")}:                     Eccoti girino!
        {charTag(Franco, "neutral")}:                   Questa è una cosa molto delicata, per cui promettimi che la terrai per te.
                                                        E per me ovviamente, perché se la tieni solo per te me la dimentico, e quello sì che diventerebbe un problema.
                                                        Si tratta di Euforbo.
                                                        Le maestre sono preoccupate.
                                                        Dicono che è molto intelligente.
        {charTag(Franco, "party")}:                     Sa tipo come respirare sott'acqua e ha anche trovato un modo per gracchiare senza sputare, e conosce tutto delle salamandre.
        {charTag(Franco, "neutral")}:                   Ma non sa come esprimere bene le sue emozioni, si agita tantissimo quando prova a dirle e poi si zittisce tutto.
                                                        Mi si rompe il cuore quando lo vedo così.
                                                        Ma la nostra amica comune mi ha detto che ci sono questi sigilli che non servono per chiudere le cose ma per aprirle.
        {charTag(Franco, "question")}:                  Che quindi sarebbero delle chiavi, no?
        {charTag(Franco, "neutral")}:                   Anche se pure le chiavi chiudono e aprono.
        {charTag(Franco, "question")}:                  Quindi forse dei grimaldelli?
                                                        Che poi ho visto che mi ha dato un sasso, quel sasso lì nuovo che vedi.
        {charTag(Franco, "neutral")}:                   E i sassi aprono anche le teste con un po' di forza.
                                                        Ma non voglio metterci le emozioni dentro a Euforbo, voglio che le sappia dire.
                                                        E mi ha detto "crediamo che con questo tipo di glifo all'inizio, {player_name} possa scoprire un sigillo adatto per aiutare Euforbo".
        {charTag(TheWitch, witch_state())}:             <i>Confermiamo.</i>
        {charTag(Franco, "neutral")}:                   Mi fido di lei, non mi ha detto molto altro.
                                                        E non so cosa faranno quei sigilli di preciso, ma mi sono ricordato di quando Euforbo era piccolo e non voleva nuotare.
                                                        Poi l'abbiamo lasciato da solo quando abbiamo traslocato verso la nuova corrente e ha imparato da solo.
                                                        Un pezzo alla volta.
                                                        E quindi mi sa che se ci dai un sigillo così, bello o brutto che sia, alla fine è come il primo colpo di pinna, e poi lui sa meglio come dirle le cose.
                                                        Creane uno, io me lo prendo e poi glielo dono e vediamo che succede.
        {charTag(Franco, "party")}:                     Grazie, girino!

    //@animation:RewriterBook

    -> main


=== franco_assign_special_mission_two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)


        {charTag(Franco, "party")}:                     Girino!
                                                        Ho una sorpresa per te!
                                                        Troviamoci in cucina.
        {charTag(Franco, "neutral")}:                   Ma non "nella" cucina.
                                                        Sul pontile.
                                                        Perché se ci mettiamo nella cucina, poi finisce che si cuoce.
        {charTag(Franco, "question")}:                  Come la rana nella pentola, hai presente?
        {charTag(Franco, "neutral")}:                   Quella che era nell'acqua.
                                                        Poi l'acqua ha iniziato a bollire.
        {charTag(Franco, "question")}:                  E poi le hai detto "Ma se facessi pagare per questa esperienza?"
        {charTag(Franco, "neutral")}:                   E così ha aperto degli stabilimenti termali in una vecchia cucina.
                                                        Ma nessuno ci è andato.
                                                        Perché nessuna rana vuole davvero bollire.
        {charTag(Franco, "party")}:                     E perché poi le rane odiano gli imprenditori.
{
    - are_two_entities_together(FirstCharacter, PG):
        {charTag(FirstCharacter, "affectionate")}:      Allora sono una rana.
        {charTag(Franco, "question")}:                  Ma sai nuotare?
        {charTag(FirstCharacter, "sad")}:               No.
        {charTag(Franco, "party")}:                     Allora sei una rana, sicuro!

}

        {charTag(Franco, "party")}:                     Ci vediamo in cucina!

        ~ move_entity(Franco, Safekeeping)
        ~ move_entity(FrancoCucina, Kitchen)
        ~ kitchen_kitchenOccupied = true
        //@animation:RewriterBook
        -> main
