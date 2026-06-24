=== rewriting_proposal_first_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - grimoire_firstChar hasnt grimFirstCharProposal:
            -> confession
            
        - else:
            -> rewriting
            
    }
    
    = confession
        //Per il feedback, temi legati al rapporto, all'amicizia
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(FirstCharacter, "neutral")}:                   Io...
        {charTag(FirstCharacter, "sad")}:                       Forse ho frainteso tutto il discorso sulla chitarra.
        {charTag(FirstCharacter, "neutral")}:                   Non è tanto "il piano b", la cosa facile.
                                                                Ma la cosa che possono fare tuttə.
        {charTag(FirstCharacter, "sad")}:                       E non ero pronta ad essere "tuttə".
        {charTag(FirstCharacter, "neutral")}:                   Mi aspettavo concerti e viaggi nel mondo.
                                                                Mi aspettavo amicizie eterne e una casa in campagna e aiuto reciproco.
                                                                Mi aspettavo un amore folle, di quelli su cui ci fanno i film.
                                                                Mi aspettavo di fare qualcosa di buono, di salvare il mondo con le mie canzoni.
                                                                E non ho ottenuto niente di questo.
        {charTag(FirstCharacter, "annoyed")}:                   Sono soltanto mediocre.
        {charTag(FirstCharacter, "sad")}:                       Un concentrato di rinunce.
        {charTag(FirstCharacter, "annoyed")}:                   Faccio un lavoro di merda che mi ammazza le giornate.
        {charTag(FirstCharacter, "sad")}:                       Talco, Valeria, Anna, Luigia: le persone a cui voglio bene presto o tardi se ne vanno. E spesso spariscono.
                                                                Non capisco se la relazione con Ennio sia stabile o immobile.
        {charTag(FirstCharacter, "annoyed")}:                   E non riesco manco a risparmiare a sufficienza da donare dieci euro per la Palestina, figurarsi salvare il mondo.
        {charTag(FirstCharacter, "neutral")}:                   {player_name}, credo di avere paura.
                                                                Perché mi chiedo: è questo il massimo che posso aspettarmi dalla vita?
        {charTag(FirstCharacter, "annoyed")}:                   Andrà sempre peggio?
        {charTag(FirstCharacter, "sad")}:                       Tra quanto dovrò fare due lavori di merda invece di uno e morire dentro?
                                                                Vedersene andare tutte le mie amiche?
                                                                O perdere anche Ennio, e rimanere sola e infelice con gatto e vibratore?
        {charTag(FirstCharacter, "neutral")}:                   E non è vero che la chitarra fa schifo, Mark Bowen sei un dio, ma non è il mio strumento.
                                                                Perché una chitarra funziona perché lascia la sua pancia aperta, le sue vulnerabilità esposte.
        {charTag(FirstCharacter, "sad")}:                       Mentre io ora ho bisogno di sicurezza e risposte.
        {charTag(FirstCharacter, "annoyed")}:                   {player_name}: devo continuare a vivere una vita che non è la mia?
        {charTag(FirstCharacter, "sad")}:                       O fare il salto e rischiare di perdere tutto?
        - 
            -> first_char_closing_storylet ->

        {charTag(FirstCharacter, "sad")}:                       A volte vorrei lasciare che il mondo scegliesse al posto mio.

            + \ {charTag(PG, "neutral")}:                       Che ne dici se riscriviamo assieme la tua storia?
                -> rewriting
            
            + \ {charTag(PG, "neutral")}:                       Accolgo il tuo dolore, e mi prendo un attimo per riflettere.
                -> main


    = rewriting
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(FirstCharacter, "neutral")}:                   Bene, {player_name}.
                                                                Direi che dopo tutti i pipponi che ti ho tirato, è giunto il momento di fare questa roba.
                                                                Chissà cosa accadrà!

            //Funzione di preparazione alla riscrittura
            ~  rewriting_prep(FirstCharacter)

            
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
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        

        - (top)
        {charTag(FirstCharacter, "neutral")}:                   Comunque: cominciamo?

        {charTag(PG, "neutral")}:                               {charNameOne}, prima hai detto che ti aspettavi concerti e viaggi nel mondo.
                                                                Ma che ora sei mediocre e hai un lavoro di merda.
                                                                Però possiamo raccontare la tua storia in un altro modo.
                                                                Tu dici che sei un concentrato di rinunce.

            + \ {charTag(PG, "neutral")}:                       Ma è davvero possibile avere tutto quello che si desidera?
                -> glyph_choice_manager(false, airC)->
                {charTag(PG, "neutral")}:                       Non è rinuncia quindi: è accogliere la vita adulta.
                                                                E imparare come compiere delle scelte, dove andare.
                {
                    - grimoire_firstChar has grimFirstCharEleven:
                                                                Ad esempio, sai già che non vuoi stare da sola.
                                                                E puoi costruire le tue prossime scelte partendo da questo.
                }

            + \ {charTag(PG, "neutral")}:                       Però per la prima volta sei innamorata, innamorata davvero.
                -> glyph_choice_manager(false, waterC)->
                {charTag(PG, "neutral")}:                       Ti sei chiesta se Ennio non sia la tua casa, il tuo rifugio.
                                                                Non hai certo rinunciato all'amore.
                                                    
                {
                    - grimoire_firstChar has grimFirstCharTen:
                                                                Un amore che hai detto essere come pane appena sfornato.
                }
            
            + \ {charTag(PG, "neutral")}:                       Però stai sentendo la voglia di lottare, di cambiare le cose.
                -> glyph_choice_manager(false, fireC)->
                {charTag(PG, "neutral")}:                       Con le tue colleghe sul lavoro.
                                                                Con la tua musica.
                                                                L'hai detto prima: è stato bello dire "no".
                                                                Certe rinunce rendono potenti.
                {
                - grimoire_firstChar has grimFirstCharMentorAboutThirdChar: 
                                                                E quando hai parlato con {charNameFive} di {charNameThree}, ti sei detta comunque disponibile a mettere un poco delle tue energie a disposizione anche nel cambiare uomini di cui non ti fidi.
                }
                {
                - grimoire_thirdChar has grimFirstThirdChar:
                                                                Pensa poi alla passione con cui hai fatto una partaccia a {charNameThree} per difendere la sua ex compagna, e per fargli vedere in che modo giudica tutte le donne.
                }                                                
                
            + \ {charTag(PG, "neutral")}:                       Forse perché la tua stabilità è altrove: con Talco.
                -> glyph_choice_manager(false, earthC)->
                {charTag(PG, "neutral")}:                       La cartolina è una porta aperta: Talco ti attende.
               {
                    - grimoire_firstChar has grimFirstCharEleven: 
                                                                E ti ha già detto in passato che una buona relazione è una relazione scomoda.
                                                                Non aver paura del conflitto che avete avuto: l'amore è ancora lì, o non ti avrebbe mai riscritto.
               }
               {
                    - grimoire_firstChar has grimFirstCharKitchenOne:
                                                                E già una volta ti sei ricostruita una vita, quando sei arrivata al nord.
                }
            
            + \ {charTag(PG, "neutral")}:                       Hai detto che quando rinunci a te creando, trovi tutto.
                -> glyph_choice_manager(false, aetherC)->
            {charTag(PG, "neutral")}:                           E anche se ti incasina scrivere di politica, stai cercando nella musica un modo per cambiare le cose.
                                                                A volte forse rinunciare è utile per andare avanti.
            -    
            
            {charTag(FirstCharacter, "neutral")}:               Io.
                                                                Sì, forse la rinuncia mi spaventa un sacco.
                                                                Ma forse ora un po' meno.
            

            //Riduco di uno il livello di inchiostro
            ~ firstChar_InkLevel --

            //Check per commento strega
            -> rewriting_witch_feedback(oneR) ->   

            
                    {
                    - firstChar_InkLevel == ink_empty:
                        -> ending
                    - else: 
                        -> two
                    }        
            
        = two
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(PG, "neutral")}:                               È evidente quanto siano importanti le relazioni per te.
                                                                E a un certo punto hai iniziato ad aspettarti amicizie eterne, case in campagna e un amore da film.
                                                    

            + \ {charTag(PG, "neutral")}:                       Talco e un'ondata di cambiamenti ti aspettano in Islanda.
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:                           Pensavi Ennio fosse noioso, e te ne sei innamorata.
                                                                La vita ci sorprende sempre quando si tratta di relazioni.
               
            + \ {charTag(PG, "neutral")}:                       Hai di più: hai la musica, Valeria, le tue coinquiline.
                -> glyph_choice_manager(false, aetherC)->
            {charTag(PG, "neutral")}:                           Le tue relazioni creano cose che rimangono, anche se le relazioni stesse dovessero finire.
                                                                Con le persone che ami sei trasformazione.
            {
                - grimoire_firstChar has grimFirstCharKitchenOne:
                                                                Non tutto deve finire come con Luana e il vecchio gruppo.
            }                                    
                
            + \ {charTag(PG, "neutral")}:                       L'uomo che ti ama ti ha proposto di diventare <i>casa</i> l'uno per l'altra.
                -> glyph_choice_manager(false, waterC)->
           {charTag(PG, "neutral")}:                            Un uomo che ti fa sentire solida.
                                                                Con cui hai potuto svolazzare, conoscerti al meglio.
                {
                    - grimoire_firstChar has grimFirstCharTen: 
                                                                Con cui puoi stare piacevolmente in silenzio.
                }
                {
                    - grimoire_firstChar has grimFirstCharKitchenOne:
                                                                E l'amore per Talco.
                                                                Sei piena d'amore, non trovi?
                }
                {
                    - grimoire_firstChar has grimFirstCharKitchenThree:
                                                                E l'amore per la creatività.
                                                                Sei piena d'amore, non trovi?
                }
                
            + \ {charTag(PG, "neutral")}:                       Ma tutto questo non può esistere se non rendi più solida te stessa.
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:                           Essere adulti significa sopravvivere alle proprie aspettative.
                                                                Ma non è una sconfitta.
               {
                - grimoire_firstChar has grimFirstCharTwelve:
            {charTag(PG, "neutral")}:                           Pensa alla maturità con cui hai parlato dell'invidia che provi.
                                                                Anche da una cosa dolorosa come il tradire le proprie aspettative, tu hai trovato un modo per crescere.
                }
            
            + \ {charTag(PG, "neutral")}:                       Ma chi ce l'ha un papà con cui suonare e ubriacarsi?
                -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:                           I tuoi genitori hanno fatto enormi sacrifici per permetterti di studiare.
                                                                Palese che ti vogliono un bene immenso.
               {
                - grimoire_firstChar has grimFirstCharTwelve:
                                                                Anche se confondono la tua insicurezza con pretenziosità.
                }
            -
            
            {charTag(FirstCharacter, "neutral")}:               Sì, forse sono un po' una cozzetta. 
                                                                E sono felice solo se sono con le persone a cui voglio bene.
            
            //Riduco di uno il livello di inchiostro
            ~ firstChar_InkLevel --
            
            //Check per commento strega
            -> rewriting_witch_feedback(twoR) ->           
               
            
                    {
                    - firstChar_InkLevel == ink_empty:
                        -> ending
                    - else:
                        -> three
                    }
            
        
        = three
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(PG, "neutral")}:                               Più volte hai parlato del tuo bisogno di fare qualcosa di utile, di grande. 
                                                                Ti aspettavi di fare qualcosa di buono, di salvare il mondo con le tue canzoni.
    
            + \ {charTag(PG, "neutral")}:                       Quando un modello non funziona, cambi le persone o cambi il modello?
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:                           Il mondo è duro da cambiare, ma l'esempio è una gran cosa.
                                                                Rompere le aspettative, l'ovvio, è rivoluzionario.
                {
                    - grimoire_firstChar has grimFirstCharNovel: 
                                                                O come hai detto per <b>Luna vergine</b>, puoi abbracciare il tuo essere mostro.
                }

            + \ {charTag(PG, "neutral")}:                       Ma se restiamo sul concreto: nessunə salva il mondo da solə.
                    -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:                           È inevitabile, ma non è un fallimento.
                {
                - grimoire_firstChar has grimFirstCharMentorAboutThirdChar: 
                                                                Come quando {charNameFive} ti ha parlato del bisogno di non lasciare indietro {charNameThree}, anche se non condividi il suo dolore.
                }  
                {
                    - grimoire_firstChar has grimFirstCharTwelve:
                                                                Piuttosto, è un bene, me l'hai insegnato tu.
                                                                Così, assieme, evitiamo che le invidie e le insicurezze rendano le nostre lotte fragili.
                }
            
            + \ {charTag(PG, "neutral")}:                       Con la band ti sei data uno scopo più grande.
                -> glyph_choice_manager(false, aetherC)->
            {charTag(PG, "neutral")}:                           E anche le tue amiche che sono tornate nei paesini, hanno fatto grandi cose.
               {
                    - grimoire_firstChar has grimFirstCharKitchenTwo:
                                                                E sei stata tu a dirmi che bisogna perdonarsi in queste situazioni.
                                                                Sbagliare.
                                                                Provare cose nuove.
                                                                <i>Più gorgonzola, meno poliziottə.</i>
                                                                Ricordi?
                }

            + \ {charTag(PG, "neutral")}:                       Con le tue colleghe potreste iniziare una rivoluzione.
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:                           C'è la rabbia.
                                                                C'è la voglia di creare un sindacato.
                                                                Hai trovato un modo di lottare anche senza la musica.
                
            + \ {charTag(PG, "neutral")}:                       Ma potresti fare qualcosa di buono anche prendendoti cura dei tuoi genitori.
                -> glyph_choice_manager(false, waterC)->
                {
                    -   grimoire_firstChar has grimFirstCharKitchenAlone: 
                                                                Magari scoprendo come capire tua madre cucinando assieme.
                }
                {
                    - grimoire_firstChar has grimFirstCharKitchenOne: 
                                                                E recuperano quel pezzo di paradiso di quando eri piccola.
                }
                {
                    - grimoire_firstChar has grimFirstCharKitchenTwo: 
                                                                Partendo dal piccolo, dalle cose che vedi come raccontavi in cucina.
                }
            -
                
            
        {charTag(FirstCharacter, "neutral")}:                   Credo di capire.
            

                //Riduco di uno il livello di inchiostro
                ~ firstChar_InkLevel --
                
                //Check per commento strega
                -> rewriting_witch_feedback(threeR) ->          
                
                {
                    - firstChar_InkLevel == ink_empty:
                        -> ending
                    - else:
                        -> four
                }
        
        = four
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)


            {charTag(PG, "neutral")}:                           Ti senti mediocre, e hai paura di rischiare di fare un salto e perdere tutto, di fallire.
    
            + \ {charTag(PG, "neutral")}:                       Ma ogni fallimento è un'occasione di cambiamento.
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:                           Lo dice Ennio quando gioca.
                                                                L'hai visto quando Talco ha mollato il Conservatorio, eppure si è fattə la sua vita.
                                                                E anche quando le cose non si fanno enormi, la vita va avanti comunque, come per tuo padre dopo che ha perso il lavoro.
                
            + \ {charTag(PG, "neutral")}:                       Sei amata da molte persone: anche se cadi, non sarai sola.
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:                           Le tue amiche, Ennio, Talco, la tua famiglia.
                                                                Se dovessi cadere, avrai una rete pronta ad aiutarti.
                {
                    - grimoire_firstChar has grimFirstCharEleven:
                                                                E anche le persone che senti di rado, alla fine rispondo sempre.
                                                                Non sei sola.
                }
            
            + \ {charTag(PG, "neutral")}:                       La musica e ciò che ti permette di fare saranno sempre con te.
                -> glyph_choice_manager(false, aetherC)->
            {charTag(PG, "neutral")}:                           Puoi raccontare storie mai sentite.
                                                                Continuare a provare a cambiare il mondo come vorresti.
               
            + \ {charTag(PG, "neutral")}:                       La mediocrità non è una colpa ma un risultato statistico.
                -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:                           Ennio è felice nel suo non cercare di essere speciale.
                                                                La mediocrità non è una colpa, ma solo un risultato statistico.
                {
                    - grimoire_firstChar has grimFirstCharTwelve:
                                                                E forse tua madre allora ha ragione, e si tratta anche di accontentarsi.
                                                                Così da non sentirsi inadeguate.
                }
            
            + \ {charTag(PG, "neutral")}:                       Quando Talco ti ha parlato della gravidanza ha corso un rischio, e ha deciso di cambiare la sua vita.
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:                           E quel rischio è servito, perché ha smosso in te domande.
                                                                Su di te, sul tuo futuro.
                                                                Il rischio porta cambiamento.
                {
                    - grimoire_firstChar has grimFirstCharTen:
                                                                Puoi decidere che fare del treno dove c'è Ennio.
                }
                                                                Sei coraggiosa, {charNameOne}.
                                                                Non avere paura.
            -
            
        {charTag(FirstCharacter, "neutral")}:                   Forse ho più di quanto veda. 
            
            //Riduco di uno il livello di inchiostro
            ~ firstChar_InkLevel --
            
            //Check per commento strega
            -> rewriting_witch_feedback(fourR) ->     
            
            -> ending
    
        = ending
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        

        //Check per commento strega
        -> rewriting_witch_feedback(endR) -> 

            {charTag(PG, "neutral")}:                           Vedo il tuo blocco, {charNameOne}.
                                                                Sei arrivata qui perché non sai più cosa aspettarti dalla tua vita.
                                                                Come avanzare.
                                                                Come uscire da una vita che non senti più tua.
            {
                - firstChar_maximum_inkLevel == ink_empty:
                    {charTag(PG, "neutral")}:                   Mi rendo conto di non aver legato molto con te, e hai tutto il diritto di non ascoltarmi.
            } 
                                                                Non sta a me dirti cosa fare, ma se posso darti un consiglio, eccolo.

            + (fire) \ {charTag(PG, "neutral")}:                Rivoluziona la tua vita, raggiungi Talco in Islanda.
            //me ne vado all'estero da Talco.
                -> glyph_choice_manager(false, fireC)->
            
            + (aether) \ {charTag(PG, "neutral")}:              La musica ti dà uno scopo più grande. Seguila.
            // mollo il lavoro per la musica, per far qualcosa di buono per le altre persone.
                -> glyph_choice_manager(false, aetherC)->         
            
            + (earth) \ {charTag(PG, "neutral")}:               Riabbraccia il tuo sguardo infantile, sii curiosa, e ricomincia da capo. Anche tornando dai tuoi.
            //torno al sud, ricomincio al sicuro.
                -> glyph_choice_manager(false, airC)->
                
            + (water) \ {charTag(PG, "neutral")}:               L'amore e la stabilità di Ennio sono la base per poter cambiare.
            //me ne vado a vivere col moroso.
                -> glyph_choice_manager(false, waterC)->
                
            + (air) \ {charTag(PG, "neutral")}:                 Sei ricca di relazioni, possibilità, esperienze: goditele.
            //trovare il bello in quello che si ha (per la gioia di Mentore).
                -> glyph_choice_manager(false, earthC)->   
            - 


        {charTag(FirstCharacter, "neutral")}:                   Grazie, {player_name}.
                                                                Non.
                                                                Uh.
        {charTag(FirstCharacter, "sad")}:                       Non è facile guardarsi in modo diverso.
                                                                Alla fine ci raccontiamo tutto il giorno allo stesso modo.
        {charTag(FirstCharacter, "annoyed")}:                   E i giorni si fanno mesi e blah blah blah.
        {charTag(FirstCharacter, "neutral")}:                   È un po' come le canzoni, che a volte le capisci solo in un modo, fino a quando un'altra persona non te le fa ascoltare in modo diverso.
                                                                O tipo con una cover.
                                                                Eccoci di nuovo con i pipponi.
        {charTag(FirstCharacter, "neutral")}:                   Invece.

        {
            - ending.fire:
                                                                Hai detto che Talco mi aspetta in Islanda.
            {charTag(FirstCharacter, "curious")}:               Non avevo mai davvero guardato fino in fondo alla possibilità di andarmene dall'Italia.
        
            - ending.aether:
            {charTag(FirstCharacter, "curious")}:               Sentirti dire che la musica mi dà uno scopo è stato diverso dal dirlo io.
                                                                È diventata una cosa vera.
            {charTag(FirstCharacter, "neutral")}:               Ha senso?

            - ending.earth:
            {charTag(FirstCharacter, "neutral")}:               Non avevo ancora guardato all'andare dai miei come a un ricominciare.
            {charTag(FirstCharacter, "affectionate")}:          È una parola molto più bella e positiva di "fallire".
            Mi piace come prospettiva.

            - ending.water:
                                                                Forse hai ragione.
            {charTag(FirstCharacter, "affectionate")}:          La relazione con Ennio è partita con quella rassicurazione per la sua stabilità.
            {charTag(FirstCharacter, "neutral")}:               E potrei ripartire da lì per trovare me stessa in altri modi.
                                                                Anche in altri modi dentro la relazione con lui.

            - ending.air:
                                                                Riconoscere la ricchezza della mia vita mi fa sentire, mmm.
            {charTag(FirstCharacter, "annoyed")}:               Lagnosa.
            {charTag(FirstCharacter, "neutral")}:               Ma ha senso.
                                                                Ti ho raccontato così tante cose.
            {charTag(FirstCharacter, "curious")}:               Ho davvero motivo di essere così infelice?
                                                                O come direbbe {charNameFive}, bloccata?
        }
        {charTag(FirstCharacter, "neutral")}:                   Quante cose a cui pensare, ama.

            
            
            //E andiamo a cambiare il nome
                ~ rewriting_end(FirstCharacter)


                -> naming
                
    = naming
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

    
    {
    - firstChar_ActualName has Triangolo:
        {
            - ending.air:
                                                                E se ripenso a tutto quello che ci siamo dettə fino ad ora, credo che questa sia la mia canzone.
            - else:
                                                                Ma se ripenso a tutto quello che ci siamo dettə fino ad ora, è un'altra la mia canzone.
        }
        
                                                                Io sono...

        ~  characterChangingObjects(FirstCharacter)

    {charTag(FirstCharacter, "neutral")}:                       <b><i>{charNameOne}</b></i>.
                                                                Sono lo strumento semplice, eppure fondamentale.
                                                                Sono quella che attende che le altre facciano casino, per mettere un accento, un colore.
                                                                Che ritrova il bello nelle cose quotidiane.
                                                                Apprezzando quello che ha.
    {
    - grimoire_firstChar has grimFirstCharMentor:               Dopo quella conversazione, {charNameFive} sarà contenta di aver avuto ragione.
    - else:                                                     Sì
    }
                                                                Ho trovato il mio nome.
            
    - firstChar_ActualName has Orchestra:
    {
        - ending.fire:
                                                                E se ripenso a tutto quello che ci siamo dettə fino ad ora, credo che questa sia la mia canzone.
        - else:
                                                                Ma se ripenso a tutto quello che ci siamo dettə fino ad ora, è un'altra la mia canzone.
    }

                                                                Rullo di tamburi: io sono...
        ~  characterChangingObjects(FirstCharacter)                                            
    {charTag(FirstCharacter, "neutral")}:                       <b><i>{charNameOne}</b></i>!
                                                                Signore e signorə e signori: sono la gioia del cambiamento.
                                                                Le infinite possibilità.
                                                                Sono colei che può provare tutto.
                                                                Incluso il cambiare paese.
                                                                Colei che nulla teme, perché tutto è.
            
    - firstChar_ActualName has FlautoDolce:
    {
        - ending.aether:
                                                                E se ripenso a tutto quello che ci siamo dettə fino ad ora, credo che questa sia la mia canzone.
        - else:
                                                                Ma se ripenso a tutto quello che ci siamo dettə fino ad ora, è un'altra la mia canzone.
    }

                                                                Ho scelto come nome...
        ~  characterChangingObjects(FirstCharacter)
    {charTag(FirstCharacter, "neutral")}:                       <b><i>{charNameOne}</b></i>.
                                                                Che sia quel pezzetto di plastica suonato alle elementari o un pezzo pregiato di un'orchestra, il Flauto ci ricorda che la musica è ovunque.
                                                                E dove c'è musica, c'è cambiamento.
                                                                E metterò al centro di tutto la mia musica, la band, per fare cose che davvero cambino il mondo.
        
            
    - firstChar_ActualName has Ocarina:
    {
        - ending.earth:
                                                                E se ripenso a tutto quello che ci siamo dettə fino ad ora, credo che questa sia la mia canzone.
        - else:
                                                                Ma se ripenso a tutto quello che ci siamo dettə fino ad ora, è un'altra la mia canzone.
    }
                                                                Il mio nome è...
        ~  characterChangingObjects(FirstCharacter)
    {charTag(FirstCharacter, "neutral")}:                       <b><i>{charNameOne}</b></i>.                          
                                                                E riabbraccio la mia infanzia, gli spazi in cui sono cresciuta.
                                                                Per ricominciare a giocare, a esplorare quello che già conosco.
                                                                Per prendermi cura dei miei e della mia terra.
                                                                Per permettere ad altrə di non doversene andare.

    - firstChar_ActualName has Violino:
    {
        - ending.water:
                                                                E se ripenso a tutto quello che ci siamo dettə fino ad ora, credo che questa sia la mia canzone.
        - else:
                                                                Ma se ripenso a tutto quello che ci siamo dettə fino ad ora, è un'altra la mia canzone.
    }

                                                                Io sono...
        ~  characterChangingObjects(FirstCharacter)
    {charTag(FirstCharacter, "neutral")}:                       <b><i>{charNameOne}</b></i>.
                                                                Lo strumento romantico.
                                                                Lo strumento divino.
                                                                Abbraccio l'amore come motore del cambiamento.
                                                                Smuovendo le sue acque sicure per trovare la mia felicità.
    }
    
            {
            - firstChar_specialEvent == true:
                -> secret_ending
            - else:
                -> exit
            }
        
        
    = secret_ending
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    {
        - grimoire_fifthChar hasnt grimMentorSecondSecretEnding && grimoire_fifthChar hasnt grimMentorThirdSecretEnding:
            {charTag(TheWitch, witch_state())}:                 <i>{charNameOne} ripone piena fiducia in {player_name}, ed è pronta a condividere con {player_pronoun has him:lui|{player_pronoun has her:lei|ləi}} una informazione importante.</i>
    }

    {charTag(FirstCharacter, "neutral")}:    
                                                                Vorrei anche dirti una cosa, {player_name}.
                                                                Credo che {charNameFive} sia triste per qualcosa.
                                                                Mi dà l'impressione di mettercela tutta, qui.
                                                                Ma di essere, non so come dire, scomoda?
                                                                Non credo lo ammetterebbe mai, ma credo abbia bisogno di una persona amica.
                                                                Portale del bene.
        
        -> first_char_closing_storylet ->
        -> exit
            
   
    = exit
    ~ temp charNameOne = translator(firstChar_ActualName)
    {
        - contentsNest hasnt fireGlyph:
                                                                Un'ultima cosa, {player_name}.
                                                                Volevo lasciarti qualcosa di buono di me, prima di andarmene, e ho pensato di donarti un glifo.
        {
        - player_accessiblePlaces has Nest: 
                                                                Lo troverai al nido, e son sicura che saprai già cosa farne.
        
        - else: 
                                                                Una certa voce mi ha detto che presto saprai cosa farne. E te lo farà trovare dove ne avrai più bisogno.
        }
        ~ move_entity(fireGlyph, Nest)

    }
            
    -> close
        
    = close   
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        
        
            
        {charTag(FirstCharacter, "neutral")}:                   Direi che sono pronta per andarmene, {player_name}.
                                                                Abbiamo fatto un viaggio enorme assieme, ora è giunto il tempo per me di riprendere in mano la mia vita.
                                                                Grazie di tutto, davvero.
                                                                Salutami {charNameFive}, e dille di riposarsi.
        {
            - secondChar_storyStatus == story_storyStarted:
                                                                E quella bestiola di {charNameTwo}.

        }
        {
            - thirdChar_storyStatus == story_storyStarted:
                {
                - thirdChar_firstCharRage == true or grimoire_thirdChar has grimFirstThirdChar:

                    {charTag(FirstCharacter, "neutral")}:       Ma non ti azzardare a salutarmi quell'idiota di {charNameThree}.
                                                                O torno qui giusto per menarti, ama.                       
    
                - else:
            
                    {charTag(FirstCharacter, "neutral")}:       E persino {charNameThree}.
                                                                Sono sorpresa dalla mia stessa bontà {player_name}!                                                        
                }

        }
                                                                A presto e grazie ancora!
                                                                
    -> first_char_closing_storylet ->
    -> endingPNGstory(FirstCharacter)
        