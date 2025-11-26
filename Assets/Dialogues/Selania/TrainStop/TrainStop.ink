=== train_stop ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

    {debug: La lista degli oggetti nella stanza è: {trainStopContents}.}

    {train_stop == 1: La panchina aspetta fremente una nuova conoscenza.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
    {
        - safekeepingContents has RoomExit:
            ~ move_entity (RoomExit, Bedroom)
    }
    
            -> witch_frog_mission_notifier ->
    
    ~ book_arrivingFromTracking = TrainStop

// {train_stop == 1: Questa è la stazione del treno.|{~La stazione profuma di partenze.|La panchina aspetta fremente una nuova conoscenza.|Sulle vette la luce brilla leggera.|Un vento fresco ti sospinge lungo la strada.|Le lettere ondeggiano sulla bacheca.|L'odore della foresta scalda il sentiero.}}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}


        -> main
  
  
  
        
=== starting_note ===
    + {are_two_entities_together(StartingNote, PG)}[StartingNote]
    
    Ti scrivo perché volevo ringraziarti per quello che hai fatto. #speaker:Sconosciutə #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:writer_unknown
        Che abbiamo fatto.
        A volte il quotidiano mi fa dimenticare tutto, e pensare che sia stata tutta una mia invenzione, roba nella testa.
        Ma poi la notte e i sogni mi ricordano che è stato tutto vero.
        E allora, vorrei soltanto tornare.
        <b>K</b>.
            -> main


=== first_character_notes ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    + (check){are_two_entities_together(FirstCharacterNotes, PG)}[FirstCharacterNotes]
    
        {
            - not one:
                -> one
                
            - not two:
                {  
                    - firstChar_mailPause < 0:
                        -> two
                    - else:
                        -> one
                }
                
            - not three:
                {  
                    - firstChar_mailPause < 0:
                        -> three
                    - else:
                        -> two
                }
            
            - else:
                -> three
            
        }
    
    = one
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        Ciao {player_name}, come stai?
        Qui, questi primi giorni qui sono stati strani.
        A quanto pare la mia assenza è stata solo per qualche ora.
        E nessunə mi ha fatto domande su nulla.
        Eppure io vedo i cambiamenti, i cambiamenti in me.
           
           {
                - firstChar_ActualName has Triangolo:
                    Sto prendendo le cose con un'altra piega.
                    A lavoro riesco a trovare il bello nelle piccole cose.
                    E mi sto interessando ai giochi di Ennio.
                    E ho scritto una lettera a Talco, per dirlə che non mi trasferirò, ma mi manca.
                    Spero mi risponda presto.
                    Intanto ti mando un grande abbraccio.
                    
                - firstChar_ActualName has RagazzaOrchestra:
                    L'altra sera ho mandato un messaggio a Talco.
                    "Ci sto."
                    E mi ha chiamata dopo dieci minuti dieci.
                    Ed è stato come tornare a casa.
                    Ci vorranno almeno due mesi prima di riuscire a combinare tutto, e va bene così.
                    Almeno ho due mesi di tempo per informare Ennio.
                    E Valeria.
                    Non avevo pensato a quanto mi avrebbe fatto paura lasciare questa casa.
                    Ti aggiornerò presto comunque.
                    Così magari vieni a trovarci!

                    
                - firstChar_ActualName has FlautoDolce:
                    
                    
                - firstChar_ActualName has Ocarina:
                    
                    
                - firstChar_ActualName has Violino:
                    
            }
        

        Alla prossima lettera.
         
        <b>{charNameOne}</b>
        
            {
                - one == 1:
                @animation:RewriterBook
            
            }
            
       
            ~ firstChar_mailPause = firstChar_mailPauseDuration
                -> main
    
    = two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Ciao {player_name}, qui è sempre {charNameOne} che ti scrive.
       
       {
            - firstChar_ActualName has Triangolo:
                Talco mi ha risposto, e abbiamo ripreso a videochiamarci.
                Lə bimbə è adorabile.
                Le prime volte ci siamo raccontat3 il mondo.
                Ma ultimamente ci sono molti silenzi.
                Ləi mi racconta le sue giornate, ma mi rendo conto che le mie sono piccoline.
                La cosa più grossa è anche la meno bella: ci sono dei casini sul lavoro.
                Hanno scoperto il tentativo di fare sindacato, e c'è aria di vendetta.
                Cerco di non cagarmi addosso, ma non è facilissimo.
                
            - firstChar_ActualName has RagazzaOrchestra:
                Anche se dovrei chiamarmi "La piagnona".
                Mentre le cose pratiche per trasferirmi vanno avanti, ho iniziato a dirlo all3 altr3.
                Con Valeria abbiamo passato una serata a bere e fare progetti.
                E mi ha promesso che non diventeremo "amiche da ricorrenza".
                Si sta già organizzando per venire a trovarmi.
                Ma la sorpresa più grande l'ho avuta da Ennio.
                Prima cosa: per la prima volta l'ho visto piangere.
                Seconda cosa: mi ha detto "l'ho sempre saputo".
                Mi ha detto che sapeva che tutto questo era troppo poco per me.
                Che lui era troppo poco per me.
                Mi si è spezzato il cuore.
                Gli ho detto che lo amo, che questa scelta è per me, per vivere.
                Lui mi ha detto che lo sa, e che ci penserà un po' sopra.
                Per un attimo ha detto "potrei venire anche io".
                E ho reagito con gioia.
                Ma non oso credere possa accadere.
                Sono una codarda, {player_name}?
                
                
            - firstChar_ActualName has FlautoDolce:
                
                
            - firstChar_ActualName has Ocarina:
                
                
            - firstChar_ActualName has Violino:
                
        }
    
    E lì invece? Come stanno le tue piante?
    Sono arrivate nuove persone interessanti?
    Sicuro, nessunə più interessante di me!
    A presto, <b>{charNameOne}</b>.

        ~ firstChar_mailPause = firstChar_mailPauseDuration
        
        {
            - two == 1:
            @animation:RewriterBook
            
        }
    
       
        -> main
        
    = three
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
    
    Ciao ama!
    
     {
            - firstChar_ActualName has Triangolo:
                Qui...
                Uh.
                Continua a piacermi questa cosa di essere {charNameOne}, ma non è facilissima.
                Talco ha rimandato per due volte i nostri incontri, e credo sia una scusa.
                E a lavoro sembra che non rinnoveranno i contratti a nessunə.
                Hanno già fatto arrivare tre persone nuove, e Luca sta facendo di tutto per tenercele lontane.
                Ho questa sensazione strana.
                Che sia facile dire "goditi le piccole cose" quando tutto va bene.
                Ma ora è.
                È difficile.
                Però, nota positiva: con Ennio stiamo davvero bene.
                È come se ci fossimo risintonizzat3.
                E le sere assieme sono tranquillizzanti.

                
            - firstChar_ActualName has RagazzaOrchestra:
               Ti sto scrivendo da... Boston!
               Ok no, questa battuta fa ridere solo una volta.
               Ti sto scrivendo in realtà <i>dal</i> Boston.
               Un pub dove Talco giura di aver beccato Björk più di una volta.
               Un posticino adorabile a Reykjavík.
               I primi giorni qui sono stati assurdi.
               Thomas è adorabile ora che è nel suo ambiente naturale.
               E Talco.
               Madonna, non l'avrei pensato, ma spacca come genitore.
               Ennio sta continuando a dirmi che gli manco.
               Che casa sua è aperta.
               Ma non ha più parlato della possibilità che lui venga qui.
               E...
               Mi va bene così.
               Per la seconda volta nella mia vita posso fare un reset.
               Posso provare a essere me stessa.
               Ma con una consapevolezza che non avevo a diciannove anni.
               Forse anche per questo sfacciatamente mi sono proposta per suonare in una band locale.
               E tra qualche sera porteremo due pezzi a un festival jazz.
               Io.
               Jazz.
               Mai pensato.
               E invece la vita può sempre sorprenderci, vero?
               E tu?
               Come stai?
               Come sta {charNameTwo}?
               E {mentorName}?
               Mi mancate.

                
            - firstChar_ActualName has FlautoDolce:
                
    
                
            - firstChar_ActualName has Ocarina:
                
      
                
            - firstChar_ActualName has Violino:
                
        }

   
    Un saluto.
    <b>{charNameOne}</b>.
    
        {
            - three == 1:
            @animation:RewriterBook
            
        }
    
    
            -> main
    
=== second_character_notes ===
//Mettere cose sul rapporto con nonna, papà. mamma, fratello, animali, futuro.
    + (check){are_two_entities_together(SecondCharacterNotes, PG)}[SecondCharacterNotes]
    
    {
            - not one:
                -> one
                
            - not two:
                {  
                    - secondChar_mailPause < 0:
                        -> two
                    - else:
                        -> one
                }
                
            - not three:
                {  
                    - secondChar_mailPause < 0:
                        -> three
                    - else:
                        -> two
                }
            
            - else:
                -> three
            
        }
    
    = one
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        Sono a lezione e mi sto rompendo e quindi ho deciso di scrivere a {player_name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
        Cioè a te.
        Anche se non ho mica capito come te la mando la lettera.
        Ma come sta la rana?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
        Hai scoperto poi se è elettrica?
            
            {
                - secondChar_ActualName has Riccio:
                    
                    Qui le cose sono strane.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Forse perché sono uguali a prima.
                    Ora passo più tempo in camera.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    Papà è contento perché dice che non rompo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Mamma è preoccupata perché vuole che gioco con gli altri.
                    A volte guardo fuori dalla finestra e basta.
                    E vado a letto e non correggo più nulla.
                    Mi addormento, e aspetto.
                    A volte voglio tornare lì da voi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    Ma non so cosa fare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    La prof di matematica mi guarda male.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_angry
                    Ci sentiamo {player_name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    
                - secondChar_ActualName has Grizzly:
                    
                    Oggi per la prima volta ho litigato con papà.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_angry
                    Nel senso che non è stato mica lui a cominciare ma io.
                    Ha cercato di picchiarmi e gli ho urlato che è un bullo.
                    E poi ho preso i miei libri e glieli ho tirati contro.
                    Lui si è arrabbiato così tanto, {player_name}!
                    E allora ho urlato.
                    Urlato come un orso.
                    Che si dice che ho bramito quindi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    E lui se ne è andato sbattendo la porta, urlando a mamma che ha tirato su un deficiente.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_angry
                    Però sono felice perché ho meno paura ora.
                    Mamma mi guarda strano.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    Ma so che tu mica mi avresti guardato così.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Salutami la rana!
                    
                - secondChar_ActualName has Lupo:
                    
                    L'altro giorno ho parlato con l'amico di mio fratello.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Gli ho detto che per me siamo un branco ma che secondo me lui mica mi ci vede in questo branco.
                    E lui mi ha detto una cosa strana.
                    Che non ce l'ha con me.
                    Ma che non sa parlare coi bambini.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Allora gli ho detto di non parlarmi come un bambino.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Che so cosa sono i lupi, le frazioni, l'elettricità.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Lui ha riso e mi ha detto: "Ma sai creare un muffin?".#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    E mi ha insegnato a fare i muffin.
                    Mi sono divertito tanto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    E voglio portartene uno.
                  
    
                - secondChar_ActualName has Delfino:
                    
                    A scuola sto finendo tantissimo nei guai.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Ho iniziato a fare qualche dispetto ai bambini prepotenti.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_angry
                    Secondo me hanno funzionato, ma le maestre si sono arrabbiate.
                    Soprattutto per l'inchiostro sulle loro scarpe.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    Ma non è colpa mia se si sono messe in mezzo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_angry
                    Però mi sono fatto due nuovi amici, e l'altro giorno abbiamo passato mezz'ora in castigo assieme.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Quando la maestra di matematica è tornata e ha trovato la stanza tutta legata con lo spago, ha detto una parolaccia grossa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Ma grossa grossa.
                    Quando l'ho ridetta a mio fratello è scoppiato a ridere.
                    Ma forse qui non te la scrivo, per ora.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                   
                    
                - secondChar_ActualName has Capibara:
                    
                    Ieri ho avuto una conversazione da grandi con mio fratello.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Me l'ha fatta perché ho chiamato il suo amico "frocio" quando mi ha sgridato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    E non avevo fatto nulla di male.
                    A parte mettere della tempera nel suo frullatore.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Mio fratello mi ha spiegato perché fa male quella parola.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    E perché papà la usa quando è arrabbiato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Mi ha detto che tantissime persone usano quella parola come scusa per fare del male ad altre persone.
                    E lo fanno perché hanno paura.
                    E poi mi ha portato in una associazione che serve per chi è come mio fratello o il suo amico e non vuole più avere paura.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    E io non avevo mai capito che si possono fare tutte queste cose assieme.
                    Mi è dispiaciuto tantissimo aver fatto male al suo amico.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    Però sono anche contento che mi hanno detto le cose per bene dopo tutti questi anni.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    E tu hai paura di alcune persone?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_angry
                    
                    
                - secondChar_ActualName has Corvo:
                    
                    L'altro giorno ho detto a mamma e papà che voglio diventare un veterinario.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Per studiare e salvare gli animali.
                    Mamma ha detto che allora forse dovrei diventare un etologo (questo l'ho fatto scrivere a lei, che però vuole sapere chi sei, è preoccupata).#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    Quando poi ne ho parlato con mio fratello, mi ha detto che questa estate se voglio mi fa conoscere una persona che fa una cosa bellissima: salva gli animali dai laboratori.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Mio fratello dice che studiare è importante, ma che per cambiare le cose devo capire come lottare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Avevo capito che dovevo lasciarla via la rabbia, {player_name}.
                    Ma lui mi dice che la rabbia serve.
                    Va solo mandata nella giusta direzione.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Ti scriverò appena scopro qual è quella giusta e quale è quella sbagliata.
                
            }
            
            PS: come sta {mentorName}? Mi spiace per come l'ho trattata mentre ero lì, sai?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
            Ma non dirglielo. Per ora per lo meno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
            Ciao!

        {
            - one == 1:
            @animation:RewriterBook
            
        }
        
            ~ secondChar_mailPause = secondChar_mailPauseDuration
                -> main
    
    = two
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        Che strano.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
        Ho lasciato l'altra lettera sul comodino di notte.
        E poi è sparita.
        Non so mica se ti è arrivata.
        O se papà l'ha buttata.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_angry
            
            {
                - secondChar_ActualName has Riccio:
                
                    Le cose a scuola vanno male.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    L'altro giorno ho picchiato un bambino perché mi ha chiamato "strano".
                    E l'ho spinto dalle scale.
                    Ora sono in sospensione, a casa.
                    Papà è sparito da due giorni.
                    Mamma piange in camera.
                    Io non so come mi sento.
                    Però ho ripreso a fare esperimenti.
                    In un vecchio libro un bambino disegnava la porta sul muro, e andava in un altro mondo.
                    Forse se trovo il modo posso tornare da voi.
                    Mi mancate.
                    Ciao.
    
                - secondChar_ActualName has Grizzly:
                
                    Se l'ha buttata urlo di nuovo, vediamo che mi dice poi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_angry
                    Però ti dovevo dire questa cosa: sono nella squadra di calcio.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Non sono mica bravo, sinceramente.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    Questa roba delle forza e della velocità non è roba mia proprio.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Però dice l'allenatore che ho strategia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Mamma me l'ha fatto fare perché dice che devo scaricare tutta questa "rabbia da ragazzino".#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    E non mi chiama più bambino.
                    Negli spogliatoi ci sono state delle risse.
                    Ho dato un pugno straforte a uno più grande.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_angry
                    E ora a scuola non mi rompono più le scatole.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Se qualcuno ti rompe le scatole {player_name} chiamami.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    E ti aiuto io.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Ciao!
    
                - secondChar_ActualName has Lupo:
                
                    Ma non credo: le cose negli ultimi giorni vanno meglio.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Con l'amico di mio fratello ho fatto dei muffin per lui e mamma.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    E poi gli ho detto che mi dispiace quando litigano.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    E che ho capito che essere grandi fa schifo, ma che ci sono anche cose belle.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Come andare al mare.
                    Mamma si è messa a piangere.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    Papà è stato in silenzio tantissimo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    E ho iniziato a pensare che mi avrebbe picchiato.
                    Invece ha detto: domani si fa vacanza e si va a nuotare tutti assieme.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Mamma l'ha abbracciato, e si è mangiata un intero muffin.
                    Ti dico poi come è andata!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    A presto.
                    
                - secondChar_ActualName has Delfino:
                
                    In questi giorni ho ripreso a dire delle bugie.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Ma invece di dirle piccole, le sto dicendo grandissime.
                    E questa cosa fa divertire i miei nuovi amici.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    E anche qualche maestra.
                    Mamma dice che da grande devo fare il comico.
                    Papà è banale e dice che devo fare il politico.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Mio fratello è preoccupato, perché teme che mi metto nei pasticci.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    Gioco: una di queste cose che ho detto non è vera.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Tu lo capisci quale?
                    Salutami la rana!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    <b>{charNameTwo}</b>.
                    
                - secondChar_ActualName has Capibara:
                
                    Dopo che gli ho detto che lui usa quella parola con mio fratello perché ha paura, non mi parla più.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Mamma dice che lui ha paura di tutte le cose, ma non lo sa dire.
                    Le ho detto che ci sono delle associazioni.
                    Lei ha sorriso e mi ha detto che sto davvero diventando grande.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Però continuo a pensarci a questa cosa delle associazioni.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Tu lo sai che io ho paura per gli animali.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    E mi hai insegnato che le cose si affrontano con gli amici.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Magari non sono bravo a farmi degli amici, ma sono bravo a parlare degli animali.
                    E forse ci riesco a fare qualcosa così, come mio fratello fa per i suoi amici.
                    Devo solo capire cosa.
                    Vorrei tanto chiederlo alla rana.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Salutamela!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                
                - secondChar_ActualName has Corvo:
                
                    Ultimamente parliamo di più.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Gli piace parlare di politica.
                    Secondo me dice cose stupide, ma forse nelle sue cose stupide c'è lui, le sue paure.
                    Almeno così dice l'amico di mio fratello.
                    Oggi siamo stati da nonna.
                    Ho dovuto insistere perché avevano paura che ci rimanevo male.
                    Si no boh.
                    Mi è spiaciuto quando non mi ha riconosciuto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    Però è sempre la nonna.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Quando mamma ha parlato con l'infermiera ho preso un mazzo di carte.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Era sporco e mancava l'asso di picche.
                    Ma nonna ha ricordato tutti i trucchi e mi ha stracciato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Stammi bene!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    <b>{charNameTwo}</b>.
            }
            PS: mi piace mettere i PS, su internet non ci sono.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
            PPS: ma sono arrivate persone nuove poi? Qualcuna con dei dolci magari?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
        
        {
            - two == 1:
            @animation:RewriterBook
            
        }
        
                ~ secondChar_mailPause = secondChar_mailPauseDuration
                    -> main
    
    = three
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        Ciao {player_name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
                
                {
                - secondChar_ActualName has Riccio:
                    
                    Ti scrivo da casa di mio fratello.
                    Novità: ora vivo qui!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    All'inizio il suo amico non era contento, ma ora mi insegna anche a fare i dolci!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Fa anche delle caramelle superbuone.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Papà non è più tornato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Mamma non ha nemmeno fatto storie quando me ne sono andato.
                    Non mi sento mica felice.
                    Sì no boh.
                    Che cosa strana da scrivere.
                    Però le cose sono diverse.
                    A volte abbasso le spine.
                    A volte mi addormento sul divano mentre guardo i telefilm con mio fratello.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    E non ho mica paura.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Spero che tu non abbia paura.
                    Salutami {mentorName}.
                    Ti voglio bene.
                    
                - secondChar_ActualName has Grizzly:
                    
                    Sono SUPER ARRABBIATO.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_angry
                    CON MIO FRATELLO.
                    Non avevamo mai litigato, mai.
                    Ma l'altro giorno è venuto a casa e mi ha detto che sto diventando come papà.
                    Papà si è incazzato con lui e mi ha difeso.
                    Mio fratello dice che sto diventando un bullo.
                    Che un suo amico maestro a scuola gli ha detto che me la prendo coi più piccoli.
                    Papà gli ha detto che mi faccio rispettare.
                    E che non sono una checca come lui.
                    Lui mio fratello.
                    Non sono mica abituato a mio padre così.
                    Ma poi in camera mi è preso male tutto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    Mi manca mio fratello.
                    Mi mancate voi.
                    Vorrei sapere cosa fare.
                    
                - secondChar_ActualName has Lupo:
                    
                    Oggi sono triste, e non so perché.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    Ho dato un pugno a un ragazzo delle medie, ma non mi è mica piaciuto.
                    A casa le cose vanno bene, ma.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Sì no boh.
                    Mica pensavo che è così faticoso.
                    Mamma e papà sono tranquilli solo se siamo assieme.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    Mi sembra un lavoro.
                    E se sono giù si preoccupano tantissimo.
                    E se si preoccupano tornano a litigare.
                    Non so mica cosa fare.
                    Forse {mentorName} li può aiutare?
                    Mi mancate.
                    <b>{charNameTwo}</b>.
                    
                - secondChar_ActualName has Delfino:
                    
                    Se non l'hai capito nell'ultima lettera solo l'ultima frase non era vera: tutte le altre lo erano.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Però è successa una cosa divertente, {player_name}!
                    La prof di matematica mi ha detto che le mie bugie sono storie.
                    E che le storie sono da conservare.
                    E quindi abbiamo aperto assieme a altri bambini un giornale della scuola.
                    Faremo uscire per tutto il resto dell'anno i nostri racconti e le notizie.
                    Mi ha solo chiesto di non scrivere più quella parolaccia che lei ha detto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    E di non dire niente sulla preside o si arrabbia.
                    E allora ti saluto dicendoti quella parolaccia, perché poi non la potrò più scrivere.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    "Per il catarro del cammello!"#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Che schifo, {player_name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Ma lì ci sono i cammelli?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Un saluto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    <b>{charNameTwo}</b>.
                    
                - secondChar_ActualName has Capibara:
        
                    Questo cervellino (il mio cervellino) ha trovato una soluzione.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Ho parlato con la prof di matematica, e le ho detto delle mie paure.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Degli animali che spariscono, dei boschi che bruciano.
                    Dei ghiacciai.
                    Lei mi ha detto che possiamo raccogliere dei soldi ma sì no boh.
                    Io pensavo all'associazione di mio fratello e del suo fidanzato, e loro insegnano a non avere paura non a spendere soldi.
                    Allora mi ha fatto fare una lezione in classe su queste cose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Ho spiegato le paure.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    E poi ho detto che se ci mettiamo assieme ci sono anche le soluzioni.
                    Alcuni compagni hanno detto che ci possiamo trovare nel campetto il pomeriggio.
                    E quindi forse qualcosa sta iniziando, {player_name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Non so cosa faremo, però è bello non farlo da solo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    E vorrei tanto tu fossi qui con me, ora.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Secondo me ci diresti tantissime cose sagge.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Salutami la rana.
                    <b>{charNameTwo}</b>.
                
                - secondChar_ActualName has Corvo:
                
                    Ieri è successa una cosa fighissima.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Ti ricordi quell'amica di mio fratello, che dovevo conoscere al mare?
                    Sta da tre giorni da lui perché dice che è stata buttata fuori di casa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_melanchonic
                    E mi ha raccontato tante cose che mica sapevo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Cose brutte che vengono fatte agli animali.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_angry
                    Ma, {player_name}: non aveva paura.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Lei dice che sono sveglio, e che per questo non devo avere paura perché posso capire tutto.
                    E che magari un giorno trovo un modo per salvare gli animali.
                    Mi ha regalato un romanzo di Ursula LeGuin (ho dovuto guardare la copertina, è un nome difficile).#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy
                    Non sapevo di potere imparare cose dai romanzi.
                    Oggi ho chiesto alla maestra di matematica di darmi dei libri sull'ambiente.
                    Ci sono così tante cose da imparare, {player_name}, così tante!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Spero ci vedremo presto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#portrait:riccio_neutral
                    Salutami la rana!
                    <b>{charNameTwo}</b>.
                    
            }
        
        PS: Ma poi hai scoperto cos'è quella statua nella foresta?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_energy   
        PPS: Ho un segreto che riguarda la serra, ma te lo dirò con la prossima lettera! Ciao ciao!
        
        {
            - three == 1:
            @animation:RewriterBook
            
        }        
            ~ secondChar_mailPause = secondChar_mailPauseDuration
                -> main
    
=== third_character_notes ===
//Forse le sue lettere saranno scritte da una persona cara, vicina.
    
    + {are_two_entities_together(ThirdCharacterNotes, PG)}[ThirdCharacterNotes]
    
        {
            - not one:
                -> one
                
            - not two && thirdChar_mailPause < 0:
                -> two
                
            - not three && thirdChar_mailPause < 0:
                -> three
        }
        
    = one
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        {charNameThree}: Lettere random note da parte della personaggia #speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)} #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:third_neutral
        
        {
            - thirdChar_possibleStates has Riccio: 
                {charNameThree}: xy
            - thirdChar_possibleStates has Capibara:
                {charNameThree}: zz
        }
        
        ~ thirdChar_mailPause = thirdChar_mailPauseDuration
            -> main
    
    = two
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        {charNameThree}: seconda lettera
        
        {
            - thirdChar_possibleStates has Riccio: 
                {charNameThree}: xy
            - thirdChar_possibleStates has Capibara:
                {charNameThree}: zz
        }    
        
        ~ thirdChar_mailPause = thirdChar_mailPauseDuration
            -> main
    
    = three
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        {charNameThree}: terza lettera
        
        {
            - thirdChar_possibleStates has Riccio: 
                {charNameThree}: xy
            - thirdChar_possibleStates has Capibara:
                {charNameThree}: zz
        }    
        
        ~ thirdChar_mailPause = thirdChar_mailPauseDuration
            -> main
    
=== fourth_character_notes ===
    
    + {are_two_entities_together(FourthCharacterNotes, PG)}[FourthCharacterNotes]
        
        {
            - not one:
                -> one
                
            - not two && thirdChar_mailPause < 0:
                -> two
                
            - not three && thirdChar_mailPause < 0:
                -> three
            
        }
        
    = one
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        {charNameFour}: Lettere random note da parte della personaggia#speaker:{fourthChar_tag()} #inkA:{ink_tag_a(fourthChar_InkLevel)} #inkB:{ink_tag_b(fourthChar_InkLevel)} #inkC:{ink_tag_c(fourthChar_InkLevel)}  #inkD:{ink_tag_d(fourthChar_InkLevel)} #portrait:fourth_neutral
        
        {
            - fourthChar_possibleStates has Riccio: 
                {charNameFour}: xy
            - fourthChar_possibleStates has Capibara:
                {charNameFour}: zz
        }    
        
        ~ fourthChar_mailPause = fourthChar_mailPauseDuration
            -> main
    
    = two
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        {charNameFour}: seconda lettera
        
        {
            - fourthChar_possibleStates has Riccio: 
                {charNameFour}: xy
            - fourthChar_possibleStates has Capibara:
                {charNameFour}: zz
        }  
        
        ~ fourthChar_mailPause = fourthChar_mailPauseDuration
            -> main
    
    = three
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        {charNameFour}: terza lettera
    
        {
            - fourthChar_possibleStates has Riccio: 
                {charNameFour}: xy
            - fourthChar_possibleStates has Capibara:
                {charNameFour}: zz
        }      
        
        ~ fourthChar_mailPause = fourthChar_mailPauseDuration
            -> main

=== fifth_character_notes ===

    + {are_two_entities_together(FifthCharacterNotes, PG)}[FifthCharacterNotes]
    
        {
            - not one:
                -> one
                
            - not two && thirdChar_mailPause < 0:
                -> two
                
            - not three && thirdChar_mailPause < 0:
                -> three
            
        }
        
    = one
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        {mentorName}: Lettere random note da parte della personaggia#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
        
        {
            - fifthChar_possibleStates has Riccio: 
                {mentorName}: xy
            - fifthChar_possibleStates has Capibara:
                {mentorName}: zz
        }
        
        ~ fifthChar_mailPause = fifthChar_mailPauseDuration
            -> main
    
    = two
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        {mentorName}: seconda lettera
        
        {
            - fifthChar_possibleStates has Riccio: 
                {mentorName}: xy
            - fifthChar_possibleStates has Capibara:
                {mentorName}: zz
        }
            
        ~ fifthChar_mailPause = fifthChar_mailPauseDuration
            -> main
    
    = three
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        {mentorName}: terza lettera
        
        {
            - fifthChar_possibleStates has Riccio: 
                {mentorName}: xy
            - fifthChar_possibleStates has Capibara:
                {mentorName}: zz
        }
            
        ~ fifthChar_mailPause = fifthChar_mailPauseDuration
            -> main
