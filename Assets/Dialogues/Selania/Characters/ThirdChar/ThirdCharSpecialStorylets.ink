//Questi storylets speciali non tornano sulle opzioni di dialogo, ma sul main        
    === pre_open_the_nest
        ~ temp charNameTwo = translator(thirdChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)

            {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "jester")}:                    Boss!
                                                            
            - else:
            {charTag(ThirdCharacter, "jester")}:                    {player_name}!
            }
                                                                    Giuro che non lo faccio per farti dar di matto, ma ti chiedo di seguirmi ancora una volta.
        {charTag(ThirdCharacter, "neutral")}:                       Lì, dietro la vecchia barca.
                                                                    Questo vecio qui ti ha trovato qualcosa di 
        {charTag(ThirdCharacter, "jester")}:                        SPA-ZIA-LE!

        
        -> third_char_closing_storylet ->
        ~ opening_places()
        ~ move_entity(ThirdCharacter, Nest)

    ->->    

    
    === open_the_nest
    ~ temp charNameTwo = translator(thirdChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:                           Non è che amo proprio proprio la pioggia.
                                                                        Ma.
                                                                        C'è qualcosa di rilassante in questo posto, sotto questa tenda, vero?
                                                                        Una volta da piccolo mio papà doveva venire a prendermi dopo un allenamento.
                                                                        Avevo più o meno l'età di {charNameTwo}.
                                                                        Ma pioveva così forte che c'ha messo una vita.
                                                                        Così mi sono messo sotto agli spalti, fermo, ad ascoltare la tempesta.
        {charTag(ThirdCharacter, "jester")}:                            Chissà quando sono diventato questo vecchio idiota, vero vecio?
        {charTag(ThirdCharacter, "neutral")}:                           Papà si è scusato tantissimo quando è arrivato.
        {charTag(ThirdCharacter, "bored")}:                             Tipico suo.
        {charTag(ThirdCharacter, "neutral")}:                           Ma io quelle ore me le ricordo come uno dei momenti più belli della mia vita.
                                                                        E quando ho visto quei sassi lì.
                                                                        Boh.
                                                                        Credo di averli già visti, forse proprio quel giorno.
                                                                        Sai cos'è una cosa bella del mio lavoro?
                                                                        Capire cosa dire alle persone quando stanno di merda.
                                                                        Dirgli la cosa giusta, così che c'arrivano da soli a trovare le risposte.
        {charTag(ThirdCharacter, "jester")}:                            Anche perché le mie sono tremende, vecio.
        {charTag(ThirdCharacter, "neutral")}:                           E quei sassi lì mi ricordano la stessa sensazione, di quando stai per aprire la bocca e sai già che effetto farai sulle persone.
                                                                        Non è male.
                                                                        Comunque non credo che nessuno verrà a romperti le palle in questo postaccio.

                {
                - tutorial_CarlaTutorial == true:
                {charTag(ThirdCharacter, "jester")}:                    A parte Carla ovviamente!                                                                                                                                                                                                                                        
                }
        {charTag(ThirdCharacter, "neutral")}:                           Quindi ti faccio la domanda peggiore del mondo.
                                                                        Per me.
                                                                        Che idea ti sei fatt{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} di me?

        + \ {charTag(PG, "neutral")}:                                   Cosa succede se non rispondo che sei un bravo ragazzo?
                -> glyph_choice_manager(false, airC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:                    Che ti meno, vecio!

                - else:
                {charTag(ThirdCharacter, "bored")}:                     L'ho detto giusto un paio di volte, dai!
                }
        {charTag(ThirdCharacter, "neutral")}:                           Tutti c'hanno le loro fisse.
                                                                        Per lo meno non mi svendo la casa alle slot machines.
                                                                        O passo il tempo a insultare gente online.
        {charTag(ThirdCharacter, "jester")}:                            E poi sono un ragazzo d'oro, non serve che me lo dici tu!                                                                          

        + \ {charTag(PG, "neutral")}:                                   Sei un po' idiota ma hai il fuoco dentro, e un tipo così è un tipo che mi piace!
                -> glyph_choice_manager(false, fireC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:                    Tra idioti ci capiamo, vecio!

                - else:
                {charTag(ThirdCharacter, "bored")}:                     <i>Faccio</i> l'idiota, ma non lo sono.
                                                                        Ti piace giudicare facile, vero? 
                }
        {charTag(ThirdCharacter, "neutral")}:                           Però è una cosa che mi diceva sempre anche mamma, dell'idiota.
                                                                        Secondo mia sorella è una cosa che ho iniziato a fare quando le cose in casa stavano andando male.
        {charTag(ThirdCharacter, "jester")}:                            Inizi a fare il buffone per risolvere un problema, e finisci per fare il buffone per il resto della tua vita.                                                                      
        
        + {grimoire_thirdChar hasnt grimThirdCharFour}  \ {charTag(PG, "neutral")}:                             La cosa che mi preoccupa è che non ho ancora capito come tratti le persone.
            -> glyph_choice_manager(false, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == they:
                {charTag(ThirdCharacter, "jester")}:                    Non so perché mi c'avrei scommesso il culo che mi avresti detto qualcosa di pesante.
                }
        {charTag(ThirdCharacter, "neutral")}:                           Non ho mai tradito la fiducia di nessuno.
                                                                        Non spiffero in giro i cazzi degli altri.
                                                                        Né li giudico se fanno scelte di merda.
                                                                        Non prendo debiti.
                                                                        E presto i soldi a chi è nei casini.
                                                                        Non mi sembra una brutta cosa, no?            

        + {grimoire_thirdChar has grimThirdCharFour}  \ {charTag(PG, "neutral")}:                               Non mi piace come parli della tua ex, dei tuoi appuntamenti e delle donne in generale.
            -> glyph_choice_manager(false, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == they:
                {charTag(ThirdCharacter, "jester")}:                    Non so perché mi c'avrei scommesso il culo che mi avresti detto qualcosa di pesante.
                }
        {charTag(ThirdCharacter, "neutral")}:                           Io le donne le rispetto.
                                                                        Ma non sono sicuro che la cosa sia reciproca.
                                                                        Però finisco sempre per passare per lo stronzo, perché ho la bocca troppo larga.
        {charTag(ThirdCharacter, "bored")}:                             Magari a volte parlo troppo, ma non ho mai picchiato nessuna ragazza.            

        + \ {charTag(PG, "neutral")}:                                   Magari non sei un filosofo, ma apprezzo il tuo forte senso pratico.
                -> glyph_choice_manager(false, earthC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:                    Ah ah, grazie vecio!
                - else:
                {charTag(ThirdCharacter, "bored")}:                     Posso dire anche cose intelligenti.
                                                                        Se la persona è interessante.
                }
        {charTag(ThirdCharacter, "neutral")}:                           Però sì, ho un mio senso pratico.
                                                                        Che non è una cosa che scegli di avere o meno, quando tuo papà si brucia tutto quello che avevate quando hai sedici anni.
                                                                        Alla fine devi trovare il modo per sfangartela.         
        {charTag(ThirdCharacter, "jester")}:                            Non sono venuto su così male, no?                

        +  \ {charTag(PG, "neutral")}:                                  Ho l'impressione che dietro la maschera da buffone tu stia soffrendo molto.
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == her:
                {charTag(ThirdCharacter, "jester")}:                    Figurati se non tiravi fuori le cose da fighetta, figurati.
                }

        {charTag(ThirdCharacter, "melanchonic")}:                       Gesù licantropo sì! Sono tormentato.
                                                                        La notte non dormo e soffro.
                                                                        Soffro pensando a quanto lavoro sta facendo per me {player_name}!
        {charTag(ThirdCharacter, "jester")}:                            Lavoro non richiesto.
        {charTag(ThirdCharacter, "bored")}:                             E poi questa roba è la cosa più stupida e prevedibile sentita.
                                                                        Tutti alla fine stanno male a questo mondo, {player_name}!                                                                
        -    
        
        {charTag(ThirdCharacter, "neutral")}:                           Ti lascio al tuo nuovo giochino, {player_name}.
                                                                        Magari così c'hai un buon ricordo di me quando me ne vado.

            -> third_char_closing_storylet ->

        {charTag(TheWitch, "{witch_state()}")}:                         <i>{player_name}.
                                                                        <i>Questo posto è potente.
                                                                        <i>E complesso.
                                                                        <i>Una parte di noi vorrebbe dire a {player_name} di andarsene subito.
                                                                        <i>Ma crediamo anche che l'esperienza sia la migliore maestra.
                                                                        <i>Abbiamo quindi deciso di donare a {player_name} tre <b>sigilli</b>.
                                                                        <i>Li troverà nel suo grimorio.
                                                                        <i>Sperando che {player_name} ricordi che non tutto quello che possediamo va utilizzato.
                                                                        <i>Se {player_name} vuole ancora parlarne con noi, ci trova come sempre alla discarica.</i>   

            //Chiamiamo il primo, notifichiamo, ripetiamo  
            ~ png_random_sigils_opener ()
                {player_name} ha ricevuto {sigils_translator(nest_newSigilDiscovered)}.
                //Chiamo tre volte l'updater, così aggiorno l'informazione sul grimorio
                ~ glyph_grimoireTripleSigilsUpdater()
                ~ glyph_grimoireTripleSigilsUpdater()
                ~ glyph_grimoireTripleSigilsUpdater()
                //Poi aggiorno il sigillo principale
                ~ glyph_grimoireMainSigilsUpdater()
                //E poi svuoto il nuovo sigillo
                ~ nest_newSigilDiscovered = ()

            ~ png_random_sigils_opener ()
                {player_name} ha ricevuto {sigils_translator(nest_newSigilDiscovered)}.
                //Chiamo tre volte l'updater, così aggiorno l'informazione sul grimorio
                ~ glyph_grimoireTripleSigilsUpdater()
                ~ glyph_grimoireTripleSigilsUpdater()
                ~ glyph_grimoireTripleSigilsUpdater()
                //Poi aggiorno il sigillo principale
                ~ glyph_grimoireMainSigilsUpdater()
                //E poi svuoto il nuovo sigillo
                ~ nest_newSigilDiscovered = ()


            ~ png_random_sigils_opener ()
                {player_name} ha ricevuto {sigils_translator(nest_newSigilDiscovered)}.
                //Chiamo tre volte l'updater, così aggiorno l'informazione sul grimorio
                ~ glyph_grimoireTripleSigilsUpdater()
                ~ glyph_grimoireTripleSigilsUpdater()
                ~ glyph_grimoireTripleSigilsUpdater()
                //Poi aggiorno il sigillo principale
                ~ glyph_grimoireMainSigilsUpdater()
                //E poi svuoto il nuovo sigillo
                ~ nest_newSigilDiscovered = ()

            
            //Parte subito la spiegazione sui sigilli di Carla
            {
                -  settings_gamerMode == true:
                    ~ move_entity(Carla, Library)
                    -> tutorial_carlaSigilsActivationStorylet
                - else:
                    ->->
            }
        
        

