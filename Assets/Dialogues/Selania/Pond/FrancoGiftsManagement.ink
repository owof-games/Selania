// === franco_giftsManagement ===
// {debug_frog: passo da franco_giftsManagement.}
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
//     ~ temp charNameFour = translator(fourthChar_ActualName)
//     ~ temp charNameFive = translator(fifthChar_ActualName)


//     //Facciamo un passaggio di aggiornamento degli achievements subito dopo la chiusura di una commissione
//     -> achievements_onGame_statusUpdate_GM ->
//     {
//         - frog_giftability == false:
//             {charTag(Franco, "party")}:                         Girino!
//             {charTag(Franco, "neutral")}:                       Per ora non ho modo di aiutarti, ma non ti preoccupare: vedo di ricordarmi che ti meriti un premio.
//                                                                 E appena la situazione si aggiorna, potrai ritirarlo!
//                                                                     ~ frog_suspended_gift = true

//         - else:
//             {charTag(Franco, "party")}:                         Bene girino, direi che è il momento che Franco ti dia una zampa!
//             {
//                 - firstChar_storyStatus == story_storyStarted && frog_firstCharAchievableGifts != () && frog_firstCharGiftable == false:
//                 {charTag(Franco, "neutral")}:                   Ti dico che per ora non ho consigli utili su {charNameOne}, ma mi sto attivando per aiutarti, parola di Franco! 
//             }

//             {
//                 - secondChar_storyStatus == story_storyStarted && frog_secondCharAchievableGifts != () && frog_secondCharGiftable == false:
//                 {charTag(Franco, "neutral")}:                    Non ho dritte su {charNameTwo}, solo rovesci, ma se torni più avanti sono sicuro che qualcosa di nuovo te lo posso dare.
//             }

//             {
//                 - thirdChar_storyStatus == story_storyStarted && frog_thirdCharAchievableGifts != () && frog_thirdCharGiftable == false:
//                 {charTag(Franco, "neutral")}:                     Ci sono cose di {charNameThree} che per ora mi sono un mistero misterioso, ma se torni più tardi te le posso smisterare.
//                 {charTag(Franco, "question")}:                    O smistare?
//             }
     
//     }



    

//     - (top)
//     {frog_giftability: Come vuoi che ti aiuti?}

//         + {frog_firstCharGiftable == true} \ {charTag(PG, "neutral")}:              Mi servirebbe un consiglio su {charNameOne}.
//             -> franco_giftsFirstChar
//         + {frog_secondCharGiftable == true}  \ {charTag(PG, "neutral")}:            Vorrei una mano con {charNameTwo}.
//             -> franco_giftsSecondChar
//         + {frog_thirdCharGiftable == true}  \ {charTag(PG, "neutral")}:             Cosa potresti offrirmi per {charNameThree}?
//             -> franco_giftsThirdChar
//         + {frog_fourthCharGiftable == true}  \ {charTag(PG, "neutral")}:            Apprezzerei un aiuto con {charNameFour}.
//             -> franco_giftsFourthChar
//         + {frog_fifthCharGiftable == true}  \ {charTag(PG, "neutral")}:             Qualche dritta su {charNameFive}?
//             -> franco_giftsFifthChar
//         + {(frog_recoverableCultivables != ()) && (frog_recoveredCultivables == ())}  \ {charTag(PG, "neutral")}:         Puoi aiutarmi a recuperare una pianta che ho già utilizzato?
//                 {charTag(Franco, "party")}:                     Certo che craack!
//                                                                 Ma.
//                                                                 Lo posso fare solo una volta.
//                                                                     + + Ok, voglio usare ora questa occasione!
//                                                                         -> cultivable_recovery
//                                                                     + + Mmm, ci ragiono su.
//                                                                         -> top

