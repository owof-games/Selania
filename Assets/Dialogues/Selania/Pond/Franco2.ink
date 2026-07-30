=== franco_pond
{debug_frog: Entro in franco2}
+ {are_two_entities_together(Franco, PG) && entity_location(PG) == Pond} [Franco]

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

// end
-> main



= franco_is_tired

    {charTag(Franco, "party")}:                     Girino!
    {charTag(Franco, "neutral")}:                   Franco è stanchino ora.
                                                    Torna più tardi e provo a darti una zampa.
    {charTag(Franco, "question")}:                  Basta che poi me la restituisci, sennò non so come grattare la schiena di zio Gracco.
                                                    
                                                        ~ move_entity(Franco, Safekeeping)
-> main


= franco_cant_give_a_gift

    {charTag(Franco, "party")}:                         Girino!
    {charTag(Franco, "neutral")}:                       Per ora non ho modo di aiutarti, ma non ti preoccupare: vedo di ricordarmi che ti meriti un premio.
                                                        E appena la situazione si aggiorna, potrai ritirarlo!
-> main


= franco_has_a_suspended_gift

    {charTag(Franco, "party")}:                       Ehi girino!
    {shuffle:
                                                    - Hai ancora quel dono di prima da prendere!
                                                    - Devo ancora darti quel dono!
                                                    - Te lo ricordi che c'ho qui una cosa per te, vero?
                                                    - Franco La Rana ha qui qualcosa che è tuo!
                                                    - Ricordati che se ti serve c'ho qui il tuo dono!
    }

    -> franco_wants_to_give_you_a_gift



/*
 * SPECIAL STORYLETS
 */


= franco_special_storylets

    // compute special storylet for third char: there's been a problem with the gifted object, with the ingredient in the kitchen, or with the universal ingredient in the kitchen
    ~ temp thirdCharDiscrepancy = frog_third_char_object_gift == thirdChar_giftedObject && thirdChar_giftedObject != ()
    ~ thirdCharDiscrepancy = thirdCharDiscrepancy || frog_third_char_object_ingredient == kitchen_thirdCharExtraIngredient && frog_third_char_object_ingredient != ()
    ~ thirdCharDiscrepancy = thirdCharDiscrepancy || frog_third_char_object_ingredient == universalIngredient

    {   //Prima presentazione
        - grimoire_franco hasnt grimFrancoFirst:
            -> franco_special_storylets_intro ->
        
        - are_two_entities_together(PG, Franco) && special_mission_one_contents && entity_location(PG) == Pond && grimoire_franco hasnt grimFrancoSpecialMissionOneFeedback:
            -> franco_special_storylets_feedback_mission_one_closed

        - thirdCharDiscrepancy && grimoire_franco hasnt grimFrancoThirdIngredientFailure:
            -> franco_special_storylets_third_ingredient_failure ->

        - not franco_special_storylets_open_kitchen && player_accessiblePlaces has Kitchen:
            -> franco_special_storylets_open_kitchen ->

        - not franco_special_storylets_open_library && player_accessiblePlaces has Nest:
            -> franco_special_storylets_open_library ->

        - not franco_special_storylets_open_nest && player_accessiblePlaces has Library:
            -> franco_special_storylets_open_nest ->

        - are_two_entities_together(PG, Franco) && achievements_fullLore ==  Discovered && grimoire_franco hasnt grimFrancoAllDocuments:
            -> franco_special_storylets_allDocumentsFounded    
    }

->->


= franco_special_storylets_intro

    ~ temp charNameOne = translator(firstChar_ActualName)
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
    {
        - are_two_entities_together(SecondCharacter, PG):
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
        {
            - are_two_entities_together(FirstCharacter, PG):
                                                    {charTag(FirstCharacter, "affectionate")}:       Livello di confusione: sì.
        }
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "jester")}:        Rana: mi sento ubriaco e non ho manco bevuto!
        }

    ~ grimoire_franco += grimFrancoFirst

->->