=== third_read_story_library
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:                           Non leggevo dall'ottantaquattro e sai una cosa {player_name}?
        {charTag(ThirdCharacter, "angry")}:                             Non dovevo farlo nemmeno oggi.
        {charTag(ThirdCharacter, "neutral")}:                           Ma il fratellino era così preso perché c'ha aperto la biblioteca di merda che ho detto "Prendiamone uno a caso".
                                                                        E il racconto a caso è stato quella roba piena di misandria che è <b>Polvere</b>.
                                                                        So che l'hai letto anche tu.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:                    Vecio: se mi dici che ti è piaciuto ti meno!

                - thirdChar_recordedPlayerPronoun == her:
                {charTag(ThirdCharacter, "bored")}:                     E non dirmi che ti trovi d'accordo con lei o non sei la donna che pensavo tu fossi!

                - else:
                {charTag(ThirdCharacter, "neutral")}:                   Ho paura a sapere cosa ne pensi.
                }                                                                
        {charTag(ThirdCharacter, "bored")}:                             Dico solo una cosa.
                                                                        Se un uomo scrive una cosa del genere, così violenta verso gli uomini, lo bruciano sul rogo.
                                                                        E invece quella robaccia è lì in biblioteca.
                                                                        Una biblioteca dove può leggere anche il fratellino!
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:                   L'unica volta che ti preoccupi per {charNameTwo} guarda caso è per un racconto con una donna incazzata.
                                                                        Non per tutte le parolacce che stai usando da quando sei qui, per dire.
                        {
                        - are_two_entities_together(FifthCharacter, PG) && fifthChar_slurDetector > 2:
                        {charTag(Mentor, "neutral")}:                   Nonostante ti abbia già chiesto più volte di non dirle.                                                     
                        }
                }
                {
                - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "energy")}:                   A me quel racconto ha divertito tantissimo!
                                                                        Soprattutto quando lei gli impedisce di scappare.
                }
    
        + \ {charTag(PG, "neutral")}:                                   Lui ha ignorato tutti i suoi <i>no</i>, e lei si sta proteggendo.
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == her:
                {charTag(ThirdCharacter, "bored")}:                     Ovvio che vai subito a difendere anche altre donne immaginarie.
                }
                {
                - are_two_entities_together(FifthCharacter, PG):
                {charTag(Mentor, "neutral")}:                           E per anni lei ha cercato di spiegargli le cose con calma, ma lui non l'ha mai ascoltata. 
                }
        {charTag(ThirdCharacter, "bored")}:                             Sembra la stessa logica di uno che spara preventivamente a un altro tizio solo perché potrebbe entrargli in casa a rubare.
                                                                        Non ha senso questa roba.
                                                                        Non è difesa.
                                                                        Lui cerca di scappare.
                                                                        Lei lo riacciuffa.
                                                                        E ammette pure di essere pazza!
        {charTag(ThirdCharacter, "jester")}:                            E tu stai qui a difenderla.
        {charTag(ThirdCharacter, "bored")}:                             Io boh.             
            
        + \ {charTag(PG, "neutral")}:                                   Non puoi mettere sullo stesso piano i comportamenti di oppresso e oppressore.
                -> glyph_choice_manager(false, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == they:
                {charTag(ThirdCharacter, "jester")}:                    Rido solo perché sei prevedibile, mi devi tirare fuori la cosa più astrusa possibile.
                } 
        {charTag(ThirdCharacter, "jester")}:                            Questa cosa è quasi tragicomica.
        {charTag(ThirdCharacter, "neutral")}:                           Lei è lì gigante e pazza.
        {charTag(ThirdCharacter, "jester")}:                            Lo dice anche lei che è pazza!
        {charTag(ThirdCharacter, "bored")}:                             Ma no, per te lui è l'oppressore.
                                                                        E lei l'oppressa.
        {charTag(ThirdCharacter, "jester")}:                            Fai sembrare {charNameOne} normale quando ragioni così.                                                                
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "affectionate")}:              Ti lovvo {player_name}, non lo ascoltare.
                {charTag(FirstCharacter, "curious")}:                   Non sa ancora quante cose non normali penso di lui!
                }
        
        + \ {charTag(PG, "neutral")}:                                   Sul momento è appagante, ma nel lungo periodo la violenza non fa bene a nessuno.
                -> glyph_choice_manager(false, earthC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "bored")}:                     Oh, non prendermi per pacifista ora!
                } 
        {charTag(ThirdCharacter, "neutral")}:                           Le relazioni sono un gran casino.
                                                                        Però non è schiacciando un poveretto come se fosse un pistacchio che si risolve qualcosa.            
        
        + \ {charTag(PG, "neutral")}:                                   Per te è ingiustificata la sua rabbia o solo la violenza?
                -> glyph_choice_manager(false, airC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "bored")}:                     E rieccoci con le domande da Super Quark.
                - else:
                {charTag(ThirdCharacter, "jester")}:                    E rieccoci con le domande da Super Quark.
                                                                        Che palle, vecio!
                } 
        {charTag(ThirdCharacter, "bored")}:                             Non lo so.
                                                                        Posso dirti che mi sta sul culo e bona?
                                                                        Perché è tutta presa da sé.
                                                                        Non si è manco chiesta come sta lui.
                                                                        Ci gode pure a vederlo soffrire, la pazza.
        {charTag(ThirdCharacter, "jester")}:                            Cosa cazzo dovrei giustificare o non giustificare del carattere di merda di questa tizia?    
        
        + \ {charTag(PG, "neutral")}:                                   Uomini o donne, chi se ne frega! Tutti hanno il diritto di sfasciare qualcosa.
                -> glyph_choice_manager(false, fireC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "bored")}:                     {player_name} ha scelto la violenza.
                - else:
                {charTag(ThirdCharacter, "jester")}:                    {player_name} ha scelto la violenza.
                }
        {charTag(ThirdCharacter, "jester")}:                            Nuovo motto: "Non essere misandrico: odia tutti allo stesso modo!"
        {charTag(ThirdCharacter, "neutral")}:                           Io non sono uno che si arrabbia molto, ti ci devi proprio impegnare per farmi incazzare, ma tanto.
                                                                        E non mi piace la violenza.
                                                                        Ti mette sempre dalla parte del torto.
                                                                        Per questo 'sto racconto mi fa incazzare a bestia.
                                                                        Perché magari lei c'aveva pure ragione, alla fine gliel'ha detto mille volte di no.
                                                                        Ma lui col cervello duro come il marmo non l'ha mai ascoltata.
        {charTag(ThirdCharacter, "jester")}:                            E capisco uno sberlotto o due per fargli riavviare il sistema e farlo ragionare.
        {charTag(ThirdCharacter, "bored")}:                             Ma quella roba lì, tutta quella violenza lì, zero.
                                                                        Espulsione immediata e sospensione fino a fine campionato.      
        -
        {charTag(ThirdCharacter, "neutral")}:                           Più tardi provo a leggere qualcosa.
        {charTag(ThirdCharacter, "jester")}:                            Ma se mi esce un altro racconto come quello mi sentite urlare bestemmie per tutto 'sto cazzo di posto.
            
            -> third_char_closing_storylet ->
            ->->


