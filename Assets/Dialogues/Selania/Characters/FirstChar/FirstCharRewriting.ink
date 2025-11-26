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

        Io...
        Forse ho frainteso tutto il discorso sulla Chitarra.
        Non è tanto "il piano b", la cosa facile.
        Ma piuttosto la cosa che possono fare tutt3.
        E...
        E non ero pronta ad essere "tutt3".
        Mi aspettavo concerti e viaggi nel mondo.
        Mi aspettavo amicizie eterne e case in campagna ad aiutarci reciprocamente.
        Mi aspettavo un amore folle, di quelli su cui ci fanno i film.
        Mi aspettavo di fare qualcosa di buono, di salvare il mondo con le mie canzoni.
        E non ho che non ho ottenuto questo.
        Sono soltanto mediocre.
        Un concentrato di rinunce.
        Faccio un lavoro di merda che mi ammazza le giornate.
        Le persone che amo vivono lontane, e alcune sono scomparse.
        Non capisco se la relazione con Ennio è stabile o immobile.
        E non riesco manco a risparmiare a sufficienza da donare dieci euro per la Palestina, figurarsi salvare il mondo.
        {player_name}, credo di avere paura.
        Perché l'unica domanda che mi rimane, l'unica spocchiosa domanda è:
        è questo il massimo che posso aspettarmi dalla vita?
        Andrà sempre peggio?
        Tra quanto dovrò fare due lavori di merda invece di uno e morire dentro?
        O vedere La Rifugia trasformarsi in un altro airbnb vintage e dover tornare dai miei ad inacidirmi?
        O perdere anche Ennio, e rimanere sola e infelice con gatto e vibratore?
        E non è vero che la chitarra fa schifo, Mark Bowen sposami, ma non è il mio strumento.
        Non sono nel mio strumento.
        {player_name}: devo continuare a vivere una vita che non è la mia?
        O fare il salto e rischiare di perdere qualcosa.
        O tutto?
        Quanto si può sperare di essere felici, a questo mondo?

            + [Che ne dici se riscriviamo assieme la tua storia?]
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
       
            + [I sogni si trasformano, ma Talco ancora ti aspetta in Islanda.]
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
                    Anche se confondono la tua insicurezza con pretenziosità.
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
                {
                    - a_story_of_revenge: O come hai detto per <b>Luna vergine</b>, puoi abbracciare il tuo essere mostro.
                }

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
                {
                    -food_gift_first_char: Magari scoprendo come capire tua madre cucinando assieme.
                }
                {
                    - cooking_with_first_char.first_theme: E recuperano quel pezzo di paradiso di quando eri piccola.
                }
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
        ~ temp mentorName = translator(mentor_ActualName)

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

            + (red) [Una nuova vita ti aspetta in Islanda, con Talco.]
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
        Non.
        Uh.
        Non è facile guardarsi in modo diverso.
        Alla fine ci raccontiamo tutto il giorno allo stesso modo.
        E i giorni si fanno mesi e blah blah blah.
        È un po' come le canzoni, che a volte le capisci solo in un modo, fino a quando un'altra persona non te le fa ascoltare in modo diverso.
        O tipo con una cover.
        Eccoci di nuovo con i pipponi.
        Invece.

        {
            - ending.red:
                Hai detto che Talco mi aspetta in Islanda.
                Non avevo mai davvero guardato fino in fondo alla possibilità di andarmene dall'Italia.
            
            - ending.purple:
                Sentirti dire che la musica mi dà uno scopo è stato diverso dal dirlo io.
                È diventata una cosa vera.
                Ha senso?

            - ending.yellow:
                Non avevo ancora guardato all'andare dai miei come a un ricominciare.
                È una parola molto più bella e positiva di "fallire".
                Mi piace come prospettiva.

            - ending.green:
                Forse hai ragione.
                La relazione con Ennio è partita con quella rassicurazione per la sua stabilità.
                E potrei ripartire da lì per trovare me stessa in altri modi.
                Anche in altri modi dentro la relazione con lui.

            - ending.blue:
                Riconoscere la ricchezza della mia vita mi fa sentire, mmm.
                Lagnosa.
                Ma ha senso.
                Ti ho raccontato così tante cose.
                Ho davvero motivo di essere così infelice?
                O come direbbe {mentorName}, bloccata?

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
                    {
                        - ending.blue:
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, credo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
                    }
                    
                    Io sono <b><i>{charNameOne}</b></i>.
                    Sono lo strumento semplice, eppure fondamentale.
                    Sono quella che attende che le altre facciano casino, per mettere un accento, un colore.
                    Che ritrova il bello nelle cose quotidiane.
                    Apprezzando quello che ha.
                    Sì.
                    Ho trovato il mio nome.
                        
                - firstChar_ActualName has RagazzaOrchestra:
                    {
                        - ending.red:
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, credo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
                    }

                    Rullo di tamburi...
                    Io sono <b><i>{charNameOne}</b></i>!
                    Signore e signor3 e signori: sono la gioia del cambiamento.
                    Dell'infinita possibilità.
                    Sono colei che può provare tutto.
                    Incluso il cambiare paese.
                    Colei che nulla teme, perché tutto è.
                        
                - firstChar_ActualName has FlautoDolce:
                    {
                        - ending.purple:
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, credo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
                    }

                    Ho scelto come nome <b><i>{charNameOne}</b></i>.
                    Che sia quel pezzetto di plastica suonato alle elementari o un pezzo pregiato di un'orchestra, il Flauto ci ricorda che la musica è ovunque.
                    E dove c'è musica, c'è cambiamento.
                    E metterò al centro di tutto la mia musica, la band, per fare cose che davvero cambino il mondo.
                    
                      
                - firstChar_ActualName has Ocarina:
                    {
                        - ending.yellow:
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, credo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
                    }

                    Il mio nome è <b><i>{charNameOne}</b></i>.
                    E riabbraccio la mia infanzia, gli spazi in cui sono cresciuta.
                    Per ricominciare a giocare, a esplorare quello che già conosco.
                    Per prendermi cura dei miei e della mia terra.
                    Per permettere ad altr3 di non doversene andare.
        
                - firstChar_ActualName has Violino:
                    {
                        - ending.green:
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, credo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
                    }

                    Io sono <b><i>{charNameOne}</b></i>.
                    Lo strumento romantico.
                    Lo strumento divino.
                    Abbraccio l'amore come motore del cambiamento.
                    Smuovendo le sue acque sicure per trovare la mia felicità.

                        
            }
            
                ~ book_BGVariations ++
    
                    {
                    - firstChar_specialEvent == true:
                        -> secret_ending
                    - else:
                        -> close
                    }
        
        
    = secret_ending
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
            {
                - not rewriting_proposal_second_character.secret_ending:
                    La fiducia che {charNameOne} ha verso {player_name} fa sentire {charNameOne} piena della voglia di condividere una informazione importante.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }

        Vorrei anche dirti una cosa, {player_name}.
        Credo che {mentorName} sia triste per qualcosa.
        Mi dà l'impressione di mettercela tutta, qui.
        Ma di essere, non so come dire, scomoda?
        Non credo lo ammetterebbe mai, ma credo abbia bisogno di una persona amica.
        Portale del bene.
            -> exit
            
   
    = exit
    ~ temp charNameOne = translator(firstChar_ActualName)
        // Un'ultima cosa, {player_name}.
        // Volevo lasciarti qualcosa di buono di me, prima di andarmene, e ho pensato di donarti una conchiglia.
        // {
        //     - player_accessiblePlaces has Nest: La troverai al nido, e son sicura che saprai già cosa farne.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
        //     - else: Una certa voce mi ha detto che presto saprai cosa farne. E te la farà trovare dove ne avrai più bisogno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        // }
        //         //Spostiamo la conchiglia
        //         ~ move_entity(greenShell, Nest)
        
        
                -> close
        
    = close   
            ~ story_endedStories += story_firstCharStoryEnded
            ~ firstChar_storyStatus = story_storyEnded
            ~ player_movementsCounter = 0
            ~ PG_advance_management(FirstCharacter)
            ~ numberQuestion = 0
            ~ firstChar_InkLevel = ink_empty

            Credo resterò ancora un po' in giro.
            Ma senza altri pipponi per te, promesso!
            E cerca di riposarti, non voglio che mi schiodi.
            
            @animation:RewriterBook
            
        -> main  
        