= franco_special_storylets_third_ingredient_failure

    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)

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
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "jester")}:                Pensavi di avere davanti un libro aperto, vero Franchì?
        }                                            
        {
        - are_two_entities_together(FirstCharacter, PG):
        {charTag(FirstCharacter, "annoyed")}:               Franco, non ti crucciare: per sapere di cosa ha bisogno, {charNameThree} dovrebbe farsi delle domande.
                                                            E non credo sia il suo forte.
            {
            - are_two_entities_together(ThirdCharacter, PG):
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
    ~ temp charNameTwo = translator(secondChar_ActualName)
    

    {charTag(Franco, "party")}:                     Girino!
    {charTag(Franco, "neutral")}:                   Ora che {charNameOne} ti ha aperto la cucina, posso darti delle dritte anche su quale ingrediente aggiungere quando cucini con una persona!
    {charTag(Franco, "party")}:                     Non è una cosa francosissima?!?
                                                    Che è tipo bellissima, solo più bagnaticcia.


->->

=== franco_special_storylets_open_library
    ~ temp charNameOne = translator(firstChar_ActualName)
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
    ~ temp charNameTwo = translator(secondChar_ActualName)
    

    {charTag(Franco, "party")}:                     Girino!
    {charTag(Franco, "neutral")}:                   Ho saputo che {charNameThree} ha aperto il nido.
                                                    Qui non posso fare miracoli, perché quei sigilli sono un graaaack casino.
    {charTag(Franco, "party")}:                     Ma posso recuperartene uno che hai utilizzato.
    {charTag(Franco, "neutral")}:                   Uno ce la faccio.
                                                    Poi sono troppo pesanti per le mie zampine.
      
->->


=== franco_special_storylets_feedback_mission_one_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    

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
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    

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

 === function franco_available_potential_gifts_for_char_internal(storyStatus, ref giftedObject, grimoireList, grimoireKitchenItem, grimoireNovelItem)

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


=== function franco_available_potential_gifts_for_char(character)

    {character:
        - FirstCharacter:
            ~ return franco_available_potential_gifts_for_char_internal(firstChar_storyStatus, firstChar_giftedObject, grimoire_firstChar, grimFirstCharKitchenEnded, grimFirstCharNovel)
        - SecondCharacter:
            ~ return franco_available_potential_gifts_for_char_internal(secondChar_storyStatus, secondChar_giftedObject, grimoire_secondChar, grimSecondCharKitchenEnded, grimSecondCharNovel)
        - ThirdCharacter:
            ~ return franco_available_potential_gifts_for_char_internal(thirdChar_storyStatus, thirdChar_giftedObject, grimoire_thirdChar, grimThirdCharKitchenEnded, grimThirdCharNovel)
        - FourthCharacter:
            ~ return franco_available_potential_gifts_for_char_internal(fourthChar_storyStatus, fourthChar_giftedObject, grimoire_fourthChar, grimFourthCharKitchenEnded, grimFourthCharNovel)
        - FifthCharacter:
            ~ return franco_available_potential_gifts_for_char_internal(fifthChar_storyStatus, fifthChar_giftedObject, grimoire_fifthChar, grimFifthCharKitchenEnded, grimFifthCharNovel)
    }


 === function franco_available_gifts_for_char_internal(storyStatus, ref giftedObject, grimoireList, grimoireKitchenItem, grimoireNovelItem)

    ~ temp potentialGifts = franco_available_potential_gifts_for_char_internal(storyStatus, giftedObject, grimoireList, grimoireKitchenItem, grimoireNovelItem)

    {player_accessiblePlaces hasnt Kitchen:
        ~ potentialGifts -= ingredientGift
    }

    {player_accessiblePlaces hasnt Library:
        ~ potentialGifts -= bookGift
    }

    ~ return potentialGifts


=== function franco_available_gifts_for_char(character)

    {character:
        - FirstCharacter:
            ~ return franco_available_gifts_for_char_internal(firstChar_storyStatus, firstChar_giftedObject, grimoire_firstChar, grimFirstCharKitchenEnded, grimFirstCharNovel)
        - SecondCharacter:
            ~ return franco_available_gifts_for_char_internal(secondChar_storyStatus, secondChar_giftedObject, grimoire_secondChar, grimSecondCharKitchenEnded, grimSecondCharNovel)
        - ThirdCharacter:
            ~ return franco_available_gifts_for_char_internal(thirdChar_storyStatus, thirdChar_giftedObject, grimoire_thirdChar, grimThirdCharKitchenEnded, grimThirdCharNovel)
        - FourthCharacter:
            ~ return franco_available_gifts_for_char_internal(fourthChar_storyStatus, fourthChar_giftedObject, grimoire_fourthChar, grimFourthCharKitchenEnded, grimFourthCharNovel)
        - FifthCharacter:
            ~ return franco_available_gifts_for_char_internal(fifthChar_storyStatus, fifthChar_giftedObject, grimoire_fifthChar, grimFifthCharKitchenEnded, grimFifthCharNovel)
    }


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

    TODO fare gli altri personaggi

    // let the player choose which gifts they want (or if they don't want it yet)
                                                        Come vuoi che ti aiuti?

        TODO fare quarto e quinto personaggio

    +   {charTag(PG, "neutral")}:                       Mi servirebbe un consiglio su {charNameOne}.
        -> franco_wants_to_give_you_a_gift_first_character
    +   {charTag(PG, "neutral")}:                       Vorrei una mano con {charNameTwo}.
        -> franco_wants_to_give_you_a_gift_second_character
    +   {charTag(PG, "neutral")}:                       Cosa potresti offrirmi per {charNameThree}?
        -> franco_wants_to_give_you_a_gift_third_character
    +   {charTag(PG, "neutral")}:                       Apprezzerei un aiuto con {charNameFour}.
        -> main
    +   {charTag(PG, "neutral")}:                       Qualche dritta su {charNameFive}?
        -> main
    +   {charTag(PG, "neutral")}:                       Vorrei pensarci ancora un po'.
        {charTag(Franco, "neutral")}:                   Mi trovi qui girino.
        {shuffle:
                                                    -   Continuo a contare tutte le onde!
                                                    -   Intanto sonnecchio sulla ninfea.
                                                    -   Nel mentre scrivo a Babbo Navale.
                                                    -   Continuo a leggere "<i>Lezioni di nuoto per girini</i>".
                                                    -   Devo decidere cosa cucinare per il compleanno dei gemelli.
        }                                                
        ~ frog_suspended_gift = true


-> main


=== franco_wants_to_give_you_a_gift_first_character

{debug_frog: passo da franco_giftsFirstChar.}
    ~ temp charNameOne = translator(firstChar_ActualName)

    {
        - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "neutral")}:           Se resto mi sembra di barare.
            {charTag(FirstCharacter, "annoyed")}:           Anche se non ha senso, visto che lo stai facendo tu, {player_name}.
            ~ move_entity(FirstCharacter, Forest)
    }

    {shuffle once:
        - {charTag(Franco, "party")}:                   Uh, mi piace {charNameOne}, è sempre così gentile con me!
        - {charTag(Franco, "party")}:                   {charNameOne} ha una bella testolina.
                                                        Piena di girini che corrono alla svelta.
        - {charTag(Franco, "party")}:                   {charNameOne} andrebbe molto d'accordo con Tullio.
                                                        Anche lui è un artista.
        - {charTag(Franco, "party")}:                   Ottimamente!                             
    }

    <- franco_wants_to_give_you_a_gift_common_dispatch(FirstCharacter, -> book)
    + -> main

    = book
        ~ temp charNameOne = translator(firstChar_ActualName)
        {
        - library_readStories has Aza:
            {charTag(Franco, "party")}:                     Franco vede, vede vede...
            {charTag(Franco, "neutral")}:                   Uh, devo aprire gli occhi.
                                                            Ma mi dicevano i topi della biblioteca che prima hai letto <b>Luna vergine</b> di Aza.
            {charTag(Franco, "neutral")}:                   Prova a parlare con {charNameOne} e vedrai che avrà sicuramente qualcosa da dirti.
                                                            Anche perché so che ha già letto <b>Luna vergine</b> di Aza.
                                                            Le persone parlano tanto delle cose che leggono.
            {charTag(Franco, "question")}:                  O vedono.
                                                            O ascoltano.
            {charTag(Franco, "party")}:                     Per fortuna io parlo poco.
                ~ frog_first_novel = "<b>Luna vergine</b> di Aza"
                ~ frog_firstCharAchievableGifts -= bookGift

        - else:
            {charTag(Franco, "neutral")}:                   C'è una lettera dei topi della biblioteca.
                {charTag(Franco, "reading")}:	                "Parola chiave: trasformazione".
                                                            Ah, e dietro c'è scritto: "Lunga".
            {charTag(Franco, "question")}:                  Forse vogliono diventare zucche?
            {charTag(Franco, "neutral")}:                   Ma magari tu ci capisci qualcosa e allora trovi il racconto che ti serve!
                ~ frog_first_novel = "una storia lunga che parli di trasformazione"
                ~ frog_firstCharAchievableGifts -= bookGift
        }

    -> franco_wants_to_give_you_a_gift_close_exchange           