=== dog_third_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
   
        {charTag(ThirdCharacter, "jester")}:                            C'è una CAGNOLINA!
        {charTag(ThirdCharacter, "bored")}:                             Merda, dovrei fare l'uomo adulto.
        {charTag(ThirdCharacter, "jester")}:                            Ma c'è una cagnolina {player_name}!
        {
        - contentsTrainStop has PG:
        {
        - contentsTrainStop has DoggoNoLetters:
        {charTag(ThirdCharacter, "jester")}:                            Vicino alla panchina.
                                                                        C'ha la faccia da furbetta questa qui!
        - else:
        {charTag(ThirdCharacter, "jester")}:                            Era vicina alla panchina.
                                                                        Con una faccia da furbetta che non hai idea!
        }
        - else:
        {charTag(ThirdCharacter, "jester")}:                            Era alla stazione, e c'aveva 'sta faccia da furbetta che l'avrei mangiata tutta!  
        }
        {charTag(ThirdCharacter, "neutral")}:                           Quando Dona compì diciotto anni gliene regalai una simile.
                                                                        Stella.
        {charTag(ThirdCharacter, "jester")}:                            Sua mamma all'inizio era incazzata a bestia con me.
                                                                        Ma poi se ne è innamorata.
        {charTag(ThirdCharacter, "neutral")}:                           Anche se poi quello che la portava a passeggio il più delle volte ero io.
                                                                        Mi manca tanto.
                                                                        Quando siamo andati a vivere assieme abbiamo provato a portarla da noi, ma alla fine lei ormai si era affezionata alla mia ex suocera.
        {charTag(ThirdCharacter, "jester")}:                            Stella è ancora una testona assurda, anche se non ci sente più un cazzo, abbaia come una dannata da mattina a sera.
                {
                - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "energy")}:                   Me la fai conoscere?
                                                                        Dai {charNameThree}!
                                                                        Me la fai conoscere?
                {charTag(ThirdCharacter, "jester")}:                    Quando usciamo di qui ci provo.
                {charTag(ThirdCharacter, "bored")}:                     Magari mia suocera, ex suocera, si intenerisce davanti a un bambino.
                {charTag(ThirdCharacter, "neutral")}:                   Anche se probabilmente Stella cercherà di morderti.
                {charTag(ThirdCharacter, "jester")}:                    Ma tanto ormai è senza denti.                                                                
                }                                                                                                                                                                                                
   

    -> third_char_closing_storylet ->
    ->-> 



