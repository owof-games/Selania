=== first_character_opinions
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {shuffle:
        - {charTag(FirstCharacter, "neutral")}:         Talco dice sempre che bisogna sporcarsi le mani per capire il mondo.

        - {charTag(FirstCharacter, "neutral")}:         Comunque non dare troppo peso a quella storia del risotto con gli allucinogeni. Mi è capitato solo due volte.

        - {charTag(FirstCharacter, "neutral")}:         Se Talco scopre che lə paragonatə a un pettirosso, col cavolo che mi dice di raggiungerlə in Islanda!

        - {charTag(FirstCharacter, "neutral")}:         La band con le ragazze è il mio secondo progetto musicale. Il mio primo era una roba omaggio agli Skiantos, per lo più per infastidire la prof di piano.

        - {charTag(FirstCharacter, "neutral")}:         Quando Talco ha lasciato il Conservatorio, il prof di composizione ha pianto. Aveva molto stima di ləi.

        - {charTag(FirstCharacter, "neutral")}:         La gente sottovaluta il lavoro dellə camerierə. E per questo veniamo trattat3 come dell3 serv3. In quel caso sputare nei piatti è un dovere politico.

        - {charTag(FirstCharacter, "neutral")}:         Quando Ennio è giù di corda si spara tutta la saga di Dragon Age dall'inizio. Ma non parliamo mai di Veilguard. Veilguard è vietato.

        - {charTag(FirstCharacter, "neutral")}:         I miei da giovani erano dei fighi assurdi. Anche ora. Ma il fatto che mamma mi ha avuta a quarant'anni fu uno scandalo al paese.

        - {charTag(FirstCharacter, "neutral")}:         Se passi dalle mie parti comunque uno spazio a La Rifugia te lo trovo sempre, promesso.

        - {charTag(FirstCharacter, "neutral")}:         C'è una sola cosa che non dirò mai a Talco: che lə suə bimbə somiglia molto più a Thomas che a ləi. Non credo apprezzerebbe.

    }
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
                -> options_first_character 

    
// === first_char_story_ended
// ~ temp charNameOne = translator(firstChar_ActualName)
// //Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
// //In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

//     {
//         - firstChar_exitCounter < firstChar_startingValueExitCounter:
//             -> top
//         - else:
//             -> goodbye
//     }
    
//         - (top)
//             {shuffle:
//                 - Questa cosa della riscrittura è stata intensa, {player_name}. Spero non sia stata faticosa anche per te.

//                 - Credo che la cucina mi mancherà un sacco. Ed è stato divertente gettare gli avanzini ai pesci. Ed ecologico.

//                 - Ho deciso che quando me ne vado ti lascio una sorpresa. Ma non ti dico dove.

//                 - Non so se raccontare o meno questa cosa a qualcunə. Forse Talco capirebbe.

//                 - Da quando l'albero è cresciuto, mi sento, ehm, osservata. Ha senso?

//                 - Comunque credo che mi terrò questa storia per me per un po', sai?

//                 - Prima ho abbozzato una melodia per raccontare questa esperienza, ma poi ho visto un pipistrello, mi sono distratta e addio idea.
//             }

//                     ~ firstChar_exitCounter ++
//                         -> main
        
//         = goodbye
//             ~ temp charNameOne = translator(firstChar_ActualName)
//             
            
//             Ama: è il momento di tornare a casa.
//             Non so cosa ora cosa accadrà, ma a prescindere: grazie per tutto quello che hai fatto per me.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
//             Qualsiasi cosa mi stesse bloccando fino ad ora, è svanita.
//             E un po' delle mie paure con lei.
//             In bocca al lupo per tutte le tue assurde avventure in questo posto!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
//             E non ti abbraccio, ma un po' è come se l'avessi fatto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
//             Ciao!
                
//                 ~ move_entity(firstCharPaint, Bedroom)
//                 ~ temp currentPlace = entity_location(PG)
//                 ~ move_entity(FirstCharacter, Safekeeping)
//                 ~ tree_advance_management(FirstCharacter)
                
//                 ~ move_entity(TrainNoiseGoingAway, currentPlace)
//                 ~ firstChar_mailPause = firstChar_mailPauseDuration
                
            
//         -> main