=== franco_wants_to_give_you_a_gift_second_character
    ~ temp charNameTwo = translator(secondChar_ActualName)

    {
        - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "energy")}:           Uh, Franco sa tantissime cose di me!
            {charTag(SecondCharacter, "emotional")}:        Sicuro che ti aiuta be-nis-si-mo!
            {charTag(SecondCharacter, "neutral")}:          Ma io vado a fare qualcos'altro.
                ~ move_entity(SecondCharacter, Forest)
    }

    {shuffle once:
        - {charTag(Franco, "party")}:                   Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!
        - {charTag(Franco, "party")}:                   Sì! Voglio chiedere a {charNameTwo} se facciamo lezioni di nuoto assieme!
        - {charTag(Franco, "party")}:                   {charNameTwo} mi sta tanto simpatico.
                                                        Anche se non ho ancora capito quella cosa della elettricità.
        - {charTag(Franco, "party")}:                   Ottimamente!                                   
    }

    <- franco_wants_to_give_you_a_gift_common_dispatch(SecondCharacter, -> book)
    + -> main

    = book
        ~ temp charNameTwo = translator(secondChar_ActualName)
        {
            - library_readStories has Lamia:
                {charTag(Franco, "party")}:                     Prima Gliberia, una delle topoline della biblioteca, ha visto che stavi leggendo <b>Il sassolino</b>.
                        {charTag(Franco, "neutral")}:           Prova a parlare con lui e vedrai che avrà sicuramente qualcosa da dirti.
                        {charTag(Franco, "party")}:             Anche perché è certissimamerrimo che ha già letto <b>Il sassolino</b>!
                        {charTag(Franco, "neutral")}:           A {charNameTwo} piace parlare.
                        {charTag(Franco, "party")}:             Ora mi sta insegnando come non annegare!
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
        -> franco_wants_to_give_you_a_gift_close_exchange


=== franco_wants_to_give_you_a_gift_third_character
    ~ temp charNameThree = translator(thirdChar_ActualName)

    {
    - are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "neutral")}:               Vi lascio alle vostre chiacchiere, via.
        {charTag(ThirdCharacter, "jester")}:                Ma se mi fischiano le orecchie vedete che penserò male di voi!
                ~ move_entity(ThirdCharacter, Forest)
    }

    {shuffle once:
        - {charTag(Franco, "neutral")}:                     Uh, non ho ancora capito {charNameThree}, ma posso aiutarti lo stesso!
        - {charTag(Franco, "neutral")}:                     Mi parla sempre del fantacalcio ma ancora non ho capito quando devo schierare i draghi.
        - {charTag(Franco, "neutral")}:                     {charNameThree} mi dice sempre che sono una sagoma, non capisco.
        - {charTag(Franco, "neutral")}:                     Perfetto!                                 
    }

    <- franco_wants_to_give_you_a_gift_common_dispatch(ThirdCharacter, -> book)
    + -> main
    
    = book
        ~ temp charNameThree = translator(thirdChar_ActualName)        
        {
            - library_readStories has Maura:
            {charTag(Franco, "party")}:                     Sembra che tu abbia già letto <b>Polvere</b>.
                    {charTag(Franco, "neutral")}:           Prova a parlare con lui e sono sicuro che avrà qualcosa da commentare!.
                    {charTag(Franco, "party")}:             Anche perché è sicuro che ha letto <b>Polvere</b>!
                    {charTag(Franco, "neutral")}:           L'hanno sentito tutti con quella cosa del licantropo.
                    {charTag(Franco, "party")}:             Se un licantropo mi morde, divento una rana mannnara?
                            ~ frog_third_novel = "<b>Polvere</b> di Maura"
                            ~ frog_thirdCharAchievableGifts -= bookGift

            - else:
                {charTag(Franco, "neutral")}:                   Secondo l'ultime novità in campo editoriale, {charNameThree} è uno che apprezza le cose rapide, e che bruciano.
                {charTag(Franco, "question")}:                  Che non è una buona idea per un libro.
                                                                Sapevi che i primi libri sapevano volare?
                {charTag(Franco, "party")}:                     Si libravano in aria.
                {charTag(Franco, "neutral")}:                   Ma poi era davvero difficile leggerli mentre si muovevano così tanto.
                                                                Così cugina Sputt li ha addomesticati.
                                                                E ora sonnecchiano tutto il giorno nelle biblioteche.
                                                                Che avevano le teche proprio per non farli scappare.
                {charTag(Franco, "party")}:                     Hai visto quante cose so?
                    ~ frog_third_novel = "qualcosa di rapido e che brucia"
                    ~ frog_thirdCharAchievableGifts -= bookGift
        }
        -> franco_wants_to_give_you_a_gift_close_exchange


