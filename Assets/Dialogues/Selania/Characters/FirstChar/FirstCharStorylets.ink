=== first_char_main_storylets

    = one
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
        Ehi, ciao!
        Non è che hai visto in giro la versione umana di un pettirosso?
        Una persona rossiccia, morbidosa e che sembra sempre un po’ pissata?
        Si chiama Talco e parla solo di Florence and the Machine.
        Anzi, *parlava* solo di Florence.
        Poi c’è stata quell’altra roba.
        Insomma: l’hai vistə?
        
            //Risposte, di cui una diversa a seconda che abbiamo incontrato o meno Mentore.
            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
            
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->
    
            + {not welcome} [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->
            
            + {welcome} [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->    
                 
            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->

            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->
            
            -
        
        Merda, Talco sa sempre come tirarmi fuori dai casini!
        E avevo giurato ad Ennio che non sarebbero più successe cose strane.
        Per la cronaca Ennio è diciamo il mio ragazzo, mentre Talco è lə miə amə.
        Ma perché te lo sto dicendo?
        Non è che ho preso dei funghi e manco me ne sono resa conto?
        Come con quel risotto allucinogeno dopo l’esame di composizione.
        Che giornatona assurda quella!
        Ma manco mi sono presentata!
        Mi chiamo {charNameOne}.
            - (firstPresentation)
        
        No no aspetta io sono <b><i>{charNameOne}</b></i>.
        Ehi! Non è mica questo il mio nome!
        <i>{charNameOne}</i>.
        Se lo dico al contrario?
        Arratihc.
        Uh.
        Prova tu.
        Come ti chiami?
        
            + {name_choice} [Mi chiamo {player_name}.]
            + [Il mio nome è...]
                -> name_choice ->
                -> gender ->
            -

        {player_pronouns has her:Anche io uso i pronomi femminili!|Invece io uso i femminili.}
        Anche se continuo a non chiamarmi {charNameOne}.
        Ora: la cosa più sensata è pensare che tutto questo sia un’allucinazione.
        O forse mi sono di nuovo addormentata a lavoro e sto sognando.
        Merda, il capo mi farà il culo.
        Quindi, {player_name}, qual è il messaggio nascosto di questo trip o sogno o quel che è?
        Datti da fare con tutte le tue cose da inconscio, così mi sveglio o ripiglio e vedo di non mandare a puttane il lavoro o relazione.
        O entrambe.
        
            //Risposte, di cui una diversa se ho parlato o meno con Mentore.
            + {not welcome} [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->
            
            + {welcome} [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->
            
            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->
                
            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
            
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->    
                 
            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->
            -
            
        ~ move_entity(Mentor, TrainStop)
        
        {
            - not welcome:
            (Mentore) Vi chiedo scusa, non avrei voluto origliare, ma volevo dirvi che non siete in un sogno, e che posso aiutarvi.
            Tu, {player_name}, quando puoi parlami, e ti spiegherò un po’ di cose.
            
            - else:
            (Mentore) Scusatemi, non avrei voluto origliare, ma ci tenevo a dirti che no, non sei in un sogno {charNameOne}, ma {player_name} può davvero aiutarti.
            E {player_name}, ci sono altre cose che posso spiegarti in più rispetto al solo “vai e parla con qualcunx”.
        }
        
        Ooook.
        Ok.
        Un fiore parlante.
        Quindi è un trip.
        Devo idratarmi.
        Devo assolutamente idratarmi.
        
            ~ move_entity(FirstCharacter, Pond)
            ~ move_entity(FirstRecap, BookPlace)
            
            -> first_char_closing_storylet ->
            -> options_first_character
        

    
    = two
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }  
            
        {player_name}, ma hai sentito che silenzio che c’è in questo posto?
        Non silenzio silenzio tipo vuoto nello spazio.
        Anche perché ci sono animaletti e insetti e tutto il resto che fanno un sacco di casino.
        Ma mi sento la testa libera.
        Riesco ad ascoltare i miei pensieri.
        E le canzoncine della pubblicità ancorate nel mio cervello.
        O magari è perché prima ho preso una botta assurda contro il vetro della serra e mi sono resettata?
        Ma il male mi ha fatto capire che questa non è un’allucinazione o un sogno.
        E invece di essere preoccupata vorrei solo stendermi a riposare.
        Mi spiace giusto perché le mie coinquiline saranno preoccupate.
        E a lavoro saranno incazzati a bestia.
        Sempre che non sia una di quelle situazioni in cui il tempo qui passa velocissimo e nel mondo reale zero.
        Magari mi metto a recuperare il sonno arretrato.
        Forse vorrei giusto avere la mia tastiera, e le ragazze della band perché ho voglia di creare qualcosa di nuovo.
        Sono settimane che non ho le energie per creare un pezzo che uno, un accenno di melodia.
        Ma tu che idea ti sei {player_pronouns has him:fatto|{player_pronouns has her:fatta|fattə}}. di questo posto?
        
        //Risposte, di cui una diversa se ho parlato o meno con Mentore.
                
            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->
            
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->  
                
            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
                
            + {not welcome} [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->
            
            + {welcome} [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->

            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->
            -
        
        Sai {player_name}: mi spiace che Talco non sia qui ma son felice di non essere sola.
        Potrebbe piacermi la tua compagnia.
                 
            -> first_char_closing_storylet ->
            -> options_first_character 
        
    = three
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
    
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }    
        
        Ehi {player_name}!
        Prima ho parlato con {mentorName} che mi ha spiegato che sei qui per aiutarmi.
        Dice che c’è qualcosa che mi blocca.
        E che quando mi fiderò di te potrò chiederti aiuto e sbloccarmi e tornare a casa.
        Tipo una versione di D&D con le quest scritte da un emo.
        Stavo per dirle: guarda ama, mi fido già di {player_name}!
        Sono un labrador e mi fido sempre di tutte le persone che incontro!
        Poi ho pensato che non è vero.
        E che se sei davvero qui per aiutarmi, posso tirarti un piccolo pippone.
        Così ci conosciamo meglio.
        No, non è un vero pippone.
        Ma mi sono chiesta cosa sia la fiducia.
        E se fosse un tema, uno di quelli delle medie tipo “Parla della persona di cui ti fidi di più”, sarebbe un tema su Talco.
        Si dice spesso “cosa x mi ha salvato la vita”, e ho creduto per un sacco che fosse una cazzata.
        Pensavo che niente salvasse nessunə.
        Poi ho conosciuto Talco.
        Abbiamo iniziato il Conservatorio assieme, ma ləi l’ha lasciato dopo un anno.
        Credo abbia litigato con tutti i professori.
        Talco non sopporta le regole che non hanno senso, e il Conservatorio ne è pieno.
        Non so se l’avevi già capito {player_name}, ma sono una persona che si tira un sacco di film in testa.
        E quando ho incontrato Talco, ero bloccata in un brutto film che durava dalla fine del liceo.
        E ləi mi ha buttato nel mondo.
        Non con quelle cagate tipo “cammina nel verde e vedrai che passa tutto”.
        Ma mi ha fatto fare cose piccole che mi hanno aperto un mondo.
        Come quando ci siamo stes3 in piazza per vedere come le persone reagivano.
        O quando abbiamo finto di intervistare persone anziane per farle sentire ascoltate.
        O tutte le volte che davanti a una cosa ingiusta ha detto “no”!
        Mi ha fatto capire che per me è importante fare qualcosa di utile per il mondo.
        E che mi piace quando posso farlo con le altre persone.
        Mi piace stare con le persone.
        Io non so se sono bloccata in qualcosa, come dice {mentorName}.
        Ma forse è vero che in qualche modo non mi muovo nella mia vita da un po’.
        Con Talco mi sono messa in situazioni strane perché mi fidavo di lei.
        E mi chiedevo: secondo te, cosa vuol dire fidarsi?
        
        //Risposte
            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->
                
            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
            
            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->
            
            + [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->
            
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->  
                
            -
        Mi manca, Talco.
        Mi spiace per come le cose siano cambiate.    
             
                -> first_char_closing_storylet ->
                -> options_first_character
        
    
    = four
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }
        
        Da qualche mese lavoro in un ristorante.
        Così, per iniziare le conversazioni a cavolo.
        Comunque, {player_name}: lavoro in un ristornante.
        Uno di quelli da catena, che si gasano perché hanno la sede sia a Buco di Culo Lombardo che a Pechino.
        Come puoi immaginare, non era quello che mi aspettavo dopo il Conservatorio.
        Per un po’ sono riuscita a fare qualche lavoretto con il pianoforte, quasi sempre non pagato.
        Poi mio padre ha perso il lavoro, e mi ha detto: figlia, siamo nella merda.
        Tengo sempre un orecchio alzato per qualche commissione.
        Ma per lo più sono di sera o nel fine settimana, quando col cavolo che mi danno il giorno libero dal ristorante.
        Per fortuna ci sono le prove con la band.
        Quando ho le energie per farle.
        Lavorare al ristorante è una merda, ma il rapporto con alcune colleghe è bello.
        Qualche settimana fa è venuto un dirigente di una compagnia petrolifera a mangiare.
        Una di quelle specializzate in greenwashing e che ti denunciano se solo racconti quello che fanno.
        Ci siamo rifiutate di servirlo.
        Il caposala era verde bestia, ma è stata la prima volta che mi son sentita viva a lavoro.
        Dire “no” è una cosa potentissima.
        Ed è stato bello farlo assieme.
        Da quel momento mi chiedo se possano esserci cose che mi diano uno scopo più ampio.
        A lavoro stiamo provando di nascosto a tirare su un gruppo sindacale.
        “Di nascosto”, perché coi contrattini precari da fame che ci ritroviamo fanno alla svelta a non rinnovarci.
        A volte temo siano energie sprecate.
        Altre, che dovrei fare qualcosa di più grande, che faccia meglio a più persone.
        Tu cosa ne pensi?
        
        //Risposte
        //Una di queste risposte genera un commento di Chitarra che ci racconta qualcosa simili imprenditore giochi Cortese come esempio tossico.

            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
            
            + [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->
            
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->  
                
            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->
                
            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->

            -    
        
        A prescindere, ci sono giornate in cui l’unica cosa che mi gasa è la rabbia nella chat ribelle.
        Gli insulti ai capoccia.
        Il tenere traccia di tutte le ingiustizie.
        La speranza di fargliele ripagare, un giorno o l’altro.
        
            -> first_char_closing_storylet ->
            -> options_first_character
            
    = five
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }
         
            -> first_char_closing_storylet ->
            -> options_first_character
        
    = six
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }
        
         
            -> first_char_closing_storylet ->
            -> options_first_character
        
    = seven
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }
        
        Ammettiamolo: ci sto girando attorno da un bel po’ ormai.
        Continuo a parlare al passato di Talco, l’avrai notato.
        Ed è perché non ci sentiamo da mesi.
        E ora ti racconterò il perché e tu mi giudicherai una stronza epocale, e me lo merito.
        Quindi.
        Un anno fa Talco mi scrive per propormi un aperitivo solo tra noi, “come ai vecchi tempi”.
        Tra lavori e fidanzati e il resto non ci vedevamo da molte settimane.
        Abbiamo trovato un incrocio coi calendari, e la sera che l’ho rivistə mi si è spalacanto il cuore.
        E tra una battuta e un lamento sul lavoro continuavo a pensare: e se riprendessimo in mano il vecchio progetto?
        E se andassimo a vivere tutt3 assieme in campagna?
        Talco, io, le ragazze del gruppo?
        Sicuro Ennio non apprezzerebbe molto, ma alla peggio potrebbe venire a trovarci nel fine settimana.
        Quando Talco mi ha detto “devo dirti qualcosa di importante”, ero già nel pieno del mio film.
        Mi ha preso la mano, tesə a bestia come non l’avevo mai vistə.
        “Aspetto un bambino”.
        E {player_name}, tutto è diventato grigio.
        Ci eravamo ripromess3 mille volte che non sarebbe successo.
        Niente figli, niente partner a frapporsi tra noi o cose del genere.
        E stava già succedendo comunque col lavoro e con Ennio e il suo Thomas ma cazzo, questa roba!
        Talco che diventa la prima persona che conosco a rimanere incintə.
        Non abbiamo manco trent’anni, cazzo!
        E l’ha visto, sulla mia faccia.
        Non ho detto nulla ma già aveva capito tutto.
        E non si è manco arrabbiatə**.**
        Mi ha solo detto che era un passo importante per ləi, perché anche se è una cosa inaspettata, ama Thomas, e sa che è l’uomo giusto.
        E poi, il colpo finale.
        “Vorrei trasferirmi da lui a Toronto. Qui non mi rimane nulla, nulla a parte te.”
        “E per questo, vorrei ti trasferissi con noi.”
        “Vorrei crescerla con te, questa creaturina. Con te e Thomas.”
        E…
        Dio, quanto vorrei del vino ora.
        Tu come ti saresti {player_pronouns has him:sentito|{player_pronouns has her:sentita|sentitə}} al mio posto?
        
        //Risposte.
                + [{player_pronouns has him:Tradito|{player_pronouns has her:Tradita|Traditə}}.]
                    -> color_variation_management(FirstCharacter, redC)->
                    
                    Uh.
                    Scusa per il sospirone.
                    Ma credo sia stata la prima emozione che mi ha colta.
                    E mi ha fatto un male boia, {player_name}.
                    Un male boia.
                    
                + [{player_pronouns has him:Incuriosito|{player_pronouns has her:Incuriosita|Incuriositə}} dall'idea di qualcosa di nuovo.]
                    -> color_variation_management(FirstCharacter, yellowC)->
                    
                    Qualcosa di nuovo con un tizio che ho visto tre volte.
                    In una città diversa in un altro continente.
                    Eppure.
                    Eppure anche qualcosa di diverso da tutto quello che avevo.
                    Dalla stasi della mia vita.
                    
                + [Felice di questa nuova famiglia con Talco.]
                    -> color_variation_management(FirstCharacter, greenC)->
                    
                    Sei una persona migliore di me allora, {player_name}.
                    Perché le emozioni che ho provato erano davvero tante, ma non felicità.
                    Per nessuna delle persone coinvolte.
                    E per questo mi sento una stronza.
                    Talco era felice di questa novità.
                    Io non son stata capace di essere felice per ləi.
                    
                + [Una situazione assurda può farmi conoscere cose assurde di me.]
                    -> color_variation_management(FirstCharacter, purpleC)->
                    
                    Possibile.
                    E la cosa più assurda sarebbe scoprire che è vero che non mi piacciono i bambini.
                    A migliaia di chilometri da tutto quello che conosco.
                    Col mio inglese terribile.
                    Dipendendo totalmente da una persona che deve prendersi cura di un infante.
                
                + [{player_pronouns has him:Confuso|{player_pronouns has her:Confusa|Confusə}} dall'assurdità di questa situazione.]
                    -> color_variation_management(FirstCharacter, blueC)->
                    
                    Non è assurda, non con Talco.
                    Ma confusione è una parola che mi ritorna, quando ripenso a quella sera.
                    Perché la quantità di cose che ho provato è stata immensa.
                
                -
        
        Quella sera ho scoperto che la persona in me che sa fare cose, le sa fare solo se sa che Talco è dalla sua parte.
        Un intero film mi è partito in testa.
        Una roba con Margherita Buy piena di solitudine abbandono e perdita.
        Ho lasciato il tavolo in silenzio, ho chiamato Ennio e l’ho raggiunto a casa sua.
        Abbiamo scopato senza preservativo, ma l’ho cacciato fuori di forza quando stava per venire.
        E poi ho pianto tutta la notte.
        Un mese dopo Talco è partitə, e non ci siamo più sentite fino a qualche settimana fa, quando mi ha mandato una cartolina.
        Una foto dellə bimbə.
        “Qualcuno aspetta un tuo abbraccio.”
        
            -> first_char_closing_storylet ->
            -> options_first_character          
    
    = eight
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }
       
           
            ~ book_BGVariations ++
            -> first_char_closing_storylet ->
            -> options_first_character
    
    = nine
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }
         

            -> first_char_closing_storylet ->
            -> options_first_character 
    = ten
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }
   
            
            -> first_char_closing_storylet ->
            -> options_first_character
    
    = eleven
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }

            -> first_char_closing_storylet ->
            -> options_first_character
            
    = twelve
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }
         

            -> first_char_closing_storylet ->
            -> options_first_character