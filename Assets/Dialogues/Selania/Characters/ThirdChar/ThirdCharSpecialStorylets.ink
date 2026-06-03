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
                                                                    Ma pioveva così forte che ci ha messo una vita.
                                                                    Così mi sono messo sotto agli spalti, fermo, ad ascoltare la tempesta.
    {charTag(ThirdCharacter, "jester")}:                            Chissà quando sono diventato questo vecchio idiota, vero vecio?
    {charTag(ThirdCharacter, "neutral")}:                           Papà si è scusato tantissimo quando è arrivato.
    {charTag(ThirdCharacter, "bored")}:                             Tipico suo.
    {charTag(ThirdCharacter, "neutral")}:                           Ma io quelle ore me le ricordo come il momento più bello della mia vita.
                                                                    E quando ho visto quei sassi lì.
                                                                    Boh.
                                                                    Credo di averli già visti, forse proprio quel giorno.
                                                                    Sai cos'è una cosa bella del mio lavoro?
                                                                    Capire cosa dire alle persone quando stanno di merda.
                                                                    Dirgli la cosa giusta, così che ci arrivano a soli a trovare le risposte.
    {charTag(ThirdCharacter, "jester")}:                            Anche perché le mie sono tremende, vecio.
    {charTag(ThirdCharacter, "neutral")}:                           E quei sassi lì mi ricordano la stessa sensazione, di quando stai per aprire la bocca e sai già che effetto farai sulle persone.
                                                                    Non è male.
                                                                    Comunque non credo che nessuno verrà a romperti {thirdChar_recordedPlayerPronoun has him:i coglioni|{thirdChar_recordedPlayerPronoun has her:le ovaie|i genitali}} in questo postaccio.
    
    {
    - tutorial_ActivateTutorial == true:
    {charTag(ThirdCharacter, "jester")}:                            A parte Carla ovviamente!                                                                                                                                                                                                                                        
    }
    {charTag(ThirdCharacter, "neutral")}:                           Quindi ti faccio la domanda peggiore del mondo.
                                                                    Per me.
                                                                    Che idea ti sei fatt{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} di me?

        + [Scelta aria] //Media
            -> glyph_choice_manager(false, airC)->
    
        + [Scelta fuoco]
            -> glyph_choice_manager(false, fireC)->
     
        + [Scelta spirito]//Negativa due (negativa come Non piace a lui, non che sia critica in assoluto)
            -> glyph_choice_manager(false, aetherC)->
    
        + [Scelta terra]
            -> glyph_choice_manager(false, earthC)->
            
        + [Scelta acqua] //Negativa uno
            -> glyph_choice_manager(false, waterC)->
        -    
    
    {charTag(ThirdCharacter, "neutral")}:                           Ti lascio al tuo nuovo giochino, {player_name}.
                                                                    Magari così c'hai un buon ricordo di me quando me ne vado.

        -> third_char_closing_storylet ->

    {charTag(TheWitch, "{witch_state()}")}:                         {player_name}.
                                                                    Questo posto è potente.
                                                                    E complesso.
                                                                    Una parte di noi vorrebbe dire a {player_name} di andarsene subito.
                                                                    Ma crediamo anche che l'esperienza sia la migliore maestra.
                                                                    Abbiamo quindi deciso di donare a {player_name} tre <b>sigilli</b>.
                                                                    Li troverà nel suo grimorio.
                                                                    Sperando che {player_name} ricordi che non tutto quello che possediamo va utilizzato.
                                                                    Se {player_name} vuole ancora parlarne con noi, ci trova come sempre alla discarica.       

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
    

    {charTag(ThirdCharacter, "neutral")}:       Racconto letto in biblioteca.
    A racconto scelto, cambia anche logica in Special Storylets
    Potrebbe aver senso il racconti di Maura, visto che lo percepirebbe come ostile (misandrico?)
    - 
            + \ {charTag(PG, "neutral")}:               Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:               Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                
            -
            {
                    - are_two_entities_together(FirstCharacter, PG):
                    {
                    - grimoire_firstChar has grimFirstThirdChar:
                            {charTag(FirstCharacter, "annoyed")}:                   Commento infastidito di Chitarra.

                    - else:
                            {charTag(FirstCharacter, "neutral")}:                   Commento empatico di Chitarra.    
                    }
            }    
        -> third_char_closing_storylet ->
        ->->


=== dog_third_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
   
   {charTag(ThirdCharacter, "neutral")}:       {charNameThree} ha visto un cane.

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


    + \ {charTag(PG, "neutral")}:                                       Credo intendesse che sei su una strada che può solo ferirti, ma puoi ancora salvarti.
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
    
    + \ {charTag(PG, "neutral")}:                                       Che forse gli amici che hai non sono poi così grandi amici.
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
    
    + \ {charTag(PG, "neutral")}:                                       Di non incazzarti per quello che ti dice {charNameOne}, ha i suoi pregiudizi.
            -> glyph_choice_manager(false, fireC)-> 
            {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == her:
            {charTag(ThirdCharacter, "bored")}:                         Dov'è la solidarietà femminile, {player_name}?
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
                                                                        Il problema per me è che quella persona l'ho avuta vicina per una vita, e ora mi ha cancellato dalla sua vita.
    {charTag(ThirdCharacter, "jester")}:                                Ma vai a farti due passi ora {player_name}!
                                                                        E cerca di non farti possedere di nuovo: c'avevi una faccia da idiota quando quella là se ne è andata dal tuo corpo!                                                                    

    -> third_char_closing_storylet ->
    ->-> 