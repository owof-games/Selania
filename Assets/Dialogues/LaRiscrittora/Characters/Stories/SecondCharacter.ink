=== second_character ===
~ temp charNameDue = uppercaseTranslator(secondCharacterState)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(SecondCharacter, PG) && secondStory == Active}[SecondCharacter]
            -> talk_with_second_character
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(SecondCharacter, PG) && secondStory == Ended} [SecondCharacter]
            -> second_char_story_ended
        + ->
    
        -> DONE
    

=== talk_with_second_character ===
~ temp charNameDue = uppercaseTranslator(secondCharacterState)

   {//Se prima chiacchierata
        - not knowing_second_character.one:
            -> knowing_second_character.one
    //Se prima chiacchierata fatta e passato abbastanza tempo dalla pausa prevista        
        - secondPauseTalking == 0:
            -> hub
    //Altre opzioni        
        - else:
            {charNameDue}: {~ Ho bisogno di tempo per me.|Ti spiace tornare tra un po'?|Credo di aver bisogno di silenzio, torna più tardi.}
        -> main
    }

= hub
~ temp charNameDue = uppercaseTranslator(secondCharacterState)

    {charNameDue}: {~ Ero sicura di aver visto una farfalla.|Non male questo posto, anche se casa mi manca.|Non son sicura di star capendo tutto di questo luogo.}
            + [Ti va di raccontarmi qualcosa di te?]
                -> knowing_second_character
                
    
            //Se non ho ancora fatto e ho parlato abbastanza con lui
            + {secondStoryQuestCount > minStoryQuesTCount && findedGifts != ()} [Ti vorrei donare questa cosa.]
                    -> second_story_gift
        
            //Dono fatto ma non ho avviato la main story
            + {second_story_gift.ink_outcome && not main_story_second_character} [Ti va di riscrivere la tua storia con me?]
                    -> second_story_chech_trigger
    
            //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
            + {second_story_gift.ink_outcome && main_story_second_character} [Riprendiamo quella storia?]
                -> main_story_second_character
            
            + [Lascio il dialogo.]
                -> main
            -
                -> talk_with_second_character




=== knowing_second_character
~ temp charNameDue = uppercaseTranslator(secondCharacterState)
    //Qui man mano faccio avanzare i temi toccati dalla personaggia
        {
            - not one:
                -> one
            - not two:
                -> two
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
                -> second_character_opinions
        }

    = one
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
    
        //Presentazione.
        ~ secondStoryQuestCount ++
        
        ???: Non è che hai visto passare di qui una persona?
            + (twoBlue) [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + (twoYellow) [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + (twoRed) [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + (twoGreen) [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + (twoPurple) [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
        ???: Ma che rinco che sono, non mi sono manco presentata: io sono {charNameOne}.
        {charNameDue}: No, io sono <b>{charNameOne}</b>.
        {charNameDue}: Ehi! Non è questo il mio nome.
        {charNameDue}: <i>{charNameOne}</i>.
        {charNameDue}: Forse se provo a dirlo al contrario?
        {charNameDue}: Aicnunir.
        {charNameDue}: Uh.
        {charNameDue}: Prova tu. Come ti chiami?
    	    + {name_choice} [Mi chiamo {name}.]
    	    + [Il mio nome è...]
    	        -> name_choice ->
    	    -
    	{charNameDue}: E con che pronomi vuoi che ti chiami?
    	        -> gender ->
    	{charNameDue}: Grandioso, io uso i femminili.      
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main
    = two
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
    
        //Presentazione.
        ~ secondStoryQuestCount ++
        
        {charNameDue}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main


    
    = three
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
    
        //Presentazione.
        ~ secondStoryQuestCount ++
        
        {charNameDue}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main
    
    
    
    
    = four
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
    
        //Presentazione.
        ~ secondStoryQuestCount ++
        
        {charNameDue}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main
    = five
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
    
        //Presentazione.
        ~ secondStoryQuestCount ++
        
        {charNameDue}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main
    
    
    = six
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
    
        //Presentazione.
        ~ secondStoryQuestCount ++
        
        {charNameDue}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main
    = seven
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
    
        //Presentazione.
        ~ secondStoryQuestCount ++
        
        {charNameDue}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main        
            
            
    = eight
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
    
        //Presentazione.
        ~ secondStoryQuestCount ++
        
        {charNameDue}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main    
    
    
    = nine
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
    
        //Presentazione.
        ~ secondStoryQuestCount ++
        
        {charNameDue}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main    
    
    = ten
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
    
        //Presentazione.
        ~ secondStoryQuestCount ++
        
        {charNameDue}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main    
    
    = eleven
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
    
        //Presentazione.
        ~ secondStoryQuestCount ++
        
        {charNameDue}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main    
    = twelve
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
    
        //Presentazione.
        ~ secondStoryQuestCount ++
        
        {charNameDue}: Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main            
            
            



        
=== second_character_opinions
~ temp charNameDue = uppercaseTranslator(secondCharacterState)
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {charNameDue}: {~ Bisogna sporcarsi le mani. Nelle cose. Non c’è contatto con le vita se le mani sono sempre pulite.|Le dita devono sapere di terra, come quando da bambina non avevi paura di cadere. Che cosa c’è di vivo se sono sempre pulite?}
            -> main


=== second_story_gift ===
~ temp charNameDue = uppercaseTranslator(secondCharacterState)
<i> Stai per donare qualcosa a {charNameDue}.</i>
        + {findedGifts != ()} [Scelgo il dono.]
            ~ currentReceiver += SecondCharacter
            -> inventory_management -> ink_outcome 
        + {findedGifts == ()} <i> Il tuo inventario è vuoto.</i>
            ->main
        
    
        = ink_outcome    
            <i>Dopo il tuo dono {inkTranslator(secondCharacterInkLevel)}.
                 -> talk_with_second_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

=== second_story_chech_trigger
      ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
      //In questa storia non ci sono trigger, lascio la struttura perché non si sa mai.
      
        //{
        //- loneliness == false:
        //    -> loneliness_trigger
        //- else:
        //    -> main_story_first_character
        //}
            -> main_story_second_character
        
        = loneliness_trigger
        Info
            * [Voglio comunque approfondire la storia di questa personaggia.]
                -> main_story_second_character
            * [Salto.]
            //FUTURA SOLUZIONE A QUESTA SITUAZIONE
                -> main
        -
        -> END

=== main_story_second_character
~ temp charNameDue = uppercaseTranslator(secondCharacterState)
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
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
        {charNameDue}: Ho realizzato una cosa, una cosa su noi due.
            -> secondAffinityCalc ->
        {
        - firstPurple && firstYellow > firstBlue: {charNameDue}: Sento ancora la mancanza di Talco, ma con te mi sento come se fossimo parte da sempre della stessa band.
        <i>{charNameOne} vede {name} come una persona amica e fidata.</i>
        
        -firstPurple or firstYellow > firstBlue:{charNameDue}: Ci sono momenti in cui cantiamo all'unisono, ed è bello. Mi sento ascoltata.
        
        <i>{charNameOne} si trova bene con {name}.</i>
        
        - firstPurple && firstYellow < firstBlue: {charNameDue}: Facciamo parte di due cori diversi, vero? Non credo tu abbia preso una sola delle mie note.
        
        <i>{charNameOne} non si è sentita capita da {name}.</i>
        
        
        - else: A volte siamo sullo stesso brano, altre no. E non ho ancora capito chi tra noi stia ignorando l'altra parte.
        
        <i>{charNameOne} non riesce a capire che rapporto sta costruendo con {name}.</i>
        
        }
        {charNameDue}: E credo di aver capito perché il mio nome
            
            + [Credo di sapere come aiutarti.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
        <i>A seguito del rapporto che {name} ha creato con {charNameDue} {firstPurple && firstYellow > firstBlue: l'inchiostro è aumentato di due unità.|{firstPurple or firstYellow > firstBlue: l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.</i>
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(secondCharacterInkLevel)
        + [Voglio cominciare la riscrittura.]
            -> secondNaming -> 
            -> one
        + [Preferisco prendermi del tempo.]
            -> main

    = one
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
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
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)

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
        - secondCharacterInkLevel == Low:
            -> ending
        - else: 
            -> three
        }
        
    = three
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
            
        + [Se non tiri nessun dado, non c'è storia da far avanzare.]
         
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
        
        + [Ma ogni persona ha immaginato sorti diverse per Jonah.]
                {
                	- firstCharacterPossibleStates hasnt Rinuncia:
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
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)

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
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
     Per questo ti dico...
        + {secondRed > 0} [Prendi una strada e se non ti piace cambiala!]
        
        + {secondPurple > 0} [Dai alla tua vita uno scopo più grande.]
        
        + {secondYellow > 0} [Ogni gioco richiede una pausa, e tu hai bisogno di ascoltarti.]
                
        + {secondGreen > 0} [Non deluderai i tuoi amici: loro saranno sempre con te.]
                
        + {secondBlue > 0} [Questa non è la tua strada. Succede. Ora puoi cambiare.]
                
        
                
        -     
        
    {charNameDue}: Grazie, {name}.
    {charNameDue}: Mentre parlavi mi è nata una nuova canzone in testa.
    {charNameDue}: Qualcosa di fresco, di pronto a cambiare.
    {charNameDue}: La canzone del mio vero nome.

        {
            - firstCharacterPossibleStates has Rinuncia:
                {charNameDue}: Che <b>resterà Rinuncia</b>, perché l'unica cosa che posso fare, è far sì che altr3 scelgano per me.
            
            - firstCharacterPossibleStates has Triangolo:
                {charNameDue}: E il mio vero nome è <b>Triangolo</b>, perché pensavo di essere uno strumento, e invece ho solo fallito.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Triangolo
            
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameDue}: Mi chiamerò <b>Ragazza Orchestra</b>: nel non saper rinunciare sono diventata l'ornitorinco della musica.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += RagazzaOrchestra
            
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameDue}: Il mio nome è <b>Flauto Dolce</b>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += FlautoDolce                
            
            - firstCharacterPossibleStates has Ocarina:
                {charNameDue}: Mi chiamerò <b>Ocarina</b>: perché il suo suono è gioco e festa.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Ocarina
            
            - firstCharacterPossibleStates has Violino:
                {charNameDue}: Io sono <b>Violino</b>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Violino
        }
        
            
        
        {
        - secondCharacterSpecialEvent == true:
            -> secret_ending
        - else:
            -> exit
        }
    
    
    = secret_ending
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
        {charNameDue}: C'è una cosa che vorrei dirti, {name}.
        {charNameDue}: Riguarda Il mentore.

            ~ secondStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(secondStory)
                -> main
            
    = exit
    ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
        {charNameDue}: Credo rimarrò ancora in giro per un poco, in attesa del prossimo bus.
            ~ secondStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(secondStory)
        -> main  
    
=== second_char_story_ended
~ temp charNameDue = uppercaseTranslator(secondCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - secondCharEndingDialogue < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {charNameDue}: {~ Mi chiedo se le cose sarebbero andate diversamente, se Talco fosse arrivatə qui con me.|Sono sicura di aver visto un'altra persona alla fermata del bus, ma quando ho cercato di raggiungerla è scomparsa.|Ogni tanto te la prendi una pausa da questo posto, vero?|Sapevi che a volte c'è una rana nello stagno che circonda la serra?}
                ~ secondCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameDue = uppercaseTranslator(secondCharacterState)
        {charNameDue}: {name}, per me è arrivato il momento di tornare a casa.
        {firstCharacterPossibleStates hasnt Rinuncia: {charNameDue}: Non so di preciso cosa mi accadrà ora, ma in un certo senso so che sono più pronta.}
        {firstCharacterPossibleStates hasnt Rinuncia: {charNameDue}: Grazie per quello che hai fatto, davvero.}
        {firstCharacterPossibleStates has Rinuncia: {charNameDue}: Vedremo cosa mi accadrà.}
            ~ move_entity(SecondCharacter, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            {
                - secondCharacterPossibleStates hasnt Rinuncia:
                    ~ move_entity(SecondCharacterNotes, BusStop)
            }    
            
        -> main

















    