//         + {frog_recoveredSigil == () && glyph_usedSigils != ()}  \ {charTag(PG, "neutral")}:         Puoi aiutarmi a recuperare un sigillo che ho già utilizzato?
//                 {charTag(Franco, "party")}:                     Certo che craack!
//                                                                 Ma.
//                 {charTag(Franco, "neutral")}:                   Lo posso fare solo una volta.
//                                                                 E dandotene uno a caso.
//                 {charTag(Franco, "question")}:                  I sigilli sono più strani delle capre, e non so fare di meglio.
//                                                                     + + Ok, voglio usare ora questa occasione!
//                                                                         //Chiamo direttamente la funzione, non ci sono scelte da compiere in questo caso.
//                                                                         ~ sigil_recovery ()
//                                                                         //E poi esco
//                                                                         -> closed_exchange

//                                                                     + + Mmm, ci ragiono su.
//                                                                         -> top

//         + {frog_giftability}  \ {charTag(PG, "neutral")}:         Vorrei pensarci ancora un po'.
//             {charTag(Franco, "neutral")}:                       Mi trovi qui girino.
//             {shuffle:
//                                                         -   Continuo a contare tutte le onde!
//                                                         -   Intanto sonnecchio sulla ninfea.
//                                                         -   Nel mentre scrivo a Babbo Navale.
//                                                         -   Continuo a leggere "<i>Lezioni di nuoto per girini</i>".
//                                                         -   Devo decidere cosa cucinare per il compleanno dei gemelli.
//             }

                                                            
//                                                                 ~ frog_suspended_gift = true
//                                                             -> main
        
//         + {! frog_giftability}  \ {charTag(PG, "neutral")}:         Perfetto, torno dopo allora!
//             -> main
        
//         -
// ->->

// === franco_giftsFirstChar ===
// {debug_frog: passo da franco_giftsFirstChar.}
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
//     ~ temp charNameFour = translator(fourthChar_ActualName)
//     ~ temp charNameFive = translator(fifthChar_ActualName)


//     {
//         - are_two_entities_together(FirstCharacter, PG):
//             {charTag(FirstCharacter, "neutral")}:           Se resto mi sembra di barare.
//             {charTag(FirstCharacter, "annoyed")}:           Anche se non ha senso, visto che lo stai facendo tu, {player_name}.
//             ~ move_entity(FirstCharacter, Forest)
//     }

//     {shuffle once:
//         - {charTag(Franco, "party")}:                   Uh, mi piace {charNameOne}, è sempre così gentile con me!
//         - {charTag(Franco, "party")}:                   {charNameOne} ha una bella testolina.
//                                                         Piena di girini che corrono alla svelta.
//         - {charTag(Franco, "party")}:                   {charNameOne} andrebbe molto d'accordo con Tullio.
//                                                         Anche lui è un artista.
//         - {charTag(Franco, "party")}:                   Ottimamente!                             
//     }
    
//     + {frog_firstCharAchievableGifts has cultivableGift}  \ {charTag(PG, "neutral")}:         Cosa potrei regalarle?
//         -> franco_giftsPlants(FirstCharacter, Pond)
//     + {frog_firstCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen}  \ {charTag(PG, "neutral")}:         Quale ingrediente potrei usare in cucina con lei?
//         -> franco_giftsPlants(FirstCharacter, Kitchen)
//     + {frog_firstCharAchievableGifts has bookGift && player_accessiblePlaces has Library}  \ {charTag(PG, "neutral")}:         Di quale racconto vorrebbe parlare?
//         -> book
//     +  \ {charTag(PG, "neutral")}:         Ora che ci penso, potresti aiutarmi in modo diverso?
//         -> franco_giftsManagement.top

//         = book
//             ~ temp charNameOne = translator(firstChar_ActualName)
//             ~ temp charNameTwo = translator(secondChar_ActualName)
//             ~ temp charNameThree = translator(thirdChar_ActualName)
//             ~ temp charNameFour = translator(fourthChar_ActualName)
//             ~ temp charNameFive = translator(fifthChar_ActualName)
        

