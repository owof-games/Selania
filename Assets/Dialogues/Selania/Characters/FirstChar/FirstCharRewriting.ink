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

        Io...#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Forse ho frainteso tutto il discorso sulla chitarra.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
        Non è tanto "il piano b", la cosa facile.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Ma piuttosto la cosa che possono fare tutt3.
        E non ero pronta ad essere "tutt3".#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
        Mi aspettavo concerti e viaggi nel mondo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Mi aspettavo amicizie eterne e una casa in campagna e aiuto reciproco.
        Mi aspettavo un amore folle, di quelli su cui ci fanno i film.
        Mi aspettavo di fare qualcosa di buono, di salvare il mondo con le mie canzoni.
        E non ho ottenuto niente di questo.
        Sono soltanto mediocre.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        Un concentrato di rinunce.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
        Faccio un lavoro di merda che mi ammazza le giornate.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        Talco, Valeria, Anna, Luigia: le persone a cui voglio bene presto o tardi se ne vanno. E spesso spariscono.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
        Non capisco se la relazione con Ennio sia stabile o immobile.
        E non riesco manco a risparmiare a sufficienza da donare dieci euro per la Palestina, figurarsi salvare il mondo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        {player_name}, cfireo di avere paura.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Perché l'unica domanda che mi rimane, l'unica spocchiosa domanda è:
        è questo il massimo che posso aspettarmi dalla vita?
        Andrà sempre peggio?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        Tra quanto dovrò fare due lavori di merda invece di uno e morire dentro?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
        O vedere La Rifugia trasformarsi in un altro airbnb finto local?
        O perdere anche Ennio, e rimanere sola e infelice con gatto e vibratore?
        E non è vero che la chitarra fa schifo, Mark Bowen sposami, ma non è il mio strumento.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Non sono nel mio strumento.
        {player_name}: devo continuare a vivere una vita che non è la mia?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        O fare il salto e rischiare di perdere tutto?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
        - 
        @animation:RewriterBook

        Quanto si può sperare di essere felici, a questo mondo?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
            

            + Che ne dici se riscriviamo assieme la tua storia?
                -> rewriting
            
            + Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.
                -> main


    = rewriting
    ~ temp charNameOne = translator(firstChar_ActualName)

            Bene, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            Direi che dopo tutti i pipponi che ti ho tirato, è giunto il momento di fare questa roba.
            Chissà cosa accadrà!

            //Valuto lo stato della relazione 
                -> firstAffinityCalc ->
            
            //Vado a svuotare i contatori di colore, così son tranquilla.
                -> storage_glyphs(FirstCharacter) ->
            
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

            - (top)
        Comunque: cominciamo?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral

        {charNameOne}, prima hai detto che ti aspettavi concerti e viaggi nel mondo.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        Ma che ora sei mediocre e hai un lavoro di merda.
        Però possiamo raccontare la tua storia in un altro modo.
        Tu dici che sei un <b>concentrato di rinunce</b>.

            + Ma l'hai detto anche tu: razionalmente, non si può avere tutto.
                -> glyph_modifier_variation_management(FirstCharacter, airC, decreaseYes)->
                Non è rinuncia quindi: è accogliere la vita adulta.
                E imparare come compiere delle scelte, dove andare.
              {
                - first_char_main_storylets.eleven:
                    Ad esempio, sai già che non vuoi stare da sola.
                    E puoi costruire le tue prossime scelte partendo da questo.
                }

            + Però per la prima volta sei innamorata, innamorata davvero.
                -> glyph_modifier_variation_management(FirstCharacter, waterC, decreaseYes)->
                Ti sei chiesta se Ennio non sia la tua casa, il tuo rifugio.
                Non hai certo rinunciato all'amore.
               {first_char_main_storylets.ten: Un amore che hai detto essere come pane appena sfornato.}
            
            + Però hai abbracciato la lotta, la voglia di cambiare le cose.
                -> glyph_modifier_variation_management(FirstCharacter, fireC, decreaseYes)->
                Con le tue colleghe sul lavoro.
                Con La Rifugia.
                L'hai detto prima: è stato bello dire "no".
                Alcune rinunce ti hanno resa potente.
                
            + Sorprendi te stessa e fai qualcosa di assurdo, vai da Talco!
                -> glyph_modifier_variation_management(FirstCharacter, earthC, decreaseYes)->
                La cartolina è una porta aperta: Talco ti attende.
               {
                - first_char_main_storylets.eleven: 
                    E ti ha già detto in passato che una buona relazione è una relazione scomoda.
                    Non aver paura del conflitto che avete avuto: l'amore è ancora lì, o non ti avrebbe mai riscritto.
               }
               {
                    - cooking_with_first_char.first_theme:
                        E già una volta ti sei ricostruita una vita, quando sei arrivata al nord.
                }
            
            + Hai detto che quando rinunci a te creando, trovi tutto.
                -> glyph_modifier_variation_management(FirstCharacter, aetherC, decreaseYes)->
                E anche se ti incasina scrivere di politica, stai cercando nella musica un modo per cambiare le cose.
                A volte forse rinunciare è utile per andare avanti.
            -
                ~ numberQuestion ++   
            
            Io.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            Sì, forse la rinuncia mi spaventa un sacco.
            Ma forse ora un po' meno.
            
            {
                - secondChar_storyStatus != story_storyEnded:
                    <i>{player_name} ha utilizzato la sua prima goccia di inchiostro per compiere una riscrittura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
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
       
            + Talco e un'ondata di cambiamenti ti aspettano in Islanda.
                -> glyph_modifier_variation_management(FirstCharacter, fireC, decreaseYes)->
                Pensavi Ennio fosse noioso, e te ne sei innamorata.
                La vita ci sorprende sempre quando si tratta di relazioni.
               
            + Hai di più: hai La Rifugia e le tue coinquiline.
                -> glyph_modifier_variation_management(FirstCharacter, aetherC, decreaseYes)->
                Le tue relazioni creano cose che rimangono, anche se le relazioni stesse dovessero finire.
                Con le persone che ami sei trasformazione.
                
            + Hai un innamorato che ti ha chiesto di convivere.
                -> glyph_modifier_variation_management(FirstCharacter, waterC, decreaseYes)->
                Un innamorato che ti fa sentire solida.
                Con cui hai potuto svolazzare, conoscerti al meglio.
                {first_char_main_storylets.ten: Con cui puoi stare piacevolmente in silenzio.}
                {
                    - cooking_with_first_char.first_theme:
                        E l'amore per Talco.
                        Sei piena d'amore, non trovi?
                }
                
            + Ma le aspettative non sono fatti.
                -> glyph_modifier_variation_management(FirstCharacter, airC, decreaseYes)->
                Ed essere adulti significa sopravvivere alle proprie aspettative.
                Ma non è una sconfitta.
               {
                - first_char_main_storylets.twelve:
                    Pensa alla maturità con cui hai parlato dell'invidia che provi.
                    Anche da una cosa dolorosa come il tradire le proprie aspettative, tu hai trovato un modo per crescere.
                }
            
            + Ma chi ce l'ha un papà con cui suonare e ubriacarsi?!?
                -> glyph_modifier_variation_management(FirstCharacter, earthC, decreaseYes)->
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
                - secondChar_storyStatus != story_storyEnded:
                    <i>{player_name} ha utilizzato la sua seconda goccia di inchiostro per procedere con la riscrittura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
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
    
            + Ma se il gioco è rotto, l'unica vittoria c'è rompendo le regole.
                    -> glyph_modifier_variation_management(FirstCharacter, earthC, decreaseYes)->
                Il mondo è duro da cambiare, ma l'esempio è una gran cosa.
                Rompere le aspettative, l'ovvio, è rivoluzionario.
                {
                    - a_story_of_revenge: 
                        O come hai detto per <b>Luna vergine</b>, puoi abbracciare il tuo essere mostro.
                }

            + È questione di numeri: nessunə salva il mondo da solə.
                    -> glyph_modifier_variation_management(FirstCharacter, airC, decreaseYes)->
                È inevitabile, ma non è un fallimento.
                {
                    - first_char_main_storylets.twelve:
                        Piuttosto, è un bene.
                        Così, assieme, evitiamo che le invidie e le insicurezze rendano le nostre lotte fragili.
                }
            
            + Con La Rifugia ti sei data uno scopo più grande.
                -> glyph_modifier_variation_management(FirstCharacter, aetherC, decreaseYes)->
               E anche le tue amiche che sono tornate nei paesini, hanno fatto grandi cose.
               {
                    - cooking_with_first_char.second_theme:
                       E sei stata tu a dirmi che bisogna perdonarsi in queste situazioni.
                       Sbagliare.
                       Provare cose nuove.
                       <i>Più gorgonzola, meno poliziott3.</i>
                       Ricordi?
                }

            + Con le tue colleghe stai portando la lotta grande in qualcosa di piccolo.
                -> glyph_modifier_variation_management(FirstCharacter, fireC, decreaseYes)->
                Pensa a quello che avete fatto contro il dirigente venuto a pranzo.
                Al tentativo di fare un sindacato.
                Hai trovato un modo di lottare anche senza la musica.
                
                    
            + Ma potresti fare qualcosa di buono anche prendendoti cura dei tuoi genitori.
                -> glyph_modifier_variation_management(FirstCharacter, waterC, decreaseYes)->
                {
                    -food_gift_first_char: 
                        Magari scoprendo come capire tua madre cucinando assieme.
                }
                {
                    - cooking_with_first_char.first_theme: 
                        E recuperano quel pezzo di paradiso di quando eri piccola.
                }
                {
                    - cooking_with_first_char.second_theme: 
                        Partendo dal piccolo, dalle cose che vedi come raccontavi in cucina.
                }
            -
                ~ numberQuestion ++
            
            Cfireo di capire.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            
                {
                    - secondChar_storyStatus != story_storyEnded:
                        <i>{player_name} ha utilizzato la terza goccia di inchiostro, proponendo una riscrittura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
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
    
            + Come nei giochi, si può sbagliare e ricominciare.
                -> glyph_modifier_variation_management(FirstCharacter, earthC, decreaseYes)->
                Lo dice Ennio quando gioca.
                L'hai visto quando Talco ha mollato il Conservatorio, eppure si è fattə la sua vita.
                
            + Sei amata da molte persone: anche se cadi, non sarai sola.
                -> glyph_modifier_variation_management(FirstCharacter, waterC, decreaseYes)->
                Le tue amiche, Ennio, Talco, la tua famiglia.
                Se dovessi cadere, avrai una rete pronta ad aiutarti.
                {
                    - first_char_main_storylets.eleven:
                        E anche le persone che senti di rado, alla fine rispondo sempre.
                        Non sei sola.
                }
            
            + La musica e ciò che ti permette di fare saranno sempre con te.
                -> glyph_modifier_variation_management(FirstCharacter, aetherC, decreaseYes)->
                Puoi raccontare storie mai sentite.
                Continuare a provare a cambiare il mondo come vorresti.
               
            + La mediocrità non è una colpa ma un risultato statistico.
                -> glyph_modifier_variation_management(FirstCharacter, airC, decreaseYes)->
                Ennio è felice nel suo non cercare di essere speciale.
                La mediocrità non è una colpa, ma solo un risultato statistico.
                {
                    - first_char_main_storylets.twelve:
                        E forse tua madre allora ha ragione, e si tratta anche di accontentarsi.
                        Così da non sentirsi inadeguate.
                }
            
            + Talco ha rischiato, parlandoti della sua gravidanza.
                -> glyph_modifier_variation_management(FirstCharacter, fireC, decreaseYes)->
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
                    - secondChar_storyStatus != story_storyEnded:
                        <i>{player_name} ha utilizzato la quarta e ultima unità di inchiostro, compiendo il massimo di riscritture possibili.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                }   
            
            -> ending
    
        = ending
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

            {
                - secondChar_storyStatus != story_storyEnded:
                    <i>{player_name} sta per utilizzare il potere dell'<b><i>epilogo</b></i>.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                - else:
                    <i>Quale <b><i>epilogo</b></i> proporrà {player_name}?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}   
            }  
        
            {
                - firstChar_InkLevel == ink_empty:
                    Mi rendo conto di non aver legato molto con te, e hai tutto il diritto di non ascoltarmi. Ma dopo tutta la tua storia, vorrei darti un consiglio:#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
                - else:
                    Per questo ti dico: #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            } 

            Vedo il tuo blocco, {charNameOne}.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            Sei arrivata qui perché non sai più cosa aspettarti dalla tua vita.
            Come avanzare.
            Come uscire da una vita che non senti più tua.

            + (fire) Rivoluziona la tua vita, raggiungi Talco in Islanda.
            //me ne vado all'estero da Talco.
                -> glyph_modifier_variation_management(FirstCharacter, fireC, decreaseYes)->
            
            + (aether) La musica ti dà uno scopo più grande. Seguila.
            // mollo il lavoro per la musica, per far qualcosa di buono per le altre persone.
                 -> glyph_modifier_variation_management(FirstCharacter, aetherC, decreaseYes)->         
            
            + (earth) Torna alla tua infanzia, dai tuoi e ricomincia da dove sei cresciuta.
            //torno al sud, ricomincio al sicuro.
                -> glyph_modifier_variation_management(FirstCharacter, earthC, decreaseYes)->
                
            + (water) L'amore e la stabilità di Ennio sono la base per poter cambiare.
            //me ne vado a vivere col moroso.
                -> glyph_modifier_variation_management(FirstCharacter, waterC, decreaseYes)->
                
            + (air) Eppure hai oggettivamente una vita ricca. Goditela.
            //trovare il bello in quello che si ha (per la gioia di Mentore).
                -> glyph_modifier_variation_management(FirstCharacter, airC, decreaseYes)->   
            - 

        //Nota: la parte di accettazione del nome è prima dell'aggiornamento, così il nome nuovo compare solo quando viene dichiarato.    
        Grazie, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Non.
        Uh.
        Non è facile guardarsi in modo diverso.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
        Alla fine ci raccontiamo tutto il giorno allo stesso modo.
        E i giorni si fanno mesi e blah blah blah.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        È un po' come le canzoni, che a volte le capisci solo in un modo, fino a quando un'altra persona non te le fa ascoltare in modo diverso.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        O tipo con una cover.
        Eccoci di nuovo con i pipponi.
        Invece.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral

        {
            - ending.fire:
                Hai detto che Talco mi aspetta in Islanda.
                Non avevo mai davvero guardato fino in fondo alla possibilità di andarmene dall'Italia.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
            
            - ending.aether:
                Sentirti dire che la musica mi dà uno scopo è stato diverso dal dirlo io.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                È diventata una cosa vera.
                Ha senso?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral

            - ending.earth:
                Non avevo ancora guardato all'andare dai miei come a un ricominciare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                È una parola molto più bella e positiva di "fallire".#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                Mi piace come prospettiva.

            - ending.water:
                Forse hai ragione.
                La relazione con Ennio è partita con quella rassicurazione per la sua stabilità.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                E potrei ripartire da lì per trovare me stessa in altri modi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                Anche in altri modi dentro la relazione con lui.

            - ending.air:
                Riconoscere la ricchezza della mia vita mi fa sentire, mmm.
                Lagnosa.
                Ma ha senso.
                Ti ho raccontato così tante cose.
                Ho davvero motivo di essere così infelice?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                O come direbbe {mentorName}, bloccata?

        }
        Quante cose a cui pensare, ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral

            //Prima chiamo il moltiplicatore di colori, così che comunque le scelte fatte qui abbiano un impatto maggiore.
                -> glyph_modifier(FirstCharacter, firstChar_glyphVariation) ->
            
            //Poi aggiorniamo i colori, così il valore complessivo conta per la scelta del nome
                -> update_glyphs(FirstCharacter) ->     
     
            //E infine genero il nome
                -> firstNaming -> naming
                
            = naming
            ~ temp charNameOne = translator(firstChar_ActualName)
            
            {
                - firstChar_ActualName has Triangolo:
                    {
                        - ending.air:
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, cfireo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
                    }
                    
                    Io sono <b><i>{charNameOne}</b></i>.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    Sono lo strumento semplice, eppure fondamentale.
                    Sono quella che attende che le altre facciano casino, per mettere un accento, un colore.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                    Che ritrova il bello nelle cose quotidiane.
                    Apprezzando quello che ha.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    Sì.
                    Ho trovato il mio nome.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                        
                - firstChar_ActualName has RagazzaOrchestra:
                    {
                        - ending.fire:
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, cfireo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
                    }

                    Rullo di tamburi...#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                    Io sono <b><i>{charNameOne}</b></i>!
                    Signore e signor3 e signori: sono la gioia del cambiamento.
                    Dell'infinita possibilità.
                    Sono colei che può provare tutto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    Incluso il cambiare paese.
                    Colei che nulla teme, perché tutto è.
                        
                - firstChar_ActualName has FlautoDolce:
                    {
                        - ending.aether:
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, cfireo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
                    }

                    Ho scelto come nome <b><i>{charNameOne}</b></i>.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                    Che sia quel pezzetto di plastica suonato alle elementari o un pezzo pregiato di un'orchestra, il Flauto ci ricorda che la musica è ovunque.
                    E dove c'è musica, c'è cambiamento.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    E metterò al centro di tutto la mia musica, la band, per fare cose che davvero cambino il mondo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                    
                      
                - firstChar_ActualName has Ocarina:
                    {
                        - ending.earth:
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, cfireo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
                    }

                    Il mio nome è <b><i>{charNameOne}</b></i>.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                    E riabbraccio la mia infanzia, gli spazi in cui sono cresciuta.
                    Per ricominciare a giocare, a esplorare quello che già conosco.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    Per prendermi cura dei miei e della mia terra.
                    Per permettere ad altr3 di non doversene andare.
        
                - firstChar_ActualName has Violino:
                    {
                        - ending.water:
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, cfireo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
                    }

                    Io sono <b><i>{charNameOne}</b></i>.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                    Lo strumento romantico.
                    Lo strumento divino.
                    Abbraccio l'amore come motore del cambiamento.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    Smuovendo le sue acque sicure per trovare la mia felicità.
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
            {
                - not rewriting_proposal_second_character.secret_ending:
                    <i>{charNameOne} ripone piena fiducia in {player_name}, ed è pronta a condividere con {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}} una informazione importante.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }

        Vorrei anche dirti una cosa, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Cfireo che {mentorName} sia triste per qualcosa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
        Mi dà l'impressione di mettercela tutta, qui.
        Ma di essere, non so come dire, scomoda?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Non credo lo ammetterebbe mai, ma credo abbia bisogno di una persona amica.
        Portale del bene.
            -> exit
            
   
    = exit
    ~ temp charNameOne = translator(firstChar_ActualName)
        {
            - contentsNest hasnt fireGlyph:
            Un'ultima cosa, {player_name}.
            Volevo lasciarti qualcosa di buono di me, prima di andarmene, e ho pensato di donarti un glifo.
            {
                - player_accessiblePlaces has Nest: 
                    Lo troverai al nido, e son sicura che saprai già cosa farne.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                
                - else: 
                    Una certa voce mi ha detto che presto saprai cosa farne. E te lo farà trovare dove ne avrai più bisogno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            }
            ~ move_entity(fireGlyph, Nest)

        }
            
    -> close
        
    = close   
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
            
            Direi che sono pronta per andarmene, {player_name}.
            Abbiamo fatto un viaggio enorme assieme, ora è giunto il tempo per me di riprendere in mano la mia vita.
            Grazie di tutto, davvero.
            Grazie di tutto.
            {
                - secondChar_storyStatus == story_storyStarted:
                    Salutami quella bestiola di {charNameTwo}.

            }
            {
                - thirdChar_storyStatus == story_storyStarted:
                    E anche {charNameThree}.

            }
            

    -> endingPNGstory(FirstCharacter)
        