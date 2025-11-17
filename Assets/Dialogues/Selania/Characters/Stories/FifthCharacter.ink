=== fifth_character ===
~ temp charNameFive = translator(fifthCharacterState)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(Mentor, PG)}[Mentor]
            -> talk_with_mentor
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(Mentor, PG) && fifthStory == StoryEnded} [Mentor]
            -> fifth_char_story_ended
        + ->
    
        -> DONE
    
=== talk_with_mentor
{debug: passo da talk_with_mentor}
~ temp charNameOne = translator(firstCharacterState)
~ temp charNameTwo = translator(secondCharacterState)
~ temp charNameThree = translator(thirdCharacterState)
~ temp charNameFour= translator(fourthCharacterState)
~ temp charNameFive = translator(fifthCharacterState)

    -> mentor_and_second_char_storylets
    //-> mentor_and_second_char_storylets
    //-> fifth_character_storylets

    = talk
    {debug: passo da talk_with_mentor.talk}
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    Come posso esserti utile, {pronouns has him: amico mio|{pronouns has her: amica mia|amicə miə}}?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
    


        + [Avrei bisogno di una mano.]
            -> support
        
        + {somethingStrange > 0 or (firstCharacterInkLevel has High && not little_storylets.infoImpo) && about_ink_usage} [Mi è successa una cosa strana.]
            -> little_storylets
            
        //+ {knowing_second_character && fifthPauseTalking == 0}[Vorrei conoscerti meglio.]
            // {
            //     - fifthPauseTalking == 0:
                    //-> talk_with_fifth_character
                
            //     - else:
            //         {~ Ora non mi va, ma non mi chiedi aiuto da un po', tutto ok?|Ho bisogno di una pausa, ma se serve aiuto sono qui.|Devo decidere cosa sistemare poi, ma se ti serve aiuto invece, chiedi pure.}
            //         -> talk_with_mentor
            // }
            
        + [Ho cambiato idea.]
            -> main
        -
-> main

=== talk_with_fifth_character ===
~ temp charNameFive = translator(fifthCharacterState)
C'è qualcosa che ti frulla nella testa.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}

            + [Ti va di raccontarmi qualcosa di te?]
                -> knowing_fifth_character
                
            //Per la mentore: dono solo dopo la fine della quarta storia, per questo metto un knot come differenziatore.
            + {knowing_fifth_character.seven && findedGifts != () && fourthStory == StoryEnded} [Ti vorrei donare questa cosa.]
                    -> second_story_gift
        
            //Dono fatto ma non ho avviato la main story
            + {fifth_story_gift.ink_outcome && not main_story_fifth_character} [Ti va di riscrivere la tua storia con me?]
                    -> fifth_story_chech_trigger
    
            //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
            + {fifth_story_gift.ink_outcome && main_story_fifth_character} [Riprendiamo quella storia?]
                -> main_story_fifth_character
            
            + [<i>Lascio il dialogo.]
                -> main
            -
                -> talk_with_fifth_character




