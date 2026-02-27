=== fifth_character ===
~ temp charNameFive = translator(fifthChar_ActualName)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(FifthCharacter, PG)}[FifthCharacter]
            -> talk_with_fifth_character
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(FifthCharacter, PG) && fifthChar_storyStatus == story_storyEnded} [FifthCharacter]
            -> fifth_char_story_ended
        + ->
    
        -> DONE

=== talk_with_fifth_character ===
~ temp charNameFive = translator(fifthChar_ActualName)
C'è qualcosa che ti frulla nella testa.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}

            + Ti va di raccontarmi qualcosa di te?
                -> knowing_fifth_character
                
            //Per la mentore: dono solo dopo la fine della quarta storia, per questo metto un knot come differenziatore.
            + {knowing_fifth_character.seven && backpack_findedGifts != () && fourthChar_storyStatus == story_storyEnded} Ti vorrei donare questa cosa.
                    -> second_story_gift
        
            //Dono fatto ma non ho avviato la main story
            + {fifth_story_gift.ink_outcome && not main_story_fifth_character} Ti va di riscrivere la tua storia con me?
                    -> fifth_story_chech_trigger
    
            //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
            + {fifth_story_gift.ink_outcome && main_story_fifth_character} Riprendiamo quella storia?
                -> main_story_fifth_character
            
            + <i>Lascio il dialogo.
                -> main
            -
                -> talk_with_fifth_character




