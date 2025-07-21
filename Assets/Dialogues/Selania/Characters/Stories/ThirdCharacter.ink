=== third_character ===
~ temp charNameThree = translator(thirdCharacterState)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(ThirdCharacter, PG) && thirdStory == Active}[ThirdCharacter]
            -> talk_with_third_character
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(ThirdCharacter, PG) && thirdStory == Ended} [ThirdCharacter]
            -> third_char_story_ended
        + ->
    
        -> DONE
    

=== talk_with_third_character ===
~ temp charNameThree = translator(thirdCharacterState)

   {//Se prima chiacchierata
        - not knowing_third_character.one:
            -> knowing_third_character.one
    //Se prima chiacchierata fatta e passato abbastanza tempo dalla pausa prevista        
        - thirdPauseTalking == 0:
            -> hub
    //Altre opzioni        
        - else:
            {charNameThree}: {~ Ho bisogno di tempo per me.|Ti spiace tornare tra un po'?|Credo di aver bisogno di silenzio, torna più tardi.}
        -> main
    }

= hub
~ temp charNameThree = translator(thirdCharacterState)

    {charNameThree}: {~ Ero sicura di aver visto una farfalla.|Non male questo posto, anche se casa mi manca.|Non son sicura di star capendo tutto di questo luogo.}
            + [Ti va di raccontarmi qualcosa di te?]
                -> knowing_third_character
                
    
            //Se non ho ancora fatto e ho parlato abbastanza con lui
            + {thirdStoryQuestCount > minStoryQuesTCountFirstChar && findedGifts != ()} [Ti vorrei donare questa cosa.]
                    -> third_story_gift
        
            //Dono fatto ma non ho avviato la main story
            + {third_story_gift.ink_outcome && not main_story_third_character} [Ti va di riscrivere la tua storia con me?]
                    -> third_story_chech_trigger
    
            //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
            + {third_story_gift.ink_outcome && main_story_third_character} [Riprendiamo quella storia?]
                -> main_story_third_character
            
            + [Lascio il dialogo.]
                -> main
            -
                -> talk_with_third_character




=== knowing_third_character
~ temp charNameThree = translator(thirdCharacterState)
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
                -> third_character_opinions
        }

    = one
    ~ temp charNameThree = translator(thirdCharacterState)
    
        //Presentazione.
        ~ thirdStoryQuestCount ++
        
        ???: Non è che hai visto passare di qui una persona?
            + (threeBlue) [Dammi dettagli più concreti.]
                    ~ thirdBlue ++
                
            + (threeYellow) [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ thirdYellow ++
                
            + (threeRed) [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ thirdRed ++

                
            + (threeGreen) [Se ti senti sola, sono qui ad ascoltarti.]
                ~ thirdGreen ++
  
                
            + (threePurple) [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ thirdPurple ++
 
            -
        ???: Ma che rinco che sono, non mi sono manco presentata: io sono {charNameThree}.
        {charNameThree}: No, io sono <b>{charNameThree}</b>.
        {charNameThree}: Ehi! Non è questo il mio nome.
        {charNameThree}: <i>{charNameThree}</i>.
        {charNameThree}: Forse se provo a dirlo al contrario?
        {charNameThree}: Aicnunir.
        {charNameThree}: Uh.
        {charNameThree}: Prova tu. Come ti chiami?
    	    + {name_choice} [Mi chiamo {name}.]
    	    + [Il mio nome è...]
    	        -> name_choice ->
    	    -
    	{charNameThree}: E con che pronomi vuoi che ti chiami?
    	        -> gender ->
    	{charNameThree}: Grandioso, io uso i femminili.      
             ~ thirdPauseTalking = thirdCharPauseDuration
             ~ move_entity(ThirdRecap, BookPlace)
            -> main
    = two
    ~ temp charNameThree = translator(thirdCharacterState)
    
        //Presentazione.
        ~ thirdStoryQuestCount ++
        
        {charNameThree}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ thirdBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ thirdYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ thirdRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ thirdGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ thirdPurple ++
 
            -
             ~ thirdPauseTalking = thirdCharPauseDuration
            -> main


    
    = three
    ~ temp charNameThree = translator(thirdCharacterState)
    
        //Presentazione.
        ~ thirdStoryQuestCount ++
        
        {charNameThree}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ thirdBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ thirdYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ thirdRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ thirdGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ thirdPurple ++
 
            -
             ~ thirdPauseTalking = thirdCharPauseDuration
            -> main
    
    
    
    
    = four
    ~ temp charNameThree = translator(thirdCharacterState)
    
        //Presentazione.
        ~ thirdStoryQuestCount ++
        
        {charNameThree}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ thirdBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ thirdYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ thirdRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ thirdGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ thirdPurple ++
 
            -
             ~ thirdPauseTalking = thirdCharPauseDuration
            -> main
    = five
    ~ temp charNameThree = translator(thirdCharacterState)
    
        //Presentazione.
        ~ thirdStoryQuestCount ++
        
        {charNameThree}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ thirdBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ thirdYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ thirdRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ thirdGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ thirdPurple ++
 
            -
             ~ thirdPauseTalking = thirdCharPauseDuration
            -> main
    
    
    = six
    ~ temp charNameThree = translator(thirdCharacterState)
    
        //Presentazione.
        ~ thirdStoryQuestCount ++
        
        {charNameThree}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ thirdBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ thirdYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ thirdRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ thirdGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ thirdPurple ++
 
            -
             ~ thirdPauseTalking = thirdCharPauseDuration
            -> main
    = seven
    ~ temp charNameThree = translator(thirdCharacterState)
    
        //Presentazione.
        ~ thirdStoryQuestCount ++
        
        {charNameThree}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ thirdBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ thirdYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ thirdRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ thirdGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ thirdPurple ++
 
            -
             ~ thirdPauseTalking = thirdCharPauseDuration
            -> main        
            
            
    = eight
    ~ temp charNameThree = translator(thirdCharacterState)
    
        //Presentazione.
        ~ thirdStoryQuestCount ++
        
        {charNameThree}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ thirdBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ thirdYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ thirdRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ thirdGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ thirdPurple ++
 
            -
             ~ thirdPauseTalking = thirdCharPauseDuration
            -> main    
    
    
    = nine
    ~ temp charNameThree = translator(thirdCharacterState)
    
        //Presentazione.
        ~ thirdStoryQuestCount ++
        
        {charNameThree}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ thirdBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ thirdYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ thirdRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ thirdGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ thirdPurple ++
 
            -
             ~ thirdPauseTalking = thirdCharPauseDuration
            -> main    
    
    = ten
    ~ temp charNameThree = translator(thirdCharacterState)
    
        //Presentazione.
        ~ thirdStoryQuestCount ++
        
        {charNameThree}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ thirdBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ thirdYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ thirdRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ thirdGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ thirdPurple ++
 
            -
             ~ thirdPauseTalking = thirdCharPauseDuration
            -> main    
    
    = eleven
    ~ temp charNameThree = translator(thirdCharacterState)
    
        //Presentazione.
        ~ thirdStoryQuestCount ++
        
        {charNameThree}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ thirdBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ thirdYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ thirdRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ thirdGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ thirdPurple ++
 
            -
             ~ thirdPauseTalking = thirdCharPauseDuration
            -> main    
    = twelve
    ~ temp charNameThree = translator(thirdCharacterState)
    
        //Presentazione.
        ~ thirdStoryQuestCount ++
        
        {charNameThree}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ thirdBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ thirdYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ thirdRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ thirdGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ thirdPurple ++
 
            -
             ~ thirdPauseTalking = thirdCharPauseDuration
            -> main            
            
            



        
=== third_character_opinions
~ temp charNameThree = translator(thirdCharacterState)
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {charNameThree}: {~ Bisogna sporcarsi le mani. Nelle cose. Non c’è contatto con le vita se le mani sono sempre pulite.|Le dita devono sapere di terra, come quando da bambina non avevi paura di cadere. Che cosa c’è di vivo se sono sempre pulite?}
            -> main


=== third_story_gift ===
~ temp charNameThree = translator(thirdCharacterState)
<i> Stai per donare qualcosa a {charNameThree}.</i>
        + {findedGifts != ()} [Scelgo il dono.]
            ~ currentReceiver += ThirdCharacter
            -> inventory_management -> ink_outcome 
        + {findedGifts == ()} <i> Il tuo inventario è vuoto.</i>
            ->main
        
    
        = ink_outcome    
            <i>Dopo il tuo dono {inkTranslator(thirdCharacterInkLevel)}.
                 -> talk_with_third_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

=== third_story_chech_trigger
      ~ temp charNameThree = translator(thirdCharacterState)
      //In questa storia non ci sono trigger, lascio la struttura perché non si sa mai.
      
        //{
        //- loneliness == false:
        //    -> loneliness_trigger
        //- else:
        //    -> main_story_first_character
        //}
            -> main_story_third_character
        
        = loneliness_trigger
        Info
            * [Voglio comunque approfondire la storia di questa personaggia.]
                -> main_story_third_character
            * [Salto.]
            //FUTURA SOLUZIONE A QUESTA SITUAZIONE
                -> main
        -
        -> END

=== main_story_third_character
~ temp charNameThree = translator(thirdCharacterState)
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
    ~ temp charNameThree = translator(thirdCharacterState)
        {charNameThree}: Ho realizzato una cosa, una cosa su noi due.
            -> thirdAffinityCalc ->
        {
        - firstPurple && firstYellow > firstBlue: {charNameThree}: Sento ancora la mancanza di Talco, ma con te mi sento come se fossimo parte da sempre della stessa band.
        <i>{charNameThree} vede {name} come una persona amica e fidata.</i>
        
        -firstPurple or firstYellow > firstBlue:{charNameThree}: Ci sono momenti in cui cantiamo all'unisono, ed è bello. Mi sento ascoltata.
        
        <i>{charNameThree} si trova bene con {name}.</i>
        
        - firstPurple && firstYellow < firstBlue: {charNameThree}: Facciamo parte di due cori diversi, vero? Non credo tu abbia preso una sola delle mie note.
        
        <i>{charNameThree} non si è sentita capita da {name}.</i>
        
        
        - else: A volte siamo sullo stesso brano, altre no. E non ho ancora capito chi tra noi stia ignorando l'altra parte.
        
        <i>{charNameThree} non riesce a capire che rapporto sta costruendo con {name}.</i>
        
        }
        {charNameThree}: E credo di aver capito perché il mio nome
            
            + [Credo di sapere come aiutarti.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameThree = translator(thirdCharacterState)
        <i>A seguito del rapporto che {name} ha creato con {charNameThree} {firstPurple && firstYellow > firstBlue: l'inchiostro è aumentato di due unità.|{firstPurple or firstYellow > firstBlue: l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.</i>
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(thirdCharacterInkLevel)
        + [Voglio cominciare la riscrittura.]
            -> thirdNaming -> 
            -> one
        + [Preferisco prendermi del tempo.]
            -> main

    = one
    ~ temp charNameThree = translator(thirdCharacterState)
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
        - thirdCharacterInkLevel == Empty:
            -> ending
        - else: 
            -> three
        }        
        
    = two
    ~ temp charNameThree = translator(thirdCharacterState)

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
        - thirdCharacterInkLevel == Low:
            -> ending
        - else: 
            -> three
        }
        
    = three
    ~ temp charNameThree = translator(thirdCharacterState)
            
        + [Se non tiri nessun dado, non c'è storia da far avanzare.]
         
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
        
        + [Ma ogni persona ha immaginato sorti diverse per Jonah.]
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
                
        + [Eppure la prima cosa che hai visto qui sono otto sentieri.]
 
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
            
        
        + [La storia di Jonah è un successo.]

                
        + [Ragioni come se fossi sola se dovessi cadere.]
     
        -
        ~ saturationVar ++
        
        {
        - firstCharacterInkLevel == Normal:
            -> ending
        - else: 
            -> four
        }
    
    = four
    ~ temp charNameThree = translator(thirdCharacterState)

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
    ~ temp charNameThree = translator(thirdCharacterState)
     Per questo ti dico...
        + {thirdRed > 0} [Prendi una strada e se non ti piace cambiala!]
        
        + {thirdPurple > 0} [Dai alla tua vita uno scopo più grande.]
        
        + {thirdYellow > 0} [Ogni gioco richiede una pausa, e tu hai bisogno di ascoltarti.]
                
        + {thirdGreen > 0} [Non deluderai i tuoi amici: loro saranno sempre con te.]
                
        + {thirdBlue > 0} [Questa non è la tua strada. Succede. Ora puoi cambiare.]
                
        
                
        -     
        
    {charNameThree}: Grazie, {name}.
    {charNameThree}: Mentre parlavi mi è nata una nuova canzone in testa.
    {charNameThree}: Qualcosa di fresco, di pronto a cambiare.
    {charNameThree}: La canzone del mio vero nome.

        {
            - firstCharacterPossibleStates has Chitarra:
                {charNameThree}: Che <b>resterà Chitarra</b>, perché l'unica cosa che posso fare, è far sì che altr3 scelgano per me.
            
            - firstCharacterPossibleStates has Triangolo:
                {charNameThree}: E il mio vero nome è <b>Triangolo</b>, perché pensavo di essere uno strumento, e invece ho solo fallito.
                    ~ thirdCharacterState = ()
                    ~ thirdCharacterState += Triangolo
            
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameThree}: Mi chiamerò <b>Ragazza Orchestra</b>: nel non saper Chitarrare sono diventata l'ornitorinco della musica.
                    ~ thirdCharacterState = ()
                    ~ thirdCharacterState += RagazzaOrchestra
            
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameThree}: Il mio nome è <b>Flauto Dolce</b>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.
                    ~ thirdCharacterState = ()
                    ~ thirdCharacterState += FlautoDolce                
            
            - firstCharacterPossibleStates has Ocarina:
                {charNameThree}: Mi chiamerò <b>Ocarina</b>: perché il suo suono è gioco e festa.
                    ~ thirdCharacterState = ()
                    ~ thirdCharacterState += Ocarina
            
            - firstCharacterPossibleStates has Violino:
                {charNameThree}: Io sono <b>Violino</b>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.
                    ~ thirdCharacterState = ()
                    ~ thirdCharacterState += Violino
        }
        
            
        
        {
        - thirdCharacterSpecialEvent == true:
            -> secret_ending
        - else:
            -> exit
        }
    
    
    = secret_ending
    ~ temp charNameThree = translator(thirdCharacterState)
        {charNameThree}: C'è una cosa che vorrei dirti, {name}.
        {charNameThree}: Riguarda Il mentore.

            ~ thirdStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(thirdStoryPG)
                -> main
            
    = exit
    ~ temp charNameThree = translator(thirdCharacterState)
        {charNameThree}: Credo rimarrò ancora in giro per un poco, in attesa del prossimo bus.
            ~ thirdStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(thirdStoryPG)
        -> main  
    
=== third_char_story_ended
~ temp charNameThree = translator(thirdCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - thirdCharEndingDialogue < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {charNameThree}: {~ Mi chiedo se le cose sarebbero andate diversamente, se Talco fosse arrivatə qui con me.|Sono sicura di aver visto un'altra persona alla fermata del bus, ma quando ho cercato di raggiungerla è scomparsa.|Ogni tanto te la prendi una pausa da questo posto, vero?|Sapevi che a volte c'è una rana nello stagno che circonda la serra?}
                ~ thirdCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameThree = translator(thirdCharacterState)
        {charNameThree}: {name}, per me è arrivato il momento di tornare a casa.
        {firstCharacterPossibleStates hasnt Chitarra: {charNameThree}: Non so di preciso cosa mi accadrà ora, ma in un certo senso so che sono più pronta.}
        {firstCharacterPossibleStates hasnt Chitarra: {charNameThree}: Grazie per quello che hai fatto, davvero.}
        {firstCharacterPossibleStates has Chitarra: {charNameThree}: Vedremo cosa mi accadrà.}
            ~ move_entity(ThirdCharacter, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            {
                - thirdCharacterPossibleStates hasnt Chitarra:
                    ~ move_entity(ThirdCharacterNotes, TrainStop)
            }    
            
        -> main

















    


// === intro_storia_uno ===



//         = intro
//             ~ storiaUno = Active
//             {charNameUno}: Vigilia di Natale.
//             {charNameUno}: Per la prima volta da mesi ho tempo libero: non sto lavorando, non sto correndo da nessuna parte.
//             {charNameUno}: Cammino lentamente col cane, andando a una cena con amici.
//             {charNameUno}: Eppure, non riesco a liberarmi di questo enorme senso di vuoto.
//             {charNameUno}: Mi prende la pancia con dita lunghe e fredde, mi fa pensare cose che non voglio pensare, più fredde della brina che già ricopre le strade.
//             {charNameUno}: Ho bisogno di parlare con qualcuno: non sento mamma da settimane, e poi ci sono messaggi, audio, meme che attendono risposte da tempi imbarazzanti.
//             {charNameUno}: Mentre aspetto il bus provo a pensare con chi potrei confidarmi.
//             {charNameUno}: Mando un audio a Lele, che mi risponde raccontandomi i suoi drammi.
//             {charNameUno}: Ascolto un vocale di Cate, ma man mano che la sua voce dal passato mi consola per le rotture di lavoro mi passa il coraggio di condividere qualcosa di più pesante.
//             {charNameUno}: Cazzo quanto sono pesante. Rispondo con delle cazzate.
//             {charNameUno}: Provo a scrivere a Sandro, ma poi il testo cambia perché messe a parole quelle cose non sono esattamente così, non hanno la voce giusta.
//             {charNameUno}: L’unica cosa che vorrei fare è gridare, gridare, gridare.
//             {charNameUno}: E poi dai, ognuno c’ha i suoi cazzi.
//             {charNameUno}: Continuo a pensare alla cena in arrivo, al dover far finta che tutto vada bene.
//             {charNameUno}: Ridere alle battute, dire cose come "Ma dai!" e "Non ci credo!".
//             {charNameUno}: L’autobus arriva, lo lascio passare.
//             {charNameUno}: Il vuoto mi trascina in giro per il paese, il suo gelo mi schiaccia lo stomaco, mi fa esplodere il cuore.
//             {charNameUno}: Il cellulare inizia a vibrare. Non ce la posso fare, non ce la posso fare.
//             {charNameUno}: Torno a casa, disattivo il telefono, e mi rimetto a lavorare.
//                 -> main


// === doni_storia_uno ===
// //Qui è la fase di check per i doni, se donarne, quali, o non farlo.
// {
//     - not dono_e_inchiostro: {charNameUno}: Credo che il Mentore prima voglia parlarti.
//         -> main
//     - else:
//         -> internal_inventario
// }

// = internal_inventario
//     {charNameUno}: Tutto sommato è una cosa così banale, così banale. Eppure questo freddo non se ne vuole andare.
//         + {findedGifts != ()} [Ho un dono per te, <i>{traduttorePersonaggeMinuscolo(effettivoStatoPersonaggiaUno)}</i>.]
//             -> inventory_management
//         + [Vorrei riascoltare la tua storia, <i>{traduttorePersonaggeMinuscolo(effettivoStatoPersonaggiaUno)}</i>.]
//             -> intro_storia_uno.intro
//         + [Mi allontano.]
//             -> main
//         -
//             -> main


// === storia_uno
// //Una volta che abbiamo fatto il dono, parte la vera e propria storia.
//     = capitolo_uno
//         //Informativa sullo stato dell'inchiostro.
//         <i>Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroPersonaggiaUno}.</i>
// //Faccio il dono, ho un feedback, esco così da parlare con il Mentore.
//             -> inkActions -> main
//             //-> primo_blocco


//     = primo_blocco
//         {charNameUno}: Sei {pronomi has maschili: tornato|{pronomi has femminili: tornata|tornatə}}, non me l'aspettavo.
//         {nome}: C'è qualcosa che vorrei chiederti:
//             * (vuoto) [Ti è capitato di sentire altre volte questo vuoto?]
//                 {charNameUno}: Forse.
//                 {charNameUno}: <b>Ricordo</b>...
//                 {charNameUno}: Mi manca l'aria, scusa.
//                 ~ terrore ++

//             * (lavoro) [Il tuo lavoro ti fa stare bene?]
//                 {charNameUno}: Sì.
//                 {charNameUno}: Il problema è che non conosco mai il limite.
//                 {charNameUno}: E c'è questa sensazione, questa preoccupazione di essere sempre in ritardo su qualcosa.
//                 {charNameUno}: È davvero difficile riposarsi, sai? Staccare un po'.
//                 {charNameUno}: E intanto il piacere sparisce, e rimaneva solo il <b>dovere</b>.
//                 ~ rabbia ++

//             * (amici) [I tuoi amici ti raccontano i loro problemi?]
//                 {charNameUno}: A volte.
//                 {charNameUno}: Ma ultimamente sempre meno.
//                 {charNameUno}: Non so se perché le cose gli vanno meglio.
//                 {charNameUno}: Se perché sono troppo assente.
//                 {charNameUno}: O solo perché alla fin fine sono sempre le solite cose noiose che accadono <b>a tutti.</b>
//                 ~ abbandono ++
//             -
//             -> thirdo_blocco

//     = thirdo_blocco
//             * Prima hai detto che ci sono cose a cui non volevi pensare.
//                     {charNameUno}: Sì.

//                 * * (racconto)[E ti andrebbe di raccontarmele?]
//                     {charNameUno}: No.
//                     {charNameUno}: Non perché non mi fidi di te.
//                     {charNameUno}: Ma perché fintanto che le cose non escono dalla testa, allora non sono vere, no?
//                     {charNameUno}: E io non voglio che divengano vere.
//                         ~ terrore ++

//                 * * (capita)[Capita anche a me, sai?]
//                     {charNameUno}: Vedi, è come con Lele.
//                     {charNameUno}: Queste cose mi ricordano che quello che provo è comune.
//                     {charNameUno}: Banale.
//                     {charNameUno}: Stupido io che lascio che mi facciano così male.
//                     ~ abbandono ++

//                 * * (testa) [A volte la nostra testa sembra volerci fare del male.]
//                     {charNameUno}: Già.
//                     {charNameUno}: È come avere un nemico in testa.
//                     {charNameUno}: Qualcosa che non puoi schiacciare.
//                     {charNameUno}: Che ti comanda e non ti lascia respirare.
//                     {charNameUno}: E che mi fa incazzare.
//                     {charNameUno}: È terribilmente frustrante.
//                     ~ rabbia ++

//             * (vuoto2) {vuoto} [Non ti scusare. Però forse questo ricordo è importante.]
//                 {charNameUno}: Il vuoto, questo gelo.
//                 {charNameUno}: Credo che in realtà ci sia da sempre.
//                 {charNameUno}: Compariva quando ero piccolo, quando i miei litigavano.
//                 {charNameUno}: A scuola, se rimanevo da solo.
//                 {charNameUno}: Alle cene di lavoro, quando non avevo niente da raccontare.
//                 {charNameUno}: Ci sono un po' di modi per disturbarlo, sfiancarlo, ma come mi rilasso, è pronto a bussare.
//                 {charNameUno}: Mi insegue nei sogni, non mi lascia respirare.
//                 ~ terrore ++

//             * (lavoro2) {lavoro} [Quando il lavoro diventa un dovere non prendi una pausa?]
//                 {charNameUno}: Pensi non ci abbia provato?!?
//                 {charNameUno}: Scusa.
//                 {charNameUno}: Ma non hai idea della frustrazione.
//                 {charNameUno}: Ci ho messo una vita per vivere di ciò che amavo fare.
//                 {charNameUno}: E quando questo è successo, non avevo più uno spazio di sfogo.
//                 {charNameUno}: Un posto dove respirare.
//                 {charNameUno}: A volte finisco per litigare solo per il piacere di litigare.
//                 {charNameUno}: Per gridare.
//                 {charNameUno}: Per far sì che accada qualcosa.
//                 ~ rabbia ++


//             * (amici2) {amici} [Anche se accadono a tutti, sono importanti per te.]
//                 {charNameUno}: Ma il punto non è quello.
//                 {charNameUno}: È che poi le persone si annoiano.
//                 {charNameUno}: Con tutti i casini, chi ha davvero voglia di ascoltare le para di qualcun altro.
//                 {charNameUno}: E poi, alle persone non piace la fragilità.
//                 {charNameUno}: La fragilità è sorella del bisogno, e le persone bisognose...
//                 {charNameUno}: Lascia fare.
//                 ~ abbandono ++



//             * Quando hai deciso di non andare alla cena...
//                 * * (verità) [Perché non hai detto la verità ai tuoi amici?]
//                     {charNameUno}: Perché qualcuno avrebbe voluto aiutare.
//                     {charNameUno}: Chiamare.
//                     {charNameUno}: Salire a casa e fare qualcosa, risolvere qualcosa assieme.
//                     {charNameUno}: Ma io non so come fare, non ho idea di come reagire a queste cose.
//                     {charNameUno}: E il Vuoto allora mi dice che sono in debito.
//                     {charNameUno}: Che devo essere riconoscente.
//                     {charNameUno}: Ma per esserlo devo ascoltare, devo prestare davvero attenzione.
//                     {charNameUno}: Fare meno cose, quando l'unica certezza che ho è che il Vuoto è silenzioso solo se continuo a lavorare.
//                     ~ terrore ++

//                 * * (sentimenti) [Non hai pensato ai loro sentimenti?]
//                     {charNameUno}: Beh, gli ho fatto un favore.
//                     {charNameUno}: Già sanno che sono inaffidabile, che non rispondo alle chiamate, che arrivo dopo settimane a scrivere un messaggio.
//                     {charNameUno}: Almeno così hanno avuto la conferma che sono dimenticabile.
//                     {charNameUno}: Ignorabile.
//                     {charNameUno}: E la prossima volta faranno senza di me.
//                     ~ abbandono ++

//                 * * (male) [Non ti sei fatto solo del male da solo?]
//                     {charNameUno}: Probabile.
//                     {charNameUno}: Ma meglio così che rovinare la festa a tutti, no?
//                     {charNameUno}: Chi ha voglia di starsene a tavola con un fantasma piagnone?
//                     {charNameUno}: Con un fallimento sociale?
//                     {charNameUno}: Io no.
//                     {charNameUno}: Non ho nemmeno voglia di restare con me.
//                     {charNameUno}: Non capisco perché ci stia tu, quì.
//                     ~ rabbia ++
//             -

//                     -> terzo_blocco

//     = terzo_blocco
//         {nome}: C'è una cosa ancora che vorrei chiederti, che vorrei capire.
//         //Questa cosa ci permette di capire qual è lo stato d'animo emergente.

//             * [Perché proprio questo ricordo?]
//                 {nome}: Perché è questa la cosa che continua a bloccarti qui?
//                 {
//                 - rabbia > abbandono && rabbia > terrore:
//                     {charNameUno}: Perché ora l'unica cosa che rimane è la <b>rabbia</b>, la furia.
//                     {charNameUno}: E non so, non ricordo se l'ho mai rivolta contro qualcuno a cui tengo.
//                     {charNameUno}: Perché a volte questo vuoto fa così male, che vorrei distruggere tutto.

//                 - abbandono > rabbia && abbandono > terrore:
//                     {charNameUno}: Perché mi sono sentito così vuoto, così solo, così dimenticato.
//                     {charNameUno}: E quel vuoto è come un buco nero.
//                     {charNameUno}: E non conta cosa è accaduto prima, cosa è venuto dopo.
//                     {charNameUno}: So solo che presto o tardi verrò <b>abbandonato</b>.

//                 - terrore > rabbia && terrore > abbandono:
//                     {charNameUno}: Perché avrei voluto parlare del vuoto.
//                     {charNameUno}: Ma il vuoto è come un vortice che prende e travolge tutto.
//                     {charNameUno}: E l'unica cosa che rimane è il <b>terrore</b> di cosa possa esserci dopo il vuoto.

//                 - else:
//                     {charNameUno}: Perché racconta qualcosa di chi ero.
//                     {charNameUno}: Di chi sono stato.
//                     {charNameUno}: E di chi poi sono diventato.
//                 }
//                     -> riscrittora_storia_uno


// === riscrittora_storia_uno
//         {nome}: Sai, io sono qui per aiutarti a rileggere la tua storia.
//         {nome}: E forse ci sono dei modi diversi di guardare a quello che ti è accaduto.

//         //Più abbiamo preso un certo topic di petto, più veniamo premiate? E quindi un punteggio alto in realtà favorisce una certa lettura di sè?
//         //Ma se non abbiamo toccato un sentimento, una paura, non abbiamo modo di rileggere quella cosa in quel modo, e allora possiamo solo confermare lo status quo.
//         //Arrivo qui con un massimo di 3 punti su un elemento
//         {nome}: Il vuoto...
//         //Mettere qualcosa per far riconoscere che una scelta usa inchiostro e l'altra no.
//             - (top1)
                
//                 * {rabbia > 0} [Esplode per la tua frustrazione.]
//                         {check_statusVsInk(rabbia, statoInchiostroPersonaggiaUno):
//                             - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
//                                 -> top1
//                         }
//                         {storia_uno.thirdo_blocco.lavoro2: {nome}: Hai detto che il piacere è sparito, che a volte vorresti litigare solo perché qualcosa possa cambiare.}                        
//                         {storia_uno.thirdo_blocco.testa: {nome}: Ti manca il respiro, ti arrabbi, e non sai come affrontare questa cosa.}
//                         {storia_uno.thirdo_blocco.male: {nome}: Non ti perdoni. Ti descrivi come un fallimento sociale.}
//                         {nome}: Il vuoto è una ferita che continua a farti male, ma che non sai come riparare.
//                         {charNameUno}: Dimmi qualcosa che non so.
//                             ~ statoInchiostroPersonaggiaUno --
//                             ~ ferito ++
                
//                 * {abbandono > 0} [È il tuo bisogno di relazioni.]
//                         {check_statusVsInk(abbandono,statoInchiostroPersonaggiaUno):
//                             - false: <i>Non hai abbastanza inchiostro per questa scelta</i>
//                                 -> top1
//                         }
//                         {storia_uno.thirdo_blocco.amici2: {nome}: Ascoltare e condividere le "para" sono cose di cui abbiamo tutte bisogno.}                        
//                         {storia_uno.thirdo_blocco.capita: {nome}: È vero che molte delle cose che proviamo sono comuni, ed è questo il bello: rende più facile la comprensione.}
//                         {storia_uno.thirdo_blocco.sentimenti: {nome}: Hai detto che sei ignorabile, dimenticabile. Ma non hai mai detto di star meglio senza le altre persone.}
//                         {nome}: Il vuoto è la tua fame di socialità, la tua voglia di connetterti, di unirti alle altre persone.
//                         {charNameUno}: No, questa cosa mi farebbe solo del male.
//                         {charNameUno}: Perché presto o tardi tutti se ne andranno.
//                         {charNameUno}: Ma continua.
//                             ~ statoInchiostroPersonaggiaUno --
//                             ~ socievole ++
                
//                 * {terrore > 0} [Ti sta indicando le cose che ti fanno paura.]
//                         {check_statusVsInk(terrore,statoInchiostroPersonaggiaUno):
//                             - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
//                                 -> top1
//                         }
//                         {storia_uno.thirdo_blocco.racconto: {nome}: Non è vero che se racconti ciò che hai in testa, diventa vero.}
//                         {storia_uno.thirdo_blocco.vuoto2: {nome}: A scuola, coi genitori, a lavoro: sono situazioni che possono diventare davvero pesanti.}
//                         {storia_uno.thirdo_blocco.verità: {nome}: Nel mondo in cui viviamo, fatto di numeri e bilanci, è normale pensare che se qualcuno ci aiuta, allora siamo in debito.}
//                         {nome}: Il vuoto è un segnale, non è un problema da risolvere.
//                         {charNameUno}: ...
//                             ~ statoInchiostroPersonaggiaUno --
//                             ~ consapevole ++
                
//                 * {rabbia == 0}[È il riflesso della tua rabbia.]
//                         {charNameUno}: Tutto qui?
//                         {charNameUno}: Come se esistesse un motivo per non essere incazzati col mondo.                                            
                
//                 * {abbandono == 0}[È l'isolamento che vai cercando.]
//                         {charNameUno}: Vedi?                
//                         {charNameUno}: Alla fine me lo merito.
//                         {charNameUno}: Merito di restare da solo.

//                 * {terrore == 0}[È la tua paura.]
//                         {charNameUno}: Quindi sono persino un codardo?
//                         {charNameUno}: Beh, dirlo ad alta voce un po' mi consola.
//                         {charNameUno}: Almeno so chi sono.


//                 -
//         {nome}: E per questo...
//             - (top2)
//                 *  {rabbia > 0} [Quello di cui hai bisogno è un momento di sosta.]
//                         {check_statusVsInk(rabbia, statoInchiostroPersonaggiaUno):
//                             - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
//                                 -> top2
//                         }
//                         {storia_uno.thirdo_blocco.lavoro2: {nome}: Iniziare a riscoprire il piacere.}                        
//                         {storia_uno.thirdo_blocco.testa: {nome}: Smetterla di trattare il vuoto come un nemico.}
//                         {storia_uno.thirdo_blocco.male: {nome}: Concerderti di essere un lamentone, un frignone.}
//                         {nome}: Se non ti fermi e non capisci cosa provi, non ha senso avanzare.
//                         {nome}: Non ha senso lavorare.
//                         {nome}: E prima o poi il vuoto, la rabbia, troveranno modi per farsi notare.
//                         {charNameUno}: Io... Io...
//                         {charNameUno}: Uhm.                       
//                             ~ statoInchiostroPersonaggiaUno --
//                             ~ ferito ++
                
//                 *  {abbandono > 0} [Guarda i rapporti che già hai, e parti da lì.]
//                         {check_statusVsInk(abbandono, statoInchiostroPersonaggiaUno):
//                             - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
//                                 -> top2
//                         }
//                         {storia_uno.thirdo_blocco.amici2: {nome}: Dici di essere assente: è un modo per difenderti dalla paura, ma è anche il modo migliore per far sì che davvero prima o poi le persone si allontanino.}               
//                         {storia_uno.thirdo_blocco.capita: {nome}: Tutte veniamo ferite da cose "banali", ma che non lo sono davvero: ci feriscono per il nostro passato, per la nostra storia.}
//                         {storia_uno.thirdo_blocco.sentimenti: {nome}: Mettersi nella posizione di essere "dimenticabile" non cancella il dolore che possono provare loro, nella tua assenza.}
//                         {nome}: È come quella cosa, quella roba della profezia che si autoavvera.
//                         {nome}: Cerchi così tanto di non venire abbandonato, che alla fine fai di tutto perché le altre persone se ne vadano.
//                         {charNameUno}: Eppure tu sei ancora qui.
//                         Già: eppure sono ancora qui.
//                         E ti conosco solo da qualche minuto.
//                             ~ statoInchiostroPersonaggiaUno --
//                             ~ socievole ++
                
//                 *  {terrore > 0} [Anche se fa paura, aprirsi è la soluzione.]
//                         {check_statusVsInk(terrore, statoInchiostroPersonaggiaUno):
//                             - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
//                                 -> top2
//                         }
//                         {storia_uno.thirdo_blocco.racconto: {nome}: Raccontare ciò che hai in testa, condividerlo, ti permette di smontarlo.}
//                         {storia_uno.thirdo_blocco.vuoto2: {nome}: Quando sei in compagnia e la situazione è difficile, può essere utile avere una persona alleata al tuo fianco.}
//                         {storia_uno.thirdo_blocco.verità: {nome}: È importante ricordarti che le persone che ti vogliono bene ti aiutano perché gli va, non perché devono.}
//                         {nome}: Non siamo fatti per affrontare il mondo da soli, e va bene così.
//                         {charNameUno}: ...
//                             ~ statoInchiostroPersonaggiaUno --
//                             ~ consapevole ++
                
//                 *  {rabbia == 0}[Hai bisogno di esplodere.]
//                         {nome}: Gridare al mondo quello che non va.
//                         {nome}: Bruciare tutto.
//                         {nome}: Solo quando tutto è cancellato, allora possiamo ricominciare.

//                 *  {abbandono == 0}[Devi cercare di stare bene da solo.]
//                         {nome}: Gli altri ci saranno, comunque.
//                         {nome}: Ma se non trovi la chiave per amare te stesso, c'è poco da trovare soddisfazione nelle relazioni.

//                 *  {terrore == 0}[Il vuoto forse è qualcosa da accogliere.]
//                         {charNameUno}: Trasformarmi nel vuoto.
//                         {charNameUno}: Sparire.
//                         {charNameUno}: L'eco di una persona.                                                            
//                 -
        
//         {nome}: La tua storia...
//             - (top3)
//                 *  {rabbia > 0} [È quella di una persona che riscopre le sue ferite.]
//                         {check_statusVsInk(rabbia, statoInchiostroPersonaggiaUno):
//                             - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
//                                 -> top3
//                         }
//                         {nome}: Che vede nella rabbia, nella frustrazione non un nemico, ma un indicatore: qui è stato superato un confine.
//                         {nome}: E allora si siede, e si ascolta.
//                         {nome}: Lascia che la sua ferita gli dica di cosa ha bisogno, di cosa prendersi cura.
//                         {nome}: Affinché pian piano possa chiudersi e guarire.
//                             ~ statoInchiostroPersonaggiaUno --
//                             ~ ferito ++

//                 *  {abbandono > 0} [È quella di una persona che ama la compagnia.]
//                         {check_statusVsInk(abbandono, statoInchiostroPersonaggiaUno):
//                             - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
//                                 -> top3
//                         }
//                         {nome}: E che non cerca di essere qualcuno che non è.
//                         {nome}: Che è incasinato dal lavoro, dalla vita, eppure alla fine torna sempre.
//                         {nome}: Che si preoccupa per Lele, che cerca di non stressare Cate.
//                         {nome}: E che ora imparerà ad essere indulgente con sé stesso, a smetterla di nascondersi lasciandosi un po' coccolare.
//                         {nome}: Condividendo le sue fragilità.
//                             ~ statoInchiostroPersonaggiaUno --
//                             ~ socievole ++

//                 *  {terrore > 0} [È quella di qualcuno che accoglie le sue paure.]
//                         {check_statusVsInk(terrore, statoInchiostroPersonaggiaUno):
//                             - false: <i>Non hai abbastanza inchiostro per questa scelta.</i>
//                                 -> top3
//                         }
//                         {nome}: Che vede il mondo, i rapporti, e ne comprende le complessità.
//                         {nome}: Una vedetta consapevole.
//                         {nome}: Sola, la vedetta è spaventata, terrorizzata.
//                         {nome}: Ma assieme alle altre persone diventa parte di una rete, di una conversazione capace di trasformare ciò che non va.
//                             ~ statoInchiostroPersonaggiaUno --
//                             ~ consapevole ++
                
//                 *  {rabbia == 0} [È un inno alla rabbia.]
//                         {nome}: Sei fuoco.
//                         {nome}: Ti alimenti della tua frustrazione.
//                         {nome}: Quello che è da capire è cosa distruggerà la tua esplosione: le persone care?
//                         {nome}: Te stesso?
//                         {nome}: O ciò che non funziona?

//                 *  {abbandono == 0} [È il viaggio solitario dell'eroe.]
//                         {nome}: Che avanza di giorno in giorno affrondando da solo i suoi drammi, la spada sporca di sangue.
//                         {nome}: Che cambia città, regione, stato ogni volta, lasciandosi il vuoto alle spalle.
//                         {nome}: Ma quando la notte sale e il fuoco crepita, si chiede: ne è valsa davvero la pena?
//                         {nome}: Non potrei forse fermarmi in un'osteria per qualche notte?
//                         {nome}: Un po' di vino, buone chiacchiere.
//                         {nome}: E forse una faccia amica con cui riprendere a camminare?
                
//                 *  {terrore == 0} [È una storia di paura.]
//                         {nome}: E la paura non è una colpa.
//                         {nome}: Il mondo è un gran casino, ci sta sentirsi costantemente in allarme.
//                 -
//                     -> chi_sono_storia_uno

// === chi_sono_storia_uno

//         {charNameUno}: Ora ricordo.
//         {charNameUno}: Ricordo che questa cosa è successa molto tempo fa.
//         {charNameUno}: Che sono bloccato qui non so nemmeno da quanto.
//         {charNameUno}: Ma vedo le cose con chiarezza.
//         {charNameUno}: Non sono {charNameUno}.
//         {charNameUno}: Io sono <>
//         {
//             - rabbia > abbandono:
//             {
//                 - rabbia > terrore:
//                 {
//                     - rabbia > ferito: l'Arrabbiato.
//                         ~ effettivoStatoPersonaggiaUno = LArrabbiato
//                     - else:  il Guarente.
//                          ~ effettivoStatoPersonaggiaUno = IlGuarente
//                 }
//                 - else:
//                 {
//                     - terrore > consapevole: il Terrorizzato.
//                          ~ effettivoStatoPersonaggiaUno = IlTerrorizzato
//                     - else: il Consapevole.
//                          ~ effettivoStatoPersonaggiaUno = IlConsapevole
//                 }
//             }
//             - abbandono > terrore:
//                 {
//                     - terrore > consapevole: il Terrorizzato.
//                          ~ effettivoStatoPersonaggiaUno = IlTerrorizzato
//                     - else: il Consapevole.
//                          ~ effettivoStatoPersonaggiaUno = IlConsapevole
//                 }
//             - else:
//                 {
//                     - abbandono > socievole: l'abbandonato.
//                          ~ effettivoStatoPersonaggiaUno = LAbbandonato
//                     - else: il Socievole.
//                          ~ effettivoStatoPersonaggiaUno = IlSocievole
//                 }                    
//         }

//         {effettivoStatoPersonaggiaUno:
//             - IlSocievole: {charNameUno}: Ora so che sto bene quando sono con altre persone, e che posso smetterla di tenerle lontane.
//             - IlConsapevole: {charNameUno}: Vedo i dolori del mondo e capisco che sono prodotti di quel sistema. Unendomi alle altre persone, posso cambiare un po' di cose.
//             - IlGuarente: {charNameUno}: La mia rabbia è una guida: ora so dove si trovano le mie ferite, e come affrontarle.
//             - IlTerrorizzato: {charNameUno}: Quello che ho dentro è mostruoso, deve rimanere nascosto dagli altri, a qualunque costo.
//             - LAbbandonato: {charNameUno}: Sono abituato a fare tutto da solo, così saprò come sopravvivere quando gli altri inevitabilmente se ne andranno.
//             - LArrabbiato: {charNameUno}: Il mondo è sempre pronto a mordere, e io lo morderò sempre prima che lui possa ferirmi.
//         }
//         -
//         {
//             - eventoSpecialePersonaggiaUno == true:
//                 -> evento_speciale
//             - else:
//                 {charNameUno}: E ora posso andarmene in pace.
//                 ~ storiaUno = Ended
//                 ~ movementsCounter = 0
//                     -> main
//         }

//     = evento_speciale
//         {charNameUno}: Prima di andarmene, vorrei dirti una cosa.
//         {charNameUno}: Mi hai dato un dono speciale, e vorrei ringraziarti in qualche modo.
//         {charNameUno}: E quindi: presta attenzione al mentore.
//         {charNameUno}: Perché potrebbe essere qualcuno che già conosci.
//         {charNameUno}: Fuori da qui.
//         {charNameUno}: Dal mondo da cui provieni.
//         {charNameUno}: Addio.                              
//             ~ storiaUno = Ended
//                 -> main

// === scelta_nome_uno
//     * Il Socievole.
//          ~ effettivoStatoPersonaggiaUno = IlSocievole
//     * Il Consapevole.
//          ~ effettivoStatoPersonaggiaUno = IlConsapevole
//     * Il Ferito.
//          ~ effettivoStatoPersonaggiaUno = IlGuarente
//     -
//         ~ movementsCounter = 0
//         ~ storiaUno = Ended
//         -> main
        
     