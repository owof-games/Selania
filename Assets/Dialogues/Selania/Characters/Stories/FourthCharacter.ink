=== fourth_character ===
~ temp charNameThree = translator(fourthCharacterState)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(FourthCharacter, PG) && fourthStory == Active}[FourthCharacter]
            -> talk_with_fourth_character
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(FourthCharacter, PG) && fourthStory == Ended} [FourthCharacter]
            -> fourth_char_story_ended
        + ->
    
        -> DONE
    

=== talk_with_fourth_character ===
~ temp charNameThree = translator(fourthCharacterState)

   {//Se prima chiacchierata
        - not knowing_fourth_character.one:
            -> knowing_fourth_character.one
    //Se prima chiacchierata fatta e passato abbastanza tempo dalla pausa prevista        
        - fourthPauseTalking == 0:
            -> hub
    //Altre opzioni        
        - else:
            {~ Ho bisogno di tempo per me.|Ti spiace tornare tra un po'?|Credo di aver bisogno di silenzio, torna più tardi.}
        -> main
    }

= hub
~ temp charNameThree = translator(fourthCharacterState)

    {~ Ero sicura di aver visto una farfalla.|Non male questo posto, anche se casa mi manca.|Non son sicura di star capendo tutto di questo luogo.} #speaker:{fourthChar_tag()} #inkA:{ink_tag_a(fourthCharacterInkLevel)} #inkB:{ink_tag_b(fourthCharacterInkLevel)}  #inkC:{ink_tag_c(fourthCharacterInkLevel)}  #inkD:{ink_tag_d(fourthCharacterInkLevel)} #portrait:fourth_neutral
            + [Ti va di raccontarmi qualcosa di te?]
                -> knowing_fourth_character
                
    
            //Se non ho ancora fatto e ho parlato abbastanza con lui
            + {fourthStoryQuestCount > minStoryQuesTCountFirstChar && findedGifts != ()} [Ti vorrei donare questa cosa.]
                    -> fourth_story_gift
        
            //Dono fatto ma non ho avviato la main story
            + {fourth_story_gift.ink_outcome && not main_story_fourth_character} [Ti va di riscrivere la tua storia con me?]
                    -> fourth_story_chech_trigger
    
            //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
            + {fourth_story_gift.ink_outcome && main_story_fourth_character} [Riprendiamo quella storia?]
                -> main_story_fourth_character
            
            + [Lascio il dialogo.]
                -> main
            -
                -> talk_with_fourth_character




=== knowing_fourth_character
~ temp charNameThree = translator(fourthCharacterState)
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
                -> fourth_character_opinions
        }

    = one
    ~ temp charNameThree = translator(fourthCharacterState)
    //Non mettere cose TW qui
        //Presentazione.
        ~ fourthStoryQuestCount ++
        
        ???: Non è che hai visto passare di qui una persona?
            + (threeBlue) [Dammi dettagli più concreti.]
                    ~ fourthBlue ++
                
            + (threeYellow) [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthYellow ++
                
            + (threeRed) [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthRed ++

                
            + (threeGreen) [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthGreen ++
  
                
            + (threePurple) [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthPurple ++
 
            -
        ???: Ma che rinco che sono, non mi sono manco presentata: io sono {charNameThree}.
        No, io sono <b>{charNameThree}</b>.
    	    + {name_choice} [Mi chiamo {name}.]
    	    + [Il mio nome è...]
    	        -> name_choice ->
    	    -
    	E con che pronomi vuoi che ti chiami?
    	        -> gender ->
    	Grandioso, io uso i femminili.      
             ~ fourthPauseTalking = fourthCharPauseDuration
             ~ move_entity(FourthRecap, BookPlace)
            -> main
    
    = two
    ~ temp charNameThree = translator(fourthCharacterState)
    //Non mettere cose TW qui
        //Presentazione.
        ~ fourthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthPurple ++
 
            -
             ~ fourthPauseTalking = fourthCharPauseDuration
            -> main


    
    = three
    ~ temp charNameThree = translator(fourthCharacterState)
    //Non mettere cose TW qui
        //Presentazione.
        ~ fourthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthPurple ++
 
            -
             ~ fourthPauseTalking = fourthCharPauseDuration
            -> main

    
    = four
    ~ temp charNameThree = translator(fourthCharacterState)
    //Non mettere cose TW qui
        //Presentazione.
        ~ fourthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthPurple ++
 
            -
             ~ fourthPauseTalking = fourthCharPauseDuration
            -> main
    = five
    ~ temp charNameThree = translator(fourthCharacterState)
    //Non mettere cose TW qui
        //Presentazione.
        ~ fourthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthPurple ++
 
            -
             ~ fourthPauseTalking = fourthCharPauseDuration
            -> main
    
    
    = six
    ~ temp charNameThree = translator(fourthCharacterState)
    //Non mettere cose TW qui
        //Presentazione.
        ~ fourthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthPurple ++
 
            -
             ~ fourthPauseTalking = fourthCharPauseDuration
            -> main
    = seven
    ~ temp charNameThree = translator(fourthCharacterState)
    //Non mettere cose TW qui
        //Presentazione.
        ~ fourthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthPurple ++
 
            -
             ~ fourthPauseTalking = fourthCharPauseDuration
            -> main        
            
            
    = eight
        //Da qui, no problem con contenuti TW. Si mette lx PG che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il counter non sale.
    ~ temp charNameThree = translator(fourthCharacterState)
    
        //Presentazione.
        ~ fourthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthPurple ++
 
            -
             ~ fourthPauseTalking = fourthCharPauseDuration
            -> main    
    
    
    = nine
    ~ temp charNameThree = translator(fourthCharacterState)
    //Da qui, no problem con contenuti TW. Si mette lx PG che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il counter non sale.
        //Presentazione.
        ~ fourthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthPurple ++
 
            -
             ~ fourthPauseTalking = fourthCharPauseDuration
            -> main    
    
    = ten
    ~ temp charNameThree = translator(fourthCharacterState)
    //Da qui, no problem con contenuti TW. Si mette lx PG che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il counter non sale.
        //Presentazione.
        ~ fourthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthPurple ++
 
            -
             ~ fourthPauseTalking = fourthCharPauseDuration
            -> main    
    
    = eleven
    ~ temp charNameThree = translator(fourthCharacterState)
    //Da qui, no problem con contenuti TW. Si mette lx PG che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il counter non sale.
        //Presentazione.
        ~ fourthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthPurple ++
 
            -
             ~ fourthPauseTalking = fourthCharPauseDuration
            -> main    
    = twelve
    ~ temp charNameThree = translator(fourthCharacterState)
    //Da qui, no problem con contenuti TW. Si mette lx PG che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il counter non sale.
        //Presentazione.
        ~ fourthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthPurple ++
 
            -
             ~ fourthPauseTalking = fourthCharPauseDuration
            -> main            
            
            



        
=== fourth_character_opinions
~ temp charNameThree = translator(fourthCharacterState)
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {~ Bisogna sporcarsi le mani. Nelle cose. Non c’è contatto con le vita se le mani sono sempre pulite.|Le dita devono sapere di terra, come quando da bambina non avevi paura di cadere. Che cosa c’è di vivo se sono sempre pulite?}
            -> main


=== fourth_story_gift ===
~ temp charNameThree = translator(fourthCharacterState)
<i> Stai per donare qualcosa a {charNameThree}.</i>
        + {findedGifts != ()} [Scelgo il dono.]
            ~ currentReceiver += FourthCharacter
            -> inventory_management -> ink_outcome 
        + {findedGifts == ()} <i> Il tuo inventario è vuoto.</i>
            ->main
        
    
        = ink_outcome    
            <i>Dopo il tuo dono {inkTranslator(fourthCharacterInkLevel)}.
                ~ move_entity(fourthCharPaint, Bedroom)
                ~ saturationVar ++
                 -> talk_with_fourth_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

=== fourth_story_chech_trigger
      ~ temp charNameThree = translator(fourthCharacterState)
      //In questa storia non ci sono trigger, lascio la struttura perché non si sa mai.
      
        //{
        //- loneliness == false:
        //    -> loneliness_trigger
        //- else:
        //    -> main_story_first_character
        //}
            -> main_story_fourth_character
        
        = loneliness_trigger
        Info
            * [Voglio comunque approfondire la storia di questa personaggia.]
                -> main_story_fourth_character
            * [Salto.]
            //FUTURA SOLUZIONE A QUESTA SITUAZIONE
                -> main
        -
        -> END

=== main_story_fourth_character
~ temp charNameThree = translator(fourthCharacterState)
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
    ~ temp charNameThree = translator(fourthCharacterState)
        Ho realizzato una cosa, una cosa su noi due.
            -> fourthAffinityCalc ->
        {
        - firstPurple && firstYellow > firstBlue: Sento ancora la mancanza di Talco, ma con te mi sento come se fossimo parte da sempre della stessa band.
        <i>{charNameThree} vede {name} come una persona amica e fidata.</i>
        
        -firstPurple or firstYellow > firstBlue:Ci sono momenti in cui cantiamo all'unisono, ed è bello. Mi sento ascoltata.
        
        <i>{charNameThree} si trova bene con {name}.</i>
        
        - firstPurple && firstYellow < firstBlue: Facciamo parte di due cori diversi, vero? Non credo tu abbia preso una sola delle mie note.
        
        <i>{charNameThree} non si è sentita capita da {name}.</i>
        
        
        - else: A volte siamo sullo stesso brano, altre no. E non ho ancora capito chi tra noi stia ignorando l'altra parte.
        
        <i>{charNameThree} non riesce a capire che rapporto sta costruendo con {name}.</i>
        
        }
        E credo di aver capito perché il mio nome
            
            + [Credo di sapere come aiutarti.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameThree = translator(fourthCharacterState)
        <i>A seguito del rapporto che {name} ha creato con {charNameThree} {firstPurple && firstYellow > firstBlue: l'inchiostro è aumentato di due unità.|{firstPurple or firstYellow > firstBlue: l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.</i>
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(fourthCharacterInkLevel)
        + [Voglio cominciare la riscrittura.]
            -> fourthNaming -> 
            -> one
        + [Preferisco prendermi del tempo.]
            -> main

    = one
    ~ temp charNameThree = translator(fourthCharacterState)
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
        - fourthCharacterInkLevel == Empty:
            -> ending
        - else: 
            -> three
        }        
        
    = two
    ~ temp charNameThree = translator(fourthCharacterState)

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
        - fourthCharacterInkLevel == Low:
            -> ending
        - else: 
            -> three
        }
        
    = three
    ~ temp charNameThree = translator(fourthCharacterState)
            
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

        {
        - firstCharacterInkLevel == Normal:
            -> ending
        - else: 
            -> four
        }
    
    = four
    ~ temp charNameThree = translator(fourthCharacterState)

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
    ~ temp charNameThree = translator(fourthCharacterState)
     Per questo ti dico...
        + {fourthRed > 0} [Prendi una strada e se non ti piace cambiala!]
        
        + {fourthPurple > 0} [Dai alla tua vita uno scopo più grande.]
        
        + {fourthYellow > 0} [Ogni gioco richiede una pausa, e tu hai bisogno di ascoltarti.]
                
        + {fourthGreen > 0} [Non deluderai i tuoi amici: loro saranno sempre con te.]
                
        + {fourthBlue > 0} [Questa non è la tua strada. Succede. Ora puoi cambiare.]
                
        
                
        -     
        
    Grazie, {name}.
    Mentre parlavi mi è nata una nuova canzone in testa.
    Qualcosa di fresco, di pronto a cambiare.
    La canzone del mio vero nome.

        {
            - firstCharacterPossibleStates has Chitarra:
                Che <b>resterà Chitarra</b>, perché l'unica cosa che posso fare, è far sì che altr3 scelgano per me.
            
            - firstCharacterPossibleStates has Triangolo:
                E il mio vero nome è <b>Triangolo</b>, perché pensavo di essere uno strumento, e invece ho solo fallito.
                    ~ fourthCharacterState = ()
                    ~ fourthCharacterState += Triangolo
            
            - firstCharacterPossibleStates has RagazzaOrchestra:
                Mi chiamerò <b>Ragazza Orchestra</b>: nel non saper Chitarrare sono diventata l'ornitorinco della musica.
                    ~ fourthCharacterState = ()
                    ~ fourthCharacterState += RagazzaOrchestra
            
            - firstCharacterPossibleStates has FlautoDolce:
                Il mio nome è <b>Flauto Dolce</b>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.
                    ~ fourthCharacterState = ()
                    ~ fourthCharacterState += FlautoDolce                
            
            - firstCharacterPossibleStates has Ocarina:
                Mi chiamerò <b>Ocarina</b>: perché il suo suono è gioco e festa.
                    ~ fourthCharacterState = ()
                    ~ fourthCharacterState += Ocarina
            
            - firstCharacterPossibleStates has Violino:
                Io sono <b>Violino</b>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.
                    ~ fourthCharacterState = ()
                    ~ fourthCharacterState += Violino
        }
        
            
        
        {
        - fourthCharacterSpecialEvent == true:
            -> secret_ending
        - else:
            -> exit
        }
        
        ~ growing ++   
        ~ bookBGVariations ++
        
    
    = secret_ending
    ~ temp charNameThree = translator(fourthCharacterState)
        C'è una cosa che vorrei dirti, {name}.
        Riguarda Il mentore.

            ~ fourthStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(fourthStoryPG)
                -> main
            
    = exit
    ~ temp charNameThree = translator(fourthCharacterState)
        Credo rimarrò ancora in giro per un poco, in attesa del prossimo bus.
            ~ fourthStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(fourthStoryPG)
        -> main  
    
=== fourth_char_story_ended
~ temp charNameThree = translator(fourthCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - fourthCharEndingDialogue < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {~ Mi chiedo se le cose sarebbero andate diversamente, se Talco fosse arrivatə qui con me.|Sono sicura di aver visto un'altra persona alla fermata del bus, ma quando ho cercato di raggiungerla è scomparsa.|Ogni tanto te la prendi una pausa da questo posto, vero?|Sapevi che a volte c'è una rana nello stagno che circonda la serra?}
                ~ fourthCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameThree = translator(fourthCharacterState)
        {name}, per me è arrivato il momento di tornare a casa.
        {firstCharacterPossibleStates hasnt Chitarra: Non so di preciso cosa mi accadrà ora, ma in un certo senso so che sono più pronta.}
        {firstCharacterPossibleStates hasnt Chitarra: Grazie per quello che hai fatto, davvero.}
        {firstCharacterPossibleStates has Chitarra: Vedremo cosa mi accadrà.}
            ~ move_entity(FourthCharacter, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            {
                - fourthCharacterPossibleStates hasnt Chitarra:
                    ~ move_entity(FourthCharacterNotes, TrainStop)
            }    
            
        -> main



