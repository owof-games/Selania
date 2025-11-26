/* ---------------------------------

   Cucina con Chitarra

 ----------------------------------*/
=== pre_start_cooking_with_first_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
Quindi {player_name}, iniziamo a cucinare assieme? #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        
        + [Ci sto!]
            -> cooking_with_first_char
        
        + [Ci penso un attimo.]
            -> main
 

=== cooking_with_first_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    -> storage_colors(FirstCharacter)->
    -> cooking_animations_on ->

    Sai {charNameOne}, mentre cuciniamo potremmo parlare un po'.
    In particolare, ripensando alle nostre conversazioni, mi farebbe piacere parlare di più...
    
    - (top)    
        
        + [Dei rapporti che hai con le persone che ti sono care.]
                -> first_theme
                

        + [{first_char_main_storylets.six: Del bisogno di fare qualcosa che salvi il mondo.|<i>{player_name} deve parlare ancora con {charNameOne} per sbloccare questo tema.</i>}]
            {
                - first_char_main_storylets.six:
                    -> second_theme
                
                - else:
                    -> top
            }
        
        + [{first_char_main_storylets.nine: Del tuo rapporto con la creatività.|<i>{player_name} deve parlare ancora con {charNameOne} per sbloccare questo tema.</i>}]
            {
            
                - first_char_main_storylets.nine:
                    -> third_theme
                
                - else:
                    -> top
            }
            
        + [Sai, forse preferirei cucinare più tardi.]
            Nessun problema, prenditi i tuoi tempi {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            -> main


    
    = first_theme
        Uh, hai già capito che per me le relazioni sono abbastanza il centro di tutto.
        Vediamo, cosa ti posso raccontare?
        Da piccola in realtà ero abbastanza un disastro sociale.
        Timida a bestia, bullizzata perché in carne, e secchiona.
        Non la ragazzina più amata dalla scuola.
        Uh, aspetta che abbasso la fiamma.
        Meglio.
        Però a casa era un piccolo paradiso.
        I miei sono gente semplice, ma hanno sempre premiato la curiosità.
        Papà mi ha passato l'amore per la musica.
        Mamma quando canta ha una voce che scioglie ogni tensione.
        Ma è stato papà quello che mi regalava sempre qualcosina che faceva rumore.
        E appena è riuscito a risparmiare a sufficienza, mi ha dato lezioni di piano.
        Credo che i miei mi abbiano insegnato che le relazioni sono cura.
        E sacrificio.
        Credi abbia senso?
        
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -    
        No no taglio io, non ti preoccupare, continua a mischiare.
        Ma invece tu che rapporto hai coi tuoi genitori?
            {
                - not cooking_with_second_char: {player_name} prova a parlare, ma non escono le parole. Però gli ingredienti possono parlare per {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }
        {player_name} aggiunge alla ricetta... #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
            + [Dei cubetti di grano del rispetto.]
                ~ kitchen_recipeNoun = "Zuppa di grano"
                Uh, credo di capire.
                Il rispetto è una bella cosa coi genitori.
                Il trattarsi reciprocamente da adulti, giusto?
                Una forma di affetto.
               
            + [Delle striscioline di seitan malinconico.]
                ~ kitchen_recipeNoun = "Grigliata di seitan"
                Credo mi dispiaccia, vero?
                Insomma.
                Qualcosa che manca, che non è come dovrebbe essere.
                O che non è più.
                Mi spiace, {player_name}, davvero.
                
            + [Dei fagioli del conflitto.]
               ~ kitchen_recipeNoun = "Fagiolata"
               Non so se ti possa consolare, ma è una cosa comune.
               Molte delle mie amiche hanno un rapporto conflittuale coi genitori.
               Talco pensa sia un passaggio necessario per diventare adulti.
               Per questo mi chiamava "Cocca di papà".
        
            + [Delle cimette di broccolo della fiducia.]
                ~ kitchen_recipeNoun = "Cimetta di broccolo"
                Sento anche io questa cosa.
                Questa fiducia reciproca.
                Credo sia l'esito la cosa più bella da creare coi propri genitori.
                Un segno totale d'amore.
    
            + [Degli spicchi di aglio del distacco.]
                ~ kitchen_recipeNoun = "Crema d'aglio"
                Merda.
                Mi spiace {player_name}.
                Non so se ha senso, ma la distanza mi sembra peggio del litigio, del conflitto.
                Perché dal conflitto può nascere un cambiamento.
                Ed è comunque un rapporto.
                Insomma.
                Mi spiace, davvero.
            -  
        
        Dove ho messo il sale?
        Eccolo.
        Però anche se da piccola non avevo amicizie con persone della mia età, l'arrivo al nord ha cambiato tutto.
        È stato come poter ricominciare da capo.
        Nel giro di pochi mesi avevo il mio giro del Conservatorio.
        I primi mesi sono stati magnifici.
        Poi, dopo un anno ho scoperto una cosa: nei gruppi si litiga.
        E a una certa Luana, una ragazza del gruppo, si è allontanata.
        Quel tipo di rapporto per cui ci si saluta etc, ma non si parla più.
        Io.
        Boh.
        Credo sentissi il bisogno di chiarire, ma non sapevo come fare.
        Mi sembrava che farlo avrebbe significato tradire il gruppo, che invece si era più ancorato all'idea di lasciare cadere le cose.
        Anche se Luana si è comportata da stronza.
        Ha senso?
        
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        
        Buono comunque questo vino rosso.
        E tu cosa ti aspetti da un'amicizia, {player_name}?
        {player_name} aggiunge alla ricetta... #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
            + [Del pepe dell'onestà.]
                ~ kitchen_recipeAdjective = "onesta"
                Come Talco.
                Quel tipo di persona che se fai una cagata, te la dice.
               
            + [Della curcuma divertente.]
                ~ kitchen_recipeAdjective = "allegra"
                L'amicizia da balotta quindi.
                Da cazzeggio assieme.
                Da oasi nel casino del mondo.
             
            + [Del cumino empatico.]
               ~ kitchen_recipeAdjective = "empatica"
               Quel tipo di rapporto che ti fa sentire ascoltata.
               Capita.
               Dove puoi essere te stessa.
               Spero di essere quel tipo di amica, sai?
        
            + [Della cannella incondizionata.]
                ~ kitchen_recipeAdjective = "incondizionata"
                Posso capire, ma non mi piace tantissimo come idea.
                Mi piace che le amicizie ci siano anche nel conflitto.
                Non mi preoccupa che le amicizie finiscano.
                Mi preoccupa il come.
                Tipo se finisce la stima.
                Terribile.
    
            + [Dello zenzero leale.]
                ~ kitchen_recipeAdjective = "leale"
                Essere leali significa essere affidabili, vero?
                Quel tipo di persona che non va in giro a dire i tuoi segreti.
                E che cerca sempre di darti il consiglio giusto, non quello che le torna comodo.
            -      
        
        Aspè, aggiungo ancora del brodino.
        Ecco.
        Si stava addensando troppo.
        Ma il profumo è magnifico.
        Comunque, unpopular opinion che non è poi molto unpopular: non è che c'è tutta 'sta differenza tra amore romantico e amicizia.
        Credo che una parte di me veda il tizio che chiami "amore" solo come un amico con cui è anche bello scopare.
        E di certo non me la sento di dire che una persona viene prima dell'altra solo per questo tipo di cose.
        Tipo che Talco ed Ennio per me sono i miei due grandi amori.
        E forse mi contraddico con altre cose che ho detto ma è un casino perché quando parli devi parlare con il linguaggio di chi hai davanti.
        E non c'è molto linguaggio per dire queste cose.
        Quando ho detto "Ti amo" a Talco una volta, ubriaca, per un poco le cose si sono fatte strane.
        Perché dietro quella parola c'è una botta infinita di aspettative.
        Però per fortuna Talco è Talco e ne abbiamo parlato e ci siamo capit3.
        Ha senso vero?
        
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        
        Carini gli insetti ma vorrei non finissero nel nostro veganissimo piatto.
        Ecco, questo coperchio ci sta perfettamente.
        Così, a caldo.
        Una persona che ti piace ti dice "Ti amo". Qual è la prima sensazione che provi?
        {player_name} aggiunge alla ricetta... #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
            + [Una mestolata di brodo del terrore.]
                ~ kitchen_recipeComplement = "del terrore"
                Woah, {player_name}.
                Questa è intensa.
                Anche se effettivamente l'amore può far cagare addosso.
               
            + [Una grattuggiata di noce euforica.]
                ~ kitchen_recipeComplement = "dell'euforia"
                Mi risuona tanto.
                Detta dalla persona giusta è una parola che ti fa volare, vero?
             
            + [Una spolverata di semi dell'"io? no, no è possibile!".]
               ~ kitchen_recipeComplement = "dell'impossibile"
                Coff Coff.
                La sento.
                Madonna se la sento.
                Mi è successo anche con Ennio.
                E a volte mi succede ancora.
        
            + [Una cucchiata di olio lusingato.]
                ~ kitchen_recipeComplement = "della lusinga"
                Uh, a qualcuno piace quando il suo pelo viene lisciato, vero?
                Però non rischia di essere una cosa egoista?
                Più legata a come ti senti che al sentimento che provi per quella persona?
    
            + [Una manciata di peperoncini arrapati.]
                ~ kitchen_recipeComplement = "dell'arrapamento"
                Questa non me l'aspettavo, ma ci sta.
                Sentirsi amatə è indubbiamente sexy.
                Anni fa confondevo a manetta arrapamento e amore.
                Puoi immaginare i casini che ho combinato.
            -  
        
            -> fourth_ingredient_dispatcher
            
    
    = second_theme
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        Woah.
        Qui si va giù leggero.
        E forse "salvare il mondo" è pretenzioso da dire.
        Anche se so bene di averlo detto io.
        Credo.
        Perché poi, da cosa dovrei salvarlo?
        Nel senso: non sono una brava con le cose politiche.
        La Rifugia è nata perché c'è un bisogno che vedo: per vivere ci servono le case.
        Ma le case non ci sono.
        O meglio, ci sono, ma solo per far fare vacanze a persone che poi alla fin fine della tua città non gliene frega una ceppa.
        E quindi non so dire bene "salvare da cosa".
        Faccio fatica a usare le parole grandi.
        Patriarcato.
        Fascismo.
        Crisi climatica.
        Gaza, Darfur, genocidio.
        Sarebbe come mettermi in bocca concetti che non conosco bene.
        Ma anche se non so che nome dare alle cose, le vedo.
        E le voglio cambiare.
        Ha senso?
        
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -        
        
        Aspetta, ho visto delle forbici prima.
        Sempre che ci serva qualcosa da aprire o tagliuzzare.
        Comunque è una questione di futuro, no?
        Ora abbiamo alcune cose nel presente.
        Quelle cose ci fanno cagare.
        Non le vogliamo, o le vogliamo diverse nel futuro.
        Tu {player_name} sai che futuro vorresti avere?
        
            {
                - not cooking_with_second_char: {player_name} prova a parlare, ma non escono le parole. Però gli ingredienti possono parlare per {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }
            
            + [Infarino confusamente delle tagliatelle.]
                ~ kitchen_recipeNoun = "Tagliatelle"
                Già.
                Anche perché sembra sempre che puoi salvare una sola cosa alla volta.
                Anche se Valeria dice che non è vero, che le lotte son tutte collegate.
               
            + [Stendo con decisione delle lasagne.]
                ~ kitchen_recipeNoun = "Lasagne"
                Uh.
                Ha senso dire che ti invidio per questa tua chiarezza?
                Deve essere bello sapere dove si vuole andare.
             
            + [Affetto con disinteresse delle bruschette.]
               ~ kitchen_recipeNoun = "Bruschette"
               Quindi sei più del tipo "Vediamo dove andiamo?"
               Che ha senso magari a livello personale.
               Ma per le grandi cose, boh.
        
            + [Impasto furiosamente delle arancine.]
                ~ kitchen_recipeNoun = "Arancine"
               Immagino che la furia sia un modo per guardare a ciò che non va ora.
               A volte mi piacerebbe sapermi arrabbiare.
               Dovrei imparare da {charNameTwo}.
    
            + [Frullo disperatamente della vellutata.]
                ~ kitchen_recipeNoun = "Sostantivo E"
                È un sentimento.
                Non so se sia peggio la confusione o la disperazione.
                
            -  
       
        Mi sa che mi metto ad affettare qualcosa intanto.
        C'è una cosa che mi imbarazza tantissimo dire, ma.
        Di base non sono la persona più sicura del pianeta, lo so.
        Ma se c'è un motivo per cui non mi sento mai all'altezza sono i social.
        Anche dal vivo, anche ora, una parte di me ha in testa la voce di InfluTizia e TikTokerCoso che mi criticano per una parola sbagliata o che.
        Non si dice così ma cosà.
        E hai dimenticato questo.
        E questa cosa non è vera, l'ha detto Butler dieci minuti fa, dovevi saperlo.
        E.
        E insomma, ci sta.
        Si sta cercando di creare un mondo diverso ed è un bene non portarci dentro le cose che non vanno ora.
        Ma questo modo di fare mi fa sentire costantemente inadeguata.
        E una parte di me pensa che abbiamo il diritto anche di sbagliare.
        In generale, ma soprattutto in queste cose.
        Perché se dobbiamo andare verso futuri che ancora non esistono, sbagliare è inevitabile.
        E ci fa bene, no?
        Alla fine cose buonissime sono nate da errori.
        Come il gorgonzola.
        Dovremmo fare meno l3 poliziott3, e perdonarci di più.
        
            + [Serve del metodo. Se la base non è solida, crolla tutta la casa.]
                -> color_variation_management(FirstCharacter, blueC)->
                Ma se poi quella base non la costruisce nessunə, perché si perde lo slancio, il coraggio?
                Cosa ci abbiamo guadagnato?
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Dovremmo farci meno paranoie e agire di più.]
                -> color_variation_management(FirstCharacter, redC)->
                Non so.
                Fare per fare non porta molto lontano.
                O meglio: magari porta lontano.
                Ma senza sapere dove arriveremo.
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Quello che conta è cosa fai quando ti viene detto che hai sbagliato.]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        
        <i>Più gorgonzola, meno poliziott3.</i>
        Devo proporlo a Valeria.
        Aspetta, rimestolo un attimo.
        Ottimo.
        Comunque non te l'ho mai chiesto, {player_name}: tu ti senti una persona sicura?

            + [Aggiungo con convinzione delle prugne.]
                ~ kitchen_recipeAdjective = "convinte"
               
            + [Spolvero con titubanza del mais.]
                ~ kitchen_recipeAdjective = "titubanti"
             
            + [Affetto con autocontrollo delle zucchine.]
               ~ kitchen_recipeAdjective = "disciplinate"
        
            + [Spremo tempestosamente del chinotto.]
                ~ kitchen_recipeAdjective = "tempestose"
    
            + [Sminuzzo con consapevolezza della cipolla.]
                ~ kitchen_recipeAdjective = "consapevoli"
            -     
        {
            - (kitchen_storagePurple >  kitchen_storageYellow) && (kitchen_storagePurple >  kitchen_storageRed) && (kitchen_storagePurple >  kitchen_storageGreen) && (kitchen_storagePurple >  kitchen_storageBlue):
                Interessante.
                In queste conversazioni non so perché ma ti ho visto come una persona quasi spirituale.
                Più attenta al grande insieme delle cose.
                Mi dai l'idea di solidità, sai?

            - (kitchen_storageYellow >  kitchen_storagePurple) && (kitchen_storageYellow >  kitchen_storageRed) && (kitchen_storageYellow >  kitchen_storageGreen) && (kitchen_storageYellow >  kitchen_storageBlue):
                Interessante.
                In queste conversazioni non so perché ma ti ho visto come una persona giocosa.
                Una che trova il piacere, il bello nel mondo, anche quando non è facile.
                Credo ci voglia tanto equilibrio interiore per farlo.

            - (kitchen_storageRed >  kitchen_storageYellow) && (kitchen_storageRed >  kitchen_storagePurple) && (kitchen_storageRed >  kitchen_storageGreen) && (kitchen_storageRed >  kitchen_storageBlue):
                Interessante.
                In queste conversazioni non so perché ma ti ho visto come una persona molto attiva.
                Più interessata alle cose da fare che non ai grandi ragionamenti.
                Ammetto che associo questa cosa all'idea del chaddone tontolotto.
                Ma è un mio pregiudizio, lo so.

            - (kitchen_storageGreen >  kitchen_storageYellow) && (kitchen_storageGreen >  kitchen_storageRed) && (kitchen_storageGreen >  kitchen_storagePurple) && (kitchen_storageGreen >  kitchen_storageBlue):
                Interessante.
                In queste conversazioni non so perché ma ti ho visto come una persona molto legata alle emozioni.
                Ma a differenza mia, sembra che tu riesca a trovare la tua solidità in questo.

            - (kitchen_storageBlue >  kitchen_storageYellow) && (kitchen_storageBlue >  kitchen_storageRed) && (kitchen_storageBlue >  kitchen_storageGreen) && (kitchen_storageBlue >  kitchen_storagePurple):
                Interessante.
                In queste conversazioni non so perché ma ti ho visto come una persona molto razionale.
                Con uno sguardo analitico sul mondo.
                Nella mia testa questa roba è tipo finta sicurezza.
                Ha a che fare col controllo.
                Ma lo so, è un vizio tutto mio.

        }

        Madonna, che profumi che sta salendo.
        Faccio un brindisino a noi al volo.
        Ecco.
        Alla fine non sto rispondendo fino in fondo alla tua domanda o quello che.
        Ammazza se picchia questo vino.
        No no mescolo io, lascia pure.
        Sto imparando tanto da Valeria, sai?
        Talco è statə la persona che mi ha insegnato ad accogliere la creatività del caos.
        Valeria mi sta mostrando quanto si possa fare unit3.
        Ma non c'è solo quello: c'è un aspetto di piacere.
        Lei è sfavata quando vede i modi seriosi e pesanti di comunicare, di fare le cose.
        Crede che il cambiamento, la lotta debba essere piacevole.
        Perché sennò al primo problema, e ce ne sono sempre di problemi, finisci per smollare.
        Per questo abbiamo tirato su la band.
        E c'è anche un piacere più piccolo.
        Quello che provo quando vado a letto e so che un'altra persona ora sta meglio, anche grazie a me.
        A volte lo ritrovo anche nel lavoro.
        Come quando si vede che una ha avuto proprio una giornata di merda, e la fai uscire col sorriso.
        Ma non so come dire, non è merito del lavoro, è giusto per caso che vi siete trovate lì, perché passiamo una marea di tempo a lavorare.
        E a volte è quasi un incidente, perché gli obbiettivi dei capoccia sono diversi.
        Merda, mi sto perdendo, maledetto vino.
        Insomma: è bello lottare per le cose grandi.
        Ed è bello addormentarsi precarie e con i casini ma sapendo di aver portato un po' di gioia a una persona.
        Ha senso?

            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        
        Ancora due minuti e ci siamo ama.
        Madonna che fame!
        E visto che siamo alla fine, te la butto leggera: sei felice della vita che hai?
        Anzi no aspetta che sennò ci prende male di sicuro.
        Ti senti di star partecipando a qualcosa di più grande, di trasformativo, con le cose che fai?

            + [Trituro con gioia dell'anice stellato.]
                ~ kitchen_recipeComplement = "della gioia."
               
            + [Aggiungo {player_pronouns has him:pieno|{player_pronouns has her:piena|pienə}} di terrore esistenziale dell'origano.]
                ~ kitchen_recipeComplement = "del terrore esistenziale."
             
            + [Sbuccio titubante della vaniglia.]
               ~ kitchen_recipeComplement = "della titubanza."
        
            + [Tosto {player_pronouns has him:rassegnato|{player_pronouns has her:rassegnata|rassegnatə}} del coriandolo.]
                ~ kitchen_recipeComplement = "della rassegnazione."
    
            + [Caramello {player_pronouns has him:sopraffatto|{player_pronouns has her:sopraffatta|sopraffattə}} della salvia.]
                ~ kitchen_recipeComplement = "della sopraffazione."
            -  
        Che poi è una domanda stupida da farti, vero?
        Sei {player_pronouns has him:un riscrittore|{player_pronouns has her: una riscrittora|unə riscrittorə}}, e stai facendo un lavorone anche solo con me.
        Grazie per questo, {player_name}!

            -> fourth_ingredient_dispatcher
                
                
    
    = third_theme
        Il tema scelto è il numero tre.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra parla.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Possiamo fare una di queste cinque scelte.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -    
        A questo punto è chitarra a chiedere a noi qualcosa sul tema a, e noi e rispondiamo con un ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step uno: sostantivi (es: Patate, bellezza, calcestruzzo).#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            {
                - not cooking_with_second_char: Provi a parlare, ma non ti escono le parole. Però gli ingredienti possono parlare per te.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }
            + [Sostantivo A]
                ~ kitchen_recipeNoun = "Sostantivo A"
               
            + [Sostantivo B]
                ~ kitchen_recipeNoun = "Sostantivo B"
             
            + [Sostantivo C]
               ~ kitchen_recipeNoun = "Sostantivo C"
        
            + [Sostantivo D]
                ~ kitchen_recipeNoun = "Sostantivo D"
    
            + [Sostantivo E]
                ~ kitchen_recipeNoun = "Sostantivo E"
            -  
        Chitarra commenta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra dice un'altra cosa sul tema che stiamo esplorando.
        Noi rispondiamo una di queste cinque cose.
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        Chitarra allora ci chiede qualcosa di personale sempre sul tema, e noi rispondiamo con il secondo ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step due: aggettivi (es: saporito, triste, colorato).
            + [Aggettivo A]
                ~ kitchen_recipeAdjective = "Aggettivo A"
               
            + [Aggettivo B]
                ~ kitchen_recipeAdjective = "Aggettivo B"
             
            + [Aggettivo C]
               ~ kitchen_recipeAdjective = "Aggettivo C"
        
            + [Aggettivo D]
                ~ kitchen_recipeAdjective = "Aggettivo D"
    
            + [Aggettivo E]
                ~ kitchen_recipeAdjective = "Aggettivo E"
            -      
    
        Chitarra commenta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra condivide per la terza e ultima volta qualcosa sul tema che stiamo affrontando.
        Noi diciamo per la terza volta qualcosa legato a quel tema.
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        
        Chitarra ci chiede per la terza e ultima volta qualcosa di personale sul tema, e aggiungiamo il terzo ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step tre: complementi (es: del campo, per rimbecco, di coriandolo)
            + [Complemento A]
                ~ kitchen_recipeComplement = "Complemento A"
               
            + [Complemento B]
                ~ kitchen_recipeComplement = "Complemento B"
             
            + [Complemento C]
               ~ kitchen_recipeComplement = "Complemento C"
        
            + [Complemento D]
                ~ kitchen_recipeComplement = "Complemento D"
    
            + [Complemento E]
                ~ kitchen_recipeComplement = "Complemento E"
            -  
            -> fourth_ingredient_dispatcher
    
    
    //La chiusura è comune, sempre per ridurre il rischio di errori
    = fourth_ingredient_dispatcher
    Ma {player_name}, qui a me sembra tutto pronto, non trovi?
    
        {
            - backpack_findedGifts == (): Dato che lo zaino di {player_name} è vuoto, non è possibile inserire un ingrediente speciale.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                -> recipe_name_creator ->
                -> at_table_with_first_char
                
            - else:
                -> add_ingredient
        
        }
    
        = add_ingredient
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
            Dato che lo zaino di {player_name} contiene degli oggetti, può inserirne uno nel piatto.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            {
                - not cooking_with_second_char:
                    Abbiamo la sensazione che il giusto ingrediente possa dare un tocco speciale alla ricetta di {player_name} e {charNameOne}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    E aiutare {player_name} a capire un po' meglio {charNameOne}.
            }
                
                + [Voglio aggiungere un ingrediente speciale.]
                    -> extra_ingredient_management(FirstCharacter)->
                    ~ disableNestDialogue()
                    
                + [Mi va bene così.]
                -
                
            Andiamo a mangiare, ama!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                -> recipe_name_creator ->
                -> at_table_with_first_char



=== at_table_with_first_char
    ~ move_entity(CookingWithFirstCharOBJ, Kitchen)
    ~ move_entity(EatingWithFirstCharOBJ, Kitchen)
    ~ temp piatto = kitchen_tempRecipeName
    
    È stato divertente cucinare assieme, {player_name}.
    Mi ha fatto sentire a casa.
    E poi questo {piatto}!
    Spacca, non trovi?
    
        {
            - kitchen_firstCharExtraIngredientReaction != notReaction:
                -> extra_ing_feedback
            
            - else:
                E ho la pancia strapiena ora.
                -> relationship_feedback
                
        }
        
        
    
        
        
        = extra_ing_feedback
        // Qui verranno fatti commenti diversi a seconda che l'ingrediente sarà apprezzato o meno.
            {
                - kitchen_firstCharExtraIngredientReaction == goodReaction:
                    -> good_reaction
                
                - kitchen_firstCharExtraIngredientReaction == badReaction:
                    -> bad_reaction
                
                - kitchen_firstCharExtraIngredientReaction == mehReaction:
                    -> meh_reaction
                
                - else:
                    ERROR: non abbiamo un valore valido di kitchen_firstCharExtraIngredientReaction, che è uguale a {kitchen_firstCharExtraIngredientReaction}.
            }
        
        
                = good_reaction
                    Aggiungere {ingredientTranslator(kitchen_firstCharExtraIngredient)} è stato un tocco geniale.
                    Mi è arrivato proprio al cuore.
                    Sai, so che non è sempre facilissimo capire come ragiono.
                    Però a me sembra tutto abbastanza limpido.
                    Alla fine basta non riempirmi di commenti rigidini e razionali quando parliamo.
                    Non mi fraintendere, non sono qui per dire che la terra è piatta o altra roba del genere.
                    Ma solo che mi trovo più a mio agio con le cose emotive, che non con i dati freddi e distaccati.
                    
                        -> relationship_feedback
                
                = bad_reaction
                    Aggiungere {ingredientTranslator(kitchen_firstCharExtraIngredient)} è stata una scelta.
                    Una scelta terribile, {player_name}.
                    Per fortuna che ho una fame bestiale.
        
                        -> relationship_feedback
            
                
                = meh_reaction
                    L'aggiunta di {ingredientTranslator(kitchen_firstCharExtraIngredient)} mi ha confusa.
                    È come.
                    Uh, non so se hai presente.
                    Quando parli con una persona sai cosa ami, e sai cosa detesti.
                    E poi ci sono quelle cose che stanno nel mezzo, che non ti fanno nulla.
                    Tipo, per me è quando una persona mi dice sempre che si risolve tutto facendo cose.
                    O con la rabbia.
                    Oppure che non prende mai troppo il mondo sul serio.
                    Cioè, mi piace fare casino, ma ogni tanto.
                    E quindi boh, il sapore di {ingredientTranslator(kitchen_firstCharExtraIngredient)} è come questa roba a metà, che non mi dice niente.
                    Ma non mi fa manco schifo.
                
                        -> relationship_feedback
            
    
        
    = relationship_feedback
        Comunque {player_name}, stavo pensando alla nostra conversazione qui, assieme.
        E se basandomi solo su questa chiacchierata in cucina dovessi dire: ho appena conosciuto {player_name}, vorrei farci amicizia?
        
            -> firstAffinityCalc ->
            {
                - firstAffinityCalc == 1:
                    {
                        - firstChar_relationshipStatus == 0:
                            Credo che la risposta sia no.
                            Non sei tu, sia chiaro.
                            E non sono io.
                            Ma piuttosto, le cose che sono per te importanti non lo sono per me.
                            È come se guardassimo il mondo con due paia di occhiali molto diversi.
                            Ma non ti preoccupare: abbiamo ancora un sacco di chiacchierate da fare per conoscerci, no?
                    
                        - firstChar_relationshipStatus == 1:
                            La risposta è sicuramente "sì".
                            Vediamo il mondo in modo simile.
                            E non credo che l'amicizia debba coincidere con l'essere la stessa persona, assolutamente no.
                            Però avere gli stessi valori aiuta a capirsi, a costruire cose assieme.
                            E posso dirti per ora che sei una persona che mi dà fiducia, {player_name}.
                            Sono felice di starti conoscendo.
                    }
                    
                - firstAffinityCalc == 2:
                    {
                        - firstChar_relationshipStatus == 0:
                            Credo che la risposta sia no.
                            Non sei tu, sia chiaro.
                            E non sono io.
                            Ma piuttosto, le cose che sono per te importanti non lo sono per me.
                            È come se guardassimo il mondo con due paia di occhiali molto diversi.
                            Ma non ti preoccupare: abbiamo ancora un sacco di chiacchierate da fare per conoscerci, no?
                            
                        - firstChar_relationshipStatus == 1:
                            Credo che la risposta sia "{player_pronouns has him:rimandato|{player_pronouns has her:rimandata|rimandatə}} a settembre".
                            Un po' ci capiamo e un po' no.
                            Che poi ci sta, no?
                            Alla fine ci stiamo conoscendo giusto ora.
                            E abbiamo ancora un bel po' di chiacchierate da farci assieme, e capirci di più.
                            O di meno.
                        
                        - firstChar_relationshipStatus == 2:
                            La risposta è sicuramente "sì".
                            Vediamo il mondo in modo simile.
                            E non credo che l'amicizia debba coincidere con l'essere la stessa persona, assolutamente no.
                            Però avere gli stessi valori aiuta a capirsi, a costruire cose assieme.
                            E posso dirti per ora che sei una persona che mi dà fiducia, {player_name}.
                            Sono felice di starti conoscendo.
                    }    
        
            }
            
            -> ending_cooking_with_first_char
            
        
=== ending_cooking_with_first_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    E ora {player_name}, credo mi farò due passi.
    Mi sento piena e soddisfatta.
    Grazie ancora per questo tempo assieme.

            -> cooking_animations_off ->
            ~ move_entity(FirstCharacter, Pond)
            ~ kitchen_firstCharCookingTogetherInvite = false
            -> update_colors(FirstCharacter) ->
            -> check_kitchen_recap -> 
        
            -> main




/* ---------------------------------

   Altri storylets legati alla cucina 

 ----------------------------------*/


=== first_char_cooking_tracker
//Lo lascio come knot e non come variabile perché potrebbe essermi utile (es: per attivare un suono che faccia sapere che c'è qualcunx in cucina)
    {debug: passo per first_char_cooking_tracker.}
    
    ->->


=== first_char_cooking_alone
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    {debug: passo per first_char_cooking_alone.}
        -> cooking_animations_on ->
        
    {first_char_cooking_alone:
    
        - 1:
            {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}
            
        - 2:
            {Potrei sostituire l'aneto con, uh, no, non una buona idea.|Perdonami {player_name}, ma sto cercando qualcosa che non mi avveleni.}
        
        - 3:
            {Ricordati ragazza che cucinare non è una scusa per bere. Ma che gioia aver trovato del vinello. |Torna dopo {player_name}, devo, ehm, riflettere.}
            
        - 4:
            {Quante possibilità ci sono che se caccio la mano nell'alveare della serra riesco a recuperare del miele?|{player_name}, ho un'idea stupida, torna dopo.}
        
        - 5:
            {Uh, questo sughino spacca. Mamma ne sarebbe orgogliosa.|{player_name}, ho bisogno di concentrazione, a dopo.}
    
        - 6:
            {Sarà una buona idea avere tutti questi coltelli accessibili con il bimbo in giro in giro? Merda, stavo per tagliarmi. Forse sono io il problema, non lui.|{player_name}, faccio danni già da sola, torna tra un po'.}
        
        - 7:
            {Tocco finale, la crema di funghi. E ora lasciamo cuocere un po'. E ci beviamo un altro goccino.|{player_name}, resisti che ho quasi finito!}
        
        - else:
            {Direi che ci siamo. Giusto la fiammata per restringere il brodo, ed è perfetta!|{player_name}, un attimo e ti lascio i fornelli, promesso.}
        
    }
    
    
    -> main




=== food_gift_first_char
{debug: passo per food_gift_first_char.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Cucinare da sola prima è stato un momento terapeutico.
    E non lo dico solo perché mi sono sparata un bel po' di vinello.
    Per me la tavola è lo spazio più bello di una casa perché amo mangiare con le altre persone.
    E amo quando mangiano quello che cucino.
    Credo sia una cosa che ho imparato da mia mamma.
    Mamma non l'ho mai capita fino in fondo.
    Non è una che parla tantissimo.
    Però ci tiene molto alle persone, e per fartelo capire fa cose.
    Come cucinare.
    Da quando vivo al Nord è salita solo una volta.
    Lei e papà hanno dormito nella mia camera, mentre io ho dormito con Valeria.
    Le coinqui erano in imbarazzo perché ha pulito tutta casa.
    E un giorno quando siamo uscite con papà a fargli fare il giro della città, lei è rimasta in casa da sola.
    Siamo tornate, e aveva preparato praticamente un cenone della vigilia.
    E ha tenuto conto del fatto che Valeria è vegana, e che a Irene non piacciono le cose rosse e tutta una serie di cose che ha capito in quei pochi giorni con loro.
    Credo che mamma sappia dire "Ti voglio bene" solo dietro ai fornelli.
    Non ti chiedo un'opinione, scusa, voglio tenermi ancorata ancora un po' a questa sensazione.
    Ma a proposito di cenone della vigilia.
    Da quando vivo su, ho iniziato a organizzare cenoni con le ame.
    Credo sia uno dei momenti più belli dell'anno.
    Qui non c'è abbastanza roba per farlo, ma ho pensato di portare un po' di Natale comunque.
    E quindi ti ho lasciato qualcosina su uno degli alberi della cucina.
    Spero possa portarti un po' di gioia, {player_name}.
    A dopo.

        ~ firstChar_pauseTalking = firstChar_pauseDuration
        ~ firstChar_justTalked = true

-> main