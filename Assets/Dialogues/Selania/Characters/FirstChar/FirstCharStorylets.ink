=== first_char_main_storylets

    = one
        //Riferimenti per la riscrittura: poco poco affetti.
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
        Ehi, ciao!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Non è che hai visto in giro la versione umana di un pettirosso?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Una persona rossiccia, morbidosa e che sembra sempre un po’ pissata?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
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
        //Riferimenti per la riscrittura: poco poco musica.
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
        //Riferimenti per la riscrittura: affetti e far del bene, scopo più grande
        //Reference musicale: Patricia di Florence + the Machine
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
        //Riferimenti per la riscrittura: avere uno scopo
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
        //Riferimenti per la riscrittura: relazioni, forse un po' di rinuncia.
        //Reference musicale: All your gold di Bat for Lashes
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
        Prima mi sono tuffata nello stagno.
        Avevo bisogno di fare qualcosa di diverso.
        Mi aspettavo qualcosa di freddo e schifoso, e invece l’acqua era tiepida, quasi avvolgente.
        Mi ha fatto sentire così al sicuro, vulnerabile in modo piacevole.
        Mi ha fatto pensare a cosa significhi “casa”.
        Quella dove vivo è una catapecchia piena di muffa, ma adoro le mie coinquiline.
        UItimamente però il continuo ricambio di coinqui e le tracce di chi se ne è andata riempie lo spazio di fantasmi, e mi fa sentire precaria.
        Poi c’è la casa dei miei.
        Continuo a dire “torno a casa” quando scendo a trovarli, ma a dire il vero è il posto che mi ricorda cosa voglio costruire, ma non quello che voglio abitare.
        E poi c’è Ennio.
        In questi anni mi sono chiesta se Ennio possa essere la mia casa, il mio rifugio.
        Quando l’ho conosciuto non avrei mai pensato che ci saremmo messi assieme.
        È così solido. Ama il suo lavoro, è quasi pedante nel rispettare i suoi ritmi.
        Non è una persona che ti fa sdraiare in mezzo a una piazza, ma più uno da sabato a fare la spesa.
        Ho iniziato a frequentarlo perché pensavo che una persona così solida mi avrebbe permesso di sperimentarmi tantissimo.
        Avrei potuto fare qualsiasi cazzata, sicura di avere una persona a cui tornare.
        Col tempo però anche io ho smesso di svolazzare.
        E non so se è perché sto crescendo, o se perché il suo peso mi tiene a terra.
        Secondo te una relazione ci cambia? O ci mostra chi siamo davvero?
        
        //Risposte
        
            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->
            
            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->
                
            + [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->
                
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->  
                    
            + [Risposta viola.]
                //Qualcosa sull'idea che la relazione è una cosa terza, e che esalata alcuni aspetti di noi a scapito di altri.
                -> color_variation_management(FirstCharacter, purpleC)->
            - 
        
        Una settimana fa mi ha chiesto di andare a convivere.
        Ho risposto subito di sì, presa dall’entusiasmo.
        Ma non so se è davvero ciò che voglio.
             
                -> first_char_closing_storylet ->
                -> options_first_character
        
    = six
        //Riferimenti per la riscrittura: scopo più grande
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
        Comunque amo vivere con le mie ragazze.
        Ah, sì, scusa, sto tornando sul pippone delle case di prima.
        Ma continuo a pensarci, anche perché ho paura che pensi che sono fredda riguardo ad andare a vivere con Ennio.
        È che dove sto ora non è solo una casa, per nulla, ed è la cosa più figa.
        Ormai la chiamano “La Rifugia”.
        All’inizio era solo una battuta perché avevamo sempre ospiti in giro per casa, gente che cercava un appoggio o era nei casini.
        Ma a forza di ripetere la battuta ci siamo dette: ma se facessimo qualcosa di buono?
        Da una parte cerchiamo a sgamo di offrire un posto temporaneo a chi è nella cacca.
        Cosa sempre più pesante con la crisi abitativa e il caro affitti.
        Dall’altra facciamo incontri informativi con le associazioni di tutela dei coinquilini, con associazioni migranti e altre realtà.
        E lo so che dirai “blah blah blah” che palle, ma ti giuro che è tutto così vivo.
        La cosa più viva delle mie giornate.
        Organizziamo raccolte fondi, e abbiamo fatto una mostra e delle proteste sotto al comune.
        La mostra è stata un’idea di Valeria, la mia bestie in casa, nonché la nostra cantante, perché abbiamo una band assieme.
        All’inizio la usavamo solo per sfogarci e raccattare qualche soldino.
        Ma poi le storie che sentivamo nella rifugia, e le lotte dell’associazione e di altre realtà hanno iniziato a infilarsi nei testi.
        Ed è una cosa strana scrivere robe politiche, perché diventa difficile mantenere la poesia.
        Abbiamo mille modi di parlare d’amore, ma i problemi reali sembrano sempre didascalici.
        Eppure sono convinta che l’arte possa fare tanto per cambiare il mondo.
        Perché i fatti sono freddi, e l’arte può renderli pieni di calore.
        Puoi tipo raccontare tutti i femminicidi del mondo e un uomo smonterà ogni dato e movente.
        Oppure scrivere “*Un violador en tu camino”* e riempire una piazza di forza e rabbia.
        Suonerà arrogante, ma vorrei per una volta creare qualcosa di altrettanto forte.
        Qualcosa che sia potente e inappellabile.
        Qualcosa che salvi il mondo.
        
        //In una delle opzioni resti in silenzio. Oppure resti in cinque modi diversi di silenzio?
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->  
                    
            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
        
            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->
            
            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->
    
                
            + [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->
            -    
        A volte mi chiedo se non abbia senso lasciare il lavoro, rischiare tutto, e dedicarmi solo alla musica.
        Non più per fama e concerti, ma per fare del bene.
             
                -> first_char_closing_storylet ->
                -> options_first_character
        
    = seven
        //Riferimenti per la riscrittura: affetti
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
        //Riferimenti per la riscrittura: mediocrità e fallimento, un poco "affetti"
        //Brano: Back in Town, Florence + The Machine.
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
        
        Tornare dai miei è come un viaggio nel tempo.
        Scendo, e mi sembra che tutto sia fermo, e questa cosa è rassicurante.
        Ma passano i giorni e mi rendo conto della bugia.
        Chi sta via pensa sempre che il posto che lascia sia immutabile, che non cambino le persone che ama.
        Ma quei cambiamenti arrivano spesso tra le righe.
        Come quando scopri che un amico di famiglia non c’è più, o che c’è una discussione tra i fratelli di tuo padre che va avanti da due anni e non ne sapevi nulla.
        Alcune delle amiche che sono tornate a vivere giù hanno trovato un altro modo di far parte di quel cambiamento.
        Anna, che studiava jazz, ha tirato su assieme ad altre persone un piccolo festival locale che sta iniziando a ingranare.
        E Luigia, una ex di Valeria, ora si occupa di recupero e decolonizzazione della storia del suo paesino sul Coghinas.
        Altre, che qui facevano occupazioni e proteste e litigavano con la polizia, ora sono sposate e raccontano vite che.
        Io.
        Tornare giù è un’opzione.
        Voglio molto bene ai miei.
        Conosco poche ragazze che possono dire “Scendo a casa e son felice di ubriacarmi con mio padre”.
        Farmi salire e studiare è stato uno sforzo enorme per loro.
        Tornare è come dire “Ok, ho sbagliato tutto”.
        E ho paura di finire in quell’alveo.
        Quello delle amiche sposate.
        Non è un crimine contro l’umanità, sia chiaro.
        Ma so anche che a volte sono la persona che il contesto mi permette di essere.
        E mi piace la persona che sono ora.
        Ma non so se mi piacerebbe la persona che sarei tornando dai miei.
        Credi abbia senso?
        
        //Risposte
            
            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->  
            
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->
            
            + [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->  
            
            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->    
                    
            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
            
            -    

            -> first_char_closing_storylet ->
            -> options_first_character
    
    = nine
        //Riferimenti per la riscrittura: forse il "fare qualcosa di buono", ma ha a che fare molto con la creatività.
        //Brano: Third Eye, Florence + The Machine.
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
        
        Ciao {player_name}, e {player_pronouns has him:benvenuto|{player_pronouns has her:benvenuta|benvenutə}} in un nuovo flusso di coscienza di {charNameOne} che non si chiama {charNameOne} e che prima o poi troverà il suo vero nome.
        E forse ci sto prendendo gusto con questi pipponi.
        Mi ricordano quando arriva l’insonnia.
        Forse mi piace solo perché è una cosa che mi accade di rado.
        E a volte si traduce in un rigirarsi nel letto guardando il cellulare, scorrendo video e articoli che ti dicono che il mondo è fottuto.
        E può essere stupido addormentarsi con queste cose, ma boh, forse sapere che non puoi fare nulla è più rassicurante che sapere che puoi fare qualcosa ma non sai cosa.
        Ma queste conversazioni con te sono più come l’altra cosa che faccio quando mi viene l’insonnia.
        Mi alzo, e vado in cucina.
        La cucina a casa è sempre piena di vita, abbiamo persone o ospiti praticamente da pranzo a notte fonda.
        Ma averla per me, sapendo che tutto dorme, mi offre una pace piena.
        E i brani migliori li ho scritti in quelle situazioni.
        Caffeino e quaderno, mi piace un sacco comporre andando a sentimento prima ancora di mettermi sulla tastiera.
        Ci sono momenti in cui qualcosa clicca, e allora so che ho preso una buona idea.
        E non ha a che fare col razionale, no.
        Ma è un ritrovarsi i piedi in un’acqua antica.
        Che raccoglie tutte le storie del mondo.
        E allora sento che anche se uso parole di oggi e suoni di oggi sto parlando del sempre.
        Di un certo tipo di sempre.
        E allora quella roba può far qualcosa di buono, di davvero buono.
        Ci arrivo sempre più di rado in quell’acqua.
        L’insonnia ha più a che fare ora con la paura di perdere il lavoro, col chiedermi cosa accadrà poi.
        Mi fa una paura pratica e spaventosa.
        Mi fa sentire minacciata.
        Però a volte torno a immergermi, e a quel punto non ho paura.
        Non perché sono coraggiosa o che di punto in bianco.
        Ma perché ho la sensazione che anche questi problemi, tutti i problemi, siano parte di quell’enorme storia.
        E sono cose che abbiamo già affrontato miliardi di volte.
        Eppure siamo ancora qui.
        E c’è ancora speranza.
            
            
            + [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->  
            
            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->    
                    
            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
            
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->
            
            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->  

            -
            
            -> first_char_closing_storylet ->
            -> options_first_character 
    
    
    = ten
        //Riferimenti per la riscrittura: affetti e rinunce
        //Reference musicale: And Love/No Choir di Florence + the Machine
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
        Sai, {player_name}, l’amore non è come me l’aspettavo.
        Ho avuto qualche altra relazione prima di Ennio, ma quando gli ho detto “Ti amo”, è stato diverso dalle altre volte.
        Aveva proprio un altro sapore in bocca, non di entusiasmo ma di promessa.
        I primi mesi sono stati strani: è il fratello di Valeria, e boh, eravamo convinti che si sarebbe arrabbiata.
        Viverci di nascosto ha reso le cose complicate ma anche, beh, eccitanti.
        E il giorno in cui Valeria ci ha detto che era felice per noi, il “ti amo” ha cambiato di nuovo sapore.
        Come pane caldo, una cosa buona e quotidiana.
        C’è più silenzio ora, quando stiamo assieme.
        Non mi serve riempire gli spazi di cose intelligenti per paura che lui si annoi.
        A volte lo osservo giocare al PC mentre coccolo i suoi gatti.
        Ci sono sere in cui parlo più col suo coinquilino che con lui.
        E il sesso è una coperta calda e non più una spiaggia torrida.
        Qualcosa che rassicura, che fa dormire bene.
        Non so come guardare a tutto questo.
        Un po’ come quando sei su un treno in stazione, e ne hai un altro fuori dal finestrino.
        E tu guardi fuori e c’è movimento ma non riesci a capire se stai riprendendo a viaggiare, o se è l’altro treno a spostarsi.
        Ultimamente Ennio è più insofferente, sente il bisogno di passare più tempo assieme.
        Credo che sia per questo che mi ha chiesto di andare a convivere.
        Non mi dice mai “rinuncia a qualcosa per stare con me”.
        Ma è lì, negli sbuffi quando gli dico che quel fine settimana ho un concerto.
        O che farò tardi perché siamo a una protesta.
        Sono mesi che non viene a vedere le cose che facciamo con la Rifugia.
        Per dargli più tempo non posso di certo smollare il lavoro, c’è solo una cosa che posso togliere dalla mia vita.
        E a quel punto, ripartirà mai il treno dalla mia stazione?
        //Risposte
            
            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->
            
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->  
                    
            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
            
            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->    
            
            + [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->    
            -    
            
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
        
        C’è questa cosa che mi stupisce sempre.
        Puoi passare anni con una persona, vederla quasi tutti i giorni.
        Studiarci, farci balotta.
        Poi cambierà città e a quel punto vi sentirete di rado o mai.
        Da una parte è bello quando ci si ritrova, perché ci si sente a casa.
        Dall’altra, questa cosa è vera solo fino a quando non accade qualcosa di grosso, come un matrimonio, come l’avere figli.
        Una cosa che non mi aspettavo della vita adulta, è di poter dimenticare le altre persone.
        Mi fa sentire una merda.
        Ma ti svegli, vai a lavoro, torni, cerchi di tenere in piedi le relazioni che hai qui, di lavarti e dormire, di prenderti cura dei tuoi interessi.
        E ti dici “Cazzo, devo scrivere a Cristina” oppure il calendario ti ricorda che è il compleanno di Stefano.
        E allora magari vi sentite per uno, due giorni ma poi gli audio rimangono lì appesi.
        E un po’ ti senti una merda, ti senti in colpa, e alla fine non scrivi fino a quando non riaccade qualcosa che sia una scusa per farlo.
        Molte delle ame che sono tornare al Sud sono diventate “amiche da ricorrenza”.
        E forse c’è questa cosa che mi spaventa, all’idea di scegliere di andare da Talco, o di finire per tornare dai miei.
        Di diventare anche per Valeria e le altre ragazze, per le colleghe, una “amica da ricorrenza”.
        Per non parlare di Ennio.
        Credo che mi lascerebbe prima.
        E non è solo questo.
        Vedo le colleghe più grandi, e la difficoltà che hanno a fare nuove amicizie.
        Il senso di mancanza che si sente mentre parlano di persone che non vedono quasi più.
        Mi sembra che più si è grandi, più si finisce per essere soli.
        E io non voglio stare sola.
        Ha senso?
        
        //Risposte
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->
                
             + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->    
                    
            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
             
            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)-> 
                
            + [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->     
            -
        Dopo il nostro primo litigio, Talco mi ha detto che una buona relazione è una relazione scomoda.
        Che abbiamo delle teste pigre, e che le relazioni sane ci fanno uscire dalla pigrizia.
        Forse allora il problema della distanza è che può diventare una scusa per abbracciare quella pigrizia.
        Mentre nei rapporti di tutti i giorni questa cosa non la puoi evitare.
        Ha senso?
            -> first_char_closing_storylet ->
            -> options_first_character
            
    = twelve
        //Riferimenti per la riscrittura: sentirsi mediocre
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
        Sai perché litigo tantissimo coi miei?
        È perché dicono che non so mai accontentarmi.
        Detto da quelli che mi hanno spedito in quell’inferno di ipercompetitività che il Conservatorio.
        Per fortuna li ho scagati e non ho fatto classica o a quest’ora starei avvelenando gente per un assolo alla Carnegie Hall.
        Ma la cosa che mi ferisce è che dicono che sono pretenziosa, quando invece quello che continuo a pensare è di non essere abbastanza.
        Di non essere all’altezza.
        Se c’è un’ultima cosa da ammettere con te, qualcosa che mi dia a speranza di uscire da qui, è questa:
        la persona che sono non è all’altezza delle mie aspettative.
        Prendi le relazioni: non sono stata capace di tenermi vicina la persona a cui voglio più bene.
        E non so godermi la solidità che mi regala Ennio.
        Ma la cosa peggiore è tutta la roba che dico quando parlo di attivismo e della Rifugia e le canzoni che scrivo.
        Perché sai qual è il sentimento che provo più spesso?
        Invidia.
        Quando scrollo su IG e vedo vecchie compagne del conservatorio avere successo, mi rode il culo.
        Quando le vedo a fare viaggi fighi con tizi fighi e senza la paura di perdere la casa, senza dover fare lavori di merda, muoio dentro.
        Dio, darei tutto a volte per la loro vita.
        E so che non è vero, non è vero fino in fondo.
        So che in un certo senso quella roba è parte di un problema più grande.
        Lo so, ma non lo “capisco” davvero.
        Non lo sento fino in fondo.
        Vorrei solo essere loro, a volte.
        Provare per una volta un po’ di pace, di sicurezza economica.
        Forse anche di riconoscimento sociale.
        Sono una merda, {player_name}, vero?
        Una delusione.
        
        + [Risposta rossa.]
            -> color_variation_management(FirstCharacter, redC)->  
                
        + [Risposta blu.]
            -> color_variation_management(FirstCharacter, blueC)->
        
        + [Risposta gialla.]
            -> color_variation_management(FirstCharacter, yellowC)->
        
        + [Risposta verde.]
            -> color_variation_management(FirstCharacter, greenC)->     
            
        + [Sei responsabile di ciò che fai, non ciò che provi.]
            -> color_variation_management(FirstCharacter, purpleC)->
    
        -     

            -> first_char_closing_storylet ->
            -> options_first_character