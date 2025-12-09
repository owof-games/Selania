//Storylets di commentario
    === growing_witch_storylet
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        Non mi aspettavo che quella pianta mezza morta si sarebbe ripresa.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
        Da quando sei qui, {player_name}, sono cambiate molte cose.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
        Spero solo sia un segno positivo.
        Dopo provo a concimarla comunque, male non le farà.
        <i>Noi preferiamo crescere senza concime. Chiederemo alle formiche di forare il sacco.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait: {witch_state()}
        
            -> main
    
    
//Storylets sul secondo personaggio
    === that_little_liar_storylet
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        {
        
            - mentor_riccioMentoreViciniColpo == true:
                {not welcome: Ti prego|{player_name}}, almeno tu sii ragionevole. Non ho fatto male a nessuno.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                Bugiarda!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Sei vecchia e cattiva e bugiarda!
                        ~ change_entity_place(SecondCharacter)
            
            - else:
                {not welcome: Perdonami,|{player_name}}, hai rispedito quel bambino a casa?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Other)} #portrait:mentore_bored
                    {
                        - are_two_entities_together(SecondCharacter, PG):
                            A quanto vedo no.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sad
                            Vecchia strega!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                            Sei vecchia e cattiva e mi hai fatto male!
                                    ~ change_entity_place(SecondCharacter)
                            {charNameTwo}!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sorry
                            Torna!
                            Cavolo.
                    }
        
        }
    
        Questo posto non è adatto a dell3 bambin3.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sorry
        Non ce l'ho con lui, ma i pericoli qui sono tanti: i binari, lo stagno, la serra pericolante, e le bestie della foresta.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sorry
        E potrei continuare per ore.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
        Anche se non è un bambino facilissimo.
        Ho perso il conto delle bugie che mi ha detto da quando è arrivato.
        E mi ha tirato un calcio!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Other)} #portrait:mentore_bored
        
            {
                -not_talk:
                    Gli hai fatto male? Perché lui ne è convinto.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
                    L'ho afferrato perché faceva i salti nello stagno.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                    Ma non so cosa c'è in quell'acqua lurida.
                    Forse l'ho stretto più di quanto volessi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sorry
                    Ma non l'ho fatto apposta.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sad
                
                - else:
                    Stavo solo cercando di fermarlo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sorry
                    Continuava a saltare nello stagno, e non ho idea di cosa possa esserci in quell'acqua lurida e limacciosa.
            } 

        Mi spiace se si è spaventato.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sad
        E mi fa tenerezza, sai?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
        Mi sembra un riccio.
        Così carino, tenero.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
        Quando è assorto nei suoi discorsi sugli animali o è incuriosito da qualcosa è adorabile.
        Ma poi provi ad avvicinarti, a conoscerlo meglio, e ti fa male.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sorry
        Mi spiace di avere perso la pazienza con lui.
        E so che non è un'emozione nobile per una mentore, ma sono rimasta ferita da quel calcio.
        E anche per questo ti chiedo di occupartene tu, così che i miei sentimenti non complichino la situazione.
        Trova un modo per allontanarlo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
        Velocemente, se riesci.
            ~ secondChar_pauseTalking = 0
            ~ mentor_pauseTalking = mentor_pauseDuration
            ~ mentor_tutorialPauses = true
                - (nameSecond)
                -> main
    
    === addressing_violence
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

    {
        - mentor_riccioMentoreViciniColpo:
            Dopo la discussione di prima, ho riparlato con {charNameTwo}, <>#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        
        - else:
            Ho parlato con {charNameTwo}, <>#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        }
            e dice che gli hai dato uno strattone, {mentorName}. #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            Che ti sei comportata da prepotente.
        {
            - are_two_entities_together(PG, SecondCharacter):
                E a {charNameTwo} non va di venir picchiato di nuovo, per cui se ne va.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                        ~ change_entity_place(SecondCharacter)
        }

    Non sono stata prepotente!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_bored
    Volevo solo che non si facesse del male!
    Quel cavolo di bambino che saltava senza pensare a quello che stava facendo.
    E il mio lavoro è proteggervi!
    Se si fosse.
    Se.    
    Io.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
    A me.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
    Mi spiace.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
    Non dovevo.
        {
            - are_two_entities_together(PG, FirstCharacter):
                E fino a qui c'eravamo tutt3.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        }
    Non mi piace arrabbiarmi, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
    E quando accade non so cosa fare.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    E forse la cosa peggiore è che.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_sad
    No.
    Non me la sento.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
        
        + [Che razionalmente sai che è sbagliato?]
                -> color_variation_management(Mentor, blueC)->
            Mi sento potente.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            Forte.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            Ascoltata.
            Lo so che è terribile {player_name}, ma se alzo le mani, una parte di me per una volta si sente qualcuno.
            Non so come guardare questa cosa, come affrontarla.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                {
                    - are_two_entities_together(PG, FirstCharacter):
                        Vedere il problema è il passo più grande, {mentorName}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                }

        + [Che è bello perdere il controllo, ribellarsi.]
                -> color_variation_management(Mentor, redC)->
            Peggio.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_sorry
            Il controllo non si perde, {player_name}.
            Si decide sempre se fare o meno il salto da "non alzare le mani" a "dai uno schiaffo"
            E io quel salto l'ho fatto volontariamente.
            Sento il bisogno di.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            Non so.
            Di farmi rispettare.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                {
                    - are_two_entities_together(PG, FirstCharacter):
                        Ma questa roba non è rispetto, ma paura.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        Non una gran bazza, non trovi?
                }
            
        + [Arrabbiarsi è umano, il problema è la violenza.]
                -> color_variation_management(Mentor, greenC)->
            Arrabbiarsi è da deboli.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
            Lo fai quando non comprendi le tue emozioni.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            E quando non provi empatia per le altre persone.
            No.
            Arrabbiarsi magari è umano, ma non è degno del mio ruolo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                {
                    - are_two_entities_together(PG, FirstCharacter):
                        E qui è il momento in cui qualcunə dovrebbe dirti di andare in terapia.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        Mi prenderò questo compito.
                        {mentorName}: cercati unə terapeuta, please.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                }
            
        + [Sei stata crudele, e hai rovinato la festa per {charNameTwo}.]
                -> color_variation_management(Mentor, yellowC)->
            Essere {player_pronouns has him:riscrittore|{player_pronouns has her:riscrittora|riscrittorə}} chiede empatia, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            Ma sì.
            Sono stata crudele, punto.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
            
        + [<i>Resto in silenzio.</i>]
                -> color_variation_management(Mentor, purpleC)->
            La cosa peggiore è che non mi piace arrabbiarmi, ma mi fa sentire potente.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            Visibile.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            Per pochi secondi mi sembra di potermi far rispettare.
            A volte <b>voglio</b> arrabbiarmi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
            Perché è l'unico modo per farmi ascoltare.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                {
                    - are_two_entities_together(PG, FirstCharacter):
                        Totale esperienza femminile, ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                        Ma non toglie il problema di ciò che hai fatto.
                }
        -
    Comunque c'è una sola cosa sensata da fare.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Chiedere scusa a {charNameTwo}.
    E vedere se avrà voglia di perdonarmi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
    Grazie per l'ascolto, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Sono sicura che diventerai {player_pronouns has him:un ottimo riscrittore|{player_pronouns has her:un'ottima riscrittora| unə ottimə riscrittorə}}.
        
        ~ change_entity_place(Mentor)
        ~ mentor_pauseTalking = mentor_pauseDuration
        ~ mentor_tutorialPauses = true
        -> main
    