//         {
//             - library_readStories has Aza:
//                 {charTag(Franco, "party")}:                     Franco vede, vede vede...
//                 {charTag(Franco, "neutral")}:                   Uh, devo aprire gli occhi.
//                                                                 Ma mi dicevano i topi della biblioteca che prima hai letto <b>Luna vergine</b> di Aza.
//                     {
//                         - grimoire_firstChar has grimFirstCharNovel:
//                             {charTag(Franco, "party")}:                     E che ne hai già parlato con {charNameOne}!
//                             {charTag(Franco, "neutral")}:                   Perché non scegli un altro dono?
//                                 ~ frog_first_novel = "<b>Luna vergine</b> di Aza"
//                                 -> franco_giftsManagement.top
                    
//                         - else:
//                             {charTag(Franco, "neutral")}:                   Prova a parlare con {charNameOne} e vedrai che avrà sicuramente qualcosa da dirti.
//                                                                             Anche perché so che ha già letto <b>Luna vergine</b> di Aza.
//                                                                             Le persone parlano tanto delle cose che leggono.
//                             {charTag(Franco, "question")}:                  O vedono.
//                                                                             O ascoltano.
//                             {charTag(Franco, "party")}:                     Per fortuna io parlo poco.
//                                 ~ frog_first_novel = "<b>Luna vergine</b> di Aza"
//                                 ~ frog_firstCharAchievableGifts -= bookGift
//                                 -> closed_exchange
                    
//                     }

//             - else:
//                 {charTag(Franco, "neutral")}:                   C'è una lettera dei topi della biblioteca.
//                  {charTag(Franco, "reading")}:	                "Parola chiave: trasformazione".
//                                                                 Ah, e dietro c'è scritto: "Lunga".
//                 {charTag(Franco, "question")}:                  Forse vogliono diventare zucche?
//                 {charTag(Franco, "neutral")}:                   Ma magari tu ci capisci qualcosa e allora trovi il racconto che ti serve!
//                     ~ frog_first_novel = "una storia lunga che parli di trasformazione"
//                     ~ frog_firstCharAchievableGifts -= bookGift
//                     -> closed_exchange
//             }
 
//         -> closed_exchange           


// === franco_giftsSecondChar ===
// {debug_frog: passo da franco_giftsSecondChar.}
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
//     ~ temp charNameFour = translator(fourthChar_ActualName)
//     ~ temp charNameFive = translator(fifthChar_ActualName)


//     {
//         - are_two_entities_together(SecondCharacter, PG):
//             {charTag(SecondCharacter, "energy")}:           Uh, Franco sa tantissime cose di me!
//             {charTag(SecondCharacter, "emotional")}:        Sicuro che ti aiuta be-nis-si-mo!
//             {charTag(SecondCharacter, "neutral")}:          Ma io vado a fare qualcos'altro.
//                 ~ move_entity(SecondCharacter, Forest)
//     }

//     {shuffle once:
//         - {charTag(Franco, "party")}:                   Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!
//         - {charTag(Franco, "party")}:                   Sì! Voglio chiedere a {charNameTwo} se facciamo lezioni di nuoto assieme!
//         - {charTag(Franco, "party")}:                   {charNameTwo} mi sta tanto simpatico.
//                                                         Anche se non ho ancora capito quella cosa della elettricità.
//         - {charTag(Franco, "party")}:                   Ottimamente!                                   
//     }
    
//     + {frog_secondCharAchievableGifts has cultivableGift}  \ {charTag(PG, "neutral")}:         Cosa potrei regalargli?
//         -> franco_giftsPlants(SecondCharacter, Pond)
//     + {frog_secondCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen}  \ {charTag(PG, "neutral")}:         Quale ingrediente potrei usare in cucina con lui?
//         -> franco_giftsPlants(SecondCharacter, Kitchen)
//     + {frog_secondCharAchievableGifts has bookGift && player_accessiblePlaces has Library}  \ {charTag(PG, "neutral")}:         Di quale racconto vorrebbe parlare?
//         -> book
//     +  \ {charTag(PG, "neutral")}:         Ora che ci penso, potresti aiutarmi in modo diverso?
//         -> franco_giftsManagement.top
    