=== franco_wants_to_give_you_a_gift_common_dispatch(character, -> book)
    ~ temp achievableGifts = franco_available_gifts_for_char(character)
    + {achievableGifts has cultivableGift}  \ {charTag(PG, "neutral")}:         Cosa potrei regalarle?
        -> franco_giftsPlants(character, Pond)
    + {achievableGifts has ingredientGift && player_accessiblePlaces has Kitchen}  \ {charTag(PG, "neutral")}:         Quale ingrediente potrei usare in cucina con lei?
        -> franco_giftsPlants(character, Kitchen)
    + {achievableGifts has bookGift && player_accessiblePlaces has Library}  \ {charTag(PG, "neutral")}:         Di quale racconto vorrebbe parlare?
        -> book



=== franco_wants_to_give_you_a_gift_close_exchange
{debug_frog: passo closed_exchange.}

{charTag(Franco, "party")}:                         Girino!

{
    - closed_exchange == 1:                         Gattino!
                                                    Bambino!
    {charTag(Franco, "question")}:                  Hai mai visto quante cose piccole finiscono con "ino?"
                                                    Tranne il pino.
                                                    Non dovrebbe chiamarsi "pone"?
    {charTag(Franco, "neutral")}:                   Ma non Pino il girino, che è grosso come, uh, una lettera da zia Graaak.
    {charTag(Franco, "reading")}:	                "Dice Pino di dire a {player_name} quella faccenda delle commissioni finite."
                                                    "E poi se gli riporti la sua crema solare."
    {charTag(Franco, "neutral")}:	                Vero!
                                                    La crema!
                                                    Anche per noi è importante proteggere la nostra pelle.
                                                    Poi ci vengono le bolle.
    {charTag(Franco, "party")}:                     Anche se alcune rane le apprezzano.
    {charTag(Franco, "neutral")}:                   Uh, una lettera di zia Graaak.
    {charTag(Franco, "reading")}:	                "LE COMMISSIONI! DEVI DIRE CHE NON SONO INFINITE!"
                                                    "SENNO' POI COME FA UNA PERSONA A DECIDERE QUALE AIUTO VUOLE DA TE?!?"
                                                    "E QUINDI DEVI SOLO DIRE "NE HO ALCUNE SPECIALI CHE HANNO LE LORO REGOLE, MA LE COMMISSIONI A DISPOSIZIONE ORA SONO SOLO DIECI!"
                                                    "E SE LE COMMISSIONI SONO SOLO DIECI, QUANTE VOLTE PUOI AIUTARE QUELLA POVERA ANIMA, FRANCO? QUANTE?"
    {charTag(Franco, "question")}:	                Perdonami {player_name}, ma nella mia famiglia tutti si agitano così velocemente.
                                                    Sai che quasi quasi mi faccio un pisolino ora?

    - else:

    {shuffle once:
            -   {charTag(Franco, "party")}:         Facciamo un bel duo noi due.
                                                    Io il cervello, tu la mano.
                                                    Quella è una mano, vero?
                                                    A dopo girino!

            -   {charTag(Franco, "party")}:         Non la senti la soddisfazione di qualcosa di concluso?
                {charTag(Franco, "question")}:      E non confuso?
                                                    Illuso?
                                                    Escluso?
                                                    Deluso.
                                                    Uh, dicevamo?

            -   {charTag(Franco, "neutral")}:       Come dice sempre Tullio: "Per fortuna che non sai guidare."
                                                    E come dice sempre Giulio: "Dopo il lavoro bisogna riposare."
                                                    E ora riposiamo un po', {player_name}!

            -   {charTag(Franco, "party")}:         Siamo un portento assieme, abbiamo chiuso un'altra commissione!
                {charTag(Franco, "neutral")}:       Anche se zia Graaak dice che sono più un tormento.
                                                    Forse perché da piccolo soffiavo tantissimo.
                                                    E una volta ho avuto un raffreddore che faceva piovere ovunque.
                                                    Uh, una lettera di Tullio.
                {charTag(Franco, "reading")}:	    "Quella è la tormenta, Franco."
                                                    "Tu sei un tormento di coccole."
                {charTag(Franco, "party")}:         Quanto è carino?
                                                    Devo assolutamente spupazzarlo.

            -   {charTag(Franco, "party")}:         Un'altra commissione chiusa dal dream team Franco e {player_name}!
                                                    Chi ci ferma più, a noi?
                {charTag(Franco, "question")}:      A parte la polizia, {~per quella cosa dei volantini.|dopo quella faccenda della molotov.|per via di quegli adesivi su Mangione.|per via di quel datacenter in fiamme.|dopo la schedatura alla manifestazione per la Palestina.}
                {charTag(Franco, "neutral")}:       Ma è un'altra storia.
                {
                    - are_two_entities_together(PG, FourthCharacter):
                        {charTag(FourthCharacter, "neutral")}:    Non cambiare mai Franco.
                }  

    }      

}

-> main