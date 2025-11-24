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
            -   are_two_entities_together(Mentor, PG): Vi lascio un po' di privacy. In bocca al lupo {player_name} e {charNameOne}.#speaker:{mentor_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
                    ~ change_entity_place(Mentor)
        }
        {
            -   are_two_entities_together(SecondCharacter, PG):
                {charNameTwo}, potresti lasciarci un po' da sol3?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                Certissimamente! A dopo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                    ~ change_entity_place(SecondCharacter)
        }
        
        Bene, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Direi che dopo tutti i pipponi che ti ho tirato, è giunto il momento di fare questa roba.
        Chissà cosa accadrà!
        
        
        {charNameOne}, prima hai detto che ti aspettavi concerti e viaggi nel mondo.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        Ma che ora sei mediocre e hai un lavoro di merda.
        Però possiamo raccontare la tua storia in un altro modo.
        Tu dici che sei un <b>concentrato di rinunce</b>.

            + [Ma l'hai detto anche tu: non si può avere tutto.]
                -> color_variation_management(FirstCharacter, blueC)->
                Non è rinuncia quindi: è accogliere la vita adulta.
                E imparare come compiere delle scelte, dove andare.
              {
                - first_char_main_storylets.eleven:
                    Ad esempio, sai già che non vuoi stare da sola.
                    E puoi costruire le tue prossime scelte partendo da questo.
                }

            + [Però per la prima volta sei innamorata, innamorata davvero.]
                -> color_variation_management(FirstCharacter, greenC)->
                Ti sei chiesta se Ennio non sia la tua casa, il tuo rifugio.
                Non hai certo rinunciato all'amore.
               {first_char_main_storylets.ten: Un amore che hai detto essere come pane appena sfornato.}
            
            + [Però hai abbracciato la lotta, la voglia di cambiare le cose.]
                -> color_variation_management(FirstCharacter, redC)->
                Con le tue colleghe sul lavoro.
                Con La Rifugia.
                L'hai detto prima: è stato bello dire "no".
                Alcune rinuncie ti hanno resa potente.
                
            + [Puoi sempre viaggiare da Talco, ricominciare.]
                -> color_variation_management(FirstCharacter, yellowC)->
                La cartolina è una porta aperta: Talco ti attende.
               {
                - first_char_main_storylets.eleven: 
                E ti ha già detto in passato che una buona relazione è una relazione scomoda.
                Non aver paura del conflitto che avete avuto: l'amore è ancora lì, o non ti avrebbe mai riscritto.
               }
            
            + [Hai detto che quando rinunci a te creando, trovi tutto.]
                -> color_variation_management(FirstCharacter, purpleC)->
                E anche se ti incasina scrivere di politica, stai cercando nella musica un modo per cambiare le cose.
                A volte forse rinunciare è utile per andare avanti.
            -
                ~ numberQuestion ++   
            
            Io.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            Sì, forse la rinuncia mi spaventa un sacco.
            Ma forse ora un po' meno.
            
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

        È evidente quanto siano importanti le relazioni per te.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        E a un certo punto hai iniziato ad aspettarti amicizie eterne, case in campagna e un amore da film.
        Eppure...
       
            + [I sogni si trasformano, ma Talco ancora ti aspetta in Canada.]
                -> color_variation_management(FirstCharacter, redC)->
                Pensavi Ennio fosse noioso, e te ne sei innamorata.
                La vita ci sorprende sempre quando si tratta di relazioni.
               
            + [Hai già una casa: La Rifugia e le tue coinquiline.]
                -> color_variation_management(FirstCharacter, purpleC)->
                Le tue relazioni creano cose che rimangono, anche se le relazioni stesse dovessero finire.
                Con le persone che ami sei trasformazione.
                
            + [Hai un innamorato che ti ha chiesto di convivere.]
                -> color_variation_management(FirstCharacter, greenC)->
                Un innamorato che ti fa sentire solida.
                Con cui hai potuto svolazzare, conoscerti al meglio.
                {first_char_main_storylets.ten: Con cui puoi stare piacevolmente in silenzio.}
                
            + [Essere persone adulte significa sopravvivere alle proprie aspettative.]
                -> color_variation_management(FirstCharacter, blueC)->
               Ma non è una sconfitta.
               {
                - first_char_main_storylets.twelve:
                    Pensa alla maturità con cui hai parlato dell'invidia che provi.
                    Anche da una cosa dolorosa come il tradire le proprie aspettative, tu hai trovato un modo per crescere.
                }
            
            + [Hai un padre con cui suonare e ubriacarti.]
                -> color_variation_management(FirstCharacter, yellowC)->
                I tuoi genitori hanno fatto enormi sacrifici per permetterti di studiare.
                Palese che ti vogliono un bene immenso.
               {
                - first_char_main_storylets.twelve:
                    Anceh se confondono la tua insicurezza con pretenziosità.
                }
            -
                ~ numberQuestion ++
            
            Sì, forse sono un po' una cozzetta. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            E sono felice solo se sono con le persone a cui voglio bene.
            
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
        Più volte hai parlato del tuo bisogno di fare qualcosa di utile, di grande. #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        Ti aspettavi di fare qualcosa di buono, di salvare il mondo con le tue canzoni.
        

            + [Talco ti ha insegnato a rompere le regole.]
                -> color_variation_management(FirstCharacter, yellowC)->
                Il mondo è duro da cambiare, ma l'esempio è una gran cosa.
                Rompere le aspettative, l'ovvio, è rivoluzionario.

            + [Ma nessunə salva il mondo da solə, {charNameOne}.]
                -> color_variation_management(FirstCharacter, blueC)->
                È inevitabile, ma non è un fallimento.
                {
                    - first_char_main_storylets.twelve:
                        Piuttosto, è un bene.
                        Così, assieme, evitiamo che le invidie e le insicurezze rendano le nostre lotte fragili.
                }
            
            + [Con La Rifugia ti sei data uno scopo più grande.]
                -> color_variation_management(FirstCharacter, purpleC)->
               E anche le tue amiche che sono tornate nei paesini, hanno fatto grandi cose.

            + [Con le tue colleghe stai portando la lotta grande in qualcosa di piccolo.]
                -> color_variation_management(FirstCharacter, redC)->
                Pensa a quello che avete fatto contro il dirigente venuto a pranzo.
                Al tentativo di fare un sindacato.
                Hai trovato un modo di lottare anche senza la musica.
                
                    
            + [Ma il cambiamento parte anche dalla casa. Ad esempio aiutando i tuoi genitori.]
                -> color_variation_management(FirstCharacter, greenC)->
        
            -
                ~ numberQuestion ++
            
            Credo di capire.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            
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
    
            + [Come nei giochi, si può sbagliare e ricominciare.]
                -> color_variation_management(FirstCharacter, yellowC)->
                Lo dice Ennio quando gioca.
                L'hai visto quando Talco ha mollato il Conservatorio, eppure si è fattə la sua vita.
                
            
            + [Sei amata da molte persone: anche se cadi, non sarai sola.]
                -> color_variation_management(FirstCharacter, greenC)->
                Le tue amiche, Ennio, Talco, la tua famiglia.
                Se dovessi cadere, avrai una rete pronta ad aiutarti.
                {
                    - first_char_main_storylets.eleven:
                        E anche le persone che senti di rado, alla fine rispondo sempre.
                        Non sei sola.
                }
            
            + [La Rifugia è la prova che c'è sempre un posto da cui ripartire.]
                -> color_variation_management(FirstCharacter, purpleC)->
                Aiutate chi è in difficoltà.
                Perché non credere che qualcuno aiuterà te, se servirà?
               
            + [Ennio è felice nel suo non cercare di essere speciale.]
                -> color_variation_management(FirstCharacter, blueC)->
                La mediocrità non è una colpa, ma solo un risultato statistico.
                {
                    - first_char_main_storylets.twelve:
                        E forse tua madre allora ha ragione, e si tratta anche di accontentarsi.
                        Così da non sentirsi inadeguate.
                }
            
            + [Talco ha abbracciato il rischio, parlandoti della maternità.]
                -> color_variation_management(FirstCharacter, redC)->
               E tu lo hai fatto con l'organizzazione sindacale.
               Con La Rifugia.
                {
                    - first_char_main_storylets.ten:
                        Prendendo il treno della relazione con Ennio.
                }
                Sei coraggiosa, {charNameOne}.
                Non avere paura.
            -
                ~ numberQuestion ++
            
            Forse ho più di quanto veda. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            
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
                - else:
                    Per questo ti dico: #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            } 
        
            Ti chiedi se questo il massimo che puoi aspettarti dalla vita. #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            Da una vita che non senti tua.

            + (red) [Una nuova vita ti aspetta in Canada, con Talco.]
            //me ne vado all’estero da Talco.
                -> color_variation_management(FirstCharacter, redC)->
            
            + (purple) [La musica ti dà uno scopo più grande. Seguila.]
            // mollo il lavoro per la musica, per far qualcosa di buono per le altre persone.
                 -> color_variation_management(FirstCharacter, purpleC)->         
            
            + (yellow) [Puoi tornare dai tuoi e ricominciare da dove sei cresciuta.]
            //torno al sud, ricomincio al sicuro.
                -> color_variation_management(FirstCharacter, yellowC)->
                
            + (green) [La stabilità di Ennio è la base per poter cambiare.]
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
        