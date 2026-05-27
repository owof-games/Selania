=== third_char_main_storylets

= one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        //Commento diverso a seconda che sia il primo storylet con noi, o se invece ha assistito ad altri storylets.
        {
            - thirdChar_recordedPlayerPronoun != ():
            {charTag(PG, "neutral")}:                           Immagina: arrivo qui e la prima cosa che penso qual è?
                                                                "No, questo non proprio il frigo."

            - else:  
            {charTag(PG, "neutral")}:                           No, questo non è il frigo.   
        }
                                                                Volevo prendermi una kölsch, giusto per affrontare il caldo.
                                                                E invece eccomi qui.
                                                                Però per lo meno non si sente il miagolio del gatto dello Stracciamaroni.
                                                                O il puzzo dello Stracciamaroni.

        {
            - thirdChar_recordedPlayerPronoun == ():
            {charTag(ThirdCharacter, "neutral")}:               Ma partiamo con le presentazioni!
                -> name_choice.top2 ->
                -> gender ->
            ~ thirdChar_recordedPlayerPronoun += player_pronoun

            - else:
            {
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(PG, "neutral")}:                       Prima ti hanno chiamato {player_name}, e ho sentito che sei un ragazzo!


                - thirdChar_recordedPlayerPronoun == her:
                {charTag(PG, "neutral")}:                       Prima ti hanno chiamato {player_name}, e ho sentito che sei un ragazza!


                - thirdChar_recordedPlayerPronoun == they:
                {charTag(PG, "neutral")}:                       Prima ti hanno chiamato {player_name}, e ho sentito che sei una persona non binaria.

            }   
        }   

             {
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(PG, "neutral")}:                       Te la posso dire una cosa?
                                                                Meno male.
                                                                MENO MALE!
                                                                Dieci su dieci.
                                                                Perché tra {charNameOne} e {charNameFive} mi serviva qualcuno con cui parlare di calcio e non solo di "cose emotive".

                - thirdChar_recordedPlayerPronoun == her:
                {charTag(PG, "neutral")}:                       Io sono sicuro che {charNameOne} e quella di {charNameFive} sei felice che ci sia qualcuno con cui non devi parlare della posta del cuore.
                                                                Non che ci sia qualcosa di male se ti piace!
                                                                Ma non è la mia roba.
                                                                Zero proprio!

                - thirdChar_recordedPlayerPronoun == they:
                {charTag(PG, "neutral")}:                       Te lo dico già ora: supporto tantissimo.
                                                                Ma mi confondo coi nomi, figurati coi pronomi.
                                                                Però ci provo, guarda: <b>amicə</b>.
                                                                È come cercare di dire una <i>a</i> e venire bloccati da un colpo di tosse.
            }


        {charTag(PG, "neutral")}:                               Io sono {charNameThree}.
                                                                Cioè, non sono davvero {charNameThree}.
                                                                Ma prima {charNameTwo} mi ha detto: "Ehi, ma tu sembri un boccale di birra!"
                                                                E allora ho cercato il mio riflesso.
                                                                Un po' ci sono rimasto male: tutte quelle ore spese in palestra, e nessuno le vedrà!
                                                                Detto tra noi, le ore sono state due.
                                                                Tre se contiamo il tempo dell'iscrizione.
                                                                Però la mia pancetta da birra alle tipe piace, almeno un otto me lo piglio.
                                                                E ora sono una birra.
                                                                Ma birra o non birra, che si combina da queste parti?

            
            + \ {charTag(PG, "neutral")}:                       Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:                       Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                    
                
        -    
        {charTag(ThirdCharacter, "neutral")}:                   Quindi gira che ti rigira, sei solo te a sgobbare qui mentre noi ce la prendiamo comoda?
                                                                Che sfiga.

        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:               Alla fine tocca sempre a noi uomini tirare avanti la baracca, vero?
                                                        

            - else:
            {charTag(ThirdCharacter, "neutral")}:               Questo sì che è un cambiamento!
                                                                Non averne a male, ma alla fine siamo sempre noi uomini a tirare avanti la baracca.
                                                                E invece vedi un po'.
        }                
                                                                Anche se Dona è, era una che sgobbava tantissimo, per dire.

        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:               Quella grande stronza della mia ex.
            //Check parolacce da parte di Mentore
            ~ fifthChar_slurDetectorFunction()
                                        

            - else:
            {charTag(ThirdCharacter, "neutral")}:               La mia ex.
        }       
                                                                Ma non sono qui per parlare di lei.
                                                                Non so proprio perché sono qui: non c'ho di sicuro le ansie di {charNameOne}.
                                                                E l'età delle elementari è passata da, boh, trent'anni?
                                                                Anche se ti giuro che non si vede quando non sempre un pezzo di vetro.
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:               Ma tra l'altro come piscio?
                                                                E vuol dire che sono nudo ora?
                                                                Dove mi è finito il?
                                                                Oh.

            - else:
            {charTag(ThirdCharacter, "neutral")}:               Ma come mangio poi?
                                                                E se mangio dove finisce quello che mangio?
                                                                Ma soprattutto, dove esce?!?
        }                                                    
                                                                Comunque butta bene che mi avete rapito nel giorno libero.
        {
            - are_two_entities_together(Mentor, PG):        
            {charTag(Mentor, "sad")}:                           Nessuno ti ha rapito. {charNameThree}!
                                                                Le persone arrivano qui perché ne hanno bisogno.
            {charTag(ThirdCharacter, "jester")}:                Si fa per dire, zia!
                                                                Anche se avrei preferito passare la giornata a sistemare il fantacalcio.
        }                                                    
                                                                Sono uno che si fa il culo a lavoro io, {player_name}.
                                                                In teoria dovrei farmi dalle cinque all'una, ma finisce sempre che mi chiamano anche durante il giorno.
                                                                Colleghi, fornitori, i tizi della spazzatura.
                                                                Perché il mio capo è un coglione.
                                                                Ma c'ha i soldi, per cui: rispetto.
        {//Blocco per reazioni e commenti legati al genere.
        - thirdChar_recordedPlayerPronoun == him:
        {charTag(ThirdCharacter, "neutral")}:                   E la sua tipa, oh amico mio.
                                                                Non hai idea di quanto sia bona.
                                                                Incapace, ma bona!
                                                                Un nove se lo prende tutto.
        }                                                      
                                                                Ma visto che invece tu c'hai i superpoteri e porti la gente in posti incasinati con la sola forza del pensiero, dimmi.
                                                                Che lavoro faccio?


            + \ {charTag(PG, "neutral")}:                       Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:                       Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Dall'aspetto direi che sei un barista?
                    -> glyph_choice_manager(false, airC)->
            {charTag(ThirdCharacter, "neutral")}:               "Dall'aspetto?!?".
                                                                Così si giudicano le persone nel terzo millennio?
                                                                Dov'è {charNameOne} con le sue cose femministe a difendermi?
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:               Sei un coglione, amico!
            //Check parolacce da parte di Mentore
            ~ fifthChar_slurDetectorFunction()
                                                                Io sono un idiota, per cui siamo una grande squadra!

            - else:
            {charTag(ThirdCharacter, "neutral")}:               Ovviamente ti prendo in giro, non ti preoccupare.
        }  
            
            + \ {charTag(PG, "neutral")}:                       Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                    
            -
        {charTag(ThirdCharacter, "jester")}:                    Comunque lavoro in una birreria.
                                                                Anzi: LA birreria.
                                                                Che si chiama <i>Il baretto</i>, che è il nome che aveva quando era un bar.
                                                                E l'aveva mio padre in gestione.
                                                                Comunque è la migliore birreria della zona.
                                                                Perché l'unica nella frazione sfigatissima in cui vivo.
                                                                Pura periferia.
                                                                Però non è così male, se ignori la distesa infinita di appartamenti.
                                                                I vecchi che dicono "Qui un tempo era tutta pianura!".
                                                                E i turisti che prendono un buco in affitto convinti di essere in centro.
                                                                E invece c'hanno a dividere la fermata del bus la sera con il Pino.
        {
            - are_two_entities_together(Franco, PG):
            {charTag(Franco, "party")}:                         Pino il girino?
            {charTag(ThirdCharacter, "jester")}:                Se Pino il girino è alto quasi due metri e ha un paio di pantaloncini che stanno su solo grazie allo sporco sì, allora è Pino il girino.
            {charTag(Franco, "question")}:                      Allora forse è Pino l'airone, il finto critico gastronomico!
        }                                                    
                                                                Ogni tanto qualcuno gli fa le foto, al Pino.
                                                                I turisti sono idioti.
                                                                Ma vai ad aiutare qualcuno di questi poveracci, mentre io mi rilasso un attimo.
        -> third_char_closing_storylet ->
        -> options_third_character
   
    = two
    //Non mettere cose TW qui
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "bored")}:                     Certo che quando mi hai rapito potevi portare qui il mio cellulare.
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:               Cioè, avrai anche tu una tipa a cui scrivere, no?
                                                                O sei uno di quelli che usa il lavoro per scappare dalla fidanzata?

            - else:
            {charTag(ThirdCharacter, "neutral")}:               Immagino che anche tu hai qualcuno a cui scrivere, no?
                                                                
        }  
                                                                Non mi piace che non posso scrivere ad Ava.
                                                                La mia ragazza.
                                                                Ci scriviamo tutto il giorno, sia cose stupide che cose serie.
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:               E a volte anche qualcosa di più piccantino.

            - else:
            {charTag(ThirdCharacter, "neutral")}:               Ma niente cose zozze, promesso!
        }                                                      
                                                                Mi capisce sempre.
                                                                Quando quell'altra mi ha smollato dopo tredici anni...
                                                                Cazzo.
        //Check parolacce da parte di Mentore
            ~ fifthChar_slurDetectorFunction()                                                        
                                                                Tredici fottutissimi anni, di cui cinque di convivenza.
                                                                Non pensavo mi sarei innamorato di nuovo.
                                                                Ne ho avute di tipe, eh!
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:               Lo sai anche tu amico che dobbiamo scopare ogni tanto, giusto per starcene tranquilli.
                                                            
            - else:
            {charTag(ThirdCharacter, "neutral")}:               Anche tentativi seri, giuro.
                                                                Non sono sempre un buffone.
        }                                                      
                                                                Ho aspettato un po' dopo Dona, perché speravo che alla fine avrebbe cambiato idea.
                                                                Invece se ne è andata in Spagna dopo che mi ha umiliato urlandomi contro davanti ai suoi.
        {charTag(ThirdCharacter, "melanchonic")}:               Ero a pezzi.
        {charTag(ThirdCharacter, "jester")}:                    Però dopo tre mesi avevo iniziato a vedere qualche ragazza.
                                                                Tre mesi: sono o non sono un bravo ragazzo?
                                                                Ma è un incubo alla mia età uscire con le ragazze, {player_name}.
                                                                Ho provato con le app da imbrocco.
                                                                Mi sono fatto aiutare da Dania, la mia collega sveglia, e mi ha fatto mettere foto idiote e una col suo cane "Perché alle ragazze piacciono i cani", ha detto.
                                                                Lei è lesbica, quindi non ho ancora capito se le cose funzionano allo stesso modo.
                                                                Sul testo del profilo abbiamo litigato perché ha detto che sono "sessista", solo perché ho scritto che non voglio una tipa che colleziona uomini come fossero figurine.
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:               Io sono pro tutto per carità, ma a volte 'ste donne sono di un pesante, vero?

            - else:
            {charTag(ThirdCharacter, "neutral")}:               A me sembra una cosa buona però, una cosa rispettosa, non volere che una donna sia per forza una che va con tutti di questi tempi.
        }                                                      
                                                                Ma le app fanno schifo.
                                                                Mi scrivono solo quelle della mia età, e boh, sarà che la birreria mi tiene giovane, ma io ho bisogno di tipe più fresche e piene di interessi.
                                                                Ma quelle più giovani non lo vogliono un bravo ragazzo come me.
        {
            - are_two_entities_together(FirstCharacter, PG):
                                                                Vero, {charNameOne}?
            {charTag(FirstCharacter, "annoyed")}:               Mi si è appena suicidata la vagina.             
        }                                                    
        {charTag(ThirdCharacter, "jester")}:                    Su quelle app è pieno di ragazzi più giovani, che magari ne sanno meno del mondo, ma non è quello che si vuole da una relazione vero?
                                                                Però con le clienti ogni tanto si riesce a scopare.
        //Check parolacce da parte di Mentore
            ~ fifthChar_slurDetectorFunction()                                                        
                                                                Unica regola: solo le turiste.
                                                                Perché se me ne faccio una della frazione poi so come va a finire.
                                                                Un po' come tutte le cattive voci che hanno messo in giro quando Dona mi ha mollato.
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:               Qualunque cosa succede, è sempre colpa del fidanzato alla fine.
                                                                Che balle.

            - else:
            {charTag(ThirdCharacter, "neutral")}:               Uno può sembrare un po' coglione, e comunque stare male no?
                                                                Non è che si deve far vedere proprio tutto quando si è con gli altri.
        }                                                      
                                                                Le persone non si fanno mai i cazzi propri.
        //Check parolacce da parte di Mentore
            ~ fifthChar_slurDetectorFunction()                                                        
                                                                Con le turiste non è così difficile, alla fine arrivano qui e vogliono solo sfasciarsi di birra, e a quel punto non gli importa di nulla.
                                                                Però con Ava è diverso.
                                                                Lei mi fa stare bene davvero, non mi giudica.

        
            + \ {charTag(PG, "neutral")}:                       Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)? //Non credi che le "tipe" ubriache sia violenza?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:                       Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                //Ricorda fastidio per scelte intellettuali.
            
            + \ {charTag(PG, "neutral")}:                       Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                
            -
                                                                Comunque basta parlare di Ava che poi mi diventi gelos{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}}.

        {//Blocco per reazioni e commenti legati al genere.
        
        - thirdChar_recordedPlayerPronoun == him:
        {charTag(ThirdCharacter, "neutral")}:                   Ma se provi a toccarla amico, allora vedi che divento una bestia.
                                                        
        - else:
        {charTag(ThirdCharacter, "neutral")}:                   E poi sono uno fedele.
                                                                Un po' marpione, ma perché mi piace scherzare.
                                                                Ma non la tradirei mai.
        }                                                    
                                                            
        {
        - are_two_entities_together(FirstCharacter, PG):
        {
        - grimoire_thirdChar has grimFirstThirdChar:
                {charTag(FirstCharacter, "annoyed")}:           Commento infastidito di Chitarra.

        - else:
                {charTag(FirstCharacter, "neutral")}:           Commento neutro/positivo di Chitarra.    
        }
        }     

            -> third_char_closing_storylet ->
            -> options_third_character

    = three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:                   La zia insiste perché ti parli di me, dice che se sono qui c'è un motivo, qualcosa che mi tormenta.
        {
            - are_two_entities_together(Mentor, PG):
            {charTag(Mentor, "hurry")}:                         È carina questa cosa della zia, ma non sono così vecchia {charNameThree}.
            {charTag(ThirdCharacter, "neutral")}:               Ma "zia" per me è un segno di rispetto.
                                                                Una zia è una che ha avuto una sua vita e che per questo è saggia.
                                                                E quando sei più giovane ti fa fare le cose che i tuoi genitori non ti farebbero fare.    
        }
        {charTag(ThirdCharacter, "jester")}:                    Forse la cosa che mi tormenta di più è che io sono una schiappa a calcetto.
                                                                Scherzo, circa.
                                                                Becco gli altri ogni lunedì sera, quando la birreria è chiusa.
                                                                È un'idea che ha avuto il Poggi, il mio amico storico, dopo il Covid.
                                                                Quello è stato un periodo di merda {player_name}, ma davvero di merda, manco un uno a quell'anno darei, solo le fiamme.
                                                                Ho perso il mio lavoro storico da un giorno all'altro, un lavoro da fighi, con soldi e viaggi.
                                                                Ero un boss, e poi boom, a terra.
                                                                E una sera il Poggi mi ha detto "Dai, ti tiro su una squadretta con gente a posto così ti distrai!"
                                                                Ora il Poggi non si vede da due anni, da quando è nata l'Olivia.
        {//Blocco per reazioni e commenti legati al genere.
        
        - thirdChar_recordedPlayerPronoun == him:
        {charTag(ThirdCharacter, "neutral")}:                   Dicono che se ci nasce una figlia perdiamo la testa a noi uomini, vero?
                                                        
        - else:
        {charTag(ThirdCharacter, "neutral")}:                   Ci sta, alla fine la famiglia è la cosa più importante, no?
        }                                                          
                                                                Nella squadra c'è il Merlo, che è uno pieno di soldi e che se la sente un po', ma quando giochiamo per lo più se ne sta zitto.
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:               Ha una moglie che se la butti in acqua galleggia senza sforzo, non so se ci siamo capiti.
                                                                Finta dai piedi ai capelli.
                                                                Se la guardi bene da vicino non supera un sei, sei e mezzo se hai bevuto.
                                                
            - else:
            {charTag(ThirdCharacter, "neutral")}:               Anche perché sennò parla della sua azienda edile e della fatica con le tasse e io vorrei solo menarlo.
                                                                C'ha una casa più grande della mia, di quella di mia sorella e di quella di mio padre messe assieme, il maledetto.
        }  
                                                                Poi il Giova, che si è sposato da poco ma è sempre fuori casa e la moglie è disperata.
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:               Ma quella è così pesante che anche io sarei sempre fuori casa.
                                                                Vai a sapere perché l'ha sposata poi.
                                                
            - else:
            {charTag(ThirdCharacter, "neutral")}:               Le relazioni sono strane, vero?
        }                                                     
                                                                Il Giova va avanti a start up o robe del genere.
                                                                Io non credo che nessuno abbia capito che diavolo faccia di lavoro, manco lui.
                                                                Il Poggi diceva sempre che Giova gareggia in uno sport tutto suo e comunque arriva sempre secondo.
                                                                Ma c'ha la famiglia ricca quindi beato lui.
                                                                Poi c'è Dario, che è entrato da poco nel gruppo e solo perché esce con la Katia, la cugina del Giova.
                                                                Uno a posto, che è uscito da poco da un divorzio pesantissimo, quella gli ha portato via tutto, inclusi i figli.
                                                                L'unico peccato è che è juventino.
                                                                E quindi è lo scemo del gruppo.
                                                                E infine c'è Rocco. 
                                                                Che in realtà si chiama Adil <>
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:               ma è dalle scuole che lo chiamavamo Marocco e alla fine è finita che ora lo chiamiamo tutti Rocco.
                                                
            - else:
            {charTag(ThirdCharacter, "neutral")}:               ma lo sai anche tu come si è stupidi alle scuole vero? E alla fine gli è rimasto addosso questo nome.
        }                                                      
                                                                Che poi è pure egiziano.
                                                                Rocco è l'unico che becco anche fuori a volte.
                                                                Fa l'operaio nella stessa fabbrica dello Stracciamaroni, che poi è vero per metà della frazione.
                                                                C'ha due figli con la testa sulle spalle, studiano tutti e due anche se non ricordo mai cosa, il maschio roba per le AI.
                                                                Quell'uomo merita tutto il nostro rispetto.
                                                                Anche se c'abbiamo due vite diverse ci capiamo, non so come mai.
                                                                Insomma, nessuno di noi è esattamente questo grande intellettuale.
                                                                Siamo più gente con le mani sporche.
                                                                A parte il Giova.
                                                                Che è stupido e ha le mani pulite.
                                                                Però ce la caviamo bene.
                                                                Abbiamo sempre qualche collega loro o gente del bar che viene a fare due tiri.
                                                                E la serata così passa bene.

        
            + \ {charTag(PG, "neutral")}:                       Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:                       Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                
            - 
            {charTag(ThirdCharacter, "neutral")}:               Come vedi comunque la zia c'ha torto.
                                                                Non ho problemi col lavoro.
                                                                Nessun tormento con le tipe.
                                                                I miei amici sono a posto.
                                                                Questo {charNameThree} sta da dio!

        {
        - are_two_entities_together(FirstCharacter, PG):
        {
        - grimoire_thirdChar has grimFirstThirdChar:
        {charTag(FirstCharacter, "annoyed")}:                   Commento infastidito di Chitarra.

        - else:
        {charTag(FirstCharacter, "neutral")}:                   Commento neutro/positivo di Chitarra.    
        }
        }                                                      
            -> third_char_closing_storylet ->
            -> options_third_character
            

    
    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        
        {charTag(ThirdCharacter, "neutral")}:                   Sembra che non me ne posso andare fino a quando non ho risolto il mio blocco, dice la zia.
                                                                Quindi affrontiamo il grande blocco.
                                                                Donatella.
         {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:               La grandissima stronza.
            //Check parolacce da parte di Mentore
            ~ fifthChar_slurDetectorFunction()
                                                
            - else:
            {charTag(ThirdCharacter, "neutral")}:               La mia ex.
        }

                                                                Mettiti sedut{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} comod{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}}.
                                                                E immagina.
                                                                Lui: un tipo a posto, che lavora tanto.
                                                                Che non urla mai contro la sua tipa.
                                                                Che non l'ha mai tradita anche se fa un lavoro dove è facile incontrare ragazze.
        {//Blocco per reazioni e commenti legati al genere.
        - thirdChar_recordedPlayerPronoun == him:
        {charTag(ThirdCharacter, "neutral")}:                   E tu lo sai quanto è dura resistere quando il tuo amico lassotto si prende bene!
                                                        
        - else:
        {charTag(ThirdCharacter, "neutral")}:                   E ti giuro che per noi uomini questa cosa è un vero atto d'amore!
        }                                                          
                                                                Lei: una che è cresciuta poveraccia e vuole scappare da quella situazione a tutti i costi.
                                                                Che si è fatta il culo alla scuola di estetista e a venticinque anni si apre lo studio insieme a una sua amica.
                                                                E che è una gran bona, non da dieci ma otto e mezzo tutto.
                                                                Due vite normali e una convivenza che va avanti da cinque anni e una cosa in arrivo che lui sogna da quando la conosce: il matrimonio.
                                                                Il periodo attorno al matrimonio sembra perfetto: i genitori di lei che aiutano con le cose pratiche, la sorella di lui con l'organizzazione, col trovare il posto giusto.
                                                                Unica nota dolente: quello sfigato del padre di lui che è contrario, perché dice "quella ha in testa sogni più grandi di questo buco di periferia, se ne andrà"!
                                                                Si parla anche di figli, lui ha già comprato in segreto un completino dell'Inter per quando arriverà il primo.
                                                                Però lei si fa sempre più silenziosa.
                                                                Lavora sempre di più.
                                                                Una sera lui le fa trovare una cenetta romantica, una cosa semplice perché fa cagare a cucinare ma ci ha provato.
                                                                E quando le chiede se va tutto bene, lei risponde di no.
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "angry")}:                 No.
                                                
            - else:
            {charTag(ThirdCharacter, "melanchonic")}:           No.
        }                                                                                  
                                                                E lei lo riempie di cazzate.
        //Check parolacce da parte di Mentore
            ~ fifthChar_slurDetectorFunction()                                                        
                                                                Dice che da quando vivono assieme è lei che deve fare tutto in casa e lui non muove un dito.
                                                                E che lei non può sapere cosa vuole perché non ha mai avuto una vita sua perché è stato lui a crescerla, dice.
                                                                Perché conosce il mondo solo attraverso di lui.
                                                                Ma lei non vuole arrivare ai trent'anni senza sapere cosa vuole davvero, chi è davvero.
                                                                Lui le risponde che può occuparsi di più della casa, che può sistemare quelle cose che dice sempre che sistemerà ma poi non lo fa.
                                                                Lei gli prende le mani e gli dice "Ti voglio bene, davvero. Ma non posso sposarti solo perché sei l'unica cosa che conosco".
                                                                Lei se ne va da quella casa tre giorni dopo, e lui la aspetta.
                                                                La aspetta per un anno.
                                                                Prova a fare palestra.
                                                                Prende più ore in birreria per avere più soldi.
                                                                Le regala dei biglietti per New York, perché sa che è vero che hanno fatto tanti sacrifici, e che è giovane e vuole vedere il mondo.
                                                                Dentro, una dedica e una frase: "Ti aspetterò all'aeroporto quando tornerai, per chiederti di nuovo di sposarmi".
                                                                E lei gli rimanda indietro i biglietti scrivendogli un messaggio per dirgli che non deve aspettarla, né all'aeroporto né a casa.
                                                                Ma più.
                                                                E lui capisce che lei non se ne è andata perché deve scoprire sé stessa o robe del genere.
                                                                Ma perché lui sta invecchiando, non ha chissà quale giro di amici fighi, e non guadagna abbastanza.
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "angry")}:                 Alla fine lei stava solo cercando un nuovo cazzo, più giovane, più figo, più ricco.
            //Check parolacce da parte di Mentore
            ~ fifthChar_slurDetectorFunction()
                                                
            - else:
            {charTag(ThirdCharacter, "melanchonic")}:           Finisce così la storia di uno sfigato.
        } 
                                                            
        
            + \ {charTag(PG, "neutral")}:                       Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:                       Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                
            -
        {
            - are_two_entities_together(FirstCharacter, PG):
                3. **Qui se c’è in giro Chitarra non si trattiene, e ci rinfaccia alcuni tipi di risposte che possiamo dare.**
                4. Lui le risponde che è la sua storia, che in quel momento noi siamo lì per lui, e che non deve rompere le scatole, che lui non viene a fare commenti quando racconta delle sue paranoie sul lavoro o il moroso o Sborotalco.
        }

        {charTag(ThirdCharacter, "neutral")}:                   C'è qualcosa in questo posto, un po' ti fa venire da piangere
        {charTag(ThirdCharacter, "neutral")}:                   Alla fine comunque lui ha trovato qualcuno che la ama.
                                                                A volte le cose vanno in vacca solo per poter migliorare.
        {charTag(ThirdCharacter, "neutral")}:                   Ora che hai sentito qual è la cosa che ancora mi fa incazzare, immagino saprai anche come farmi uscire di qui.


            -> third_char_closing_storylet ->
            -> options_third_character

    = five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "angry")}:                 Da uomo a uomo: inizio a perdere la pazienza.
                                                
            - else:
            {charTag(ThirdCharacter, "neutral")}:               Sto iniziando a perdere la pazienza {player_name}.
        } 

        {charTag(ThirdCharacter, "neutral")}:                   {charNameFive} dice che io posso andarmene solo se mi riscrivi.
                                                                Che sono io a dirti che mi devi riscrivere.
                                                                Ma non riesco a chiedertelo, e secondo lei è perché non ho preso un punto importante.
                                                                Secondo me è colpa di qualcosa qui.
                                                                Mi avete drogato?
                                                                Vabbè, per ora reggiamo il gioco.
                                                                {charNameFive} dice che spesso i problemi sono in famiglia.
                                                                E magari c'ha pure ragione.
        {charTag(ThirdCharacter, "jester")}:                    Ora non ci crederai vedendo questo popo' di figo.
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "jester")}:                E non farti idee da frocio per favore!
                                                                                                                                
                                                
            - else:
            {charTag(ThirdCharacter, "neutral")}:               Figo e impegnato, ricordatelo {player_name}.
        }                                                    
                                                                Ma la mia famiglia è abbastanza sfigata.
                                                                Mia mamma era un dieci in realtà. ma è morta qualche anno fa.
                                                                Mia sorella Marta invece è una con una testa da otto ma un cuore da tre.
                                                                Un trattore.
                                                                Quando Dona mi ha lasciato mi ha aiutato a modo suo: passando le serate a insultarla.
                                                                Ammetto che quando si è sposata mi ha sorpreso perché ero sicuro fosse lesbica.
                                                                Anche se sta con uno che è abbastanza fragilino.
                                                                Lavora nel teatro, pensa te.
                                                                Chi ci va ancora a teatro?
                                                                Però forse è per questo che stanno bene assieme.
                                                                Le ho sempre voluto bene, e quando è nato l'Armando poche settimane fa ho sentito addosso tutta la voglia che ho di diventare papà.
                                                                Anche se non dice niente e piange metà del tempo, a volte ti caccia dei sorrisoni che ti svoltano la giornata.
        {//Blocco per reazioni e commenti legati al genere.
        
        - thirdChar_recordedPlayerPronoun == him:
        {charTag(ThirdCharacter, "neutral")}:                   Sarà un latin lover come lo zio, si-cu-ro!
                                                        
        - else:
        {charTag(ThirdCharacter, "neutral")}:                   È una cosa così bella che a volte mi viene da piangere.
        }                                                         
                                                                Ora tutta la famiglia gira attorno a mia sorella.
                                                                Anche la tipa di mio padre, che ha sempre un po' detestato Marta, sembra un'altra persona.
                                                                Gira che ti rigira alla fine alle donne basta avere un figlio e zac, vita risolta.
                                                                Papà la adorava già anche prima, ma papà è uno sfigato.
                                                                Uno che si è fatto sempre portare via tutto: la vecchia casa, il bar, la mamma.
                                                                Con lui non ci parlo da due anni.
                                                                Da quando mi ha detto di non sposare Dona.
                                                                Immagino che stia gongolando ora che le cose gli hanno dato ragione.
                                                                A volte viene in birreria, ma lo faccio sempre servire da qualcun altro.
        {//Blocco per reazioni e commenti legati al genere.
        
        - thirdChar_recordedPlayerPronoun == him:
        {charTag(ThirdCharacter, "neutral")}:                   Non ho voglia di essere associato a un tipo del genere, zero proprio.
                                                        
        - else:
        {charTag(ThirdCharacter, "neutral")}:                   Il rispetto è una cosa che va guadagnata, anche dal proprio figlio.
        }                                                                  
                                                            
        
            + \ {charTag(PG, "neutral")}:                       Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:                       Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                
            - 
        {charTag(ThirdCharacter, "neutral")}:                   Comunque la famiglia è una cosa strana, {player_name}.
                                                                Io non ci credo che ci possa essere tutto questo amore con qualcuno con cui cresci.
                                                                Vedi troppe brutte cose.

        {
        - are_two_entities_together(FirstCharacter, PG):
        {
        - grimoire_thirdChar has grimFirstThirdChar:
        {charTag(FirstCharacter, "annoyed")}:                   Commento infastidito di Chitarra.

        - else:
        {charTag(FirstCharacter, "neutral")}:                   Commento neutro/positivo di Chitarra.    
        }
        }  

            -> third_char_closing_storylet ->
            -> options_third_character
    

    = six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:                   Forse col Poggi qui saprei cosa dire per andarmene.
                                                                O per lo meno ci faremmo quattro risate in più.
                                                                Lui è quel tipo di amico che...
                                                                Uh.

        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "jester")}:                Quello con cui puoi parlare delle tipe ma anche fare un discorso serio, quel tipo di amico, hai presente?
                                                
            - else:
            {charTag(ThirdCharacter, "neutral")}:               Ai ragazzi non piace parlare troppo delle proprie faccende.
                                                                Però si può stare assieme e fare qualcosa tipo il calcio e magari nel mentre la dici anche la cosa seria.
                                                                E lui è quello a cui puoi dire la cosa seria.
                                                                E poi cazzeggiare.
                } 
        {charTag(ThirdCharacter, "neutral")}:                   L'ho conosciuto alle medie, e all'inizio lo odiavo.
                                                                Tutto pulitino e ordinato, un vero damerino.
                                                                Sua mamma era una che pensava di vivere a Parigi, quando c'aveva la casa attaccata alla tangenziale.
                                                                Un sei che si guarda così storta da convincersi di essere un nove.
        {//Blocco per reazioni e commenti legati al genere.
        - thirdChar_recordedPlayerPronoun == him:
        {charTag(ThirdCharacter, "neutral")}:                   Anche se da piccoli andavamo tutti a casa loro d'estate a guardarcela mentre se ne stava stesa nel giardino in costume.
                                                        
        - else:
        {charTag(ThirdCharacter, "neutral")}:                   suo padre invece era uno che lavorava tantissimo all'estero.
                                                                Ma in paese si diceva che in realtà aveva un'altra famiglia a Milano, e per quello lo si vedeva qui quasi solo i fine settimana.
        }                                                          
                                                                Con gli altri l'abbiamo menato un paio di volte, ma c'era qualcosa di orgoglioso in lui, e alla fine dopo il primo anno mi sono ritrovato a fare le pause con lui invece che con gli altri idioti con cui uscivo.
                                                                Lui e io abbiamo fatto anche le altre scuole assieme, persino i primi due anni di Ingegneria.
                                                                Anche se io volevo solo fare festa.
                                                                Diciamocelo: non posso essere <b>così</b> bono e pure intelligente, sennò chi le ferma più le tipe?
                                                                E lì la gente era troppo seria, non sai la rottura di balle.
                                                                Amanda l'ha conosciuta lì, e lei è tipo l'opposto dell'ingegnere, divertente come poche, ed è una che dà le paste a tutti.
                                                                È lei l'uomo di casa, e quando è nata Olivia il Poggi è stato felice di smollare il lavoro e fare il mammo.
                                                                Quelli del calcetto lo prendono in giro ancora, tranne Rocco, ma per me è una cosa proprio da Poggi.
                                                                Lui se ne frega delle cose che pensano gli altri.
        {//Blocco per reazioni e commenti legati al genere.
        - thirdChar_recordedPlayerPronoun == him:
        {charTag(ThirdCharacter, "neutral")}:                   E di cattiverie gliene sono state dette tante negli anni, ma davvero tante.
                                                        
        - else:
        {charTag(ThirdCharacter, "neutral")}:                   A me non è una cosa che viene così bene.
        }                                                          
                                                                A lui potevo dirgli tutte le mie merde.
                                                                Quando ho perso il lavoro, il lavoro buono, mi ha ascoltato per ore e questa cosa secondo me mi ha salvato.
                                                                Salvato da brutti pensieri.
                                                                Però ora che c'è Olivia, qualcosa si è raffreddato.
                                                                Non so dire cosa, all'inizio mi ha anche fatto fare da padrino al battesimo.
                                                                Forse gli pesa non avere un lavoro, raccontare solo della bambina.
                                                                O forse un po' gli faccio pena.
                                                                A volte me lo chiedo.
                                                                A calcetto a volte me le fanno le battute, sul fatto che Dona mi ha lasciato perché non mi tira abbastanza o perché faccio un lavoro da ragazzino.
                                                                So che il Poggi non è uno che ragiona così.
                                                                Però ha sempre trovato il tempo per fare cose assieme anche quando si è messo con Amanda, anche dopo il matrimonio.
                                                                Anche i primi due anni di Olivia.
                                                                Ma ora.
                                                                Nulla.
                                                                Anche quando è finita con Dona, giusto un paio di bevute assieme e basta.
                                                                E gli auguri per le feste e per il compleanno.
        {//Blocco per reazioni e commenti legati al genere.
        - thirdChar_recordedPlayerPronoun == him:
        {charTag(ThirdCharacter, "neutral")}:                   Alla fine siamo pieni di amici così, no?
                                                        
        - else:
        {charTag(ThirdCharacter, "neutral")}:                   Mi manca.
        }                                                          

        
            + \ {charTag(PG, "neutral")}:                       Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:                       Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                
            -
        {charTag(ThirdCharacter, "neutral")}:                   Comunque {player_name} io non ho altro da dirti.
                                                                Ho una vita semplice, magari non perfetta ma felice.
                                                                Per cui fai quella roba della riscrittura quando vuoi così posso tornare alla mia birra in frigo.
                                                                Sempre che non se la sia rubata di nuovo lo Stracciamaroni.
        {
        - are_two_entities_together(FirstCharacter, PG):
        {
        - grimoire_thirdChar has grimFirstThirdChar:
        {charTag(FirstCharacter, "annoyed")}:                   Commento infastidito di Chitarra.

        - else:
        {charTag(FirstCharacter, "neutral")}:                   Commento neutro/positivo di Chitarra.    
        }
        }  

            -> third_char_closing_storylet ->
            -> options_third_character
    


    ///Scelte legate alle lettere
    === third_char_letters_choices



    = one
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        

        + (air)\ {charTag(PG, "neutral")}:                      Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?

                
        + (earth)\ {charTag(PG, "neutral")}:                    Cosa ti renderà più stabile? Da quali fondamenta parti?
                

        + (fire)\ {charTag(PG, "neutral")}:                     Cosa vuoi? Come puoi cambiare questa situazione?
                

        + (water)\ {charTag(PG, "neutral")}:                    Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                

        + (aether)\ {charTag(PG, "neutral")}:                   Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                
        -

        ->->

    = two
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        

        + (air)\ {charTag(PG, "neutral")}:                      Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?

                
        + (earth)\ {charTag(PG, "neutral")}:                    Cosa ti renderà più stabile? Da quali fondamenta parti?
                

        + (fire)\ {charTag(PG, "neutral")}:                     Cosa vuoi? Come puoi cambiare questa situazione?
                

        + (water)\ {charTag(PG, "neutral")}:                    Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                

        + (aether)\ {charTag(PG, "neutral")}:                   Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                
        -

        ->->

    = three
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        
        + (air)\ {charTag(PG, "neutral")}:                      Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?

                
        + (earth)\ {charTag(PG, "neutral")}:                    Cosa ti renderà più stabile? Da quali fondamenta parti?
                

        + (fire)\ {charTag(PG, "neutral")}:                     Cosa vuoi? Come puoi cambiare questa situazione?
                

        + (water)\ {charTag(PG, "neutral")}:                    Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                

        + (aether)\ {charTag(PG, "neutral")}:                   Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                
        -

        ->->


    = four
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)


        + (air)\ {charTag(PG, "neutral")}:                      Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?

                
        + (earth)\ {charTag(PG, "neutral")}:                    Cosa ti renderà più stabile? Da quali fondamenta parti?
                

        + (fire)\ {charTag(PG, "neutral")}:                     Cosa vuoi? Come puoi cambiare questa situazione?
                

        + (water)\ {charTag(PG, "neutral")}:                    Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                

        + (aether)\ {charTag(PG, "neutral")}:                   Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                
        -

        ->->


    = five
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        

        + (air)\ {charTag(PG, "neutral")}:                      Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?

                
        + (earth)\ {charTag(PG, "neutral")}:                    Cosa ti renderà più stabile? Da quali fondamenta parti?
                

        + (fire)\ {charTag(PG, "neutral")}:                     Cosa vuoi? Come puoi cambiare questa situazione?
                

        + (water)\ {charTag(PG, "neutral")}:                    Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                

        + (aether)\ {charTag(PG, "neutral")}:                   Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                
        -

        ->->

    = six
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        

        + (air)\ {charTag(PG, "neutral")}:                      Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?

                
        + (earth)\ {charTag(PG, "neutral")}:                    Cosa ti renderà più stabile? Da quali fondamenta parti?
                

        + (fire)\ {charTag(PG, "neutral")}:                     Cosa vuoi? Come puoi cambiare questa situazione?
                

        + (water)\ {charTag(PG, "neutral")}:                    Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                

        + (aether)\ {charTag(PG, "neutral")}:                   Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                
        -

        ->->

    = seven
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        //Seconda riscrittura
        -> second_rewriting ->
        ->->