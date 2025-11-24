=== rewriting_proposal_first_character
~ temp charNameOne = translator(firstChar_ActualName)
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - not confession:
            -> confession
            
        - else:
            -> rewriting
            
    }
    
    = confession
        //Per il feedback, temi legati al rapporto, all'amicizia
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)

    
            + [<i>Voglio cominciare la riscrittura.]
                -> rewriting
            
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = rewriting
    ~ temp charNameOne = translator(firstChar_ActualName)
            //Valuto lo stato della relazione 
                -> firstAffinityCalc ->
            
            //Vado a svuotare i contatori di colore, così son tranquilla.
                -> storage_colors(FirstCharacter) ->
            
            //E poi a seconda dello stato di inchiostro, mi sposto sulla domanda prevista    
                {
                    - firstChar_InkLevel == ink_empty:
                        -> ending
                    - else: 
                        -> one
                } 


        = one
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
    
        {
            -   are_two_entities_together(Mentor, PG): Bene, è il momento che mi allontani.#speaker:{mentor_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
                    ~ change_entity_place(Mentor)
        }
        {
            -   are_two_entities_together(SecondCharacter, PG): {charNameTwo}, avremmo bisogno di privacy, puoi andare a fare due passi?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                    ~ change_entity_place(SecondCharacter)
        }
        
        Sono pronta, {player_name}. Iniziamo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        
        
        Ti aspettavi concerti e viaggi nel mondo.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        Ci sono cose a cui hai rinunciato.
        //pensa a ciò che puoi avere
            
            + [L'hai detto anche tu: non si può avere tutto.]
                -> color_variation_management(FirstCharacter, blueC)->
              
                  
            + [Ma per la prima volta hai una relazione romantica.]
                -> color_variation_management(FirstCharacter, greenC)->
               
            
            + [Ma hai trovato la lotta, la voglia di cambiare le cose.]
                -> color_variation_management(FirstCharacter, redC)->
                
                
            + [Puoi sempre viaggiare da Talco, ricominciare.]
                -> color_variation_management(FirstCharacter, yellowC)->
               
            
            + [Hai detto che quando rinunci a te creando, trovi tutto.]
                -> color_variation_management(FirstCharacter, purpleC)->
               
    
            -
                ~ numberQuestion ++   
            
            Capito. Continua.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            {
                - secondChar_storyStatus!=story_storyEnded:{player_name} ha utilizzato la sua prima unità di inchiostro per compiere una riscrittura. L'inchiostro ora si è consumato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }
            
            
                    {
                    - firstChar_InkLevel == ink_low:
                        -> ending
                    - else: 
                        -> two
                    }        
            
        = two
        ~ temp charNameOne = translator(firstChar_ActualName)
        Ti aspettavi amicizie eterne e case in campagna e un amore da film.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
       
    
            + [I sogni si trasformano, ma Talco ancora ti aspetta.]
                -> color_variation_management(FirstCharacter, redC)->
               
            + [Hai già una casa: La Rifugia e le tue coinquiline.]
                -> color_variation_management(FirstCharacter, purpleC)->
               
            + [Hai un innamorato che ti ha chiesto di convivere.]
                -> color_variation_management(FirstCharacter, greenC)->
                
            + [Essere persone adulte significa sopravvivere alle proprie aspettative.]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Hai un padre con cui suonare e ubriacarti.]
                -> color_variation_management(FirstCharacter, yellowC)->
               
            -
                ~ numberQuestion ++
            Ti ascolto. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            {
                - secondChar_storyStatus!=story_storyEnded:{player_name} ha utilizzato la sua seconda unità di inchiostro per procedere con la riscrittura. Il boccetto ora è vuoto.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }        
            
            {
            - firstChar_InkLevel == ink_normal:
                -> ending
            - else:
                -> three
            }
            
        
        = three
        ~ temp charNameOne = translator(firstChar_ActualName)
        Ti aspettavi di fare qualcosa di buono, di salvare il mondo con le tue canzoni.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        
                
            + [Talco ti ha insegnato a rompere le regole.]
                Il mondo è duro da cambiare, ma l'esempio è una gran cosa.
                Rompere le aspettative, l'ovvio, è rivoluzionario.
                -> color_variation_management(FirstCharacter, yellowC)->
              
            
            + [Ma nessunə salva il mondo da solə, {charNameOne}.]
                -> color_variation_management(FirstCharacter, blueC)->
                
                    
            + [Con La Rifugia ti sei data uno scopo più grande.]
                -> color_variation_management(FirstCharacter, purpleC)->
               
  
            + [Pensa a come stai lottando con le colleghe.]
                A quello che avete fatto contro il dirigente venuto a pranzo.
                Al tentativo di fare un sindacato.
                Hai trovato un modo di lottare anche al di fuori della musica.
                -> color_variation_management(FirstCharacter, redC)->
               
                    
            + [Ma puoi aiutare i tuoi genitori, una bontà più ristretta ma comunque enorme.]
                -> color_variation_management(FirstCharacter, greenC)->
                       
            -
                ~ numberQuestion ++
            Mmm.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            
            {
                - secondChar_storyStatus!=story_storyEnded:{player_name} ha utilizzato la terza unità di inchiostro, proponendo una riscruttura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }        
            
            {
            - firstChar_InkLevel == ink_medium:
                -> ending
            - else:
                -> four
            }
        
        = four
        ~ temp charNameOne = translator(firstChar_ActualName)
            Ti senti mediocre, e hai paura di rischiare di fare un salto e perdere tutto, di fallire.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
    
            + [Ma alla fine agisci comunque, come con le colleghe e il sindacato.]
                -> color_variation_management(FirstCharacter, yellowC)->
               
            
            + [Sei amata da molte persone: anche se cadi, non sarai sola.]
                -> color_variation_management(FirstCharacter, greenC)->
                
            
            + [La Rifugia è la prova che c'è sempre un posto da cui ripartire.]
                -> color_variation_management(FirstCharacter, purpleC)->
               
            
            + [Ennio è felice nel suo non cercare di essere speciale.]
                -> color_variation_management(FirstCharacter, blueC)->
                
            
            + [Talco ha abbracciato il rischio, parlandoti della maternità.]
                -> color_variation_management(FirstCharacter, redC)->
               
            -
                ~ numberQuestion ++
            Ok. E quindi... #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            {
                - secondChar_storyStatus!=story_storyEnded:{player_name} ha utilizzato la quarta e ultima unità di inchiostro, compiendo il massimo di riscritture possibili.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }   
            
            -> ending
    
        = ending
        ~ temp charNameOne = translator(firstChar_ActualName)
            {
                - secondChar_storyStatus != story_storyEnded:
                    {player_name} sta per utilizzare il potere dell'<b><i>epilogo</b></i>.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                - else:
                    Cosa dirà {player_name} come <b><i>epilogo</b></i>?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}   
            }  
        
            {
                - firstChar_InkLevel == ink_empty:
                    Mi rendo conto di non aver legato molto con te, e hai tutto il diritto di non ascoltarmi. Ma dopo tutta la tua storia, vorrei darti un consiglio:#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
                - else: Per questo ti dico: #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            } 
        
            Ti chiedi se questo il massimo che puoi aspettarti dalla vita. #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
    
            + (red) [Una nuova vita ti aspetta in Canada, con Talco.]
            //me ne vado all’estero da Talco.
                -> color_variation_management(FirstCharacter, redC)->
            
            + (purple) [La musica ti dà uno scopo più grande. Seguila.]
            // mollo il lavoro per la musica, per far qualcosa di buono per le altre persone.
                 -> color_variation_management(FirstCharacter, purpleC)->         
            
            + (yellow) [Puoi tornare dai tuoi e ricominciare dalla tua infanzia.]
            //torno al sud, ricomincio al sicuro.
                -> color_variation_management(FirstCharacter, yellowC)->
                
            + (green) [La stabilità di Ennio è il cambiamento di cui hai bisogno.]
            //me ne vado a vivere col moroso.
                -> color_variation_management(FirstCharacter, greenC)->
                
            + (blue) [Eppure hai una vita ricca. Goditela.]
            //trovare il bello in quello che si ha (per la gioia di Mentore).
                -> color_variation_management(FirstCharacter, blueC)->
            
                    
            - 
        //Nota: la parte di accettazione del nome è prima dell'aggiornamento, così il nome nuovo compare solo quando viene dichiarato.    
         Grazie, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Mentre ti ascoltavo mi è nata una nuova canzone in testa.
         La canzone del mio nome.
        So che hai detto <>
        {
            - ending.red: e/ma a seconda del'esito
            - ending.purple: e/ma a seconda del'esito
            - ending.yellow: e/ma a seconda del'esito
            - ending.green: e/ma a seconda del'esito
            - ending.blue: e/ma a seconda del'esito

        }
            //Prima chiamo il moltiplicatore di colori, così che comunque le scelte fatte qui abbiano un impatto maggiore.
                -> color_modifier(FirstCharacter, firstChar_colorVariation) ->
            
            //Poi aggiorniamo i colori, così il valore complessivo conta per la scelta del nome
                -> update_colors(FirstCharacter) ->     
     
            //E infine genero il nome
                -> firstNaming -> naming
                
            = naming
            ~ temp charNameOne = translator(firstChar_ActualName)
            
            {
                - firstChar_ActualName has Triangolo:
                
                     E il mio vero nome è <b><i>{charNameOne}</b></i>, perché pensavo di essere uno strumento, e invece ho solo fallito.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                        
                - firstChar_ActualName has RagazzaOrchestra:

                     Mi chiamerò <b><i>{charNameOne}</b></i>: nel non saper rinunciare sono diventata l'ornitorinco della musica.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        
                - firstChar_ActualName has FlautoDolce:

                     Il mio nome è <b><i>{charNameOne}</b></i>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                      
                - firstChar_ActualName has Ocarina:

                     Mi chiamerò <b><i>{charNameOne}</b></i>: perché il suo suono è gioco e festa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
        
                - firstChar_ActualName has Violino:

                     Io sono <b><i>{charNameOne}</b></i>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                        
            }
            
                ~ book_BGVariations ++
    
                    {
                    - firstChar_specialEvent == true:
                        -> secret_ending
                    - else:
                        -> exit
                    }
        
        
    = secret_ending
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
        C'è una cosa che devo dirti ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
        Riguarda {mentorName}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Non voglio sembrare una snitch ma continuo a chiedermi: qual è il confine tra essere una brava persona ed essere una manipolatrice?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        A me non la conta giusta quella.
        Però tra un po' mi potrò levare di culo e non è più un mio problema.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Ma se hai intenzione di restare qui a lungo, forse devi chiedertelo anche tu.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                -> close
            
    = exit
    ~ temp charNameOne = translator(firstChar_ActualName)
        Un'ultima cosa, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Volevo lasciarti qualcosa di buono di me, prima di andarmene, e ho pensato di donarti una conchiglia.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
        {
            - player_accessiblePlaces has Nest: La troverai al nido, e son sicura che saprai già cosa farne.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            - else: Una certa voce mi ha detto che presto saprai cosa farne. E te la farà trovare dove ne avrai più bisogno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        }
                //Spostiamo la conchiglia
                ~ move_entity(greenShell, Nest)
        
        E ora resterò qui a disturbarti ancora per un po', in attesa del prossimo treno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                -> close
        
    = close   
            ~ story_endedStories += story_firstCharStoryEnded
            ~ firstChar_storyStatus = story_storyEnded
            ~ player_movementsCounter = 0
            ~ PG_advance_management(FirstCharacter)
            ~ numberQuestion = 0
            ~ firstChar_InkLevel = ink_empty
            A dopo {player_name}!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral 
            E prenditi un po' di riposo, non mi schiodare!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            @animation:RewriterBook
            
        -> main  
        