=== a_story_of_transformation

    Sono un po' pensierosa {player_name}.
    Prima mi sono concessa una pausa in biblioteca.
    Una pausa piccolissima.
    E ho letto questo racconto, si chiama <b>Il cancello</b>.
    E la protagonista...
    Non so se ti capita mai di leggere una storia che non è la tua, eppure ti accende ricordi, ti accende modi diversi di guardare i tuoi ricordi.
    Leggo poco perché a volte le storie mi entrano nella testa e non riesco a star bene fino a quando non sono concluse.
    E Liliana.
    Non so.
    Liliana mi ricorda la persona che sono stata.
    La persona che poteva anche arrabbiarsi.
    E la sua stanchezza.
    Ti senti mai così {player_pronouns has him:stanco|{player_pronouns has her:stanca|stancə}} che vorresti sparire per un po' dal mondo, e basta?

        + [Non si può sparire, per cui è un pensiero abbastanza inutile.]
                -> color_variation_management(Mentor, blueC)->
            Un pensiero non è inutile.
            Un pensiero è solo un pensiero.
            E a volte ti fa stare bene anche quando non può essere vero.
                {
                    - are_two_entities_together(FirstCharacter, PG):
                        Potrei scrivere una canzone su questa cosa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                }
    
        + [Ma Liliana è stanca dell'ingiustizia, non del mondo. E ha reagito.]
                -> color_variation_management(Mentor, redC)->
            Ma una magari a volte ha voglia di non reagire e basta.
            E di agire.
            No?
            Di fare quello che vuole, e non solo rispondere a quello che ha attorno.
     
        + [Vorresti sparire dal mondo, o da te?]
                -> color_variation_management(Mentor, purpleC)->
            Cambierebbe poi così tanto?
            No, è una cosa stupida da dire.
            Ed è stato stupido dire di voler sparire.
            Lascia perdere.
    
        + [No, però mi capita di fare dei grandiosi pisolini.]
                -> color_variation_management(Mentor, yellowC)->
            Pensavo a qualcosa di più impegnativo.
            Qualcosa che non si risolve dormendo.
            Ma comunque tempo per dormire non l'ho mai.
            {
                - are_two_entities_together(SecondCharacter, PG): 
                    Lo dico sempre: i pisolini sono no-io-si!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
            } 
            
        + [A volte vorrei solo diventare invisibile.]
                -> color_variation_management(Mentor, greenC)->
            Esatto, {player_name}.
            So che è una scelta egoista.
            Perché abbiamo una responsabilità verso il mondo.
            Ma questo mondo a volte sa essere davvero <b>troppo</b>.
        -    
    Comunque alla fine Liliana con la sua rabbia trova un modo per cambiare.
    E quando riesce a vedere la sua casa come uno spazio brillante, mi ha fatto pensare: questa è l'essenza stessa della riscrittura.
        ~ firstChar_pauseTalking = firstChar_pauseDuration
        -> main   


=== dog_mentor
    {
        - contentsTrainStop has PG:
            {
                - contentsTrainStop has DoggoNoNotes:
                    Ma quanto sei carina cagnolina!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_hurry
                    Ma quanto!
                    Andiamo a fare due passi?
                    Giochiamo con il bastoncino?
                    Woof!#speaker:Doggo #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:doggo
                
                - else:
                    Ehi {player_name}!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
                    Hai visto quella cagnolina prima?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_hurry
                    Era lì sotto il tabellone.
                    Con un musino adorabile.
                    Ho provato a giocarci, ma si è allontanata.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_sad
            }
        - else:
            Ehi {player_name}!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
            Hai visto quella cagnolina prima?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_hurry
            Era lì sotto il tabellone della stazione.
            Con un musino adorabile.
            Ho provato a giocarci, ma si è allontanata.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_sad
    }

-> main


=== mentor_rage
Mentore sbrocca
    ~ mentor_pauseTalking = mentor_pauseDuration
    -> main
        
    
 
//Fine della demo
    === ending_demo
    ~ temp mentorName = translator(mentor_ActualName)

        Sembra che la demo sia finita qui, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
        Potrai girare ancora per gli spazi aperti.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
        Continuare a leggere le storie della <b><i>biblioteca</b></i>.
        E coltivare cosa rimane da coltivare nella <b><i>serra</b></i>.
        Ma non compariranno nuove persone bisognose.
        Se te la senti, dopo aver chiuso l'esperienza potrai rispondere a qualche domanda su <i>Selanìa</i>.
        E aggiungere in wishlist su Steam il gioco.
        Un gesto semplice che aiuta i giochi indie a essere più visibili.
        Grazie di cuore, e buona vita.
        A presto!
        -> helping_mentor