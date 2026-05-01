=== fourth_character ===
~ temp charNameThree = translator(fourthChar_ActualName)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(FourthCharacter, PG) && fourthChar_storyStatus == story_storyStarted}[FourthCharacter]
            -> talk_with_fourth_character
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(FourthCharacter, PG) && fourthChar_storyStatus == story_storyEnded} [FourthCharacter]
            -> fourth_char_story_ended
        + ->
    
        -> DONE
    

=== talk_with_fourth_character ===
~ temp charNameThree = translator(fourthChar_ActualName)

   {//Se prima chiacchierata
        - not knowing_fourth_character.one:
            -> knowing_fourth_character.one
    //Se prima chiacchierata fatta e passato abbastanza tempo dalla pausa prevista        
        - fourthChar_pauseTalking == 0:
            -> hub
    //Altre opzioni        
        - else:
            {~ Ho bisogno di tempo per me.|Ti spiace tornare tra un po'?|Credo di aver bisogno di silenzio, torna più tardi.}
        -> main
    }

= hub
~ temp charNameThree = translator(fourthChar_ActualName)

    {charTag(FourthCharacter, "neutral")}:      {~ Ero sicura di aver visto una farfalla.|Non male questo posto, anche se casa mi manca.|Non son sicura di star capendo tutto di questo luogo.}
            + [Ti va di raccontarmi qualcosa di te?]
                -> knowing_fourth_character
                
    
            //Se non ho ancora fatto e ho parlato abbastanza con lui
            + {fourthChar_storyletsForRewritingCount > firstChar_minStoryletsForRewriting && backpack_findedGifts != ()} [Ti vorrei donare questa cosa.]
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
~ temp charNameThree = translator(fourthChar_ActualName)
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
    ~ temp charNameThree = translator(fourthChar_ActualName)
    //Non mettere cose TW qui
        //Presentazione.
        ~ fourthChar_storyletsForRewritingCount ++
        
        ???: Non è che hai visto passare di qui una persona?
            + (threeBlue) [Dammi dettagli più concreti.]
                    ~ fourthChar_air ++
                
            + (threeYellow) [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthChar_earth ++
                
            + (threeRed) [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthChar_fire ++

                
            + (threeGreen) [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthChar_water ++
  
                
            + (threePurple) [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthChar_aether ++
 
            -
        ???: Ma che rinco che sono, non mi sono manco presentata: io sono {charNameThree}.
        No, io sono <b>{charNameThree}</b>.
    	    + {name_choice} [Mi chiamo {player_name}.]
    	    + [Il mio nome è...]
    	        -> name_choice ->
    	    -
    	E con che pronomi vuoi che ti chiami?
    	        -> gender ->
    	Grandioso, io uso i femminili.      
             ~ fourthChar_pauseTalking = fourthChar_pauseDuration
            -> main
    
    = two
    ~ temp charNameThree = translator(fourthChar_ActualName)
    //Non mettere cose TW qui
        //Presentazione.
        ~ fourthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthChar_air ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthChar_earth ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthChar_fire ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthChar_water ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthChar_aether ++
 
            -
             ~ fourthChar_pauseTalking = fourthChar_pauseDuration
            -> main


    
    = three
    ~ temp charNameThree = translator(fourthChar_ActualName)
    //Non mettere cose TW qui
        //Presentazione.
        ~ fourthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthChar_air ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthChar_earth ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthChar_fire ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthChar_water ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthChar_aether ++
 
            -
             ~ fourthChar_pauseTalking = fourthChar_pauseDuration
            -> main

    
    = four
    ~ temp charNameThree = translator(fourthChar_ActualName)
    //Non mettere cose TW qui
        //Presentazione.
        ~ fourthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthChar_air ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthChar_earth ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthChar_fire ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthChar_water ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthChar_aether ++
 
            -
             ~ fourthChar_pauseTalking = fourthChar_pauseDuration
            -> main
    = five
    ~ temp charNameThree = translator(fourthChar_ActualName)
    //Non mettere cose TW qui
        //Presentazione.
        ~ fourthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthChar_air ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthChar_earth ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthChar_fire ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthChar_water ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthChar_aether ++
 
            -
             ~ fourthChar_pauseTalking = fourthChar_pauseDuration
            -> main
    
    
    = six
    ~ temp charNameThree = translator(fourthChar_ActualName)
    //Non mettere cose TW qui
        //Presentazione.
        ~ fourthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthChar_air ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthChar_earth ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthChar_fire ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthChar_water ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthChar_aether ++
 
            -
             ~ fourthChar_pauseTalking = fourthChar_pauseDuration
            -> main
    = seven
    ~ temp charNameThree = translator(fourthChar_ActualName)
    //Non mettere cose TW qui
        //Presentazione.
        ~ fourthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthChar_air ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthChar_earth ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthChar_fire ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthChar_water ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthChar_aether ++
 
            -
             ~ fourthChar_pauseTalking = fourthChar_pauseDuration
            -> main        
            
            
    = eight
        //Da qui, no problem con contenuti TW. Si mette lx PG che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il greenhouse_questionsCounter non sale.
    ~ temp charNameThree = translator(fourthChar_ActualName)
    
        //Presentazione.
        ~ fourthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthChar_air ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthChar_earth ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthChar_fire ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthChar_water ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthChar_aether ++
 
            -
             ~ fourthChar_pauseTalking = fourthChar_pauseDuration
            -> main    
    
    
    = nine
    ~ temp charNameThree = translator(fourthChar_ActualName)
    //Da qui, no problem con contenuti TW. Si mette lx PG che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il greenhouse_questionsCounter non sale.
        //Presentazione.
        ~ fourthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthChar_air ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthChar_earth ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthChar_fire ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthChar_water ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthChar_aether ++
 
            -
             ~ fourthChar_pauseTalking = fourthChar_pauseDuration
            -> main    
    
    = ten
    ~ temp charNameThree = translator(fourthChar_ActualName)
    //Da qui, no problem con contenuti TW. Si mette lx PG che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il greenhouse_questionsCounter non sale.
        //Presentazione.
        ~ fourthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthChar_air ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthChar_earth ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthChar_fire ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthChar_water ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthChar_aether ++
 
            -
             ~ fourthChar_pauseTalking = fourthChar_pauseDuration
            -> main    
    
    = eleven
    ~ temp charNameThree = translator(fourthChar_ActualName)
    //Da qui, no problem con contenuti TW. Si mette lx PG che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il greenhouse_questionsCounter non sale.
        //Presentazione.
        ~ fourthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthChar_air ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthChar_earth ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthChar_fire ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthChar_water ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthChar_aether ++
 
            -
             ~ fourthChar_pauseTalking = fourthChar_pauseDuration
            -> main    
    = twelve
    ~ temp charNameThree = translator(fourthChar_ActualName)
    //Da qui, no problem con contenuti TW. Si mette lx PG che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il greenhouse_questionsCounter non sale.
        //Presentazione.
        ~ fourthChar_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fourthChar_air ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fourthChar_earth ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fourthChar_fire ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fourthChar_water ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fourthChar_aether ++
 
            -
             ~ fourthChar_pauseTalking = fourthChar_pauseDuration
            -> main            
            
            



        
=== fourth_character_opinions
~ temp charNameThree = translator(fourthChar_ActualName)
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {~ Bisogna sporcarsi le mani. Nelle cose. Non c’è contatto con le vita se le mani sono sempre pulite.|Le dita devono sapere di terra, come quando da bambina non avevi paura di cadere. Che cosa c’è di vivo se sono sempre pulite?}
            -> main


=== fourth_story_gift ===
~ temp charNameThree = translator(fourthChar_ActualName)
Stai per donare qualcosa a {charNameThree}.
        + {backpack_findedGifts != ()} [Scelgo il dono.]
            // ~ gift_currentReceiver += FourthCharacter
            // -> backpack_management -> ink_outcome 
        + {backpack_findedGifts == ()} Il tuo inventario è vuoto.
        -
            ->main
        
    
        = ink_outcome    
            Dopo il tuo dono {inkTranslator(FourthCharacter)}.
                
                 -> talk_with_fourth_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

=== fourth_story_chech_trigger
      ~ temp charNameThree = translator(fourthChar_ActualName)
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
~ temp charNameThree = translator(fourthChar_ActualName)
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
    ~ temp charNameThree = translator(fourthChar_ActualName)
        Ho realizzato una cosa, una cosa su noi due.
            -> fourthAffinityCalc ->
        {
        - firstChar_aether && firstChar_earth > firstChar_air: Sento ancora la mancanza di Talco, ma con te mi sento come se fossimo parte da sempre della stessa band.
        {charNameThree} vede {player_name} come una persona amica e fidata.
        
        -firstChar_aether or firstChar_earth > firstChar_air:Ci sono momenti in cui cantiamo all'unisono, ed è bello. Mi sento ascoltata.
        
        {charNameThree} si trova bene con {player_name}.
        
        - firstChar_aether && firstChar_earth < firstChar_air: Facciamo parte di due cori diversi, vero? Non credo tu abbia preso una sola delle mie note.
        
        {charNameThree} non si è sentita capita da {player_name}.
        
        
        - else: A volte siamo sullo stesso brano, altre no. E non ho ancora capito chi tra noi stia ignorando l'altra parte.
        
        {charNameThree} non riesce a capire che rapporto sta costruendo con {player_name}.
        
        }
        E credo di aver capito perché il mio nome
            
            + [Credo di sapere come aiutarti.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameThree = translator(fourthChar_ActualName)
        <i>A seguito del rapporto che {player_name} ha creato con {charNameThree} {firstChar_aether && firstChar_earth > firstChar_air: l'inchiostro è aumentato di due unità.|{firstChar_aether or firstChar_earth > firstChar_air: l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.</i>
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(fourthChar_InkLevel)
        + [Voglio cominciare la riscrittura.]
            -> fourthNaming -> 
            -> one
        + [Preferisco prendermi del tempo.]
            -> main

    = one
    ~ temp charNameThree = translator(fourthChar_ActualName)
    {player_name}: Prima hai detto che hai il terrore di fare una scelta.
        
        + [Qui hai accettato il tuo nuovo nome.]
            {player_name}: E ammettere una propria paura, una scelta enorme.
                {
	                - firstChar_possibleStates hasnt Violino:
		                ~ firstChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }            
        
        + [Eppure hai deciso di costruire una famiglia con l3 tu3 amic3.]
  
        
        + [Dimenticando che per finire gli studi hai lottato per anni.]
     
            
        + [Ma hai più volte accettato il rischio di suonare sul]
                {
	                - firstChar_possibleStates hasnt Violino:
		                ~ firstChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }
        + [Però da che sei qui hai esplorato tutto questo luogo.]
           
                {
                	- firstChar_possibleStates hasnt Chitarra:
    		            ~ firstChar_possibleStates --
    		           {debug_changeName: Diminuisco lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }
            
        -
 
        {
        - fourthChar_InkLevel == ink_empty:
            -> ending
        - else: 
            -> three
        }        
        
    = two
    ~ temp charNameThree = translator(fourthChar_ActualName)

        + [Con Talco puoi litigare, eppure siete legatissim3.]
            {player_name}: Pensi davvero che ti accuserebbe di tradimento solo perché hai deciso di decidere per te stessa?
            {player_name}: Il Talco che hai raccontato si arrabbierebbe di più se tu facessi una scelta per te pensando a ləi.
            
                    
        + [La paura di tradire è un'altra faccia dell'ego.]
                {
	                - firstChar_possibleStates hasnt Violino:
		                ~ firstChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }
    
            
        + [Il tuo cuore si preoccupa molto di loro, e poco di te.]
   
            
        + [Forse accadrà, ma non è un tuo problema.]
 
                {
                	- firstChar_possibleStates hasnt Chitarra:
    		            ~ firstChar_possibleStates --
    		           {debug_changeName: Diminuisco lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }
                
        + [Tradiamo la fiducia rompendo le regole a nostro vantaggio.]
 
                {
	                - firstChar_possibleStates hasnt Violino:
		                ~ firstChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }
                    
        -
        {
        - fourthChar_InkLevel == ink_low:
            -> ending
        - else: 
            -> three
        }
        
    = three
    ~ temp charNameThree = translator(fourthChar_ActualName)
            
        + [Se non tiri nessun dado, non c'è storia da far avanzare.]
         
                {
	                - firstChar_possibleStates hasnt Violino:
		                ~ firstChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }
        
        + [Ma ogni persona ha immaginato sorti diverse per Jonah.]
                {
                	- firstChar_possibleStates hasnt Chitarra:
    		            ~ firstChar_possibleStates --
    		           {debug_changeName: Diminuisco lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }
                
        + [Eppure la prima cosa che hai visto qui sono otto sentieri.]
 
                {
	                - firstChar_possibleStates hasnt Violino:
		                ~ firstChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }
            
        
        + [La storia di Jonah è un successo.]

                
        + [Ragioni come se fossi sola se dovessi cadere.]
     
        -

        {
        - firstChar_InkLevel == ink_normal:
            -> ending
        - else: 
            -> four
        }
    
    = four
    ~ temp charNameThree = translator(fourthChar_ActualName)

        + [Giocare è bello perché puoi sempre Chitarrare a farlo.]

                {
	                - firstChar_possibleStates hasnt Violino:
		                ~ firstChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }            
         
        
        + [Quando Anna ha Chitarrato all'ex, ha scoperto la sicurezza.]

        
        + [Un infinito più piccolo resta comunque infinito.]

                {
	                - firstChar_possibleStates hasnt Violino:
		                ~ firstChar_possibleStates ++
	                    {debug_changeName: Aumento lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }    
            
        + [Chitarrando a cercare Talco ti sei tutelata.]
 
                {
                	- firstChar_possibleStates hasnt Chitarra:
    		            ~ firstChar_possibleStates --
    		           {debug_changeName: Diminuisco lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                }            
        
        + [C'è più coraggio nella Chitarra che nel compromesso.]
 
            
        -
        
        -> ending

    = ending
    ~ temp charNameThree = translator(fourthChar_ActualName)
     Per questo ti dico...
        + {fourthChar_fire > 0} [Prendi una strada e se non ti piace cambiala!]
        
        + {fourthChar_aether > 0} [Dai alla tua vita uno scopo più grande.]
        
        + {fourthChar_earth > 0} [Ogni gioco richiede una pausa, e tu hai bisogno di ascoltarti.]
                
        + {fourthChar_water > 0} [Non deluderai i tuoi amici: loro saranno sempre con te.]
                
        + {fourthChar_air > 0} [Questa non è la tua strada. Succede. Ora puoi cambiare.]
                
        
                
        -     
        
    Grazie, {player_name}.
    Mentre parlavi mi è nata una nuova canzone in testa.
    Qualcosa di fresco, di pronto a cambiare.
    La canzone del mio vero nome.

        {
            - firstChar_possibleStates has Chitarra:
                Che <b>resterà Chitarra</b>, perché l'unica cosa che posso fare, è far sì che altr3 scelgano per me.
            
            - firstChar_possibleStates has Triangolo:
                E il mio vero nome è <b>Triangolo</b>, perché pensavo di essere uno strumento, e invece ho solo fallito.
                    ~ fourthChar_ActualName = ()
                    ~ fourthChar_ActualName += Triangolo
            
            - firstChar_possibleStates has Orchestra:
                Mi chiamerò <b>Orchestra</b>: nel non saper Chitarrare sono diventata l'ornitorinco della musica.
                    ~ fourthChar_ActualName = ()
                    ~ fourthChar_ActualName += Orchestra
            
            - firstChar_possibleStates has FlautoDolce:
                Il mio nome è <b>Flauto Dolce</b>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.
                    ~ fourthChar_ActualName = ()
                    ~ fourthChar_ActualName += FlautoDolce                
            
            - firstChar_possibleStates has Ocarina:
                Mi chiamerò <b>Ocarina</b>: perché il suo suono è gioco e festa.
                    ~ fourthChar_ActualName = ()
                    ~ fourthChar_ActualName += Ocarina
            
            - firstChar_possibleStates has Violino:
                Io sono <b>Violino</b>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.
                    ~ fourthChar_ActualName = ()
                    ~ fourthChar_ActualName += Violino
        }
        
            
        
        {
        - fourthChar_specialEvent == true:
            -> secret_ending
        - else:
            -> exit
        }
        

    
    = secret_ending
    ~ temp charNameThree = translator(fourthChar_ActualName)
        C'è una cosa che vorrei dirti, {player_name}.
        Riguarda Il mentore.
        -> close
            
    = exit
    ~ temp charNameThree = translator(fourthChar_ActualName)
        Credo rimarrò ancora in giro per un poco, in attesa del prossimo bus.
        -> close  
    
    = close
            ~ fourthChar_storyStatus = story_storyEnded
            ~ story_endedStories += story_fourthCharStoryEnded
            ~ fourthChar_InkLevel = ink_empty
            ~ player_movementsCounter = 0
            ~ numberQuestion = 0
            ~ state_ending_stories(FourthCharacter)
        -> main
    
    
=== fourth_char_story_ended
~ temp charNameThree = translator(fourthChar_ActualName)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - fourthChar_exitCounter < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {~ Mi chiedo se le cose sarebbero andate diversamente, se Talco fosse arrivatə qui con me.|Sono sicura di aver visto un'altra persona alla fermata del bus, ma quando ho cercato di raggiungerla è scomparsa.|Ogni tanto te la prendi una pausa da questo posto, vero?|Sapevi che a volte c'è una rana nello stagno che circonda la serra?}
                ~ fourthChar_exitCounter ++
        -> main
        
        = goodbye
        ~ temp charNameThree = translator(fourthChar_ActualName)
        ~ move_entity(fourthCharPaint, Bedroom)

        {player_name}, per me è arrivato il momento di tornare a casa.
        {firstChar_possibleStates hasnt Chitarra: Non so di preciso cosa mi accadrà ora, ma in un certo senso so che sono più pronta.}
        {firstChar_possibleStates hasnt Chitarra: Grazie per quello che hai fatto, davvero.}
        {firstChar_possibleStates has Chitarra: Vedremo cosa mi accadrà.}
            ~ move_entity(FourthCharacter, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            {
                - fourthChar_possibleStates hasnt Chitarra:
                    ~ move_entity(DoggoFourthLetters, TrainStop)
            }    
            
        -> main