=== third_witch_follow_up
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
    
        {
        - are_two_entities_together(FirstCharacter, PG) or are_two_entities_together(SecondCharacter, PG) or are_two_entities_together(FifthCharacter, PG):
        {charTag(ThirdCharacter, "neutral")}:                           {charNameThree}, ho bisogno di parlarti, solo noi due.
            {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "neutral")}:                       Volevo giusto segnarmi da qualche parte un'idea per una melodia.
                ~ change_entity_place(FirstCharacter)

            - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "energy")}:                       È il momento per {charNameTwo} di scoprire un nuovo animale!
                ~ change_entity_place(SecondCharacter)

            - are_two_entities_together(FifthCharacter, PG):
            {charTag(Mentor, "sad")}:                                   Spero non sia niente di grave {charNameThree}.
            {charTag(ThirdCharacter, "jester")}:                        Tranquilla zia, giusto un piccolo chiarimento tra me e {player_name}.
            {charTag(Mentor, "neutral")}:                               A dopo allora!
                ~ change_entity_place(FifthCharacter)

            - are_two_entities_together(Franco, PG):
            {charTag(Franco, "neutral")}:                               Non fate caso a me.
                                                                        Sto facendo i miei esercizi per sembrare serio.
            {charTag(Franco, "reading")}:	                            Domani ci saranno i consigli di classe.                        

            }
        }

    {charTag(ThirdCharacter, "neutral")}:                               Cosa ha voluto dire prima quella tipa, quella che ha fatto la ventriloqua con le tue chiappe?


    + \ {charTag(PG, "neutral")}:                                       Credo intendesse che sei su una strada che può solo ferirti, ma puoi ancora cambiare.
            -> glyph_choice_manager(false, waterC)->
            {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == her:
            {charTag(ThirdCharacter, "jester")}:                        Sei lo stereotipo della ragazza tutta presa dalle emozioni, {player_name}!                  
            }  
    {charTag(ThirdCharacter, "bored")}:                                 L'unica cosa che può ferirsi sono le mie palle.
                                                                        Le mie gigantesche mastodontiche pienissime palle.
                                                                        Massacrate da tutte le cose pesanti che avete il vizio di dire da queste parti.        
    
    + \ {charTag(PG, "neutral")}:                                       Che puoi essere molte cose, non solo l'idea di uomo con cui sei stato cresciuto.
            -> glyph_choice_manager(false, aetherC)->
            {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == they:
            {charTag(ThirdCharacter, "jester")}:                        Poi vi arrabbiate se diciamo che voi trans pensate solo al genere!                 
            }     
    {charTag(ThirdCharacter, "neutral")}:                               Comunque puoi dire alla tua amica che è un lavoro che ho già fatto.
                                                                        Sono cresciuto con l'idea che un uomo dovesse essere come quel fallito di mio padre.
    {charTag(ThirdCharacter, "jester")}:                                E magari non sono così perfetto come ti può sembrare, {player_name}.
    {charTag(ThirdCharacter, "neutral")}:                               Ma sono molto più uomo di quanto lui non sia mai stato.                                                                        
    
    + \ {charTag(PG, "neutral")}:                                       Che gli amici che hai non sono poi così grandi amici.
            -> glyph_choice_manager(false, earthC)->
            {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun != him:
            {charTag(ThirdCharacter, "bored")}:                         Attent{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} a come parli dei miei amici, {player_name}.
            - else:
            {charTag(ThirdCharacter, "jester")}:                        Vecio, apprezzo la sincerità, ma non parlare <i>così</i> male dei miei amici!
            }
    {charTag(ThirdCharacter, "jester")}:                                Non serviva una medium pazza per dirmi che i miei amici sono un po' coglioni.
    {charTag(ThirdCharacter, "neutral")}:                               Ma sono quanto di meglio possa trovare in quel buco di periferia in cui vivo.
                                                                        E hanno un gran cuore.
    {charTag(ThirdCharacter, "jester")}:                                Anche se il più delle volte lo nascondono dietro litri di birra!
    {charTag(TheWitch, witch_state())}:                                 <i>Una verità parziale {player_name} conduce a un disastro totale.</i>                                                                   

    
    + \ {charTag(PG, "neutral")}:                                       Cosa vorresti essere, se potessi essere tutto e chiunque?
            -> glyph_choice_manager(false, airC)->
            {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun != him:
            {charTag(ThirdCharacter, "bored")}:                         'ste domande da Cioè te le perdono solo perché se te, {player_name}.
            - else:
            {charTag(ThirdCharacter, "jester")}:                        Vecio, ma 'ste domande da Cioè? C'abbiamo dodici anni?
            }
    {charTag(ThirdCharacter, "jester")}:                                Prima alla medium psicopatica ho detto Elon Musk.
                                                                        Ma io sono cento volte più bono anche così, a forma di bicchiere.
    {charTag(ThirdCharacter, "neutral")}:                               Non c'ho voglia di essere qualcos'altro.
                                                                        Ma due soldi in più per starmene in pace non mi farebbero schifo.
                                                                        Insieme a un mondo che mi permetta di fare ancora il mio vecchio lavoro.
    {charTag(ThirdCharacter, "jester")}:                                E una tipa vicina meno rompicoglioni di {charNameOne}!                                                                                                                                         
    
    + \ {charTag(PG, "neutral")}:                                       Che {charNameOne} è piena di pregiudizi, quindi sbattitene.
            -> glyph_choice_manager(false, fireC)-> 
            {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == her:
            {charTag(ThirdCharacter, "bored")}:                         Non c'è quella roba della solidarietà femminile, {player_name}?
            - thirdChar_recordedPlayerPronoun == they:
            {charTag(ThirdCharacter, "bored")}:                         Ehi dai, non serve buttare già dal tetto così {charNameOne}!
            - else:
            {charTag(ThirdCharacter, "jester")}:                        C'ero arrivato da solo a quello, vecio.
            }
    {charTag(ThirdCharacter, "neutral")}:                               Però apprezzo che il fantasma con disturbo di personalità multiple si sia accorto che {charNameOne} mi ha preso un po' di mira.
                                                                        Ma detto tra di noi: chi se ne frega?
    {charTag(ThirdCharacter, "jester")}:                                Mi piace litigarci perché fa una faccia idiota quando si innervosisce.
    {charTag(ThirdCharacter, "neutral")}:                               Ma se dovessi farmi il sangue amaro per ogni donna incazzata che mi dice che sono un coglione, sarei già morto da mo.
    {charTag(TheWitch, witch_state())}:                                 <i>Rimaniamo sorprese e un po' deluse dalla risposta di {player_name}.</i>                                                                             
    -
    {charTag(ThirdCharacter, "neutral")}:                               C'è sempre qualcuno che vuole bene anche al più idiota del pianeta, se quell'idiota è sé stesso senza troppe maschere.
                                                                        Il problema per me è che quella persona l'ho avuta vicina per trent'anni, e ora mi ha cancellato dalla sua vita.
    {charTag(ThirdCharacter, "jester")}:                                Ma vai a farti due passi ora {player_name}!
                                                                        E cerca di non farti possedere di nuovo: c'avevi una faccia da idiota quando quella là se ne è andata dal tuo corpo!                                                                    

    -> third_char_closing_storylet ->
    ->-> 



    === third_char_second_char_departure_comment  
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(ThirdCharacter, "jester")}:                            Ma vedi tu che il fratellino se ne è andato prima di me.
        {charTag(ThirdCharacter, "neutral")}:                           Mi mancherà il piccoletto.

    {

    - secondChar_ActualName has Grizzly:
        {charTag(ThirdCharacter, "neutral")}:                           Ha scelto di diventare un orso incazzato.
        {charTag(ThirdCharacter, "angry")}:                             Chissà che ora quel coglione di suo padre non lo rispetta un po'!
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:                   Perché di sicuro la violenza lo aiuterà a risolvere la situazione.
                {charTag(ThirdCharacter, "bored")}:                     Sempre di più delle cazzo di paturnie mentali che gli facevi.                                                  
                }
    
    - secondChar_ActualName has Lupo:
        {charTag(ThirdCharacter, "neutral")}:                           Ha deciso di fare il lupo che protegge il branco.
                                                                        La famiglia.
                                                                        Commento sincero?
                                                                        Spero non lo prenda nel culo.
        {charTag(ThirdCharacter, "angry")}:                             Finisce sempre così con genitori e fratelli e tutta quella merda lì.                                                               
        
    - secondChar_ActualName has Delfino:
        {charTag(ThirdCharacter, "jester")}:                            Ma ho capito bene o t'ha detto: "Basta Riccio: ora sarò un coglione?".
                                                                        Qualcosa da me allora l'ha imparato, vero?!
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:                   Povero {charNameTwo}.
                                                                        Povero povero povero {charNameTwo}.                                                
                }
                
    - secondChar_ActualName has Capibara:
        {charTag(ThirdCharacter, "neutral")}:                           Posso dire una cosa?
                                                                        "Finalmente".
                                                                        Ha deciso di farsi dei cazzo di amici, ci voleva.
                                                                        Basta con la nonna il fratello la mamma e quel coglione del padre.
                                                                        C'ha bisogno di coetanei, il fratellino.

    - secondChar_ActualName has Corvo:
        {charTag(ThirdCharacter, "jester")}:                            Comunque mi ha conosciuto, ha pensato: "Questo è tutto scemo!".
                                                                        E ha deciso di non diventare come me e di diventare intelligente.
        {charTag(ThirdCharacter, "neutral")}:                           Un corvo, pensa te.
                                                                        Magari un giorno si ricorda di noi quando prende il Nobel per qualche cosa sugli animali.

}

    -> third_char_closing_storylet ->
    ->-> 



    === third_char_first_char_departure_comment  
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(ThirdCharacter, "jester")}:                            La senti {thirdChar_recordedPlayerPronoun has him:vecio|{thirdChar_recordedPlayerPronoun has her:zia|bomber}}?
                                                                        La pace.
        {charTag(ThirdCharacter, "neutral")}:                           La pace.
                                                                        Finalmente {charNameOne} se ne è andata.
                                                                        Ora posso respirare.


    -> third_char_closing_storylet ->
    ->-> 