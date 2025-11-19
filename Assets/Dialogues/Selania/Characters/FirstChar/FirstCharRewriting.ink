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
            
        C'è una cosa che voglio dirti, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    
                {
                    -   are_two_entities_together(Mentor, PG):Sicuro è il caso che vi lasci il vostro spazio.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurryl
                            ~ change_entity_place(Mentor)
                }
                {
                    -   are_two_entities_together(SecondCharacter, PG):Nanetto, ci lasceresti un po' da sole?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                            ~ change_entity_place(SecondCharacter)
                }  
            
        Credo di aver capito perché il mio nome qui è {charNameOne}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Penso al Ghiberti.
        Penso all3 am3.
        Penso alla mia famiglia.
        Non so se l'hai visto, ma tutta questa roba mi fa pressione.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        Tutte le persone che conosco mi stanno chiedendo di fare una scelta, di decidere che cosa fare da grande.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
        Ma sinceramente, {player_name}?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Mi cago addosso all'idea di fare una scelta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         Perché una scelta chiude strade.
         Perché una scelta delude persone.
         Perché una scelta può portarti in luoghi che non sono per te.
         Ma a quel punto, non si può più tornare indietro.
         E così l'unica cosa che rimane è rinunciare.
         Lasciare che le altre persone scelgano per te.
         O che lo faccia il mondo.
         Ecco perché mi chiamo {charNameOne}: perché rimango nel medio, nella cosa più ovvia e cringe.
         @animation:RewriterBook
         E lascio che le cose accadano.
            ~ greenhouse_cultivableGrowing ++
    
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
        
        
        Prima hai detto che hai il terrore di fare una scelta.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            
            + [Qui hai accettato il tuo nuovo nome.]
                -> color_variation_management(FirstCharacter, blueC)->
                Accettare è una scelta.
                Cercare risposte è un'altra scelta ancora.
                E ammettere una propria paura, una scelta enorme.
                  
            + [Ma hai deciso di costruire una famiglia con l3 tu3 am3.]
                -> color_variation_management(FirstCharacter, greenC)->
                Hai aperto il tuo cuore, e loro ti amano.
                Si preoccupano per te, cercano di aiutarti a trovare la tua strada.
                E questo amore è frutto di infinite piccole scelte fatte ogni giorno.
            
            + [Dimenticando che per finire gli studi hai lottato per anni.]
                -> color_variation_management(FirstCharacter, redC)->
                Che ogni esame che hai dato è stata una scelta.
                Che ogni lezione che hai seguito è stata una scelta.
                E presto o tardi, hai trovato la volontà di continuare.
                
            + [Ma hai più volte accettato il rischio di suonare sul tetto.]
                -> color_variation_management(FirstCharacter, yellowC)->
                Hai accettato di essere festa in un mondo severo.
                Hai cercato il gioco quando tutto ti dice che devi lavorare.
                Hai accolto falene, scoiattoli e altri animali suonanti.
        
            
            + [Però da che sei qui hai esplorato tutto questo luogo.]
                -> color_variation_management(FirstCharacter, purpleC)->
                Hai inseguito uno scoiattolo.
                Hai cercato Talco.
                Non ti sei fatta spaventare dalla novità.
    
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
        
        Temi che le persone a cui vuoi bene si sentano tradite dalla scelta che farai.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
    
            + [Con Talco puoi litigare, eppure siete legatissim3.]
                -> color_variation_management(FirstCharacter, redC)->
                Pensi davvero che ti accuserebbe di tradimento solo perché hai deciso di decidere per te stessa?
                Lə Talco che hai raccontato si arrabbierebbe di più se tu facessi una scelta per te pensando a ləi.
                
            + [La paura di tradire è un'altra faccia dell'ego.]
                -> color_variation_management(FirstCharacter, purpleC)->
                È la voglia di sembrare impeccabili.
                Infallibili.
                Inattaccabili.
                Ma amore e crescita prosperano nell'errore e nella vulnerabilità.
        
            + [Ti preoccupi molto di loro, e poco di te.]
                -> color_variation_management(FirstCharacter, greenC)->
                Non ti sei chiesta molto dove eri, ti sei messa solo a cercare Talco.
                Ti sei preoccupata per Jonah.
                Ma per te?
                
            + [Forse accadrà, ma non è un tuo problema.]
                -> color_variation_management(FirstCharacter, blueC)->
                Stai costruendo la tua vita, non la loro.
                Se la pensano diversamente, non è amicizia, e ti sei salvata da qualcosa di peggiore.
     
                    
            + [Tradiamo la fiducia se rompiamo le regole a nostro vantaggio.]
                -> color_variation_management(FirstCharacter, yellowC)->
                Hai deciso di giocare con loro e lasciar loro tutto il potere?
                O è una regola implicita, che non avete mai concordato ma che senti nell'aria?
                E a prescindere: abbiamo sempre il diritto di revocare un accordo, una regola.
                        
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
        Vedi una scelta come una strada chiusa, qualcosa da cui non poter tornare indietro.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
                
            + [Se non tiri nessun dado, non c'è storia da far avanzare.]
                -> color_variation_management(FirstCharacter, yellowC)->
                Quando giochi non sempre le cose vanno come vuoi, ma comunque <i>vanno</i>.
                E fintanto che le cose hanno di dove andare, c'è tempo per cambiare.
                E a volte anche ritirare i dadi.
            
            + [Tutt3 hanno immaginato sorti diverse per Jonah, ma nessuna fine.]
                -> color_variation_management(FirstCharacter, blueC)->
                Ogni passo avanti prevede la possibilità di tornare indietro.
                A volte è più difficile, a volte meno, ma è sempre possibile.
                    
            + [Eppure la prima cosa che hai visto qui sono otto sentieri.]
                -> color_variation_management(FirstCharacter, purpleC)->
                Otto luoghi dove andare.
                E ogni sentiero ha una direzione in cui andare, e una da cui tornare.
                A volte l'erba può essere cresciuta.
                A volte l'acqua può averne cancellato un pezzo.
                Ma il sentiero è sempre lì, ad aspettare.
  
            + [A suo modo, la storia di Jonah è un successo.]
                -> color_variation_management(FirstCharacter, redC)->
                Ha deciso che non gli stava più bene quello che aveva, e si è mosso per cambiarlo.
                E il leggere negativamente le cose che forse gli sono capitate raccontano nulla di Jonah e molto di chi le racconta.
                C'è orgoglio anche dietro una cassa del supermercato, non solo su palco.
                    
            + [Ragioni come se fossi sola se dovessi cadere.]
                -> color_variation_management(FirstCharacter, greenC)->
                Pensi che Talco ti abbandonerebbe?
                Anna? Olga? Persino Ennio.
                I tuoi genitori.
                Anche se a volte i vostri cuori sono distanti, quando c'è un bisogno sappiamo sempre ritrovarci.            
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
            Questo posto ti ha assegnato un nome, e quel nome è Chitarra. Ma tu lo vedi come una rinuncia.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
    
            + [Giocare è bello perché puoi sempre rinunciare a farlo.]
                -> color_variation_management(FirstCharacter, yellowC)->
                Quando una roba la devi fare anche quando non vuoi, quello è il lavoro.
                Per questo fa schifo.
            
            + [Quando Anna ha rinunciato all'ex, è rinata.]
                -> color_variation_management(FirstCharacter, greenC)->
                Rinunciare vuol dire anche prendersi cura di sé.
                Un atto d'amore quando qualcosa non ci fa più bene.
            
            + [Un infinito più piccolo resta comunque infinito.]
                -> color_variation_management(FirstCharacter, purpleC)->
                Rinuncia a una cosa e sarai comunque tutto.
                Un nome è solo un nome.
                Una persona è un universo intero.
                
            + [Rinunciando a cercare Talco ti sei tutelata.]
                -> color_variation_management(FirstCharacter, blueC)->
                Se una cosa non ha senso, non ha senso anche se continuiamo ad insistere nel farla.
                    {
                    	- firstChar_possibleStates hasnt Chitarra:
        		            ~ firstChar_possibleStates --
        		           {debug_changeName: Diminuisco lo stato della prima personaggia, che ora è {firstChar_possibleStates }}
                    }            
            
            + [C'è più coraggio nella rinuncia che nel compromesso.]
                -> color_variation_management(FirstCharacter, redC)->
                Spesso è più costosa, ma la coerenza personale non ha prezzo.
                
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
        
             
    
            + [Prendi una strada e se non ti piace cambiala!]
                -> color_variation_management(FirstCharacter, redC)->
            
            + [Dai alla tua vita uno scopo più grande.]
                 -> color_variation_management(FirstCharacter, purpleC)->         
            
            + [Ogni gioco richiede una pausa, e tu hai bisogno di ascoltarti.]
                -> color_variation_management(FirstCharacter, yellowC)->
                
            + [Non deluderai i tuoi amici: loro saranno sempre con te.]
                -> color_variation_management(FirstCharacter, greenC)->
                    
            + [Questa non è la tua strada. Succede. Ora puoi cambiare.]
                -> color_variation_management(FirstCharacter, blueC)->
            
                    
            - 
        //Nota: la parte di accettazione del nome è prima dell'aggiornamento, così il nome nuovo compare solo quando viene dichiarato.    
         Grazie, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Mentre ti ascoltavo mi è nata una nuova canzone in testa.
         La canzone del mio nome.
            
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
            
                ~ greenhouse_cultivableGrowing ++    
    
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
        