=== knowing_fifth_character
~ temp charNameFive = translator(fifthChar_ActualName)
    //Qui man mano faccio avanzare i temi toccati dalla personaggia
        {
            - not one:
                -> one
            - not three:
                -> three
            - not three:
                -> three
            - not four:
                -> four
            - not five:
                -> five
            - not six:
                -> six
            - not seven:
                -> seven
            - not eight:
                -> eight
            - not nine:
                -> nine
            - not ten:
                -> ten
            - not eleven:
                -> eleven
            - not twelve:
                -> twelve
            - else:
                -> fifth_character_opinions
        }
    = one
    ~ temp charNameFive = translator(fifthChar_ActualName)
        ~ fifthChar_storyletsForRewritingCount ++
        //Non mettere cose TW qui
        //Amore per il giardinaggio e la possibilità, per la giocatrice, di esprimere qualcosa che poi si potrebbe avvicinare ai possibili finali.
        Non è giusto avere delle preferenze, ma la serra è il mio posto preferito.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral 
        C'è qualcosa nel vedere crescere piante, fiori, funghi che mi fa sentire appagata.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Non è solo l'odore della terra, o l'umidità nell'aria nei giorni più caldi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Ma quella sensazione che con le tue mani puoi permettere a un altro corpo di crescere al meglio.

            + (fiveAir) Preferisco la stazione dei treni, è ordinata, precisa.
                    -> color_variation_management(FifthCharacter, airC, varPGYes)->
                Sì, ne capisco il fascino.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                A volte mi siedo lì e mi godo per qualche istante l'attesa.
                Il nulla che accade.
                Ma poi le mani fremono, mi supplicano di sistemare qualcosa fuori posto.
                
            + (fiveEarth) Lo stagno è divertente, succede di tutto.
                    -> color_variation_management(FifthCharacter, earthC, varPGYes) ->
                Forse succede <i>di troppo</i>.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Non sembra pensare a nulla.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                L'acqua è lì e lascia che tutto accada, senza pensare al domani.
                
            + (fiveFire) La foresta domina: è lotta, è potenza!
                    -> color_variation_management(FifthCharacter, fireC, varPGYes)->
                E disordinata, sporca.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Posso capirne il fascino, ma non è un luogo dove resto con piacere.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                E quel tronco al centro non vuole saperne né di crescere né di morire.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Una cosa davvero fastidiosa.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    
                
            + (fiveWater) Un po' come prendersi cura delle persone, qui.
                    -> color_variation_management(FifthCharacter, waterC, varPGYes)->
                Sì, anche se con meno aspettative.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Le persone a volte fanno cose che non ci aspettiamo.
                Un <i>Lichene degli abissi</i> con le giuste condizioni cresce sempre allo stesso modo.
  
            + (fiveAether) Invece sono felice che crescano a prescindere da me.
                    -> color_variation_management(FifthCharacter, aetherC, varPGYes)->
                Senza di te?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Dobbiamo bagnare il terreno, prepararlo, seminare.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Non ci sarebbe nulla senza il nostro lavoro.
                Non saprebbero resistere alle erbacce, al freddo.
                No, non sono d'accordo, scusa.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    
 
            -
        {((firstChar_storyStatus hasnt story_storyEnded) && (secondChar_storyStatus hasnt story_storyEnded)): Ma a proposito di questo posto: devo ancora capire come sgomberare quell'ammasso di mobili rotti che blocca il sentiero a ovest della foresta.|Ma a proposito di questo posto: devo ancora liberare il sentiero da quei fiori enormi vicino alla serra.}#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Grazie per la chiacchierata, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        
             ~ mentor_pauseTalking = mentor_pauseDuration
            @animation:RewriterBook
 
            -> main
    
    = two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ change_entity_place(SecondCharacter)
    ~ fifthChar_storyletsForRewritingCount ++
        
        //Non mettere cose TW qui
        //Partendo dalla prima personaggia, dipendenza dai rapporti (circa)
        La storia di {charNameOne} mi ha colpita.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            {
                - are_two_entities_together(FirstCharacter, PG): E {charNameOne} di sicuro non vuole sentire le tue opinioni in merito.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_annoyed
                    ~ change_entity_place(FirstCharacter)
            }
            
        Non tanto il suo blocco, quello è una cosa comune a quell'età.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        Quanto invece fosse consapevole delle opinioni di tutte le persone care.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Senza però perdere sé stessa.
        Questa è una cosa difficile anche alla mia età.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        
            + I numeri sono indicatori, non fatti assoluti.
                    -> color_variation_management(FifthCharacter, airC, varPGYes)->
                Su questo hai ragione, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Eppure posso assicurarti che i miei cinquanta e rotti anni si portano addosso anche un bel po' di fatti scricchiolanti e ricordi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                   
                
            + {charNameOne} sapeva ridere, giocare, e questo l'ha resa libera.
                    -> color_variation_management(FifthCharacter, earthC, varPGYes) ->
                E la libertà può farti perdere ancora di più.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                A volte non c'è maggiore libertà di essere stabili e felici nel proprio ruolo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                
                
            + Non c'è vera azione senza consapevolezza.
                    -> color_variation_management(FifthCharacter, fireC, varPGYes)->
                Allora la maggior parte di noi non agisce mai veramente.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Eppure riusciamo a farci del male, e a farci del bene.
                Qualcosa deve sempre cambiare.

                
            + E tu sei molto ricettiva verso le altre persone.
                    -> color_variation_management(FifthCharacter, waterC, varPGYes)->
                Forse non <i>molto</i>.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Ma indubbiamente quello che hanno da dire e quello che provano, conta.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Una mentore è una guida, ma per imparare a guidare deve capire chi ha dall'altra parte.
                Di cosa abbia bisogno.
                Dove voglia andare.
                
                
            + Ci sono momenti in cui è necessario anche perdersi.
                    -> color_variation_management(FifthCharacter, aetherC, varPGYes)->
                E in questo luogo in fondo arrivano solo persone che si sono perse.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                E che se ne vanno più serene.
                Avrebbero scoperto quella serenità, senza un po' di smarrimento?
                
            -
        Questo luogo continua a stupirmi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Sei qui per aiutare le altre persone, e finisci per scoprire cose di te.
        Ma ora è il momento di svuotare lo stagno dalle sue cose più schifose.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Prega per me, {player_name}.
                
             ~ mentor_pauseTalking = mentor_pauseDuration
             @animation:RewriterBook
             
                -> main


    
    = three
    ~ temp charNameFive = translator(fifthChar_ActualName)
        //Non mettere cose TW qui
        //Questo è un riferimento indiretto anche ai figli che ora non la chiamano molto.
        ~ fifthChar_storyletsForRewritingCount ++
         
        A volte un po' mi pesa, tutto questo via vai.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        Ci sono persone a cui mi sono affezionata, che non rivedrò più.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Persone che ho aiutato e ora vorrei sentire più spesso.
        Ma poi le loro lettere non arrivano, o arrivano sempre meno.
        E allora mi chiedo se ho sbagliato qualcosa.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        Non mi fraintendere: sono felice di quello che faccio, di quello che ho fatto.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        E per me è una gioia tenere tutto questo in piedi, giorno per giorno.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry

            + Ogni lavoro ha la sua quota di sacrificio.
                -> color_variation_management(FifthCharacter, airC, varPGYes)->
                Vero.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Il valore di qualcosa viene da quanto ci è costata.
                E la maggior parte delle volte non paghiamo in denaro.
                    
                
            + Forse le volpi si mangiano le lettere!
                -> color_variation_management(FifthCharacter, earthC, varPGYes) ->
                La fantasia è un modo piacevole di affrontare la realtà, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Ma alla lunga rende difficile capire cosa sia vero e cosa no.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                    
                
            + Il mondo è pieno di ingrati.
                -> color_variation_management(FifthCharacter, fireC, varPGYes)->
                No.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Direi che il mondo è pieno di persone distratte.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Le cose da fare sono infinite, e finiamo per dimenticarci di chi non vediamo tutti i giorni.
                Non è ingratitudine, è una vita che scorre troppo veloce.
                    

                
            + Ti prometto che ti scriverò ogni giorno.
                -> color_variation_management(FifthCharacter, waterC, varPGYes)->
                Oh, {player_pronouns has him: caro|{player_pronouns has her: cara|carə}}, è una bella promessa.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Una promessa che ho sentito decine di volte.
                    
  
                
            + Esiste un confine tra {charNameFive} e questo luogo?
                -> color_variation_management(FifthCharacter, aetherC, varPGYes)->
                A volte mi sento <i>solo</i> questo luogo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Non mi chiedo spesso se andarmene o meno.
                O dove.

 
            -
            Ma basta con questo spirito malinconico!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            Mi sono appena ricordata che ci sono delle erbacce fastidiose sotto la poltrona della biblioteca.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            Devo inventarmi un modo per liberarmene!
            
                ~ mentor_pauseTalking = mentor_pauseDuration
                @animation:RewriterBook
                            
                    -> main
    
    
    
    
    = four
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ change_entity_place(SecondCharacter)
        //Non mettere cose TW qui
        //Responsabilità
        ~ fifthChar_storyletsForRewritingCount ++
        Mi sto chiedendo se non sia stata troppo dura col piccolo {charNameTwo} appena arrivato qui.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry 
        Ero sinceramente spaventata, ma forse ho reagito con violenza.
        Ma questo non è un luogo per un bimbo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Ti immagini cosa possa significare essere un genitore, e renderti conto che tuo figlio, così piccolo, ha già perso la strada?
        Che già non sappia più cosa fare del suo futuro?
        Che cosa terribile per entrambi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        E tutta quella responsabilità.
        Quella paura per il futuro e per l'ambiente.
        Non dovrebbe pensare al pallone, a giocare con gli amici, a studiare?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        
            + {charNameTwo} ama studiare, e infatti questo è il posto per lui.
                -> color_variation_management(FifthCharacter, airC, varPGYes)->
                No!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Questo è un posto spirituale.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Di crescita, di esplorazione.
                Non un laboratorio.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Non il piccolo chimico.
                    
                
            + Giocare è comunque un modo per capire il mondo, {charNameFive}.
                    -> color_variation_management(FifthCharacter, earthC, varPGYes) ->
                Ma un modo controllato, adatto per i bambini.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Con meno violenza possibile.
                Senza le cose terribili che ci circondano.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Se non voglio vederle io a cinquant'anni, perché deve vederle un bimbo?
                    
                
            + Alla sua età avevo anche io idee e paure. Si è bambini, non idioti.
                    -> color_variation_management(FifthCharacter, fireC, varPGYes)->
                Non serve che usi quel linguaggio con me, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                E non sono d'accordo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Nemmeno a vent'anni puoi sapere davvero cosa vuoi.
                Cosa conta a questo mondo.
                Per questo i genitori ci sono.
                Per proteggerti.
                    

            + Mi spiace che tu ti senta in colpa.
                -> color_variation_management(FifthCharacter, waterC, varPGYes)->
                Ma non hai detto che non ho sbagliato.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Scusa, non è quello il tuo ruolo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Sennò non sarei io la mentore, ma tu.
                Spero che almeno lui prima o poi mi perdoni.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    
  
            + Il genitore dovrebbe essere il lavoro di una comunità.
                -> color_variation_management(FifthCharacter, aetherC, varPGYes)->
                Non dire castronerie, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Si fa così dai tempi dei tempi, due persone.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Una se manca.
                Però dovrebbero avere il diritto di sbagliare.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad

            -
        
        Forse mi sono concentrata sulla cosa sbagliata.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Il problema non è quello che è accaduto.
        Il problema è che mi sono fatta coinvolgere.
        Una mentore deve mantenere un certo distacco per guidarti.
        Non può essere emotiva.
        Vado a riordinare in ordine di data i libri in biblioteca.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
    
             ~ mentor_pauseTalking = mentor_pauseDuration
             @animation:RewriterBook
             
            -> main
    = five
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        //Non mettere cose TW qui
        //Presentazione.
        ~ fifthChar_storyletsForRewritingCount ++
        Mi sento più stanca del solito.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
        E fa caldo.
        Ma l'idea di stendermi sotto quell'albero non mi piace.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
        E c'è molto da fare.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Però quella panchina mi ricorda un'altra panchina, sai?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Dove in un'altra vita ho ricevuto il mio primo bacio.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Dall'uomo che poi ho sposato.
        E a cui ho dedicato il resto dei miei giorni.
        Fino a quando non sono arrivata qui.
        Già.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        Fino a quando non sono arrivata qui.
        {player_name}: secondo te cosa vuol dire amare un'altra persona?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral

            + Progettare assieme, costruire fondamenta, accrescersi.
                -> color_variation_management(FifthCharacter, airC, varPGYes)->
                Già.
                Creare qualcosa che regga alla fine del desiderio.
                Quando il corpo perde il suo splendore.
                E il letto è il luogo della stanchezza e della malattia.
                Quando invece di chiamarci "amore".
                Ci chiediamo dove sono le chiavi della macchina.
                    
                
            + Un rifugio di stupore e gioia in un mondo grigio.
                -> color_variation_management(FifthCharacter, earthC, varPGYes) ->
                Mi piace la tua ingenuità {player_name}.
                Con questa logica ho amato solo una cosa:
                il mio giardino.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Un posto sempre sorprendente, vivo.
                Pieno di musica.
                E forse è davvero così.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    
                
            + Fondersi nella passione, a letto come in una protesta.
                -> color_variation_management(FifthCharacter, fireC, varPGYes)->
                La passione si spegne, {player_name}.
                E a quel punto cosa rimane?
                Noia?
                Rancore?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Odio?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Passioni forti chiamano passioni ancora più forti.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    

                
            + Cura, ascolto, affetto.
                -> color_variation_management(FifthCharacter, waterC, varPGYes)->
                Già, ho pensato la stessa cosa a lungo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Ma a volte la cura diventa un lavoro.
                L'ascolto un dovere.
                L'affetto un'abitudine.
                Eppure resti.
                Vuol dire che è finito l'amore?
                    
  
                
            + Raggiungersi l'anima a vicenda, ricercando il divino che è noi.
                -> color_variation_management(FifthCharacter, aetherC, varPGYes)->
                Una visione mistica.
                Forse blasfema.
                Qualcosa che non ho mai conosciuto, se non nei romanzi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                O nell'amicizia.
                E a volte, se resto in silenzio e ferma a lungo, in questo luogo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                

 
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
        
        Perdonami: a volte sono solo una sciocca romantica.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
        E mi dimentico che l'amore è ovunque.
        Anche qui.
        Soprattutto qui.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Amore per noi.
        Vado a recuperare del terriccio dal sottobosco, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Parleremo più tardi.
        
        ~ mentor_pauseTalking = mentor_pauseDuration
        @animation:RewriterBook
        
            -> main
    
    
    = six
    ~ temp charNameFive = translator(fifthChar_ActualName)
    //Non mettere cose TW qui
    
    // -> si parla esplicitamente di responsabilità personale (in antitesi anche con la visione del fungo)? Questa è una visione di RABBIA.

        ~ fifthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + Dammi dettagli più concreti.
                    -> color_variation_management(FifthCharacter, airC, varPGYes)->
                
            + Sicuro che il violino ha bisogno di un tamburo per tornare.
                    -> color_variation_management(FifthCharacter, earthC, varPGYes) ->
                
            + Seguiamo le sue tracce! Fiutiamo il suo odore.
                -> color_variation_management(FifthCharacter, fireC, varPGYes)->

                
            + Se ti senti sola, sono qui ad ascoltarti.
                -> color_variation_management(FifthCharacter, waterC, varPGYes)->
  
                
            + Tu sei sempre con ləi, ləi è sempre con te.
                ~ fifthChar_aether ++
 
            -
            //Qui potrebbe aver senso ridurre i tempi di attesa tra un dialogo e l'altro.
             ~  mentor_pauseDuration = 5
             ~ mentor_pauseTalking = mentor_pauseDuration
            -> main
    = seven
    ~ temp charNameFive = translator(fifthChar_ActualName)
    //Non mettere cose TW qui
    
        //Presentazione.
        ~ fifthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + Dammi dettagli più concreti.
                    -> color_variation_management(FifthCharacter, airC, varPGYes)->
                
            + Sicuro che il violino ha bisogno di un tamburo per tornare.
                    -> color_variation_management(FifthCharacter, earthC, varPGYes) ->
                
            + Seguiamo le sue tracce! Fiutiamo il suo odore.
                -> color_variation_management(FifthCharacter, fireC, varPGYes)->

                
            + Se ti senti sola, sono qui ad ascoltarti.
                -> color_variation_management(FifthCharacter, waterC, varPGYes)->
  
                
            + Tu sei sempre con ləi, ləi è sempre con te.
                ~ fifthChar_aether ++
 
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
            -> main        
            
            
    = eight
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        //Presentazione.
        ~ fifthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + Dammi dettagli più concreti.
                    -> color_variation_management(FifthCharacter, airC, varPGYes)->
                
            + Sicuro che il violino ha bisogno di un tamburo per tornare.
                    -> color_variation_management(FifthCharacter, earthC, varPGYes) ->
                
            + Seguiamo le sue tracce! Fiutiamo il suo odore.
                -> color_variation_management(FifthCharacter, fireC, varPGYes)->

                
            + Se ti senti sola, sono qui ad ascoltarti.
                -> color_variation_management(FifthCharacter, waterC, varPGYes)->
  
                
            + Tu sei sempre con ləi, ləi è sempre con te.
                ~ fifthChar_aether ++
 
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
            -> main    
    
    
    = nine
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        //Presentazione.
        ~ fifthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + Dammi dettagli più concreti.
                    -> color_variation_management(FifthCharacter, airC, varPGYes)->
                
            + Sicuro che il violino ha bisogno di un tamburo per tornare.
                    -> color_variation_management(FifthCharacter, earthC, varPGYes) ->
                
            + Seguiamo le sue tracce! Fiutiamo il suo odore.
                -> color_variation_management(FifthCharacter, fireC, varPGYes)->

                
            + Se ti senti sola, sono qui ad ascoltarti.
                -> color_variation_management(FifthCharacter, waterC, varPGYes)->
  
                
            + Tu sei sempre con ləi, ləi è sempre con te.
                ~ fifthChar_aether ++
 
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
            -> main    
    
    = ten
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        //Presentazione.
        ~ fifthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + Dammi dettagli più concreti.
                    -> color_variation_management(FifthCharacter, airC, varPGYes)->
                
            + Sicuro che il violino ha bisogno di un tamburo per tornare.
                    -> color_variation_management(FifthCharacter, earthC, varPGYes) ->
                
            + Seguiamo le sue tracce! Fiutiamo il suo odore.
                -> color_variation_management(FifthCharacter, fireC, varPGYes)->

                
            + Se ti senti sola, sono qui ad ascoltarti.
                -> color_variation_management(FifthCharacter, waterC, varPGYes)->
  
                
            + Tu sei sempre con ləi, ləi è sempre con te.
                ~ fifthChar_aether ++
 
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
            -> main    
    
    = eleven
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        //Presentazione.
        ~ fifthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + Dammi dettagli più concreti.
                    -> color_variation_management(FifthCharacter, airC, varPGYes)->
                
            + Sicuro che il violino ha bisogno di un tamburo per tornare.
                    -> color_variation_management(FifthCharacter, earthC, varPGYes) ->
                
            + Seguiamo le sue tracce! Fiutiamo il suo odore.
                -> color_variation_management(FifthCharacter, fireC, varPGYes)->

                
            + Se ti senti sola, sono qui ad ascoltarti.
                -> color_variation_management(FifthCharacter, waterC, varPGYes)->
  
                
            + Tu sei sempre con ləi, ləi è sempre con te.
                ~ fifthChar_aether ++
 
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
            -> main    
    = twelve
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        //Presentazione.
        ~ fifthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + Dammi dettagli più concreti.
                    -> color_variation_management(FifthCharacter, airC, varPGYes)->
                
            + Sicuro che il violino ha bisogno di un tamburo per tornare.
                    -> color_variation_management(FifthCharacter, earthC, varPGYes) ->
                
            + Seguiamo le sue tracce! Fiutiamo il suo odore.
                -> color_variation_management(FifthCharacter, fireC, varPGYes)->

                
            + Se ti senti sola, sono qui ad ascoltarti.
                -> color_variation_management(FifthCharacter, waterC, varPGYes)->
  
                
            + Tu sei sempre con ləi, ləi è sempre con te.
                ~ fifthChar_aether ++
 
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
            -> main            
            
            



        


=== fifth_story_gift ===
~ temp charNameFive = translator(fifthChar_ActualName)
Stai per donare qualcosa a {charNameFive}. #speaker:{witch_tag()}
        + {backpack_findedGifts != ()} Scelgo il dono.
            ~ gift_currentReceiver += FifthCharacter
            -> backpack_management -> ink_outcome 
        + {backpack_findedGifts == ()} Il tuo inventario è vuoto.
            ->main
        
    
        = ink_outcome    
            Dopo il tuo dono {inkTranslator(FifthCharacter)}.
            
                 -> talk_with_fifth_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

=== fifth_story_chech_trigger
      ~ temp charNameFive = translator(fifthChar_ActualName)
      //In questa storia non ci sono trigger, lascio la struttura perché non si sa mai.
      
        //{
        //- loneliness == false:
        //    -> loneliness_trigger
        //- else:
        //    -> main_story_first_character
        //}
            -> main_story_fifth_character
        
        = loneliness_trigger
        Info
            * Voglio comunque approfondire la storia di questa personaggia.
                -> main_story_fifth_character
            * Salto.
            //FUTURA SOLUZIONE A QUESTA SITUAZIONE
                -> main
        -
        -> END

=== main_story_fifth_character
~ temp charNameFive = translator(fifthChar_ActualName)
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - not confession:
            -> confession
        - not one:
            -> statement
        - else:
            -> one
    }
    = confession
    ~ temp charNameFive = translator(fifthChar_ActualName)
        Ho realizzato una cosa, una cosa su noi due.
            -> secondAffinityCalc ->
        {
        - firstChar_aether && firstChar_earth > firstChar_air: Sento ancora la mancanza di Talco, ma con te mi sento come se fossimo parte da sempre della stessa band.
        {charNameFive} vede {player_name} come una persona amica e fidata.
        
        -firstChar_aether or firstChar_earth > firstChar_air:Ci sono momenti in cui cantiamo all'unisono, ed è bello. Mi sento ascoltata.
        
        {charNameFive} si trova bene con {player_name}.
        
        - firstChar_aether && firstChar_earth < firstChar_air: Facciamo parte di due cori diversi, vero? Non credo tu abbia preso una sola delle mie note.
        
        {charNameFive} non si è sentita capita da {player_name}.
        
        
        - else: A volte siamo sullo stesso brano, altre no. E non ho ancora capito chi tra noi stia ignorando l'altra parte.
        
        {charNameFive} non riesce a capire che rapporto sta costruendo con {player_name}.
        
        }
        E credo di aver capito perché il mio nome
            
            + Credo di sapere come aiutarti.
                -> statement
            + Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.
                -> main


    = statement
    ~ temp charNameFive = translator(fifthChar_ActualName)
        A seguito del rapporto che {player_name} ha creato con {charNameFive} {firstChar_aether && firstChar_earth > firstChar_air: l'inchiostro è aumentato di due unità.|{firstChar_aether or firstChar_earth > firstChar_air: l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(secondChar_InkLevel)
        + Voglio cominciare la riscrittura.
            -> secondNaming -> 
            -> one
        + Preferisco prendermi del tempo.
            -> main

    = one
    ~ temp charNameFive = translator(fifthChar_ActualName)
    {player_name}: Prima hai detto che hai il terrore di fare una scelta.
        
        + Qui hai accettato il tuo nuovo nome.
            {player_name}: E ammettere una propria paura, una scelta enorme.
                {
	                - firstChar_possibleStates hasnt Violino:
		                ~ firstChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }            
        
        + Eppure hai deciso di costruire una famiglia con l3 tu3 amic3.
  
        
        + Dimenticando che per finire gli studi hai lottato per anni.
     
            
        + Ma hai più volte accettato il rischio di suonare sul
                {
	                - firstChar_possibleStates hasnt Violino:
		                ~ firstChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }
        + Però da che sei qui hai esplorato tutto questo luogo.
           
                {
                	- firstChar_possibleStates hasnt Chitarra:
    		            ~ firstChar_possibleStates --
    		           {debug_changeName: Diminuisco lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }
            
        -
 
        {
        - secondChar_InkLevel == ink_empty:
            -> ending
        - else: 
            -> two
        }        
        
    = two
    ~ temp charNameFive = translator(fifthChar_ActualName)

        + Con Talco puoi litigare, eppure siete legatissim3.
            {player_name}: Pensi davvero che ti accuserebbe di tradimento solo perché hai deciso di decidere per te stessa?
            {player_name}: Il Talco che hai raccontato si arrabbierebbe di più se tu facessi una scelta per te pensando a ləi.
            
                    
        + La paura di tradire è un'altra faccia dell'ego.
                {
	                - firstChar_possibleStates hasnt Violino:
		                ~ firstChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }
    
            
        + Il tuo cuore si preoccupa molto di loro, e poco di te.
   
            
        + Forse accadrà, ma non è un tuo problema.
 
                {
                	- firstChar_possibleStates hasnt Chitarra:
    		            ~ firstChar_possibleStates --
    		           {debug_changeName: Diminuisco lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }
                
        + Tradiamo la fiducia rompendo le regole a nostro vantaggio.
 
                {
	                - firstChar_possibleStates hasnt Violino:
		                ~ firstChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }
                    
        -
        {
        - fifthChar_InkLevel == ink_low:
            -> ending
        - else: 
            -> three
        }
        
    = three
    ~ temp charNameFive = translator(fifthChar_ActualName)
            
        + Se non tiri nessun dado, non c'è storia da far avanzare.
         
                {
	                - fifthChar_possibleStates hasnt Violino:
		                ~ fifthChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {fifthChar_possibleStates }}
                }
        
        + Ma ogni persona ha immaginato sorti diverse per Jonah.
                {
                	- fifthChar_possibleStates hasnt Chitarra:
    		            ~ fifthChar_possibleStates --
    		           {debug_changeName: Diminuisco lo stato della prima personaggia, che ora è {fifthChar_possibleStates }}
                }
                
        + Eppure la prima cosa che hai visto qui sono otto sentieri.
 
                {
	                - fifthChar_possibleStates hasnt Violino:
		                ~ fifthChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {fifthChar_possibleStates }}
                }
            
        
        + La storia di Jonah è un successo.

                
        + Ragioni come se fossi sola se dovessi cadere.
     
        -
        {
        - fifthChar_InkLevel == ink_normal:
            -> ending
        - else: 
            -> four
        }
    
    = four
    ~ temp charNameFive = translator(fifthChar_ActualName)

        + Giocare è bello perché puoi sempre Chitarrare a farlo.

                {
	                - firstChar_possibleStates hasnt Violino:
		                ~ firstChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }            
         
        
        + Quando Anna ha Chitarrato all'ex, ha scoperto la sicurezza.

        
        + Un infinito più piccolo resta comunque infinito.

                {
	                - firstChar_possibleStates hasnt Violino:
		                ~ firstChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }    
            
        + Chitarrando a cercare Talco ti sei tutelata.
 
                {
                	- firstChar_possibleStates hasnt Chitarra:
    		            ~ firstChar_possibleStates --
    		           {debug_changeName: Diminuisco lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }            
        
        + C'è più coraggio nella Chitarra che nel compromesso.
 
            
        -
        
        -> ending

    = ending
    ~ temp charNameFive = translator(fifthChar_ActualName)
     Per questo ti dico...
        + {fifthChar_fire > 0} Prendi una strada e se non ti piace cambiala!
        
        + {fifthChar_aether > 0} Dai alla tua vita uno scopo più grande.
        
        + {fifthChar_earth > 0} Ogni gioco richiede una pausa, e tu hai bisogno di ascoltarti.
                
        + {fifthChar_water > 0} Non deluderai i tuoi amici: loro saranno sempre con te.
                
        + {fifthChar_air > 0} Questa non è la tua strada. Succede. Ora puoi cambiare.
                
        
                
        -     
        
    Grazie, {player_name}.
    Mentre parlavi mi è nata una nuova canzone in testa.
    Qualcosa di fresco, di pronto a cambiare.
    La canzone del mio vero nome.

        {
            - firstChar_possibleStates has Chitarra:
                Che <b><i>resterà Chitarra</b></i>, perché l'unica cosa che posso fare, è far sì che altr3 scelgano per me.
            
            - firstChar_possibleStates has Triangolo:
                E il mio vero nome è <b><i>Triangolo</b></i>, perché pensavo di essere uno strumento, e invece ho solo fallito.
                    ~ fifthChar_ActualName = ()
                    ~ fifthChar_ActualName += Triangolo
            
            - firstChar_possibleStates has RagazzaOrchestra:
                Mi chiamerò <b><i>Ragazza Orchestra</b></i>: nel non saper Chitarrare sono diventata l'ornitorinco della musica.
                    ~ fifthChar_ActualName = ()
                    ~ fifthChar_ActualName += RagazzaOrchestra
            
            - firstChar_possibleStates has FlautoDolce:
                Il mio nome è <b><i>Flauto Dolce</b></i>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.
                    ~ fifthChar_ActualName = ()
                    ~ fifthChar_ActualName += FlautoDolce                
            
            - firstChar_possibleStates has Ocarina:
                Mi chiamerò <b><i>Ocarina</b></i>: perché il suo suono è gioco e festa.
                    ~ fifthChar_ActualName = ()
                    ~ fifthChar_ActualName += Ocarina
            
            - firstChar_possibleStates has Violino:
                Io sono <b><i>Violino</b></i>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.
                    ~ fifthChar_ActualName = ()
                    ~ fifthChar_ActualName += Violino
        }
        
        
        ~ book_BGVariations ++
        ~ greenhouse_cultivableGrowing ++   
        
        {
        - fifthChar_specialEvent == true:
            -> secret_ending
        - else:
            -> exit
        }
    
        
    = secret_ending
    ~ temp charNameFive = translator(fifthChar_ActualName)
        C'è una cosa che vorrei dirti, {player_name}.
        Riguarda Il mentore.
        -> close
            
    = exit
    ~ temp charNameFive = translator(fifthChar_ActualName)
        Credo rimarrò ancora in giro per un poco, in attesa del prossimo bus.
        -> close
    
    = close
            ~ fifthChar_storyStatus = story_storyEnded
            ~ story_endedStories += story_fifthCharStoryEnded
            ~ fifthChar_InkLevel = ink_empty
            ~ player_movementsCounter = 0
            ~ numberQuestion = 0
            ~ state_ending_stories(FifthCharacter)
        -> main
    
=== fifth_char_story_ended
~ temp charNameFive = translator(fifthChar_ActualName)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - fifthChar_exitCounter < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {~ Mi chiedo se le cose sarebbero andate diversamente, se Talco fosse arrivatə qui con me.|Sono sicura di aver visto un'altra persona alla fermata del bus, ma quando ho cercato di raggiungerla è scomparsa.|Ogni tanto te la prendi una pausa da questo posto, vero?|Sapevi che a volte c'è una rana nello stagno che circonda la serra?}
                ~ fifthChar_exitCounter ++
        -> main
        
        = goodbye
        ~ temp charNameFive = translator(fifthChar_ActualName)
        ~ move_entity(fifthCharPaint, Bedroom)
        
        {player_name}, per me è arrivato il momento di tornare a casa.
        {firstChar_possibleStates hasnt Chitarra: Non so di preciso cosa mi accadrà ora, ma in un certo senso so che sono più pronta.}
        {firstChar_possibleStates hasnt Chitarra: Grazie per quello che hai fatto, davvero.}
        {firstChar_possibleStates has Chitarra: Vedremo cosa mi accadrà.}
            ~ move_entity(FifthCharacter, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            {
                - fifthChar_possibleStates hasnt Chitarra:
                    ~ move_entity(FifthCharacterNotes, TrainStop)
            }    
            
        -> main




        


=== fifth_character_opinions
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)
~ change_entity_place(Mentor)

    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {~ Nonna dice che non si scappa dalla periferia. Che papà ce l'ha dentro e se l'è portata anche quando siamo andati a vivere in centro.|Non mi piacciono i cartoni per quelli della mia età. Dicono tutte cose che so già.|Se ci pensi bene dire una bugia o scrivere una storia sono la stessa cosa.|Ogni persona ha un animale dentro secondo me. Prendi {mentorName}: sembra un gufo. Anzi anzi: un avvoltoio! No, dai. Un fagiano, quelli femmina, tutti grigi grigi.|Mio fratello dice che devo fidarmi di più degli adulti, ma secondo me lo dice perché è adulto.|Per me il veterinario è come il druido dei videogiochi, solo non deve tirare dei dadi per salvare gli animali.|Un po' mi piacerebbe dormire e basta, senza pensieri.|Forse non mi dispiace mica che sei qui.|Se vado via di qui vorrei tanto portare la rana con me.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
            ~ secondChar_pauseTalking = secondChar_pauseDuration
            ~ secondChar_justTalked = true
                -> talk_with_fifth_character











    