//         = book
//             ~ temp charNameOne = translator(firstChar_ActualName)
//             ~ temp charNameTwo = translator(secondChar_ActualName)
//             ~ temp charNameThree = translator(thirdChar_ActualName)
//             ~ temp charNameFour = translator(fourthChar_ActualName)
//             ~ temp charNameFive = translator(fifthChar_ActualName)
        

                
//         {
//             - library_readStories has Lamia:
//                 {charTag(Franco, "party")}:                     Prima Gliberia, una delle topoline della biblioteca, ha visto che stavi leggendo <b>Il sassolino</b>.
//                     {
//                         - grimoire_secondChar has grimSecondCharNovel:
//                                                                 E che ne avete già parlato con {charNameTwo}.
//                         {charTag(Franco, "neutral")}:           Perché non scegli un altro dono?
//                                 ~ frog_second_novel = "<b>Il sassolino</b> di Lamia"
//                                     -> franco_giftsManagement.top
                    
//                         - else:
//                         {charTag(Franco, "neutral")}:           Prova a parlare con lui e vedrai che avrà sicuramente qualcosa da dirti.
//                         {charTag(Franco, "party")}:             Anche perché è certissimamerrimo che ha già letto <b>Il sassolino</b>!
//                         {charTag(Franco, "neutral")}:           A {charNameTwo} piace parlare.
//                         {charTag(Franco, "party")}:             Ora mi sta insegnando come non annegare!
//                                 ~ frog_second_novel = "<b>Il sassolino</b> di Lamia"
//                                 ~ frog_secondCharAchievableGifts -= bookGift
//                                 -> closed_exchange
//                     }

//             - else:
//                 {charTag(Franco, "neutral")}:                   Secondo il manuale della biblioteca, {charNameTwo} è uno da fenotipo "ribellione" combinato con "veloce".
//                 {charTag(Franco, "question")}:                  E tu dirai "Franco la rana, cos'è un fenotipo?"
//                 {charTag(Franco, "neutral")}:                   E io ti dirò "Un tipo a cui piace tanto il fieno!"
//                                                                 E poi aggiungerò "Che è un po' diverso dal topognomastico, che è un topo che mastica gli gnomi."
//                                                                 E so che sono tante informazioni anche per una bella testolina come la tua, girino.
//                 {charTag(Franco, "party")}:                     Per cui vai pure a cercare questa ribellione in biblioteca e vedrai che farai felice {charNameTwo}!
//                     ~ frog_second_novel = "qualcosa di veloce che parli di ribellione"
//                     ~ frog_secondCharAchievableGifts -= bookGift
//                         -> closed_exchange
//         }

//         -> closed_exchange           


// === franco_giftsThirdChar ===
// {debug_frog: passo da franco_giftsThirdChar.}
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
//     ~ temp charNameFour = translator(fourthChar_ActualName)
//     ~ temp charNameFive = translator(fifthChar_ActualName)


//         {
//         - are_two_entities_together(ThirdCharacter, PG):
//             {charTag(ThirdCharacter, "neutral")}:               Vi lascio alle vostre chiacchiere, via.
//             {charTag(ThirdCharacter, "jester")}:                Ma se mi fischiano le orecchie vedete che penserò male di voi!
//                     ~ move_entity(ThirdCharacter, Forest)
//         }

//         {shuffle once:
//             - {charTag(Franco, "neutral")}:                     Uh, non ho ancora capito {charNameThree}, ma posso aiutarti lo stesso!
//             - {charTag(Franco, "neutral")}:                     Mi parla sempre del fantacalcio ma ancora non ho capito quando devo schierare i draghi.
//             - {charTag(Franco, "neutral")}:                     {charNameThree} mi dice sempre che sono una sagoma, non capisco.
//             - {charTag(Franco, "neutral")}:                     Perfetto!                                 
//         }
    
