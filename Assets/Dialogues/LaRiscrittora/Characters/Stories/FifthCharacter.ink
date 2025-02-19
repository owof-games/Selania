=== fifth_character ===
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(Mentor, PG)}[Mentor]
            -> talk_with_mentor
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(Mentor, PG) && fifthStory == Ended} [Mentor]
            -> fifth_char_story_ended
        + ->
    
        -> DONE
    
=== talk_with_mentor
~ temp charNameOne = uppercaseTranslator(firstCharacterState)
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
~ temp charNameFour= uppercaseTranslator(fourthCharacterState)
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

-> fifth_character_storylets ->

    {charNameFive}: Come posso esserti utile, {pronouns has him: amico mio|{pronouns has her: amica mia|amicə miə}}?
    
        + [Avrei bisogno di una mano.]
            -> support
        
        + {(pre_test && not little_storylets.voices) or (firstCharacterInkLevel has High && not little_storylets.infoImpo)}[Mi è successa una cosa strana.]
            -> little_storylets
            
        + {knowing_second_character}[Vorrei conoscerti meglio.]
            {
                - fifthPauseTalking == 0:
                    -> talk_with_fifth_character
                - else:
            //Valutare se per la mentore non abbia senso invece dell'invito alla pausa, darci frasi sul contesto.    
            {charNameFive}: {~ Ora non mi va, ma non mi chiedi aiuto da un po', tutto ok?|Ho bisogno di una pausa, ma se serve aiuto sono qui.|Devo decidere cosa sistemare poi, ma se ti serve aiuto invece, chiedi pure.}
                -> talk_with_mentor
            }
            
        + [Nulla, scusa.]
            -> main
        -
-> main

=== talk_with_fifth_character ===
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

            + [Ti va di raccontarmi qualcosa di te?]
                -> knowing_fifth_character
                
            //Per la mentore: dono solo dopo la fine della quarta storia.
            + {fifthStoryQuestCount > minStoryQuesTCount && findedGifts != () && fourthStory == Ended} [Ti vorrei donare questa cosa.]
                    -> second_story_gift
        
            //Dono fatto ma non ho avviato la main story
            + {fifth_story_gift.ink_outcome && not main_story_fifth_character} [Ti va di riscrivere la tua storia con me?]
                    -> fifth_story_chech_trigger
    
            //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
            + {fifth_story_gift.ink_outcome && main_story_second_character} [Riprendiamo quella storia?]
                -> main_story_fifth_character
            
            + [Lascio il dialogo.]
                -> main
            -
                -> talk_with_fifth_character




=== knowing_fifth_character
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    //Qui man mano faccio avanzare i temi toccati dalla personaggia
        {
            - not one:
                -> one
            - not two && firstStory == Ended:
                -> two
            - not three && firstStory == Ended:
                -> three
            - not four && secondStory == Ended:
                -> four
            - not five && secondStory == Ended:
                -> five
            //Forse solo una di queste, perché con la terza storia avremo degli storylets ad hoc.    
            - not six && thirdStory == Ended:
                -> six
            //Metà delle storie della mentore sono disponibili sostanzialmente da subito, le altre dopo che le condizioni per attivare la storia a tutti gli effetti sono state raggiunte.      
            - not seven && fifthStory == Active:
                -> seven
            - not eight && fifthStory == Active:
                -> eight
            - not nine && fifthStory == Active:
                -> nine
            - not ten && fifthStory == Active:
                -> ten
            - not eleven && fifthStory == Active:
                -> eleven
            - not twelve && fifthStory == Active:
                -> twelve
            - else:
                -> fifth_character_opinions
        }

    = one
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        ~ fifthStoryQuestCount ++
        
        ???: Non è che hai visto passare di qui una persona?
            + (fiveBlue) [Dammi dettagli più concreti.]
                ~ fifthBlue ++
                
            + (fiveYellow) [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                ~ fifthYellow ++
                
            + (fiveRed) [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + (fiveGreen) [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + (fivePurple) [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
        ???: Ma che rinco che sono, non mi sono manco presentata: io sono {charNameFive}.
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main
    = two
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main


    
    = three
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main
    
    
    
    
    = four
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main
    = five
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main
    
    
    = six
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
            //Qui potrebbe aver senso ridurre i tempi di attesa tra un dialogo e l'altro.
             ~  fifthCharPauseDurantion = 5
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main
    = seven
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main        
            
            
    = eight
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main    
    
    
    = nine
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main    
    
    = ten
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main    
    
    = eleven
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main    
    = twelve
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main            
            
            



        


=== fifth_story_gift ===
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
<i> Stai per donare qualcosa a {charNameFive}.</i>
        + {findedGifts != ()} [Scelgo il dono.]
            ~ currentReceiver += Mentor
            -> inventory_management -> ink_outcome 
        + {findedGifts == ()} <i> Il tuo inventario è vuoto.</i>
            ->main
        
    
        = ink_outcome    
            <i>Dopo il tuo dono {inkTranslator(secondCharacterInkLevel)}.
                 -> talk_with_fifth_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

=== fifth_story_chech_trigger
      ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
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
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
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
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        {charNameFive}: Ho realizzato una cosa, una cosa su noi due.
            -> secondAffinityCalc ->
        {
        - firstPurple && firstYellow > firstBlue: {charNameFive}: Sento ancora la mancanza di Talco, ma con te mi sento come se fossimo parte da sempre della stessa band.
        <i>{charNameFive} vede {name} come una persona amica e fidata.</i>
        
        -firstPurple or firstYellow > firstBlue:{charNameFive}: Ci sono momenti in cui cantiamo all'unisono, ed è bello. Mi sento ascoltata.
        
        <i>{charNameFive} si trova bene con {name}.</i>
        
        - firstPurple && firstYellow < firstBlue: {charNameFive}: Facciamo parte di due cori diversi, vero? Non credo tu abbia preso una sola delle mie note.
        
        <i>{charNameFive} non si è sentita capita da {name}.</i>
        
        
        - else: A volte siamo sullo stesso brano, altre no. E non ho ancora capito chi tra noi stia ignorando l'altra parte.
        
        <i>{charNameFive} non riesce a capire che rapporto sta costruendo con {name}.</i>
        
        }
        {charNameFive}: E credo di aver capito perché il mio nome
            
            + [Credo di sapere come aiutarti.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        <i>A seguito del rapporto che {name} ha creato con {charNameFive} {firstPurple && firstYellow > firstBlue: l'inchiostro è aumentato di due unità.|{firstPurple or firstYellow > firstBlue: l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.</i>
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(secondCharacterInkLevel)
        + [Voglio cominciare la riscrittura.]
            -> secondNaming -> 
            -> one
        + [Preferisco prendermi del tempo.]
            -> main

    = one
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
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
                	- firstCharacterPossibleStates hasnt Rinuncia:
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
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

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
                	- firstCharacterPossibleStates hasnt Rinuncia:
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
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
            
        + [Se non tiri nessun dado, non c'è storia da far avanzare.]
         
                {
	                - fifthCharacterPossibleStates hasnt Violino:
		                ~ fifthCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {fifthCharacterPossibleStates }}
                }
        
        + [Ma ogni persona ha immaginato sorti diverse per Jonah.]
                {
                	- fifthCharacterPossibleStates hasnt Rinuncia:
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
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

        + [Giocare è bello perché puoi sempre rinunciare a farlo.]

                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
         
        
        + [Quando Anna ha rinunciato all'ex, ha scoperto la sicurezza.]

        
        + [Un infinito più piccolo resta comunque infinito.]

                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }    
            
        + [Rinunciando a cercare Talco ti sei tutelata.]
 
                {
                	- firstCharacterPossibleStates hasnt Rinuncia:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
        
        + [C'è più coraggio nella rinuncia che nel compromesso.]
 
            
        -
        
        -> ending

    = ending
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
     Per questo ti dico...
        + {fifthRed > 0} [Prendi una strada e se non ti piace cambiala!]
        
        + {fifthPurple > 0} [Dai alla tua vita uno scopo più grande.]
        
        + {fifthYellow > 0} [Ogni gioco richiede una pausa, e tu hai bisogno di ascoltarti.]
                
        + {fifthGreen > 0} [Non deluderai i tuoi amici: loro saranno sempre con te.]
                
        + {fifthBlue > 0} [Questa non è la tua strada. Succede. Ora puoi cambiare.]
                
        
                
        -     
        
    {charNameFive}: Grazie, {name}.
    {charNameFive}: Mentre parlavi mi è nata una nuova canzone in testa.
    {charNameFive}: Qualcosa di fresco, di pronto a cambiare.
    {charNameFive}: La canzone del mio vero nome.

        {
            - firstCharacterPossibleStates has Rinuncia:
                {charNameFive}: Che <b>resterà Rinuncia</b>, perché l'unica cosa che posso fare, è far sì che altr3 scelgano per me.
            
            - firstCharacterPossibleStates has Triangolo:
                {charNameFive}: E il mio vero nome è <b>Triangolo</b>, perché pensavo di essere uno strumento, e invece ho solo fallito.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += Triangolo
            
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameFive}: Mi chiamerò <b>Ragazza Orchestra</b>: nel non saper rinunciare sono diventata l'ornitorinco della musica.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += RagazzaOrchestra
            
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameFive}: Il mio nome è <b>Flauto Dolce</b>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += FlautoDolce                
            
            - firstCharacterPossibleStates has Ocarina:
                {charNameFive}: Mi chiamerò <b>Ocarina</b>: perché il suo suono è gioco e festa.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += Ocarina
            
            - firstCharacterPossibleStates has Violino:
                {charNameFive}: Io sono <b>Violino</b>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += Violino
        }
        
            
        
        {
        - fifthCharacterSpecialEvent == true:
            -> secret_ending
        - else:
            -> exit
        }
    
    
    = secret_ending
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        {charNameFive}: C'è una cosa che vorrei dirti, {name}.
        {charNameFive}: Riguarda Il mentore.

            ~ fifthStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(fifthStory)
                -> main
            
    = exit
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        {charNameFive}: Credo rimarrò ancora in giro per un poco, in attesa del prossimo bus.
            ~ fifthStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(fifthStory)
        -> main  
    
=== fifth_char_story_ended
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - fifthCharEndingDialogue < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {charNameFive}: {~ Mi chiedo se le cose sarebbero andate diversamente, se Talco fosse arrivatə qui con me.|Sono sicura di aver visto un'altra persona alla fermata del bus, ma quando ho cercato di raggiungerla è scomparsa.|Ogni tanto te la prendi una pausa da questo posto, vero?|Sapevi che a volte c'è una rana nello stagno che circonda la serra?}
                ~ fifthCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        {charNameFive}: {name}, per me è arrivato il momento di tornare a casa.
        {firstCharacterPossibleStates hasnt Rinuncia: {charNameFive}: Non so di preciso cosa mi accadrà ora, ma in un certo senso so che sono più pronta.}
        {firstCharacterPossibleStates hasnt Rinuncia: {charNameFive}: Grazie per quello che hai fatto, davvero.}
        {firstCharacterPossibleStates has Rinuncia: {charNameFive}: Vedremo cosa mi accadrà.}
            ~ move_entity(Mentor, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            {
                - fifthCharacterPossibleStates hasnt Rinuncia:
                    ~ move_entity(FifthCharacterNotes, BusStop)
            }    
            
        -> main




=== fifth_character_opinions
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        {   
            //Opinioni dopo la fine della terza storia
            - fourthTier == true:
                -> four
            //Opinioni dopo la fine della seconda storia    
            - thirdTier == true:
                -> three
            //Opinioni dopo la fine della prima storia      
            - secondTier == true:
                -> two
            //Opinioni presenti da inizio gioco    
            - firstTier == true:
                -> one


        }

   = one
   ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {charNameFive}: {~ Bisogna sporcarsi le mani. Nelle cose. Non c’è contatto con le vita se le mani sono sempre pulite.|Le dita devono sapere di terra, come quando da bambina non avevi paura di cadere. Che cosa c’è di vivo se sono sempre pulite?}
            -> main
    
    = two
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {charNameFive}: {~ Bisogna sporcarsi le mani. Nelle cose. Non c’è contatto con le vita se le mani sono sempre pulite.|Le dita devono sapere di terra, come quando da bambina non avevi paura di cadere. Che cosa c’è di vivo se sono sempre pulite?}
            -> main
            
    = three
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {charNameFive}: {~ Bisogna sporcarsi le mani. Nelle cose. Non c’è contatto con le vita se le mani sono sempre pulite.|Le dita devono sapere di terra, come quando da bambina non avevi paura di cadere. Che cosa c’è di vivo se sono sempre pulite?}
            -> main
            
    = four
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {charNameFive}: {~ Bisogna sporcarsi le mani. Nelle cose. Non c’è contatto con le vita se le mani sono sempre pulite.|Le dita devono sapere di terra, come quando da bambina non avevi paura di cadere. Che cosa c’è di vivo se sono sempre pulite?}
            -> main        













    