=== knowing_fifth_character
~ temp charNameFive = translator(fifthCharacterState)
    //Qui man mano faccio avanzare i temi toccati dalla personaggia
        {
            //Mentore esplode
            - are_two_entities_together(Mentor, PG) && thirdStory == StoryEnded and not mentor_rage:
                -> mentor_rage
        }
        
        {
            - not one && tutorialPauses == false:
                -> one
            - not two && firstStory == StoryEnded && tutorialPauses == false:
                -> two
            - not three && firstStory == StoryEnded && tutorialPauses == false:
                -> three
            - not four && secondStory == StoryEnded && tutorialPauses == false:
                -> four
            - not five && secondStory == StoryEnded && tutorialPauses == false:
                -> five
            //Forse solo una di queste, perché con la terza storia avremo degli storylets ad hoc.    
            - not six && thirdStory == StoryStarted && tutorialPauses == false:
                -> six
            //Questo è lo storylet dove Mentore sbrocca, e che poi trasformo in quinta personaggia    
            - not seven && thirdStory == StoryEnded && tutorialPauses == false:
                -> seven
            - not eight && fifthStory == StoryStarted && tutorialPauses == false:
                -> eight
            - not nine && fifthStory == StoryStarted && tutorialPauses == false:
                -> nine
            - not ten && fifthStory == StoryStarted && tutorialPauses == false:
                -> ten
            - not eleven && fifthStory == StoryStarted && tutorialPauses == false:
                -> eleven
            - not twelve && fifthStory == StoryStarted && tutorialPauses == false:
                -> twelve
            - else:
                -> talk_with_mentor.talk
        }

    = one
    ~ temp charNameFive = translator(fifthCharacterState)
        ~ fifthStoryQuestCount ++
        //Non mettere cose TW qui
        //Amore per il giardinaggio e la possibilità, per la giocatrice, di esprimere qualcosa che poi si potrebbe avvicinare ai possibili finali.
        Non è giusto avere delle preferenze, ma la serra è il mio posto preferito.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral 
        C'è qualcosa nel vedere crescere piante, fiori, funghi che mi fa sentire appagata.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Non è solo l'odore della terra, o l'umidità nell'aria nei giorni più caldi.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Ma quella sensazione che con le tue mani puoi permettere a un altro corpo di crescere al meglio.

            + (fiveBlue) [Preferisco la stazione dei treni, è ordinata, precisa.]
                    -> color_variation_management(Mentor, blueC)->
                Sì, ne capisco il fascino.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                A volte mi siedo lì e mi godo per qualche istante l'attesa.
                Il nulla che accade.
                Ma poi le mani fremono, mi supplicano di sistemare qualcosa fuori posto.
                
            + (fiveYellow) [Lo stagno è divertente, succede di tutto.]
                    -> color_variation_management(Mentor, yellowC)->
                Forse succede <i>di troppo</i>.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Non sembra pensare a nulla.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                L'acqua è lì e lascia che tutto accada, senza pensare al domani.
                
            + (fiveRed) [La foresta domina: è lotta, è potenza!]
                    -> color_variation_management(Mentor, redC)->
                E disordinata, sporca.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Posso capirne il fascino, ma non è un luogo dove resto con piacere.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                E quel tronco al centro non vuole saperne né di crescere né di morire.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Una cosa davvero fastidiosa.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    
                
            + (fiveGreen) [Un po' come prendersi cura delle persone, qui.]
                    -> color_variation_management(Mentor, greenC)->
                Sì, anche se con meno aspettative.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Le persone a volte fanno cose che non ci aspettiamo.
                Un <i>Lichene degli abissi</i> con le giuste condizioni cresce sempre allo stesso modo.
  
            + (fivePurple) [Invece sono felice che crescano a prescidere da me.]
                    -> color_variation_management(Mentor, purpleC)->
                Senza di te?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Dobbiamo bagnare il terreno, prepararlo, seminare.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Non ci sarebbe nulla senza il nostro lavoro.
                Non saprebbero resistere alle erbacce, al freddo.
                No, non sono d'accordo, scusa.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    
 
            -
        {((firstStory hasnt StoryEnded) && (secondStory hasnt StoryEnded)): Ma a proposito di questo posto: devo ancora capire come sgomberare quell'ammasso di mobili rotti che blocca il sentiero a ovest della foresta.|Ma a proposito di questo posto: devo ancora liberare il sentiero da quei fiori enormi vicino alla serra.}#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Grazie per la chiacchierata, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        
             ~ fifthPauseTalking = fifthCharPauseDuration
            @animation:RewriterBook
 
            -> main
    
    = two
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ change_entity_place(SecondCharacter)
    ~ fifthStoryQuestCount ++
        
        //Non mettere cose TW qui
        //Partendo dalla prima personaggia, dipendenza dai rapporti (circa)
        La storia di {charNameOne} mi ha colpita.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            {
                - are_two_entities_together(FirstCharacter, PG): E {charNameOne} di sicuro non vuole sentire le tue opinioni in merito.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_annoyed
                    ~ change_entity_place(FirstCharacter)
            }
            
        Non tanto il suo blocco, quello è una cosa comune a quell'età.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        Quanto invece fosse consapevole delle opinioni di tutte le persone care.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Senza però perdere sé stessa.
        Questa è una cosa difficile anche alla mia età.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        
            + [I numeri sono indicatori, non fatti assoluti.]
                    -> color_variation_management(Mentor, blueC)->
                Su questo hai ragione, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Eppure posso assicurarti che i miei cinquanta e rotti anni si portano addosso anche un bel po' di fatti scricchiolanti e ricordi.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                   
                
            + [{charNameOne} sapeva ridere, giocare, e questo l'ha resa libera.]
                    -> color_variation_management(Mentor, yellowC)->
                E la libertà può farti perdere ancora di più.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                A volte non c'è maggiore libertà di essere stabili e felici nel proprio ruolo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                
                
            + [Non c'è vera azione senza consapevolezza.]
                    -> color_variation_management(Mentor, redC)->
                Allora la maggior parte di noi non agisce mai veramente.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Eppure riusciamo a farci del male, e a farci del bene.
                Qualcosa deve sempre cambiare.

                
            + [E tu sei molto ricettiva verso le altre persone.]
                    -> color_variation_management(Mentor, greenC)->
                Forse non <i>molto</i>.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Ma indubbiamente quello che hanno da dire e quello che provano, conta.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Una mentore è una guida, ma per imparare a guidare deve capire chi ha dall'altra parte.
                Di cosa abbia bisogno.
                Dove voglia andare.
                
                
            + [Ci sono momenti in cui è necessario anche perdersi.]
                    -> color_variation_management(Mentor, purpleC)->
                E in questo luogo in fondo arrivano solo persone che si sono perse.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                E che se ne vanno più serene.
                Avrebbero scoperto quella serenità, senza un po' di smarrimento?
                
            -
        Questo luogo continua a stupirmi.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Sei qui per aiutare le altre persone, e finisci per scoprire cose di te.
        Ma ora è il momeno di svuotare lo stagno dalle sue cose più schifose.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Prega per me, {name}.
                
             ~ fifthPauseTalking = fifthCharPauseDuration
             @animation:RewriterBook
             
                -> main


    
    = three
    ~ temp charNameFive = translator(fifthCharacterState)
        //Non mettere cose TW qui
        //Questo è un riferimento indiretto anche ai figli che ora non la chiamano molto.
        ~ fifthStoryQuestCount ++
         
        A volte un po' mi pesa, tutto questo via vai.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        Ci sono persone a cui mi sono affezionata, che non rivedrò più.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Persone che ho aiutato e ora vorrei sentire più spesso.
        Ma poi le loro lettere non arrivano, o arrivano sempre meno.
        E allora mi chiedo se ho sbagliato qualcosa.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        Non mi fraintendere: sono felice di quello che faccio, di quello che ho fatto.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        E per me è una gioia tenere tutto questo in piedi, giorno per giorno.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry

            + [Ogni lavoro ha la sua quota di sacrificio.]
                -> color_variation_management(Mentor, blueC)->
                Vero.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Il valore di qualcosa viene da quanto ci è costata.
                E la maggior parte delle volte non paghiamo in denaro.
                    
                
            + [Forse le volpi si mangiano le lettere!]
                -> color_variation_management(Mentor, yellowC)->
                La fantasia è un modo piacevole di affrontare la realtà, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Ma alla lunga rende difficile capire cosa sia vero e cosa no.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                    
                
            + [Il mondo è pieno di ingrati.]
                -> color_variation_management(Mentor, redC)->
                No.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Direi che il mondo è pieno di persone distratte.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Le cose da fare sono infinite, e finiamo per dimenticarci di chi non vediamo tutti i giorni.
                Non è ingratitudine, è una vita che scorre troppo veloce.
                    

                
            + [Ti prometto che ti scriverò ogni giorno.]
                -> color_variation_management(Mentor, greenC)->
                Oh, {pronouns has him: caro|{pronouns has her: cara|carə}}, è una bella promessa.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Una promessa che ho sentito decine di volte.
                    
  
                
            + [Esiste un confine tra {charNameFive} e questo luogo?]
                -> color_variation_management(Mentor, purpleC)->
                A volte mi sento <i>solo</i> questo luogo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Non mi chiedo spesso se andarmene o meno.
                O dove.

 
            -
            Ma basta con questo spirito malinconico!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            Mi sono appena ricordata che ci sono delle erbacce fastidiose sotto la poltrona della biblioteca.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            Devo inventarmi un modo per liberarmene!
            
                ~ fifthPauseTalking = fifthCharPauseDuration
                @animation:RewriterBook
                            
                    -> main
    
    
    
    
    = four
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ change_entity_place(SecondCharacter)
        //Non mettere cose TW qui
        //Responsabilità
        ~ fifthStoryQuestCount ++
        Mi sto chiedendo se non sia stata troppo dura col piccolo {charNameTwo} appena arrivato qui.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry 
        Ero sinceramente spaventata, ma forse ho reagito con violenza.
        Ma questo non è un luogo per un bimbo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Ti immagini cosa possa significare essere un genitore, e renderti conto che tuo figlio, così piccolo, ha già perso la strada?
        Che già non sappia più cosa fare del suo futuro?
        Che cosa terribile per entrambi.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        E tutta quella responsabilità.
        Quella paura per il futuro e per l'ambiente.
        Non dovrebbe pensare al pallone, a giocare con gli amici, a studiare?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        
            + [{charNameTwo} ama studiare, e infatti questo è il posto per lui.]
                -> color_variation_management(Mentor, blueC)->
                No!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Questo è un posto spirituale.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Di crescita, di esplorazione.
                Non un laboratorio.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Non il piccolo chimico.
                    
                
            + [Giocare è comunque un modo per capire il mondo, {charNameFive}.]
                    -> color_variation_management(Mentor, yellowC)->
                Ma un modo controllato, adatto per i bambini.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Con meno violenza possibile.
                Senza le cose terribili che ci circondano.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Se non voglio vederle io a cinquant'anni, perché deve vederle un bimbo?
                    
                
            + [Alla sua età avevo anche io idee e paure. Si è bambini, non idioti.]
                    -> color_variation_management(Mentor, redC)->
                Non serve che usi quel linguaggio con me, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                E non sono d'accordo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Nemmeno a vent'anni puoi sapere davvero cosa vuoi.
                Cosa conta a questo mondo.
                Per questo i genitori ci sono.
                Per proteggerti.
                    

            + [Mi spiace che tu ti senta in colpa.]
                -> color_variation_management(Mentor, greenC)->
                Ma non hai detto che non ho sbagliato.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Scusa, non è quello il tuo ruolo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Sennò non sarei io la mentore, ma tu.
                Spero che almeno lui prima o poi mi perdoni.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    
  
            + [Il genitore dovrebbe essere il lavoro di una comunità.]
                -> color_variation_management(Mentor, purpleC)->
                Non dire castronerie, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Si fa così dai tempi dei tempi, due persone.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Una se manca.
                Però dovrebbero avere il diritto di sbagliare.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad

            -
        
        Forse mi sono concentrata sulla cosa sbagliata.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Il problema non è quello che è accaduto.
        Il problema è che mi sono fatta coinvolgere.
        Una mentore deve mantenere un certo distacco per guidarti.
        Non può essere emotiva.
        Vado a riordinare in ordine di data i libri in biblioteca.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
    
             ~ fifthPauseTalking = fifthCharPauseDuration
             @animation:RewriterBook
             
            -> main
    = five
    ~ temp charNameFive = translator(fifthCharacterState)
    
        //Non mettere cose TW qui
        //Presentazione.
        ~ fifthStoryQuestCount ++
        Mi sento più stanca del solito.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
        E fa caldo.
        Ma l'idea di stendermi sotto quell'albero non mi piace.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
        E c'è molto da fare.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Però quella panchina mi ricorda un'altra panchina, sai?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Dove in un'altra vita ho ricevuto il mio primo bacio.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Dall'uomo che poi ho sposato.
        E a cui ho dedicato il resto dei miei giorni.
        Fino a quando non sono arrivata qui.
        Già.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        Fino a quando non sono arrivata qui.
        {name}: secondo te cosa vuol dire amare un'altra persona?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral

            + [Progettare assieme, costruire fondamenta, accrescersi.]
                -> color_variation_management(Mentor, blueC)->
                Già.
                Creare qualcosa che regga alla fine del desiderio.
                Quando il corpo perde il suo splendore.
                E il letto è il luogo della stanchezza e della malattia.
                Quando invece di chiamarci "amore".
                Ci chiediamo dove sono le chiavi della macchina.
                    
                
            + [Un rifugio di stupore e gioia in un mondo grigio.]
                -> color_variation_management(Mentor, yellowC)->
                Mi piace la tua ingenuità {name}.
                Con questa logica ho amato solo una cosa:
                il mio giardino.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Un posto sempre sorprendente, vivo.
                Pieno di musica.
                E forse è davvero così.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    
                
            + [Fondersi nella passione, a letto come in una protesta.]
                -> color_variation_management(Mentor, redC)->
                La passione si spegne, {name}.
                E a quel punto cosa rimane?
                Noia?
                Rancore?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Odio?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Passioni forti chiamano passioni ancora più forti.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    

                
            + [Cura, ascolto, affetto.]
                -> color_variation_management(Mentor, greenC)->
                Già, ho pensato la stessa cosa a lungo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Ma a volte la cura diventa un lavoro.
                L'ascolto un dovere.
                L'affetto un'abitudine.
                Eppure resti.
                Vuol dire che è finito l'amore?
                    
  
                
            + [Raggiungersi l'anima a vicenda, ricercando il divino che è noi.]
                -> color_variation_management(Mentor, purpleC)->
                Una visione mistica.
                Forse blasfema.
                Qualcosa che non ho mai conosciuto, se non nei romanzi.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                O nell'amicizia.
                E a volte, se resto in silenzio e ferma a lungo, in questo luogo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                

 
            -
             ~ fifthPauseTalking = fifthCharPauseDuration
        
        Perdonami: a volte sono solo una sciocca romantica.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
        E mi dimentico che l'amore è ovunque.
        Anche qui.
        Soprattutto qui.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Amore per noi.
        Vado a recuperare del terriccio dal sottobosco, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Parleremo più tardi.
        
        ~ fifthPauseTalking = fifthCharPauseDuration
        @animation:RewriterBook
        
            -> main
    
    
    = six
    ~ temp charNameFive = translator(fifthCharacterState)
    //Non mettere cose TW qui
    
    // -> si parla esplicitamente di responsabilità personale (in antitesi anche con la visione del fungo)? Questa è una visione di RABBIA.

        ~ fifthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    -> color_variation_management(Mentor, blueC)->
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    -> color_variation_management(Mentor, yellowC)->
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                -> color_variation_management(Mentor, redC)->

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                -> color_variation_management(Mentor, greenC)->
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
            //Qui potrebbe aver senso ridurre i tempi di attesa tra un dialogo e l'altro.
             ~  fifthCharPauseDuration = 5
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main
    = seven
    ~ temp charNameFive = translator(fifthCharacterState)
    //Non mettere cose TW qui
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    -> color_variation_management(Mentor, blueC)->
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    -> color_variation_management(Mentor, yellowC)->
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                -> color_variation_management(Mentor, redC)->

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                -> color_variation_management(Mentor, greenC)->
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main        
            
            
    = eight
    ~ temp charNameFive = translator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    -> color_variation_management(Mentor, blueC)->
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    -> color_variation_management(Mentor, yellowC)->
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                -> color_variation_management(Mentor, redC)->

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                -> color_variation_management(Mentor, greenC)->
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main    
    
    
    = nine
    ~ temp charNameFive = translator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    -> color_variation_management(Mentor, blueC)->
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    -> color_variation_management(Mentor, yellowC)->
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                -> color_variation_management(Mentor, redC)->

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                -> color_variation_management(Mentor, greenC)->
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main    
    
    = ten
    ~ temp charNameFive = translator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    -> color_variation_management(Mentor, blueC)->
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    -> color_variation_management(Mentor, yellowC)->
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                -> color_variation_management(Mentor, redC)->

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                -> color_variation_management(Mentor, greenC)->
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main    
    
    = eleven
    ~ temp charNameFive = translator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    -> color_variation_management(Mentor, blueC)->
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    -> color_variation_management(Mentor, yellowC)->
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                -> color_variation_management(Mentor, redC)->

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                -> color_variation_management(Mentor, greenC)->
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main    
    = twelve
    ~ temp charNameFive = translator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    -> color_variation_management(Mentor, blueC)->
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    -> color_variation_management(Mentor, yellowC)->
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                -> color_variation_management(Mentor, redC)->

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                -> color_variation_management(Mentor, greenC)->
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main            
            
            



        


=== fifth_story_gift ===
~ temp charNameFive = translator(fifthCharacterState)
Stai per donare qualcosa a {charNameFive}. #speaker:{witch_tag()}
        + {findedGifts != ()} [Scelgo il dono.]
            ~ currentReceiver += Mentor
            -> inventory_management -> ink_outcome 
        + {findedGifts == ()} Il tuo inventario è vuoto.
            ->main
        
    
        = ink_outcome    
            Dopo il tuo dono {inkTranslator(secondCharacterInkLevel)}.
            ~ move_entity(fifthCharPaint, Bedroom)
            ~ saturationVar ++
                 -> talk_with_fifth_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

=== fifth_story_chech_trigger
      ~ temp charNameFive = translator(fifthCharacterState)
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
            * [Voglio comunque approfondire la storia di questa personaggia.]
                -> main_story_fifth_character
            * [Salto.]
            //FUTURA SOLUZIONE A QUESTA SITUAZIONE
                -> main
        -
        -> END

=== main_story_fifth_character
~ temp charNameFive = translator(fifthCharacterState)
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
    ~ temp charNameFive = translator(fifthCharacterState)
        Ho realizzato una cosa, una cosa su noi due.
            -> secondAffinityCalc ->
        {
        - firstPurple && firstYellow > firstBlue: Sento ancora la mancanza di Talco, ma con te mi sento come se fossimo parte da sempre della stessa band.
        {charNameFive} vede {name} come una persona amica e fidata.
        
        -firstPurple or firstYellow > firstBlue:Ci sono momenti in cui cantiamo all'unisono, ed è bello. Mi sento ascoltata.
        
        {charNameFive} si trova bene con {name}.
        
        - firstPurple && firstYellow < firstBlue: Facciamo parte di due cori diversi, vero? Non credo tu abbia preso una sola delle mie note.
        
        {charNameFive} non si è sentita capita da {name}.
        
        
        - else: A volte siamo sullo stesso brano, altre no. E non ho ancora capito chi tra noi stia ignorando l'altra parte.
        
        {charNameFive} non riesce a capire che rapporto sta costruendo con {name}.
        
        }
        E credo di aver capito perché il mio nome
            
            + [Credo di sapere come aiutarti.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameFive = translator(fifthCharacterState)
        A seguito del rapporto che {name} ha creato con {charNameFive} {firstPurple && firstYellow > firstBlue: l'inchiostro è aumentato di due unità.|{firstPurple or firstYellow > firstBlue: l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(secondCharacterInkLevel)
        + [Voglio cominciare la riscrittura.]
            -> secondNaming -> 
            -> one
        + [Preferisco prendermi del tempo.]
            -> main

    = one
    ~ temp charNameFive = translator(fifthCharacterState)
    {name}: Prima hai detto che hai il terrore di fare una scelta.
        
        + [Qui hai accettato il tuo nuovo nome.]
            {name}: E ammettere una propria paura, una scelta enorme.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
        
        + [Eppure hai deciso di costruire una famiglia con l3 tu3 amic3.]
  
        
        + [Dimenticando che per finire gli studi hai lottato per anni.]
     
            
        + [Ma hai più volte accettato il rischio di suonare sul]
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
        + [Però da che sei qui hai esplorato tutto questo luogo.]
           
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
            
        -
 
        {
        - secondCharacterInkLevel == Empty:
            -> ending
        - else: 
            -> two
        }        
        
    = two
    ~ temp charNameFive = translator(fifthCharacterState)

        + [Con Talco puoi litigare, eppure siete legatissim3.]
            {name}: Pensi davvero che ti accuserebbe di tradimento solo perché hai deciso di decidere per te stessa?
            {name}: Il Talco che hai raccontato si arrabbierebbe di più se tu facessi una scelta per te pensando a ləi.
            
                    
        + [La paura di tradire è un'altra faccia dell'ego.]
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
    
            
        + [Il tuo cuore si preoccupa molto di loro, e poco di te.]
   
            
        + [Forse accadrà, ma non è un tuo problema.]
 
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
                
        + [Tradiamo la fiducia rompendo le regole a nostro vantaggio.]
 
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
                    
        -
        {
        - fifthCharacterInkLevel == Low:
            -> ending
        - else: 
            -> three
        }
        
    = three
    ~ temp charNameFive = translator(fifthCharacterState)
            
        + [Se non tiri nessun dado, non c'è storia da far avanzare.]
         
                {
	                - fifthCharacterPossibleStates hasnt Violino:
		                ~ fifthCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {fifthCharacterPossibleStates }}
                }
        
        + [Ma ogni persona ha immaginato sorti diverse per Jonah.]
                {
                	- fifthCharacterPossibleStates hasnt Chitarra:
    		            ~ fifthCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {fifthCharacterPossibleStates }}
                }
                
        + [Eppure la prima cosa che hai visto qui sono otto sentieri.]
 
                {
	                - fifthCharacterPossibleStates hasnt Violino:
		                ~ fifthCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {fifthCharacterPossibleStates }}
                }
            
        
        + [La storia di Jonah è un successo.]

                
        + [Ragioni come se fossi sola se dovessi cadere.]
     
        -
        {
        - fifthCharacterInkLevel == Normal:
            -> ending
        - else: 
            -> four
        }
    
    = four
    ~ temp charNameFive = translator(fifthCharacterState)

        + [Giocare è bello perché puoi sempre Chitarrare a farlo.]

                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
         
        
        + [Quando Anna ha Chitarrato all'ex, ha scoperto la sicurezza.]

        
        + [Un infinito più piccolo resta comunque infinito.]

                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }    
            
        + [Chitarrando a cercare Talco ti sei tutelata.]
 
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
        
        + [C'è più coraggio nella Chitarra che nel compromesso.]
 
            
        -
        
        -> ending

    = ending
    ~ temp charNameFive = translator(fifthCharacterState)
     Per questo ti dico...
        + {fifthRed > 0} [Prendi una strada e se non ti piace cambiala!]
        
        + {fifthPurple > 0} [Dai alla tua vita uno scopo più grande.]
        
        + {fifthYellow > 0} [Ogni gioco richiede una pausa, e tu hai bisogno di ascoltarti.]
                
        + {fifthGreen > 0} [Non deluderai i tuoi amici: loro saranno sempre con te.]
                
        + {fifthBlue > 0} [Questa non è la tua strada. Succede. Ora puoi cambiare.]
                
        
                
        -     
        
    Grazie, {name}.
    Mentre parlavi mi è nata una nuova canzone in testa.
    Qualcosa di fresco, di pronto a cambiare.
    La canzone del mio vero nome.

        {
            - firstCharacterPossibleStates has Chitarra:
                Che <b><i>resterà Chitarra</b></i>, perché l'unica cosa che posso fare, è far sì che altr3 scelgano per me.
            
            - firstCharacterPossibleStates has Triangolo:
                E il mio vero nome è <b><i>Triangolo</b></i>, perché pensavo di essere uno strumento, e invece ho solo fallito.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += Triangolo
            
            - firstCharacterPossibleStates has RagazzaOrchestra:
                Mi chiamerò <b><i>Ragazza Orchestra</b></i>: nel non saper Chitarrare sono diventata l'ornitorinco della musica.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += RagazzaOrchestra
            
            - firstCharacterPossibleStates has FlautoDolce:
                Il mio nome è <b><i>Flauto Dolce</b></i>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += FlautoDolce                
            
            - firstCharacterPossibleStates has Ocarina:
                Mi chiamerò <b><i>Ocarina</b></i>: perché il suo suono è gioco e festa.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += Ocarina
            
            - firstCharacterPossibleStates has Violino:
                Io sono <b><i>Violino</b></i>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += Violino
        }
        
        
        ~ book_BGVariations ++
        ~ growing ++   
        
        {
        - fifthCharacterSpecialEvent == true:
            -> secret_ending
        - else:
            -> exit
        }
    
        
    = secret_ending
    ~ temp charNameFive = translator(fifthCharacterState)
        C'è una cosa che vorrei dirti, {name}.
        Riguarda Il mentore.
        -> close
            
    = exit
    ~ temp charNameFive = translator(fifthCharacterState)
        Credo rimarrò ancora in giro per un poco, in attesa del prossimo bus.
        -> close
    
    = close
            ~ fifthStory = StoryEnded
            ~ endedStories += fifthES
            ~ fifthCharacterInkLevel = Empty
            ~ movementsCounter = 0
            ~ numberQuestion = 0
            ~ PG_advance_management(fifthStoryPG)
        -> main
    
=== fifth_char_story_ended
~ temp charNameFive = translator(fifthCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - fifthCharEndingDialogue < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {~ Mi chiedo se le cose sarebbero andate diversamente, se Talco fosse arrivatə qui con me.|Sono sicura di aver visto un'altra persona alla fermata del bus, ma quando ho cercato di raggiungerla è scomparsa.|Ogni tanto te la prendi una pausa da questo posto, vero?|Sapevi che a volte c'è una rana nello stagno che circonda la serra?}
                ~ fifthCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameFive = translator(fifthCharacterState)
        {name}, per me è arrivato il momento di tornare a casa.
        {firstCharacterPossibleStates hasnt Chitarra: Non so di preciso cosa mi accadrà ora, ma in un certo senso so che sono più pronta.}
        {firstCharacterPossibleStates hasnt Chitarra: Grazie per quello che hai fatto, davvero.}
        {firstCharacterPossibleStates has Chitarra: Vedremo cosa mi accadrà.}
            ~ move_entity(Mentor, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            {
                - fifthCharacterPossibleStates hasnt Chitarra:
                    ~ move_entity(FifthCharacterNotes, TrainStop)
            }    
            
        -> main




=== fifth_character_opinions
~ temp charNameFive = translator(fifthCharacterState)
        {   
            //Opinioni dopo la fine della terza storia
            - playerAccessiblePlaces has Kitchen:
                -> four
            //Opinioni dopo la fine della seconda storia    
            - playerAccessiblePlaces has Nest:
                -> three
            //Opinioni dopo la fine della prima storia      
            - playerAccessiblePlaces has Library:
                -> two
            //Opinioni presenti da inizio gioco    
            - else:
                -> one
        }

   = one
   ~ temp charNameFive = translator(fifthCharacterState)
    {~ Sinceramente, non so che ne sarebbe di questo luogo senza tutta la manutenzione che devo fare.|Hai notato la bacheca alla stazione dei treni? Anche se è da molto che non arrivano lettere.|A volte vorrei che le cose in serra crescessero più velocemente, così da sapere subito se ho sbagliato qualcosa.|A ovest dello stagno c'è spesso un grande baccano, ma fiori e fieno sono troppo alti per poter vedere cosa ci sia da quelle parti.}
            ~ fifthPauseTalking = fifthCharPauseDuration
            -> main
    
    = two
    ~ temp charNameFive = translator(fifthCharacterState)
    {~ Da piccola amavo leggere, ma dove vivevo non c'erano biblioteche, e per molto tempo avevamo a malapena i soldi per mangiare.|A volte ho questo timore: posso davvero essere una buona mentore, anche se sono poco istruita?|Sono contenta di aver aperto la biblioteca, ma quella poltrona mi invita troppo a riposare, quando invece ci sono mille cose da fare.}
            ~ fifthPauseTalking = fifthCharPauseDuration
            -> main
            
    = three
    ~ temp charNameFive = translator(fifthCharacterState)
    {~ xxx|yyy}
            ~ fifthPauseTalking = fifthCharPauseDuration
            -> main
            
    = four
    ~ temp charNameFive = translator(fifthCharacterState)
    {~ xxx|yyy}
            ~ fifthPauseTalking = fifthCharPauseDuration
            -> main        













    