//     + {frog_thirdCharAchievableGifts has cultivableGift}  \ {charTag(PG, "neutral")}:                                                   Cosa potrei regalargli?
//         -> franco_giftsPlants(ThirdCharacter, Pond)
//     + {frog_thirdCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen}  \ {charTag(PG, "neutral")}:            Quale ingrediente potrei usare in cucina con lui?
//         -> franco_giftsPlants(ThirdCharacter, Kitchen)
//     + {frog_thirdCharAchievableGifts has bookGift && player_accessiblePlaces has Library}  \ {charTag(PG, "neutral")}:                  Di quale racconto vorrebbe parlare?
//         -> book
//     +  \ {charTag(PG, "neutral")}:         Ora che ci penso, potresti aiutarmi in modo diverso?
//         -> franco_giftsManagement.top
    

//         = book
//             ~ temp charNameOne = translator(firstChar_ActualName)
//             ~ temp charNameTwo = translator(secondChar_ActualName)
//             ~ temp charNameThree = translator(thirdChar_ActualName)
//             ~ temp charNameFour = translator(fourthChar_ActualName)
//             ~ temp charNameFive = translator(fifthChar_ActualName)
        
//         {
//             - library_readStories has Maura:
//                 {charTag(Franco, "party")}:                     Sembra che tu abbia già letto <b>Polvere</b>.
//                     {
//                         - grimoire_thirdChar has grimThirdCharNovel:
//                                                                 E che ne avete già parlato con {charNameThree}.
//                         {charTag(Franco, "neutral")}:           Perché non scegli un altro dono?
//                                 ~ frog_third_novel = "<b>Polvere</b> di Maura"
//                                     -> franco_giftsManagement.top
                    
//                         - else:
//                         {charTag(Franco, "neutral")}:           Prova a parlare con lui e sono sicuro che avrà qualcosa da commentare!.
//                         {charTag(Franco, "party")}:             Anche perché è sicuro che ha letto <b>Polvere</b>!
//                         {charTag(Franco, "neutral")}:           L'hanno sentito tutti con quella cosa del licantropo.
//                         {charTag(Franco, "party")}:             Se un licantropo mi morde, divento una rana mannnara?
//                                 ~ frog_third_novel = "<b>Polvere</b> di Maura"
//                                 ~ frog_thirdCharAchievableGifts -= bookGift
//                                 -> closed_exchange
//                     }

//             - else:
//                 {charTag(Franco, "neutral")}:                   Secondo l'ultime novità in campo editoriale, {charNameThree} è uno che apprezza le cose rapide, e che bruciano.
//                 {charTag(Franco, "question")}:                  Che non è una buona idea per un libro.
//                                                                 Sapevi che i primi libri sapevano volare?
//                 {charTag(Franco, "party")}:                     Si libravano in aria.
//                 {charTag(Franco, "neutral")}:                   Ma poi era davvero difficile leggerli mentre si muovevano così tanto.
//                                                                 Così cugina Sputt li ha addomesticati.
//                                                                 E ora sonnecchiano tutto il giorno nelle biblioteche.
//                                                                 Che avevano le teche proprio per non farli scappare.
//                 {charTag(Franco, "party")}:                     Hai visto quante cose so?
//                     ~ frog_third_novel = "qualcosa di rapido e che brucia"
//                     ~ frog_thirdCharAchievableGifts -= bookGift
//                         -> closed_exchange
//         }
//         -> closed_exchange 


// === franco_giftsFourthChar ===
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
//     ~ temp charNameFour = translator(fourthChar_ActualName)
//     ~ temp charNameFive = translator(fifthChar_ActualName)


//     {
//         - are_two_entities_together(FourthCharacter, PG):
//             Uh, Franco sa tantissime cose di me!
//                 ~ move_entity(FourthCharacter, Forest)
//     }

//     {shuffle once:
//         - {charTag(Franco, "party")}:                     Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!
//         - {charTag(Franco, "party")}:                     Sì! Voglio chiedere a {charNameTwo} se facciamo lezioni di nuoto assieme!
//         - {charTag(Franco, "party")}:                     {charNameTwo} mi sta tanto simpatico.
//                                                         Anche se non ho ancora capito quella cosa della elettricità.
//         - {charTag(Franco, "party")}:                     Ottimamente!                                   
//     }
    
//     + {frog_fourthCharAchievableGifts has cultivableGift}  \ {charTag(PG, "neutral")}:         Cosa potrei regalarle?
//         -> franco_giftsPlants(FourthCharacter, Pond)
//     + {frog_fourthCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen}  \ {charTag(PG, "neutral")}:         Quale ingrediente potrei usare in cucina con lei?
//         -> franco_giftsPlants(FourthCharacter, Kitchen)
//     + {frog_fourthCharAchievableGifts has bookGift && player_accessiblePlaces has Library}  \ {charTag(PG, "neutral")}:         Di quale racconto vorrebbe parlare?
//         -> book
//     +  \ {charTag(PG, "neutral")}:         Ora che ci penso, potresti aiutarmi in modo diverso?
//         -> franco_giftsManagement.top

//         = book
//             ~ temp charNameOne = translator(firstChar_ActualName)
//             ~ temp charNameTwo = translator(secondChar_ActualName)
//             ~ temp charNameThree = translator(thirdChar_ActualName)
//             ~ temp charNameFour = translator(fourthChar_ActualName)
//             ~ temp charNameFive = translator(fifthChar_ActualName)
        

//         -> closed_exchange    


// === franco_giftsFifthChar ===
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
//     ~ temp charNameFour = translator(fourthChar_ActualName)
//     ~ temp charNameFive = translator(fifthChar_ActualName)


//     {
//         - are_two_entities_together(Mentor, PG):
//             Uh, Franco sa tantissime cose di me!
//                 ~ move_entity(Mentor, Forest)
//     }

//     {shuffle once:
//         - {charTag(Franco, "party")}:                     Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!
//         - {charTag(Franco, "party")}:                     Sì! Voglio chiedere a {charNameTwo} se facciamo lezioni di nuoto assieme!
//         - {charTag(Franco, "party")}:                     {charNameTwo} mi sta tanto simpatico.
//                                                         Anche se non ho ancora capito quella cosa della elettricità.
//         - {charTag(Franco, "party")}:                     Ottimamente!                                   
//     }
    
//     + {frog_fifthCharAchievableGifts has cultivableGift}  \ {charTag(PG, "neutral")}:         Cosa potrei regalarle?
//         -> franco_giftsPlants(FifthCharacter, Pond)
//     + {frog_fifthCharAchievableGifts has ingredientGift && player_accessiblePlaces has Kitchen}  \ {charTag(PG, "neutral")}:         Quale ingrediente potrei usare in cucina con lei?
//         -> franco_giftsPlants(FifthCharacter, Kitchen)
//     + {frog_fifthCharAchievableGifts has bookGift && player_accessiblePlaces has Library}  \ {charTag(PG, "neutral")}:         Di quale racconto vorrebbe parlare?
//         -> book
//     +  \ {charTag(PG, "neutral")}:         Ora che ci penso, potresti aiutarmi in modo diverso?
//         -> franco_giftsManagement.top
    

//         = book
//             ~ temp charNameOne = translator(firstChar_ActualName)
//             ~ temp charNameTwo = translator(secondChar_ActualName)
//             ~ temp charNameThree = translator(thirdChar_ActualName)
//             ~ temp charNameFour = translator(fourthChar_ActualName)
//             ~ temp charNameFive = translator(fifthChar_ActualName)
        

//         -> closed_exchange    