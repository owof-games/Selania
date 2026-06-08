/* ---------------------------------

   Cucina con Chitarra

 ----------------------------------*/
=== pre_start_cooking_with_third_char
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

    
        {charTag(ThirdCharacter, "neutral")}:                               Ehi {player_name}, sei pront{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} per cucinare qualche disastro assieme?
        
        + \ {charTag(PG, "neutral")}:                                       Sono pront{player_pronoun has him:o|{player_pronoun has her:a|ə}}!
            -> cooking_with_third_char
        
        + \ {charTag(PG, "neutral")}:                                       Vorrei pensarci un attimo {charNameOne}.
            -> main
 

=== cooking_with_third_char
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)


        {charTag(PG, "neutral")}:                                           Stavo pensando che nel mentre potremmo parlare un po'.
    
    - (top)
        {charTag(PG, "neutral")}:                                           E ripensando alle nostre conversazioni, mi farebbe piacere parlare di...


                {
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(TheWitch, witch_state())}:                         <i>Avendo conosciuto {player_name} come {thirdChar_recordedPlayerPronoun == they: persona non binaria|donna}, {charNameThree} non è disposto ad approfondire altri temi cucinando con {player_name}.

                - else:
                    {
                    - grimoire_thirdChar hasnt grimThirdCharThree:
                    {charTag(TheWitch, witch_state())}:                     <i>Avendo conosciuto {player_name} come uomo, {charNameThree} ha ancora spunti di conversazione da offrire a {player_name}, se {player_name} deciderà di parlare con {charNameThree} ancora un po'.
                    }
                
                }
        
        + \ {charTag(PG, "neutral")}:                                                   Di lavoro.
                ~ cooking_animations_on()
                ~ storage_glyphs(ThirdCharacter)
                -> kitchen_moon_feedback -> 
                -> third_theme
                
        + {grimoire_thirdChar has grimThirdCharTwo}\ {charTag(PG, "neutral")}:          Di ragazze.
                ~ cooking_animations_on()
                ~ storage_glyphs(ThirdCharacter)
                -> kitchen_moon_feedback -> 
                -> second_theme
  
        + {grimoire_thirdChar has grimThirdCharThree}\ {charTag(PG, "neutral")}:        Di calcio.
                ~ cooking_animations_on()
                ~ storage_glyphs(ThirdCharacter)
                -> kitchen_moon_feedback -> 
                -> first_theme
       
            
        + \ {charTag(PG, "neutral")}:                                                   Sai, forse preferirei cucinare più tardi.
            {charTag(ThirdCharacter, "neutral")}:                                       Nessun problema, prenditi i tuoi tempi {player_name}.
                ~ kitchen_thirdCharCookingTogetherInvite = false
                ~ kitchen_thirdCharCookingTogetherWaiting = 0
                ~ move_entity(ThirdCharacter, Pond)
                ~ move_entity(ThirdCharacterCucina, Safekeeping)
            -> main


    
    = first_theme
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
       
        {charTag(ThirdCharacter, "jester")}:                                    Ahah, potrebbe diventare il mio momento preferito da quando sono qui.
        {charTag(ThirdCharacter, "neutral")}:                                   E scusa se non ti ho chiesto che squadra tifi, ma voglio avere ancora rispetto per te, vecio.
        {charTag(ThirdCharacter, "bored")}:                                     Perché cosa faccio se te ne esci con una Juve, o il Milan?
        {charTag(ThirdCharacter, "neutral")}:                                   Però ti ci porterei a giocare a calcetto con gli altri.
                                                                                La cosa migliore fatta dal Poggi, sicuramente.
                                                                                Dopo la piccola Olivia.
        {charTag(ThirdCharacter, "jester")}:                                    E dopo avermi scelto come amico.
        {charTag(ThirdCharacter, "neutral")}:                                   Ci manca nelle partitelle, lo stronzo.
                                                                                Però ce la caviamo comunque.
                                                                                Il Giova è una bomba in porta.
        {charTag(ThirdCharacter, "jester")}:                                    Una bomba per l'età che c'ha.
        {charTag(ThirdCharacter, "neutral")}:                                   Dario invece è velocissimo come attaccante.
        {charTag(ThirdCharacter, "bored")}:                                     Peccato che c'abbia in mezzo ai coglioni il Merlo, che vuole sempre la palla e poi non sa mai segnare.
        {charTag(ThirdCharacter, "neutral")}:                                   Due anni fa però siamo riusciti anche a tirare su un mezzo torneo tra colleghi, amici e clienti.
                                                                                Dona mi aveva appena lasciato.
        {charTag(ThirdCharacter, "jester")}:                                    Calciavo ogni cazzo di palla come una bomba.
                                                                                Alla fine siamo arrivati secondi.
        {charTag(ThirdCharacter, "neutral")}:                                   Ci ha salvato Rocco ai rigori.
                                                                                Quell'uomo è tanto silenzioso quanto letale.


        + \ {charTag(PG, "neutral")}:                                           E di cosa parlate quando siete assieme?
                -> glyph_choice_manager(false, airC)->
        {charTag(ThirdCharacter, "jester")}:                                    Di calcio, ovvio!
        {charTag(ThirdCharacter, "bored")}:                                     Al Merlo piace anche criticare gli altri.
                                                                                Chi non c'è in quel momento, l'infame.
        {charTag(ThirdCharacter, "neutral")}:                                   Qualcuno con cui abbiamo giocato la settimana prima, o un collega che conosciamo anche noi.
        {charTag(ThirdCharacter, "bored")}:                                     Per il Merlo sono tutti sempre troppo sfigati.
                                                                                O perché non c'hanno la figa, o perché non c'hanno i soldi, o perché non fanno nulla tutto il giorno.
        {charTag(ThirdCharacter, "jester")}:                                    A volte fa ridere, perché dice le cose in un modo da coglione totale.
        {charTag(ThirdCharacter, "neutral")}:                                   Ma la maggior parte delle volte è fottutissimamente pesante.


        + \ {charTag(PG, "neutral")}:                                           Il calcio ti ha sempre dato così tanta stabilità. {charNameThree}?
                -> glyph_choice_manager(false, earthC)->
        {charTag(ThirdCharacter, "jester")}:                                    Da sempre.
        {charTag(ThirdCharacter, "neutral")}:                                   Da piccolo passavo le ore a fare le mie formazioni, a studiarmi le strategie.
                                                                                Andavo allo stadio con mamma.
                                                                                Per un po' ho anche sperato di poter diventare un professionista.
                                                                                È venuto questo tizio della primavera del Milan a vedere me e un altro compagno.
        {charTag(ThirdCharacter, "bored")}:                                     Ma prima ancora che potesse accadere qualcosa mio padre si è messo in mezzo e ha detto all'allenatore che un bambino non deve lavorare.
        {charTag(ThirdCharacter, "neutral")}:                                   Non credo mi avrebbero mai preso.
        {charTag(ThirdCharacter, "bored")}:                                     Ma è un'altra cosa per cui odio mio padre.
        {charTag(ThirdCharacter, "jester")}:                                    Anche se giocare nel Milan, da interista, aiuto!                                                                        

                
        + \ {charTag(PG, "neutral")}:                                           Hai trasformato la tua rabbia in qualcosa per vincere, figo!
                -> glyph_choice_manager(false, fireC)->
        {charTag(ThirdCharacter, "jester")}:                                    Già.
                                                                                Ma avrei preferito non essere arrabbiato e perdere, vecio.
        {charTag(ThirdCharacter, "neutral")}:                                   Però questa è una di quelle cose che Dona non capiva.
                                                                                I lunedì sera non sono solo una serata "tra ragazzi".
        {charTag(ThirdCharacter, "bored")}:                                     Anche se poi capivo che lei diceva "tra vecchi imbecilli che non vogliono crescere".
        {charTag(ThirdCharacter, "neutral")}:                                   Senza i lunedì sera sarei il cazzo di coglione che si è schiantato in moto ubriaco.
                                                                                O che finiva per litigare nei bar e fare rissa.
                                                                                Il pallone, quelle partitelle, mi fanno sfogare l'incazzatura che c'ho col mondo.

            
        + \ {charTag(PG, "neutral")}:                                           Ho l'impressione che vuoi davvero bene a questi ragazzi, vero?
                -> glyph_choice_manager(false, waterC)->
        {charTag(ThirdCharacter, "bored")}:                                     <i>Bene</i> è una parola strana.
        {charTag(ThirdCharacter, "jester")}:                                    È una cosa che dici alla tua tipa o a tua madre.
        {charTag(ThirdCharacter, "neutral")}:                                   Però ci tengo a loro, sì.
        {charTag(ThirdCharacter, "jester")}:                                    Anche se a volte li strozzerei.
                
        + \ {charTag(PG, "neutral")}:                                           Sai che sono un{player_pronoun has him:o|{player_pronoun has her:a|ə}} che tifa sempre le squadre perdenti?
                -> glyph_choice_manager(false, aetherC)->
        {charTag(ThirdCharacter, "bored")}:                                     Te ti vuoi male, vecio.
        {charTag(ThirdCharacter, "neutral")}:                                   Cioè, capisco la cosa del perdere ogni tanto, perché poi quando vinci senti proprio che è una figata.
        {charTag(ThirdCharacter, "bored")}:                                     Ma <i>sempre</i>?
                                                                                Non è manco tifare per una squadretta sfigata, è proprio cambiare di settimana in settimana per farsi del male.
        {charTag(ThirdCharacter, "jester")}:                                    Un masochista.
                                                                                Ora capisco meglio perché stai qui!                                                                                                                                
        -
       
            //Intermezzo culinario
            ~ third_char_kitchen_comments(oneKitchen)

        {charTag(ThirdCharacter, "neutral")}:                                   Ma se domani tiriamo su una squadretta, in che ruolo ti mettiamo vecio?
            
            -> kitchen_moon_feedback -> 
        

        + (earth1)\ {charTag(PG, "neutral")}:                                   <i>Stufo della soia del centrocampista.</i>
            ~ kitchen_recipeNoun = "Stufato di soia"
            -> glyph_choice_manager(true, earthC)->
        {charTag(ThirdCharacter, "jester")}:                                    Ci sta, il tizio che sta sempre in mezzo alle scatole.
                                                                                Scherzo.
        {charTag(ThirdCharacter, "neutral")}:                                   Io non c'ho tutta questa pazienza di stare lì, sempre lontano dalle porte.

        + (water1)\ {charTag(PG, "neutral")}:                                   <i>Lavo dell'insalata di spinaci del difensore.</i>
            ~ kitchen_recipeNoun = "Insalata di spinaci"
            -> glyph_choice_manager(true, waterC)->
        {charTag(ThirdCharacter, "bored")}:                                     Che balle, vecio!
        {charTag(ThirdCharacter, "jester")}:                                    Cioè, meglio per me, anche perché in squadra tutti vogliono fare l'attaccante.
        {charTag(ThirdCharacter, "neutral")}:                                   Ma boh, è una cosa noiosissima.

        + (fire1)\ {charTag(PG, "neutral")}:                                    <i>Friggo dei peperoncini dell'attaccante.</i>
            ~ kitchen_recipeNoun = "Frittura di peperoncini"
            -> glyph_choice_manager(true, fireC)->
        {charTag(ThirdCharacter, "jester")}:                                    Come me.
        {charTag(ThirdCharacter, "bored")}:                                     Quindi, col cazzo.
        {charTag(ThirdCharacter, "jester")}:                                    Scherzo, però alla fine tutti nel gruppo voglio sempre stare in attacco.                                                                        
            
        + (aether1)\ {charTag(PG, "neutral")}:                                  <i>Salto del riso del portiere.</i>
            ~ kitchen_recipeNoun = "Sauté di riso "
            -> glyph_choice_manager(true, aetherC)->
        {charTag(ThirdCharacter, "bored")}:                                     Sto per dire una cosa odiosa, ma è un ruolo che toglierei.
                                                                                Lascerei la difesa della porta ai difensori.
                                                                                Niente uso delle mani.
                                                                                Perché uno deve averci delle regole tutte sue, scusa?
                                                                                Facciamo la porta più piccola, tipo quella dell'hockey, e bona.

        + (air1)\ {charTag(PG, "neutral")}:                                     <i>Immergo nell'olio dei pomodorini dell'arbitro.</i>
            ~ kitchen_recipeNoun = "Confit di pomodori"
            -> glyph_choice_manager(true, airC)->
        {charTag(ThirdCharacter, "jester")}:                                    CORNUTOOOOOOOOO!
                                                                                Scusa, ma non potevo farne a meno.
        {charTag(ThirdCharacter, "bored")}:                                     Cioè, è una scelta.
        {charTag(ThirdCharacter, "neutral")}:                                   Ti faresti nemico tutti.
                                                                                Passeresti le serate a litigare col Merlo.
        {charTag(ThirdCharacter, "jester")}:                                    E toglieresti a me il problema.

        -  

            //Intermezzo culinario
            ~ third_char_kitchen_comments(twoKitchen)
 
        {charTag(ThirdCharacter, "neutral")}:                                   Ultimamente capita che le serata assieme saltano.
                                                                                Ed è difficile che ci siamo tutti.
                                                                                Tra figli, mogli e lavoro c'è sempre qualche cazzo di mezzo.
                                                                                Col Poggi non era così, non è mai stato così, almeno fino all'arrivo di Olivia.
        {charTag(ThirdCharacter, "jester")}:                                    Appena abbiamo iniziato a fare casino assieme, la nostra serata settimanale era garantita.
        {charTag(ThirdCharacter, "neutral")}:                                   Si andava a vedere le partite, o ci facevamo una bevuta al Baretto, quando ancora non ci lavoravo.
        {charTag(ThirdCharacter, "jester")}:                                    O andavamo a caccia di figa.
                                                                                Quando c'avevamo vent'anni nessuno ci fermava, vecio.
        {charTag(ThirdCharacter, "neutral")}:                                   Tra le serate in discoteca e poi le feste, la domenica eravamo sempre delle pezze.
        {charTag(ThirdCharacter, "jester")}:                                    Ma felici.
                                                                                E dovevi vedere come piaceva alle ragazze.
                                                                                Non c'ha la faccia da idiota come la mia, è tutto gentile, sorridente, e ti ascolta.
        {charTag(ThirdCharacter, "neutral")}:                                   E così cadevano tutte ai suoi piedi.
        {charTag(ThirdCharacter, "jester")}:                                    Lo stronzo.
        {charTag(ThirdCharacter, "neutral")}:                                   Quando si è trovato Amanda, sapevo che erano perfetti assieme.
                                                                                La prima sera che si sono incontrati c'era un non so che, una roba che con Dona non ce l'ho mai avuta.
        {charTag(ThirdCharacter, "bored")}:                                     Non uscivamo quasi mai a quattro, ma perché Dona non si sentiva all'altezza delle conversazioni dell'<i>ingegnera</i>.
                                                                                Dona lo diceva sempre con disprezzo quell'<i>ingegnera</i>.
        {charTag(ThirdCharacter, "neutral")}:                                   Quando è nata Olivia e pian piano il Poggi è scomparso, ero convinto che fosse colpa di Dona.
                                                                                Che Amanda non c'aveva voglia di crescere la figlia con una accanto che la guarda con fastidio e fa i finti sorrisini.
                                                                                Ma quando Dona mi ha lasciato, non è cambiato niente.
        {charTag(ThirdCharacter, "melanchonic")}:                               Io boh.
                                                                                Non capisco {player_name}, proprio non capisco.

    
        + \ {charTag(PG, "neutral")}:                                           Riesci a rimanere aggiornato sulla vita del Poggi?
                -> glyph_choice_manager(false, airC)->
        {charTag(ThirdCharacter, "bored")}:                                     A volte durante le partitelle qualcuno se ne esce con qualche commento, e così scopro qualche novità.
                                                                                Ma mi rode un po' il culo quando parlano di lui, perché sono degli ingrati.
        {charTag(ThirdCharacter, "angry")}:                                     Soprattutto il Merlo.
        {charTag(ThirdCharacter, "bored")}:                                     Ogni tanto se ne esce con robe tipo che è contento che non c'è più nella chat di gruppo, perché mandava anche cose politiche o le foto della figlia "manco fosse il gatto", dice sempre il Merlo.
                                                                                Dio, che coglione.
                                                                                L'unica cosa che sa fare è mandare foto di tizie dei porno e lamentarsi di tutti.
       

        + \ {charTag(PG, "neutral")}:                                           Quando hai deciso che sarebbe diventato il tuo migliore amico?
                -> glyph_choice_manager(false, earthC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Non c'è stato un momento preciso.
                                                                                No, non è vero.
                                                                                Doveva esserci la gita di classe della quinta, la aspettavamo tutti da inizio anno.
        {charTag(ThirdCharacter, "bored")}:                                     Ma a casa la situazione economica ormai era un disastro.
        {charTag(ThirdCharacter, "neutral")}:                                   Sua mamma ha proposto di pagarmi il viaggio, ma non volevo la carità.
                                                                                E così lui ha deciso di non andare.
                                                                                E sono stato a casa da lui per tre giorni a giocare e mangiare schifezze.
        {charTag(ThirdCharacter, "jester")}:                                    E rovistare tra le cassette porno dei suoi genitori.

                
        + \ {charTag(PG, "neutral")}:                                           Sei incazzato con lui?
                -> glyph_choice_manager(false, fireC)->
        {charTag(ThirdCharacter, "neutral")}:                                   No.
                                                                                Alla fine ha fatto le sue scelte, no?
                                                                                Le facciamo tutti.
        {charTag(ThirdCharacter, "jester")}:                                    Anche se non è che qualcuno gli ha detto "O la tua famiglia o quel coglione del tuo migliore amico!".
        {charTag(ThirdCharacter, "neutral")}:                                   Non che io sappia.
        {charTag(ThirdCharacter, "bored")}:                                     Quindi perché ha dovuto allontanarmi?
            
        + \ {charTag(PG, "neutral")}:                                           Eri geloso di Amanda?
                -> glyph_choice_manager(false, waterC)->
        {charTag(ThirdCharacter, "bored")}:                                     Ma che domande sono, vecio?
        {charTag(ThirdCharacter, "jester")}:                                    Una come lei non mi avrebbe mai filato, comunque.
        {charTag(ThirdCharacter, "neutral")}:                                   È una che c'ha bisogno di stimoli intellettuali.
                                                                                Viaggiano e vanno alle mostre e quelle cose lì.
                                                                                Cioè, ti tira anche dei rutti che diventi pelato.
        {charTag(ThirdCharacter, "jester")}:                                    Ma io potevo darle solo i rutti, non i musei, no?
                
        + \ {charTag(PG, "neutral")}:                                           Il Poggi è la tua famiglia.
                -> glyph_choice_manager(false, aetherC)->
        {charTag(ThirdCharacter, "bored")}:                                     La mia famiglia è, doveva essere Dona.
        {charTag(ThirdCharacter, "neutral")}:                                   Ma in un certo senso, sì.
                                                                                Credo.
                                                                                Cioè, è normale, no?
                                                                                Ci cresci con questo stronzo.
                                                                                Ci affronti le cose di merda come la morte dei genitori i casini a lavoro e le prime relazioni finite male.
                                                                                Diventa un fratello.
                                                                                Una cosa più forte del sangue.
                                                                                Quindi sì, di pure che è famiglia.
        {charTag(ThirdCharacter, "melanchonic")}:                               Era famiglia.                                                
        -
            //Intermezzo culinario
            ~ third_char_kitchen_comments(threeKitchen)

        {charTag(ThirdCharacter, "bored")}:                                     Forse sono un po' incazzato col Poggi.
                                                                                Alla fine mi ha messo da parte per la sua famiglia.
        {charTag(ThirdCharacter, "neutral")}:                                   Boh.
                                                                                Secondo te si fa bene a perdonare qualcuno?
                                                                                Cioè, è una cosa che si deve sempre fare?
                                                                                O finisci per mancarti da solo di rispetto?
        
        + (earth2)\ {charTag(PG, "neutral")}:                                   <i>Grattuggio delle olive della invalicabilità.</i>
            ~ kitchen_recipeAdjective = "invalicabilità"
            -> glyph_choice_manager(true, earthC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Già.
                                                                                Uno può cedere un po', in alcune situazioni.
                                                                                Ma altre sono invalicabili, punto.
            
        + (air2)\ {charTag(PG, "neutral")}:                                     <i>Impano delle mandorle noncuranti.</i>
            ~ kitchen_recipeAdjective = "noncuranza"
            -> glyph_choice_manager(true, airC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Non so se sia una gran cosa, ma buon per te.
                                                                                Io non ce la faccio proprio a farmi passare addosso le cose, zero.
                                                                                Mi fai un torto?
        {charTag(ThirdCharacter, "jester")}:                                    Me lo porto fino alla tomba.
            
        + (water2)\ {charTag(PG, "neutral")}:                                   <i>Mescolo dei semi della apertura.</i>
            ~ kitchen_recipeAdjective = "apertura"
            -> glyph_choice_manager(true, waterC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Boh vecio, alla fine uno però un limite lo deve anche tirare.
        {charTag(ThirdCharacter, "bored")}:                                     Perché se stai lì a chiappe all'aria tutto il tempo poi è ovvio che lo prendi nel culo, no?
    
        + (aether2)\ {charTag(PG, "neutral")}:                                  <i>Scaldo delle ciliege collaborative.</i>
            ~ kitchen_recipeAdjective = "collaborazione"
            -> glyph_choice_manager(true, aetherC)->
        {charTag(ThirdCharacter, "bored")}:                                     Collabori nel farti prendere nel culo?
                                                                                Tipo <i>Porgi l'altra guancia</i>?
                                                                                Perché non sono uno molto religioso, vecio.
        {charTag(ThirdCharacter, "jester")}:                                    I santi li chiamo giusto quando arrivano le bollette da pagare.

        + (fire2)\ {charTag(PG, "neutral")}:                                    <i>Sbuccio dell'aglio intransigente.</i>
            ~ kitchen_recipeAdjective = "intransigenza"
            -> glyph_choice_manager(true, fireC)->
        {charTag(ThirdCharacter, "jester")}:                                    Ci capiamo, noi due.
        {charTag(ThirdCharacter, "neutral")}:                                   Ci sta anche perdonare, una volta.
                                                                                Anche se comunque me la legherò al dito per un bel po'.
        {charTag(ThirdCharacter, "bored")}:                                     Ma una.
                                                                                Poi basta, vecio.
        {charTag(ThirdCharacter, "neutral")}:                                   Com'era quella canzone?
        {charTag(ThirdCharacter, "jester")}:                                    La prima volta stronzo tu, la seconda scemo io?                                                                            
        -      
            //Intermezzo culinario
            ~ third_char_kitchen_comments(fourKitchen)

        {charTag(ThirdCharacter, "neutral")}:                                   Comunque non credo gli scriverò presto, al Poggi.
                                                                                Anche se c'ho una voglia matta di raccontargli questa situazione assurda.
        {charTag(ThirdCharacter, "bored")}:                                     Ma non voglio che pensa che sono pesante a dirgli che si sta comportando da stronzo.
        {charTag(ThirdCharacter, "neutral")}:                                   Però potrei parlarci col Rocco.
                                                                                Lui è strano, vecio, ma in modo buono.
                                                                                Come il Poggi.
        {charTag(ThirdCharacter, "jester")}:                                    Non ci ho mai cavato più di due frasi di bocca per anni.
        {charTag(ThirdCharacter, "neutral")}:                                   Poi ce ne andiamo una volta a Milano a festeggiare lo scudetto, e durante il viaggio del ritorno mi dice che è preoccupato per il suo vecio.
                                                                                Mi dice che è malato, e che vorrebbe che venisse qui, ma che lui è testone e se ne vuole stare in Egitto.
                                                                                E che è preoccupato perché i suoi figli hanno avuto dei problemi di razzismo, non ho capito cosa, robe legate agli affitti.
                                                                                E così finisce che dorme poco perché non sa se rimanere qui in Italia o tornare in Egitto.
                                                                                Mi dice che gli sembra di impazzire e che non ne può parlare con sua moglie perché lei non vede l'ora di tornare dalla sua famiglia, dice che lei non è oggettiva, non vede tutti i problemi.
                                                                                Continua così, a guidare e raccontarmi e poi a una certa si ferma e mi dice "Grazie {charNameThree}. Ho questa cosa addosso da mesi e avevo bisogno di parlarne con qualcuno, ma quando siamo a calcetto non mi viene da parlare. Merloni e Giovanni criticano sempre tutti, mi avrebbero solo fatto sentire uno sfigato."
        {charTag(ThirdCharacter, "melanchonic")}:                               Io ho risposto con una cosa stupida, ma la cosa più stupida che puoi pensare, e ci siamo messi a parlare dell'Inter.
        {charTag(ThirdCharacter, "neutral")}:                                   Però da lì, abbiamo preso a uscire e berci una birretta dopo calcetto.
                                                                                Ovviamente il Merlo ora fa battute sul fatto che siamo froci.
                                                                                Alla fine si sta assieme giusto mezz'ora.
        {charTag(ThirdCharacter, "jester")}:                                    A volte manco si dice davvero qualcosa.
        {charTag(ThirdCharacter, "neutral")}:                                   Una sigaretta.
                                                                                Ci si saluta, e via.
                                                                                Ed è una cosa strana, perché mi piacciono questi momenti.
        {charTag(ThirdCharacter, "melanchonic")}:                               Ma mi fanno anche paura, perché mi ricordano una cosa, vecio.
        {charTag(ThirdCharacter, "neutral")}:                                   Alla fine della faccenda siamo soli.
                                                                                Soli.

        + \ {charTag(PG, "neutral")}:                                           Alla fine cosa ha deciso di fare Rocco?
                -> glyph_choice_manager(false, airC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Si è preso tre settimane questa estate per andare in Egitto coi figli, vedere qual è la situazione effettiva.
                                                                                Capire se i parenti che ci sono lì stanno aiutando davvero o meno.
                                                                                E prendersi uno stacco dalla moglie, perché per questa cosa stanno litigando spesso.
                                                                                Io non so se me la farei tutta questa sbatta per il mio vecio, sinceramente.
                                                                                Per mamma avrei smosso il mondo.
                                                                                Ma per lui?
        {charTag(ThirdCharacter, "bored")}:                                     Non credo.

        + \ {charTag(PG, "neutral")}:                                           Se le proprie basi sono solide, non si è mai totalmente soli.
                -> glyph_choice_manager(false, earthC)->
        {charTag(ThirdCharacter, "jester")}:                                    Ah ah allora le mie basi fanno proprio cacare, vecio.
        {charTag(ThirdCharacter, "neutral")}:                                   C'è.
                                                                                Non sono sempre belle, le notti, sai?
                                                                                Non dopo che hai speso cinque anni in un letto con una persona che ami.
                                                                                Ma anche quando sono coi ragazzi.
                                                                                Boh.
        {charTag(ThirdCharacter, "bored")}:                                     Non ci voglio pensare.

                
        + \ {charTag(PG, "neutral")}:                                           La vita è lotta, solitudine e sopravvivenza.
                -> glyph_choice_manager(false, fireC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Già.
        {charTag(ThirdCharacter, "bored")}:                                     È una cosa schifosa, {player_name}.
        {charTag(ThirdCharacter, "neutral")}:                                   Però una volta che la accetti, ci fai pure pace.
                                                                                Non ti fai troppe aspettative.
                                                                                Chiedi solo di andare avanti per la tua vita senza rotture di cazzo.
        {charTag(ThirdCharacter, "bored")}:                                     Io non pretendo niente da te, tu non devi pretendere nulla da me.
                                                                                                                                                    
            
        + \ {charTag(PG, "neutral")}:                                           Pensi alla solitudine, ma hai davanti qualcuno che ti vuole diventare amico.
                -> glyph_choice_manager(false, waterC)->
        {charTag(ThirdCharacter, "bored")}:                                     Bella roba, visto che il mio migliore amico mi è sparito, no?
        {charTag(ThirdCharacter, "neutral")}:                                   Poi...
        {charTag(ThirdCharacter, "melanchonic")}:                               Merda.
        {charTag(ThirdCharacter, "neutral")}:                                   Io c'ho il bisogno di chiudere le cose che non capisco prima di fare qualcosa di nuovo.
        {charTag(ThirdCharacter, "bored")}:                                     E ancora non capisco cosa sia successo col Poggi.
                                                                                Non c'ha senso però.
        {charTag(ThirdCharacter, "jester")}:                                    Sono davvero una testa di cazzo.

        + \ {charTag(PG, "neutral")}:                                           Per non essere soli serve essere vulnerabili.
                -> glyph_choice_manager(false, aetherC)->
        {charTag(ThirdCharacter, "bored")}:                                     Cos'è, un pezzo della Pausini?
        {charTag(ThirdCharacter, "neutral")}:                                   E non c'ha senso, vecio.
                                                                                Il Rocco con me è stato vulnerabile, no?
        {charTag(ThirdCharacter, "bored")}:                                     Ma poi questa merda se la deve sfangare da solo, con la moglie in ansia e il padre che non vuole andarsene dal suo paese.
        {charTag(ThirdCharacter, "neutral")}:                                   Questa cosa dell'essere soli è più.
        {charTag(ThirdCharacter, "melanchonic")}:                               Più...
        {charTag(ThirdCharacter, "neutral")}:                                   C'hai una vita enorme davanti, e non sai con chi sarai alla fine, quando dovrai schiattare.
                                                                                A parte te.
        {charTag(ThirdCharacter, "bored")}:                                     È l'unica cosa certa.
        -
            //Intermezzo culinario
            ~ third_char_kitchen_comments(fiveKitchen)

        {charTag(ThirdCharacter, "neutral")}:                                   Merda, che pesante che sono stato.
                                                                                Dovevamo parlare di calcio e invece.
                                                                                Te non c'hai mai paura di risultare troppo pesante coi tuoi amici?
        
        + (water3)\ {charTag(PG, "neutral")}:                                   <i>Spruzzo con acqua di rose sinergica.</i>
            ~ kitchen_recipeComplement = "acqua di rose sinergica"
            -> glyph_choice_manager(true, waterC)->
        {charTag(ThirdCharacter, "bored")}:                                     Cos'è?
                                                                                Vi ritrovate a farvi le unghie e parlare dei vostri ragazzi?
        {charTag(ThirdCharacter, "jester")}:                                    Scherzo.
        {charTag(ThirdCharacter, "neutral")}:                                   Però preferirei tagliarmi le palle e mangiarle che passare il tempo a parlare di pesate.

        + (earth3)\ {charTag(PG, "neutral")}:                                   <i>Incorporo delle carote del sinallagma.</i>
            ~ kitchen_recipeComplement = "carote del sinallagma"
            -> glyph_choice_manager(true, earthC)->
        {charTag(ThirdCharacter, "jester")}:                                    Questa me la ricordo per un casino di Dona con un fornitore.
        {charTag(ThirdCharacter, "neutral")}:                                   Che in soldoni è: dare e avere secondo contratto?
        {charTag(ThirdCharacter, "bored")}:                                     È un modo di dire che stai lì a contare i minuti di pesate condivise?
        {charTag(ThirdCharacter, "neutral")}:                                   Aiuto.
        {charTag(ThirdCharacter, "jester")}:                                    Te l'ho già detto zio che quello intelligente è il Poggi, non io.                                            
            
        + (air3)\ {charTag(PG, "neutral")}:                                     <i>Decoro con delle bacche del filosofeggiare.</i>
            ~ kitchen_recipeComplement = "bacche del filosofeggiare"
            -> glyph_choice_manager(true, airC)->
        {charTag(ThirdCharacter, "jester")}:                                    Non so sei sia meglio, vecio!
        {charTag(ThirdCharacter, "neutral")}:                                   Quelle cose alla Marzullo, tipo "È meglio avere il cazzo piccolo e scopare, o avere il cazzo grande e non scopare"?
        {charTag(ThirdCharacter, "jester")}:                                    Giusto?
                                                                                Perché nel caso possiamo filosofeggiare per giorni, vecio!                                                             

        + (aether3)\ {charTag(PG, "neutral")}:                                  <i>Imbevo il tutto con della grappa del coevolvere.</i>
            ~ kitchen_recipeComplement = "grappa del coevolvere"
            -> glyph_choice_manager(true, aetherC)->
        {charTag(ThirdCharacter, "neutral")}:                                   La quantità di pipponi che ti fai tu vecio.
        {charTag(ThirdCharacter, "jester")}:                                    Manco {charNameOne}!

        + (fire3)\ {charTag(PG, "neutral")}:                                    <i>Rivesto con granella del silenzio.</i>
            ~ kitchen_recipeComplement = "granella del silenzio"
            -> glyph_choice_manager(true, fireC)->
        {charTag(ThirdCharacter, "jester")}:                                    Idem.
        {charTag(ThirdCharacter, "neutral")}:                                   La vita è già difficile di suo, perché devo anche riempire qualcuno con le mie paranoie?
        {charTag(ThirdCharacter, "bored")}:                                     Meglio stare lì a giocare a calcetto e bona, no?
        {charTag(ThirdCharacter, "jester")}:                                    Così tutto passa.    
        -
            //Intermezzo culinario
            ~ third_char_kitchen_comments(sixKitchen)

        -> fourth_ingredient_dispatcher
            
    
    = second_theme
    //ragazze
        ~ temp charNameOne = translator(thirdChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
    
    {charTag(ThirdCharacter, "neutral")}:                                       Frase
        
        + \ {charTag(PG, "neutral")}:                                           Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                -> glyph_choice_manager(false, airC)->

        + \ {charTag(PG, "neutral")}:                                           Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
                
        + \ {charTag(PG, "neutral")}:                                           Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            
        + \ {charTag(PG, "neutral")}:                                           Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
                
        + \ {charTag(PG, "neutral")}:                                           Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                -> glyph_choice_manager(false, aetherC)->
        -
             //Intermezzo culinario
            ~ third_char_kitchen_comments(oneKitchen)

        {charTag(ThirdCharacter, "jester")}:                                    Ma ora voglio farmi due risate con te vecio!
        {charTag(ThirdCharacter, "neutral")}:                                   Racconta un po' a zio {charNameThree} come imbrocchi?
        {charTag(ThirdCharacter, "jester")}:                                    I dettagli sconci solo se c'hai anche qualche foto!
            
            -> kitchen_moon_feedback -> 
        

        + (earth1)\ {charTag(PG, "neutral")}:                                   <i>Ingrediente terra</i>
            ~ kitchen_recipeNoun = "Zuppa di grano"
            -> glyph_choice_manager(true, earthC)->

        + (water1)\ {charTag(PG, "neutral")}:                                   <i>Ingrediente acqua</i>
            ~ kitchen_recipeNoun = "Grigliata di seitan"
            -> glyph_choice_manager(true, waterC)->
            
        + (fire1)\ {charTag(PG, "neutral")}:                                    <i>Ingrediente fire</i>
            ~ kitchen_recipeNoun = "Fagiolata"
            -> glyph_choice_manager(true, fireC)->
    
        + (aether1)\ {charTag(PG, "neutral")}:                                  <i>Ingrediente spirito</i>
            ~ kitchen_recipeNoun = "Cimetta di broccolo"
            -> glyph_choice_manager(true, aetherC)->

        + (air1)\ {charTag(PG, "neutral")}:                                     <i>Ingrediente aria</i>
            ~ kitchen_recipeNoun = "Crema d'aglio"
            -> glyph_choice_manager(true, airC)->
        -  
             //Intermezzo culinario
            ~ third_char_kitchen_comments(twoKitchen)

        {charTag(ThirdCharacter, "neutral")}:                                   Frase
                                                                                                                                                   

        + \ {charTag(PG, "neutral")}:                                           Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                -> glyph_choice_manager(false, airC)->

        + \ {charTag(PG, "neutral")}:                                           Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
                
        + \ {charTag(PG, "neutral")}:                                           Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            
        + \ {charTag(PG, "neutral")}:                                           Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
                
        + \ {charTag(PG, "neutral")}:                                           Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                -> glyph_choice_manager(false, aetherC)->

        -
             //Intermezzo culinario
            ~ third_char_kitchen_comments(threeKitchen)
        
        {charTag(ThirdCharacter, "neutral")}:                                   Non farti idee strane, ma c'ho una cosa che voglio chiederti da un po'.
                                                                                Questa non l'ho chiesta nemmeno ai ragazzi del calcetto.
        {charTag(ThirdCharacter, "jester")}:                                    Vedi quanto mi fido di te?
        {charTag(ThirdCharacter, "neutral")}:                                   Per te scopare è una cosa importante in una relazione?
        
        + (earth2)\ {charTag(PG, "neutral")}:                                   <i>Ingrediente terra</i>
            ~ kitchen_recipeAdjective = "onesta"
            -> glyph_choice_manager(true, earthC)->

            
        + (air2)\ {charTag(PG, "neutral")}:                                     <i>Ingrediente aria</i>//Aromantico
            ~ kitchen_recipeAdjective = "allegra"
            -> glyph_choice_manager(true, airC)->

            
        + (water2)\ {charTag(PG, "neutral")}:                                   <i>Ingrediente acqua</i>//conta più l'emozione
            ~ kitchen_recipeAdjective = "empatica"
            -> glyph_choice_manager(true, waterC)->

    
        + (aether2)\ {charTag(PG, "neutral")}:                                  <i>Ingrediente spirito</i>
            ~ kitchen_recipeAdjective = "incondizionata"
            -> glyph_choice_manager(true, aetherC)->


        + (fire2)\ {charTag(PG, "neutral")}:                                    <i>Ingrediente fire</i>//che differenza di "sì" ci saranno tra fuoco e terra?
            ~ kitchen_recipeAdjective = "leale"
            -> glyph_choice_manager(true, fireC)->
        - 
            //Intermezzo culinario
            ~ third_char_kitchen_comments(fourKitchen)    
        
        {charTag(ThirdCharacter, "neutral")}:                                   Frase

        + \ {charTag(PG, "neutral")}:                                           Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                -> glyph_choice_manager(false, airC)->

        + \ {charTag(PG, "neutral")}:                                           Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
                
        + \ {charTag(PG, "neutral")}:                                           Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            
        + \ {charTag(PG, "neutral")}:                                           Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
                
        + \ {charTag(PG, "neutral")}:                                           Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                -> glyph_choice_manager(false, aetherC)->
            -

             //Intermezzo culinario
            ~ third_char_kitchen_comments(fiveKitchen)


        {charTag(ThirdCharacter, "neutral")}:                                   Te ti ci vedi come padre?
                                                                                Una o due bestiacce in giro per la casa, con cui incazzarti quando ci sono.
                                                                                E sentire la mancanza appena se ne vanno a scuola?
        
        + (water3)\ {charTag(PG, "neutral")}:                                   <i>Ingrediente acqua</i>
            ~ kitchen_recipeComplement = "con brodo del terrore"
            -> glyph_choice_manager(true, waterC)->
            
        + (earth3)\ {charTag(PG, "neutral")}:                                   <i>Ingrediente terra</i>
            ~ kitchen_recipeComplement = "con noce euforica"
            -> glyph_choice_manager(true, earthC)->
            
        + (air3)\ {charTag(PG, "neutral")}:                                     <i>Ingrediente aria</i>
            ~ kitchen_recipeComplement = "con semi dell'<i>io? no, no è possibile!</i>"
            -> glyph_choice_manager(true, airC)->
    
        + (aether3)\ {charTag(PG, "neutral")}:                                  <i>Ingrediente spirito</i>
            ~ kitchen_recipeComplement = "con olio delle lusinghe"
            -> glyph_choice_manager(true, aetherC)->

        + (fire3)\ {charTag(PG, "neutral")}:                                    <i>Ingrediente fire</i>
            ~ kitchen_recipeComplement = "con peperoncini arrapati"
            -> glyph_choice_manager(true, fireC)->
        -
             //Intermezzo culinario
            ~ third_char_kitchen_comments(sixKitchen)
        
        -> fourth_ingredient_dispatcher
            
                
    
    = third_theme
    //lavoro
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive= translator(fifthChar_ActualName)


        {charTag(ThirdCharacter, "jester")}:                                    Ah ah, ci sta.
                                                                                Ed è la cosa che mi viene meglio!
        {charTag(ThirdCharacter, "neutral")}:                                   Lavorare dico, non parlare.
                                                                                Anche se alla fine metà del mio lavoro è quello.
        {charTag(ThirdCharacter, "jester")}:                                    Niente di troppo spirituale o psicologico, non ti preoccupare!
        {charTag(ThirdCharacter, "neutral")}:                                   Ma i clienti sono contenti quando ti ricordi i loro nomi.
                                                                                Quando sai già cos'è che prendono.
                                                                                Che Tizio non vuole il sale sulle patatine, o che Caio si siede al tavolo per ore con la stessa birra.
                                                                                Amo le birre, ma la cosa che mi piace davvero è fare sentire il cliente a casa.
        {charTag(ThirdCharacter, "bored")}:                                     E detto tra noi, anche per questo mi incazzo col Merlo e gli altri del calcetto.
        {charTag(ThirdCharacter, "neutral")}:                                   Una sera il Giova mi dice "Beato te che fai ancora un lavoro da ragazzino".
        {charTag(ThirdCharacter, "bored")}:                                     Secondo me se la sentono tanto per i soldi che fanno.
        {charTag(ThirdCharacter, "neutral")}:                                   Ma c'è una cosa che non capiscono proprio: che le persone possono vivere senza l'ultima start up del cazzo lanciata dal Giova.
                                                                                O quel particolare bullone stampato o che ne so io da Rocco.
                                                                                E anche le case che costruisce il Merlo, alla fine non ce ne servono così tante.
                                                                                Ma un posto dove staccare la testa e dimenticare il mondo.
                                                                                Quello è un posto che salva le vite, {player_name}.
                                                                                Che tiene le persone unite anche nei periodi di merda.
        {charTag(ThirdCharacter, "bored")}:                                     Questa roba soprattutto il Merlo e il Giova non la capiranno mai.
                                                                                                         
        
        + \ {charTag(PG, "neutral")}:                                           Quando gli dici queste cose, come reagiscono?
                -> glyph_choice_manager(false, airC)->
        {charTag(ThirdCharacter, "bored")}:                                     Pensi seriamente che possa dire una cosa del genere a quei due?
                                                                                Il Giova negherebbe di aver mai detto una cosa del genere, dicendo che l'ho frainteso o roba del genere.
                                                                                Il Merlo mi darebbe del frignone e che se ci sono rimasto male è perché in fondo so che è un lavoro da ragazzini.
        {charTag(ThirdCharacter, "neutral")}:                                   No, lasciamo perdere, va.                                                                        


        + \ {charTag(PG, "neutral")}:                                           La casa non sono quattro pareti, ma le persone con cui costruisci qualcosa.
                -> glyph_choice_manager(false, earthC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "bored")}:                             È arrivat{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} {thirdChar_recordedPlayerPronoun has him:il|{thirdChar_recordedPlayerPronoun has her:la|lə}} poet{thirdChar_recordedPlayerPronoun has him:a|{thirdChar_recordedPlayerPronoun has her:essa|essə}}.
                }
        {charTag(ThirdCharacter, "neutral")}:                                   La casa è anche quattro pareti.
                                                                                Ma quanti di noi ci stanno di merda a casa?
                                                                                Un posto in cui rifugiarsi è fondamentale per sopravvivere.

        + \ {charTag(PG, "neutral")}:                                           A volte dovresti un po' mandare a fanculo i tuoi amici, {charNameThree}.
                -> glyph_choice_manager(false, fireC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "bored")}:                             Solo io posso criticarli, {player_name}!
                }
        {charTag(ThirdCharacter, "neutral")}:                                   L'ho fatto un paio di volte.
                                                                                Ma non serve a molto.
        {charTag(ThirdCharacter, "bored")}:                                     Il Merlo coglie l'occasione per ridicolizzarti ancora di più.
                                                                                Il Giova davanti al Merlo ti tratta da idiota, per poi scriverti messaggini dove ti chiede scusa.
                                                                                Passo, grazie.

        + \ {charTag(PG, "neutral")}:                                           Un po' come il cucinare assieme.
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != her:
                {charTag(ThirdCharacter, "bored")}:                             Ma non sono una donna come te.
                }
        {charTag(ThirdCharacter, "jester")}:                                    Come starai vedendo, cucinare non è il mio forte.
        {charTag(ThirdCharacter, "neutral")}:                                   Non ho mai visto la cucina come un posto dove stare bene.
                                                                                Papà insisteva perché mangiassimo tutti assieme, ma per lo più era una tortura.
                                                                                Mentre con Dona ci guardavamo le serie TV.
                                                                                Che è anche una cosa carina, quando sei stanco morto.                                                                    

        + \ {charTag(PG, "neutral")}:                                           Alla fine questo senso di comunità e unione <b>è</b> qualcosa di spirituale, {charNameThree}.
                -> glyph_choice_manager(false, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != they:
                {charTag(ThirdCharacter, "bored")}:                             Sarà.
                }
        {charTag(ThirdCharacter, "neutral")}:                                   Mamma mi raccontava che quando era piccola d'inverno passavano le giornate tutti assieme in cucina, per risparmiare.
                                                                                Sua mamma e la nonna facevano dei lavoretti in nero e chiacchieravano, e lei aiutava.
                                                                                E in quegli inverni si discuteva del destino di famiglie e mariti e rapporti coi vicini.
                                                                                E a volte si prendevano decisioni per il resto dell'anno, o della vita.
                                                                                Ecco, mi sembra più una cosa del genere.
                                                                                Non è una roba spirituale, però fa stare assieme le persone, le fa parlare.        
        -
            //Intermezzo culinario
            ~ third_char_kitchen_comments(oneKitchen)

        {charTag(ThirdCharacter, "neutral")}:                                   Ma a proposito di lavoro!
                                                                                {player_name}, domani ti dicono che puoi fare qualsiasi lavoro su questo pianeta.
                                                                                Quale scegli?
        {charTag(ThirdCharacter, "jester")}:                                    E <i>mantenut{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}}</i> non vale                                                                        
            
            -> kitchen_moon_feedback -> 
        

        + (earth1)\ {charTag(PG, "neutral")}:                                   <i>Schiaccio dei ceci della creazione.</i>
            ~ kitchen_recipeNoun = "Purea di ceci"
            -> glyph_choice_manager(true, earthC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Un po' tipo un pittore?
                                                                                O un muratore?
        {charTag(ThirdCharacter, "jester")}:                                    Le cazzate che dicono valgono come creazione?

        + (water1)\ {charTag(PG, "neutral")}:                                   <i>Frullo delle melanzane dellə Riscrittorə.</i>
            ~ kitchen_recipeNoun = "Crema di melanzane"
            -> glyph_choice_manager(true, waterC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Non il massimo della ambizione, credo?
                                                                                Però ehi, hai trovato quello che ti piace!
                                                                                Non è una cosa che possono dire tutti!

        + (fire1)\ {charTag(PG, "neutral")}:                                    <i>Pulisco della anguria della trasformazione.</i>
            ~ kitchen_recipeNoun = "Gazpacho di anguria"
            -> glyph_choice_manager(true, fireC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Tipo il birraio, che trasforma il luppolo in birra?
                                                                                O più tipo il falegname?
        {charTag(ThirdCharacter, "jester")}:                                    O il sottoscritto, che trasforma tutto in cazzate?                                                                            
    
        + (aether1)\ {charTag(PG, "neutral")}:                                  <i>Sminuzzo delle zucchine del rifiuto del lavoro.</i>
            ~ kitchen_recipeNoun = "Parmigiana di zucchine"
            -> glyph_choice_manager(true, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == they:
                {charTag(ThirdCharacter, "jester")}:                            Non binario e per sempre precario. 
                }
        {charTag(ThirdCharacter, "neutral")}:                                   Boh, io mio romperei le balle a non fare niente.
                                                                                L'anno che sono rimasto disoccupato volevo morire.
                                                                                Passavo il tempo a discutere con Donatella.
                                                                                O al Baretto a vedere se c'era qualcuno a cui attaccare una pezza.
        {charTag(ThirdCharacter, "jester")}:                                    Però mi ero seguito tutto il calcio mercato, e mi sono sparato anche le partite CAF Confederation Cup.   

        + (air1)\ {charTag(PG, "neutral")}:                                     <i>Preparo dei peperoni della divulgazione.</i>
            ~ kitchen_recipeNoun = "Cartoccio di peperoni"
            -> glyph_choice_manager(true, airC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Un po' come Piero Angela?
                                                                                O un professore di scuola?
        {charTag(ThirdCharacter, "jester")}:                                    O vuoi essere pagat{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} per raccontare in giro quanto sono bono e bravo?                                                                        
        -
            //Intermezzo culinario
            ~ third_char_kitchen_comments(twoKitchen)  
        
        {charTag(ThirdCharacter, "neutral")}:                                   Da quando è arrivata Petra c'è anche un'altra cosa che ho scoperto che mi piace del mio lavoro.
                                                                                Insegnare come farlo.
                                                                                Vedere che puoi insegnare qualcosa ti fa sentire rispettato, vero?
                                                                                Importante.
        {charTag(ThirdCharacter, "jester")}:                                    Petra è una che ascolta, più o meno.
        {charTag(ThirdCharacter, "neutral")}:                                   Non so se è perché lavora al Baretto giusto per pagarsi gli studi, o se è perché è una generazione di pelandroni, ma fa il minimo.
                                                                                Quando gliel'ho detto qualche giorno fa mi ha risposto che "viene pagata troppo poco per fare di più".
                                                                                E allora le ho detto che se non lo fa lei deve farlo qualcun altro, e lei c'è un po' rimasta male.
                                                                                Ma è in gamba Petra, anche se poi quando viene la sua ragazza si distrae un botto.
        {charTag(ThirdCharacter, "jester")}:                                    E a volte litigano coi clienti.
        {charTag(ThirdCharacter, "neutral")}:                                   Il capo dice che dobbiamo tenerci i cazzi nostri a casa quando lavoriamo qui.
                                                                                Ma Petra gli risponde ogni volta che se i suoi clienti fanno dei commenti del cazzo perché è lesbica, allora i cazzi se li ritrova lì, a lavoro, e lì li deve affrontare.
        {charTag(ThirdCharacter, "jester")}:                                    C'ha una grinta quella!
        {charTag(ThirdCharacter, "neutral")}:                                   Mi ha anche difeso perché il capo dice che bevo troppo durante il turno.
        {charTag(ThirdCharacter, "bored")}:                                     Non è che bevo troppo, reggo benissimo.
                                                                                Tra l'altro ora quell'idiota c'ha mandato <i>in prova</i> la nuova fidanzata, una incapace che palesemente è lì solo per controllarci.
                                                                                E quando provo a insegnarle le cose, mi guarda coi neuroni distaccati, zero, il vuoto.
        {charTag(ThirdCharacter, "jester")}:                                    Quella sopravvive giusto perché è tettona.
        {charTag(ThirdCharacter, "neutral")}:                                   Però mi fa strano che tante cose cambiano e tutto il resto, ma alla fine i trucchi che insegno alla Petra, quelli che uso io, sono gli stessi che mi ha insegnato mio padre anni fa, quando ero piccolo e il Baretto era ancora suo.
        {charTag(ThirdCharacter, "bored")}:                                     Un paio di cose nella vita le ha imbroccate alla fine.
        {charTag(ThirdCharacter, "jester")}:                                    L'altra cosa che ha imbroccato ovviamente è mettere questo bel pezzo di uomo al mondo!
    
        + \ {charTag(PG, "neutral")}:                                           Perché l'insegnare dovrebbe avere a che fare col ricevere rispetto?
                -> glyph_choice_manager(false, airC)->
        {charTag(ThirdCharacter, "neutral")}:                                   È un po' quella roba da "rispetta i saggi", no?
        {charTag(ThirdCharacter, "jester")}:                                    E lo so che non sono proprio un saggio.
        {charTag(ThirdCharacter, "neutral")}:                                   Però quando uno ha qualcosa da insegnare, allora un po' è arrivato, no?
        {charTag(ThirdCharacter, "jester")}:                                    O per lo meno, lo era quando sono cresciuto io.
        {charTag(ThirdCharacter, "neutral")}:                                   Sai qualcosa, la insegni, diventi un riferimento.
                                                                                Un tipo da rispettare, se non proprio sempre, almeno nel suo campo.
                                                                                                                                                                              

        + \ {charTag(PG, "neutral")}:                                           Quindi vorresti essere un riferimento, po' come {charNameFive}.
                -> glyph_choice_manager(false, earthC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "bored")}:                             Di tutti gli esempi, perché proprio la zia?
                }
        {charTag(ThirdCharacter, "neutral")}:                                   Mmm.
                                                                                Forse sì, sai?
                                                                                Cioè, lei alla fine sta qui e ti fa fare le tue cose, ma vai da lei se non capisci qualcosa, perché ne sa più di te.
                                                                                E le porti rispetto.
                                                                                Non sarebbe male se fosse così anche al bar.
        {charTag(ThirdCharacter, "jester")}:                                    Ma figurati se Petra mi tratta come tu tratti {charNameFive}!       
                
        + \ {charTag(PG, "neutral")}:                                           Quello vi chiede di lasciare i problemi personali a casa, e dà il lavoro alla fidanzata. Da sberle.
                -> glyph_choice_manager(false, fireC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "bored")}:                             Io al mio bar il lavoro a Dona l'avrei dato.
                                                                                Ma Dona è una che sgobbava.
                - else:
                {charTag(ThirdCharacter, "jester")}:                            Non è tanto che è la tipa, ma che è una incapace.                                                                
                }
        {charTag(ThirdCharacter, "bored")}:                                     Però non hai idea di quanto mi rode il culo, {player_name}.
        {charTag(ThirdCharacter, "neutral")}:                                   Ogni tanto l'idiota se ne salta fuori con "dall'anno prossimo metto i premi di produzione".
                                                                                Oppure "{charNameThree}! Da questo fine settimana devi sempre proporre qualcosa da mangiare quando ordinano da bere, o il locale chiude!"
        {charTag(ThirdCharacter, "bored")}:                                     E poi lui se ne va in ufficio a tirare.
        {charTag(ThirdCharacter, "neutral")}:                                   Perché lo sappiamo tutti.
        {charTag(ThirdCharacter, "bored")}:                                     O ha una "urgenza" a casa e si porta via la fidanzata, lasciandoci scoperti.
        {charTag(ThirdCharacter, "neutral")}:                                   Che poi meglio così che quando c'è lei.
        {charTag(ThirdCharacter, "jester")}:                                    Settimana scorsa ha messo gli hamburger con la stagnola nel microonde.
        {charTag(ThirdCharacter, "bored")}:                                     Ho ancora nel naso la puzza di plastica fusa.
            
        + \ {charTag(PG, "neutral")}:                                           Qual è il tuo ricordo più bello al Baretto?
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != her:
                {charTag(ThirdCharacter, "bored")}:                             Che è, vuoi farmi male?
                - else:
                {charTag(ThirdCharacter, "neutral")}:                           Woah, leggera questa.
                }
        {charTag(ThirdCharacter, "neutral")}:                                   Anche se ne ho tanti di quando ero piccolo, il più bello è recente.
                                                                                Il merda era in vacanza ai fiordi o non ricordo dove, ma noi abbiamo avuto una ondata di tempo di merda che non avevo mai visto.
        {charTag(ThirdCharacter, "bored")}:                                     Era un martedì e non sapevo nemmeno se aprire, non arriva tanta gente di solito, ma lui ha rotto il cazzo a smisura perché andassi lo stesso.
        {charTag(ThirdCharacter, "neutral")}:                                   L'unica cliente che mi entra per tutta la sera è questa vecchia, Sandra.
                                                                                Se ne sta lì per due ore buone con la sua tisana, e poi fa il nome di mia mamma.
                                                                                Salta fuori che la conosceva, che era amica di mia nonna.
                                                                                Fuori il temporale peggiore degli ultimi anni, e lei ha passato la sera a raccontarmi del suo passato, di mia nonna, di mamma da piccola.
                                                                                Ci siamo sparati un toast e una birra.
        {charTag(ThirdCharacter, "melanchonic")}:                               Mi è sembrato di averla lì con me per un attimo.

                
        + \ {charTag(PG, "neutral")}:                                           Petra sembra una che sa cos'è la solidarietà tra colleghi.
                -> glyph_choice_manager(false, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != they:
                {charTag(ThirdCharacter, "bored")}:                             Mmm.
                }
        {charTag(ThirdCharacter, "neutral")}:                                   Lei ci tiene a queste cose qui, ma tanto.
                                                                                A volte arriva con articoli di legge.
                                                                                Ha portato le buste paga dai sindacati ed è tornata dicendomi quante cose non vanno.
                                                                                Ma a me non va di rompere le balle.
        {charTag(ThirdCharacter, "jester")}:                                    Le dico sempre che la ascolterò solo quando avrà imparato a fare una spillatura decente.
        {charTag(ThirdCharacter, "neutral")}:                                   E ora la maledetta sta migliorando a vista d'occhio.                                                                        
        -
             //Intermezzo culinario
            ~ third_char_kitchen_comments(threeKitchen)
        
        {charTag(ThirdCharacter, "neutral")}:                                   E te, che rapporto c'hai col tuo capo?
        
        + (earth2)\ {charTag(PG, "neutral")}:                                   <i>Mondo dei durian della stima.</i>
            ~ kitchen_recipeAdjective = "stima"
            -> glyph_choice_manager(true, earthC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Butta bene, {player_name}.
                                                                                Alla fine non è mica scontata come cosa.
            
        + (air2)\ {charTag(PG, "neutral")}:                                     <i>Affetto della carambola della accondiscendenza selettiva.</i>
            ~ kitchen_recipeAdjective = "accondiscendenza selettiva"
            -> glyph_choice_manager(true, airC)->
        {charTag(ThirdCharacter, "jester")}:                                    In soldoni: gli dai ragione fino a quando non dice stronzate?
        {charTag(ThirdCharacter, "neutral")}:                                   A volte è davvero dura stare zitti quando un capo dice una cosa che non ha senso.
            
        + (water2)\ {charTag(PG, "neutral")}:                                   <i>Sbollento dei quadong della confidenza.</i>
            ~ kitchen_recipeAdjective = "confidenza"
            -> glyph_choice_manager(true, waterC)->
        {charTag(ThirdCharacter, "bored")}:                                     Ma vi raccontate i cazzi vostri?
                                                                                O più una cosa di fiducia?
                                                                                Già i clienti sanno troppe cose su di noi.
                                                                                Non voglio sapere cosa succede se le sa anche il capo, guarda.
    
        + (aether2)\ {charTag(PG, "neutral")}:                                  <i>Frullo del mangostano dell'anarchismo.</i>
            ~ kitchen_recipeAdjective = "anarchia"
            -> glyph_choice_manager(true, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == they:
                {charTag(ThirdCharacter, "jester")}:                            Te la faccio passare solo perché già sei non binario, e me la aspettavo che rompevi altre regole.
                }
        {charTag(ThirdCharacter, "bored")}:                                     Ma un po' di regole servono, {player_name}.
                                                                                E un po' di gerarchie.
        {charTag(ThirdCharacter, "neutral")}:                                   Non dico tanto.
                                                                                Giusto quelle per capire chi sa fare cose a chi no.
                                                                                E chi può prendere una scelta sensata.
        {charTag(ThirdCharacter, "jester")}:                                    Anche se con questa logica dovrei essere io e non il mio capo a comandare.

        + (fire2)\ {charTag(PG, "neutral")}:                                    <i>Sbuccio della jabuticaba della lotta.</i>
            ~ kitchen_recipeAdjective = "lotta"
            -> glyph_choice_manager(true, fireC)->
        {charTag(ThirdCharacter, "jester")}:                                    Cazzo, devo proprio farti conoscere Petra.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == her:
                {charTag(ThirdCharacter, "jester")}:                            Non è che sei lesbica anche tu, vero?
                }
        {charTag(ThirdCharacter, "neutral")}:                                   Inizio a chiedermi se non sono un po' un coglione.
                                                                                Perché alla fine mi lamento lamento lamento ma poi non è che dico mai niente a quel cretino del mio capo.
                                                                                Magari quando vado via da qui inizio a farmi davvero rispettare.           
        -
             //Intermezzo culinario
            ~ third_char_kitchen_comments(fourKitchen)      
        
        {charTag(ThirdCharacter, "bored")}:                                     Comunque anche se mi piace insegnare le cose a Petra, non sarebbe male guadagnare di più.
                                                                                Il capo è un tirchio di merda, piange la fame e poi si è fatto il Natale a Dubai.
        {charTag(ThirdCharacter, "neutral")}:                                   E io dico: se uno lavora male, guadagna male ed è giusto.
        {charTag(ThirdCharacter, "bored")}:                                     Ma se uno lavora bene, perché guadagna comunque male?
                                                                                È una cosa da deficienti.
        {charTag(ThirdCharacter, "neutral")}:                                   Non mi piacere rompere i coglioni su queste cose, ma sono stanco di vivere con un coinquilino idiota e il suo gatto di merda che marca mezza casa.
                                                                                Se faccio il mio lavoro e tu non lo riconosci, allora non mi stai rispettando.
        {charTag(ThirdCharacter, "bored")}:                                     Soprattutto dopo che ti paro il culo con colleghi e fornitori perché tu non sai gestire un cazzo.
        {charTag(ThirdCharacter, "jester")}:                                    Forse dovrei imparare a rispondergli a merda come fa Petra.
        {charTag(ThirdCharacter, "angry")}:                                     Che poi alla fine è tutta colpa di quello sfigato di mio padre.
        {charTag(ThirdCharacter, "neutral")}:                                   Sapevi che quando ero piccolo il Baretto era nostro?
                                                                                Non eravamo ricchi sfondati, ma stavamo bene, e io me la spassavo a giocare con i vecchi a carte, o a calcio coi miei amici.
        {charTag(ThirdCharacter, "bored")}:                                     E poi bum, di punto in bianco abbiamo perso tutto, perché lui era incapace di gestire i soldi.
                                                                                Di non fare favori ad amici di merda.
        {charTag(ThirdCharacter, "neutral")}:                                   È tutta la vita che mi dico che non sarò un fallito come lui.
                                                                                E ce la sto facendo.
                                                                                Anche se.
        {charTag(ThirdCharacter, "bored")}:                                     Merda.
        {charTag(ThirdCharacter, "neutral")}:                                   Quando ho perso il vecchio lavoro, sono rimasto disoccupato per un anno.
                                                                                Un incubo.
                                                                                E il lavoro al Baretto l'ho trovato perché ha chiesto lui un favore a quello che ora è il mio capo.
                                                                                Perché fu suo padre a comprarsi l'attività dal mio e c'erano in mezzo amicizia e cose che non sto a dirti.
        {charTag(ThirdCharacter, "angry")}:                                     E ti giuro {player_name}, ti giuro che me lo immagino ogni volta che passa davanti al Baretto che se la sorride tutto felice perché alla fine ha vinto lui.
        {charTag(ThirdCharacter, "neutral")}:                                   Sto in piedi grazie a lui.
        {charTag(ThirdCharacter, "bored")}:                                     Peccato che sono qui come lavoratore, quando sarei dovuto essere il cazzo di padrone.

        + \ {charTag(PG, "neutral")}:                                           Ma anche se tuo padre avesse vinto su questo aspetto, cosa cambia? Perché è così importante?
                -> glyph_choice_manager(false, airC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "bored")}:                             È una cosa da uomini, non la puoi capire.
                - else:
                {charTag(ThirdCharacter, "jester")}:                            Serio, {player_name}?
                }
        {charTag(ThirdCharacter, "neutral")}:                                   Io non sono una persona che c'ha tanto, e l'unica cosa che mi rimane è l'orgoglio.
                                                                                La possibilità di non dovere niente a nessuno.
                                                                                Perché se devi qualcosa, a quel punto sei fregato.
                                                                                Nessuno ti dà niente per avere nulla in cambio, nessuno.
        {charTag(ThirdCharacter, "bored")}:                                     Così ora sono in debito con lui, e vuoi che non venga a riscuotere un giorno o l'altro?        

        + \ {charTag(PG, "neutral")}:                                           Magari tuo padre ti ha aiutato a ottenere il lavoro, ma l'hai ancora per le tue capacità.
                -> glyph_choice_manager(false, earthC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Non risolve il fatto che sono in debito con lui.
                                                                                Ma è vero.
                                                                                Alla fine sono un cazzone, ma a lavoro so farmi il culo.
                                                                                E se sono lì da tutti questi anni è solo per merito mio.
        {charTag(ThirdCharacter, "jester")}:                                    E del mio bellissimo faccino.

        + \ {charTag(PG, "neutral")}:                                           {charNameThree}: se sei un fuoriclasse, cambia squadra. Cercati un altro bar.
                -> glyph_choice_manager(false, fireC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Pensi che non ci abbia già pensato?
                                                                                Ogni tanto sogno anche di rilevare il bar.
                                                                                Ma per farlo serve avere qualcosa a cui appoggiarsi per farsi un mutuo.
        {charTag(ThirdCharacter, "bored")}:                                     E non ho una casa mia.
        {charTag(ThirdCharacter, "neutral")}:                                   Nessuno nella mia famiglia ha una casa sua, qualcosa di davvero <i>suo</i>.
                                                                                E poi sono vecchio.
                                                                                Cioè, non vecchio vecchio.
        {charTag(ThirdCharacter, "bored")}:                                     Ma chi mi piglia a me alla mia età?
                                            

        + \ {charTag(PG, "neutral")}:                                           Ma come ti stai vivendo questa cosa di essere un boccale, quindi?
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != her:
                {charTag(ThirdCharacter, "bored")}:                             Pensavo avessi capito che queste cose psicologiche mi fanno cagare.
                }
        {charTag(ThirdCharacter, "bored")}:                                     Detta fuori dai denti?            
        {charTag(ThirdCharacter, "angry")}:                                     La odio.
        {charTag(ThirdCharacter, "neutral")}:                                   Praticamente sono il simbolo del lavoro che mio padre mi ha trovato.
                                                                                Un fallimento.
        {charTag(ThirdCharacter, "angry")}:                                     È da quando sono arrivato che 'sto cazzo di posto si prende gioco di me.
                
        + \ {charTag(PG, "neutral")}:                                           {charNameThree}, hai mai sentito parlare di lotta di classe?
                -> glyph_choice_manager(false, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == they:
                {charTag(ThirdCharacter, "jester")}:                            Ah ah non sapevo che voi persone non binarie tenevate anche a queste cose.
                - else:
                {charTag(ThirdCharacter, "bored")}:                             Non mi partire con uno spiegone non richiesto, grazie.
                }
        {charTag(ThirdCharacter, "neutral")}:                                   'sta roba me la tira fuori anche Petra.
        {charTag(ThirdCharacter, "jester")}:                                    Andreste d'accordo voi due.
        {charTag(ThirdCharacter, "neutral")}:                                   Ma ti dico la stessa cosa che ho detto a lei.
                                                                                Tenere un locale è una cosa rischiosa.
                                                                                C'hai tutte le tasse, e c'hai sul groppone gli stipendi di quante?
                                                                                Otto persone da noi ora, tra fissi e a rotazione.
                                                                                Otto persone con sogni e famiglie e così via.
                                                                                Ci sta che ti prendi qualcosa in più, che ti prendi qualche vizio.
        {charTag(ThirdCharacter, "bored")}:                                     Certo, il nostro capo è un coglione.
                                                                                E ha il locale perché suo padre si è fatto il culo quando l'ha comprato dal mio.
        {charTag(ThirdCharacter, "neutral")}:                                   Però appunto: suo padre si è smazzato giornate infinite per anni lì dentro, per far sì che poi il merda potesse avere tutto questo.
                                                                                E lui era un poveraccio.
        {charTag(ThirdCharacter, "bored")}:                                     Solo, un poveraccio meno idiota di mio padre.

        -
            //Intermezzo culinario
            ~ third_char_kitchen_comments(fiveKitchen)


        {charTag(ThirdCharacter, "neutral")}:                                   Domanda spinosa in arrivo.
                                                                                Come te la sfanghi coi soldi?
            {
            - aether1:
            {charTag(ThirdCharacter, "bored")}:                                 Anche se hai detto che non ti piace lavorare.      
            }                                                                    
                                                                                Sei quel tipo di persona che li ha già spesi prima ancora che gli arrivino in mano?
                                                                                O più una formichina?
        
        + (water3)\ {charTag(PG, "neutral")}:                                   <i>Insaporisco con aria della povertà.</i>
            ~ kitchen_recipeComplement = "aria della povertà"
            -> glyph_choice_manager(true, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == her:
                {charTag(ThirdCharacter, "jester")}:                            Poi voi donne vi lamentate che guadagniamo più di voi.
                }
                {
                - aether1:
                {charTag(ThirdCharacter, "jester")}:                            Certo che se non ti piace lavorare, cosa ti aspettavi?    
                }
            {charTag(ThirdCharacter, "jester")}:                                Almeno se non hai soldi non devi pensare a come gestirli, giusto?    
            
        + (earth3)\ {charTag(PG, "neutral")}:                                   <i>Farcisco con aroma di oculatezza.</i>
            ~ kitchen_recipeComplement = "aroma di oculatezza"
            -> glyph_choice_manager(true, earthC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Un po' tipo colpo al cerchio e alla botte, quindi?
        {charTag(ThirdCharacter, "jester")}:                                    Ma non colpire il povero {charNameThree}!
            
        + (air3)\ {charTag(PG, "neutral")}:                                     <i>Marino con una miscela di pianificazione e disastro.</i>
            ~ kitchen_recipeComplement = "miscela di pianificazione e disastro"
            -> glyph_choice_manager(true, airC)->
        {charTag(ThirdCharacter, "jester")}:                                    Un po' come Petra.
        {charTag(ThirdCharacter, "neutral")}:                                   Ogni mese è lì che dice "A questo giro mi metto via i soldi per andare via da casa dei miei!".
                                                                                E il giorno dopo la paga si è presa un viaggio per un posto che conosce solo lei.                                            

        + (aether3)\ {charTag(PG, "neutral")}:                                  <i>Addenso con farina di quel che accade accade.</i>
            ~ kitchen_recipeComplement = "quel che accade accade"
            -> glyph_choice_manager(true, aetherC)->
        {charTag(ThirdCharacter, "neutral")}:                                   Non credo sia un metodo, {player_name}.
        {charTag(ThirdCharacter, "jester")}:                                    Soprattutto se vuoi sopravvivere.


        + (fire3)\ {charTag(PG, "neutral")}:                                    <i>Spolvero con dell'erba del risparmio asfissiante.</i>
            ~ kitchen_recipeComplement = "erba del risparmio asfissiante"
            -> glyph_choice_manager(true, fireC)->
        {charTag(ThirdCharacter, "jester")}:                                    Siamo in due.
        {charTag(ThirdCharacter, "neutral")}:                                   Donatella diceva che era il trauma dell'essere diventato povero.
                                                                                Mentre lei era più oculata, ma alcune cose se le concedeva.
                                                                                Io c'ho le linee del latte bevuto sul mio cartone, così so se quella merda del coinquilino me lo beve.

        -
             //Intermezzo culinario
            ~ third_char_kitchen_comments(sixKitchen)

        -> fourth_ingredient_dispatcher
            
    
    
    //La chiusura è comune, sempre per ridurre il rischio di errori
    = fourth_ingredient_dispatcher
        {charTag(ThirdCharacter, "neutral")}:                                   Ma {player_name}, qui a me sembra tutto pronto, non trovi?
    
    {
        - backpack_findedGifts == (): 
            {charTag(TheWitch, witch_state())}:                                 <i>{player_name} non possiede alcun ingrediente speciale.</i>
                -> at_table_with_third_char
            
        - else:
            -> add_ingredient
    
    }
    
    = add_ingredient
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    
        
        {charTag(TheWitch, witch_state())}:                                     <i>Il giusto ingrediente renderà la ricetta di {player_name} e {charNameOne} musicale.
                                                                                <i>E {player_name} potrebbe capire un po' meglio {charNameOne}.
       
    + \ {charTag(PG, "neutral")}:                                               <i>Unisco un ingrediente speciale.
        -> grimoire_greenhouse_gifts_and_ingredient ->

            //Dopo di che associo la scelta fatta alla PNG
            ~ kitchen_thirdCharExtraIngredient = grimoire_chosenPlant
            //E svuoto la variabile del grimorio
            ~ grimoire_chosenPlant = ()
            //E poi chiamo la funzione per aggiornare i valori
            ~ object_value_for_PNG(kitchen_thirdCharExtraIngredient, Kitchen, ThirdCharacter)
            //E il nome dell'ingrediente
            ~ extra_ingredient_name(kitchen_thirdCharExtraIngredient)
                    
    + \ {charTag(PG, "neutral")}:                                               <i>Non aggiungo altro.
    -
                
    {charTag(ThirdCharacter, "neutral")}:                                       Andiamo a mangiare, ama!

        -> at_table_with_third_char



=== at_table_with_third_char
    -> grimoire_storylets_updater -> 

    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive= translator(fifthChar_ActualName)

    ~ move_entity(CookingWithThirdCharOBJ, Kitchen)
    ~ move_entity(EatingWithThirdCharOBJ, Kitchen)
    ~ temp piatto = kitchen_tempRecipeName
    ~ recipe_name_creator()
    ~ recipe_name_storage(ThirdCharacter)

    {charTag(ThirdCharacter, "jester")}:                                        Non l'averei mai detto, ma è stato divertente cucinare assieme {player_name}.
    {charTag(ThirdCharacter, "bored")}:                                         A parte per la fine che ha fatto la mia insalata di patate.
    
        {
        -cooking_with_third_char.first_theme:
        {charTag(ThirdCharacter, "neutral")}:                                   Non mi aspettavo di passare dal parlare di calcio al parlare degli amici.
        {charTag(ThirdCharacter, "jester")}:                                    Anche se avrei evitato di ammorbarti con le mie pesate.                                                                        


        -cooking_with_third_char.second_theme:
        {charTag(ThirdCharacter, "neutral")}:                                   E non avevo mai pensato fino in fondo al discorso del salvare il mondo etc etc.
        
        -cooking_with_third_char.third_theme:
        {charTag(ThirdCharacter, "neutral")}:                                   E discutere di creatività.

        }
    {charTag(ThirdCharacter, "neutral")}:                                       E poi questo {piatto}!
    {charTag(ThirdCharacter, "jester")}:                                        {charNameOne} non dovrà mai sapere che ho apprezzato qualcosa di vegano o giuro che ti meno, {player_name}!
    
        {
        - kitchen_thirdCharExtraIngredientReaction != notReaction:
            -> extra_ing_feedback
        
        - else:
                                                                                E ho la pancia strapiena ora.
            -> relationship_feedback
                
        }
        
        
    
        
        
    = extra_ing_feedback
    
    // Qui verranno fatti commenti diversi a seconda che l'ingrediente sarà apprezzato o meno.
    {
    - kitchen_thirdCharExtraIngredientReaction == goodReaction:
        -> good_reaction
    
    - kitchen_thirdCharExtraIngredientReaction == badReaction:
        -> bad_reaction
    
    - kitchen_thirdCharExtraIngredientReaction == mehReaction:
        -> meh_reaction
    
    - else:
        ERROR: non abbiamo un valore valido di kitchen_thirdCharExtraIngredientReaction, che è uguale a {kitchen_thirdCharExtraIngredientReaction}.
    }

        
    = good_reaction
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

            -> kitchen_moon_feedback -> 

        {charTag(ThirdCharacter, "neutral")}:                                   Aggiungere {ingredientTranslator(kitchen_thirdCharExtraIngredient)} è stato un tocco geniale.
        {
        - kitchen_firstCharExtraIngredient == universalIngredient:
        {charTag(ThirdCharacter, "neutral")}:                                   AGGIUNGI RICORDO IMPORTANTE DI BOCCALE.
        }
            @animation:RewriterBook

            -> relationship_feedback
                
    = bad_reaction
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    

            -> kitchen_moon_feedback -> 

        {charTag(ThirdCharacter, "neutral")}:                                   Aggiungere {ingredientTranslator(kitchen_thirdCharExtraIngredient)} è stata una scelta.

            -> relationship_feedback
            
                
    = meh_reaction
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

            -> kitchen_moon_feedback -> 

        {charTag(ThirdCharacter, "neutral")}:                                   L'aggiunta di {ingredientTranslator(kitchen_thirdCharExtraIngredient)} mi ha confusa.

            -> relationship_feedback
            
    
        
    = relationship_feedback
        -> achievements_onGame_statusUpdate_GM ->
        {charTag(ThirdCharacter, "neutral")}:                                   Comunque {player_name}, stavo pensando alla nostra conversazione qui, assieme.
        
        //Prima di tutto chiamo la funzione per il calcolo dello stato della relazione
        ~ affinity_calc(ThirdCharacter)
        //Così poi posso dare il feedback

        {
        - thirdChar_relationshipStatus == negative:
            {charTag(ThirdCharacter, "neutral")}:                               Credo che la risposta sia no.

                ~ grimoire_thirdChar += grimThirdCharKitchenNegativeReaction

        - thirdChar_relationshipStatus == neutral:
            {charTag(ThirdCharacter, "neutral")}:                               Credo che la risposta sia "{player_pronoun has him:rimandato|{player_pronoun has her:rimandata|rimandatə}} a settembre".

                ~ grimoire_thirdChar += grimThirdCharKitchenNeutralReaction

        - thirdChar_relationshipStatus == positive:
            {charTag(ThirdCharacter, "neutral")}:                               La risposta è sicuramente "sì".

                ~ grimoire_thirdChar += grimThirdCharKitchenPositiveReaction

        }    
        
            
            
            -> ending_cooking_with_third_char
            
        
=== ending_cooking_with_third_char
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

    
    {charTag(ThirdCharacter, "neutral")}:                                       Frase
    

                ~ move_entity(ThirdCharacter, Pond)
                ~ move_entity(ThirdCharacterCucina, Safekeeping)
                ~ cooking_animations_off()
                ~ kitchen_thirdCharCookingTogetherInvite = false
                ~ kitchen_allChefs += ThirdCharacter
                ~ kitchen_kitchenOccupied = false
            ~ update_glyphs(ThirdCharacter)
            -> achievements_onGame_statusUpdate_GM ->
            -> third_char_closing_storylet ->
            -> main




/* ---------------------------------

   Altri storylets legati alla cucina 

 ----------------------------------*/


=== third_char_cooking_tracker
//Lo lascio come knot e non come variabile perché potrebbe essermi utile (es: per attivare un suono che faccia sapere che c'è qualcunə in cucina)
    {debug: passo per third_char_cooking_tracker.}
    
    ->->


=== third_char_cooking_alone
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)

    {debug: passo per third_char_cooking_alone.}
    
        ~ cooking_animations_on()
        
        {kitchen_thirdCharCookingTime:

        - 0:
        {charTag(ThirdCharacter, "neutral")}:                                   {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}

        - 1:
        {charTag(ThirdCharacter, "neutral")}:                                   {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}
            
        - 2:
        {charTag(ThirdCharacter, "neutral")}:                                   {Potrei sostituire l'aneto con, uh, no, non una buona idea.|Perdonami {player_name}, ma sto cercando qualcosa che non mi avveleni.}
        
        - 3:
        {charTag(ThirdCharacter, "neutral")}:                                   {Ricordati ragazza che cucinare non è una scusa per bere. Ma che gioia aver trovato del vinello. |Torna dopo {player_name}, devo, ehm, riflettere.}
            
        - 4:
        {charTag(ThirdCharacter, "neutral")}:                                   {Quante possibilità ci sono che se caccio la mano nell'alveare della serra riesco a recuperare del miele?|{player_name}, ho un'idea stupida, torna dopo.}
        
        - 5:
        {charTag(ThirdCharacter, "neutral")}:                                   {Uh, questo sughino spacca. Mamma ne sarebbe orgogliosa.|{player_name}, ho bisogno di concentrazione, a dopo.}

        - 6:
        {charTag(ThirdCharacter, "neutral")}:                                   {Sarà una buona idea avere tutti questi coltelli accessibili con il bimbo in giro in giro? Merda, stavo per tagliarmi. Forse sono io il problema, non lui.|{player_name}, faccio danni già da sola, torna tra un po'.}
        
        - 7:
        {charTag(ThirdCharacter, "neutral")}:                                   {Tocco finale, la crema di funghi. E ora lasciamo cuocere un po'. E ci beviamo un altro goccino.|{player_name}, resisti che ho quasi finito!}
        
        - else:
        {charTag(ThirdCharacter, "neutral")}:                                   {Direi che ci siamo. Giusto la fiammata per restringere il brodo, ed è perfetta!|{player_name}, un attimo e ti lascio i fornelli, promesso.}
        }
    
    -> third_char_closing_storylet ->
    -> main




=== food_gift_third_char
{debug: passo per food_gift_third_char.}
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive= translator(fifthChar_ActualName)

    
        {charTag(ThirdCharacter, "neutral")}:                                   Prima mi son messo a sfornellare da solo.
        {charTag(ThirdCharacter, "jester")}:                                    E stranamente sono vivo.
        {charTag(ThirdCharacter, "neutral")}:                                   Ho fatto il piatto preferito di mia mamma.
        {charTag(ThirdCharacter, "jester")}:                                    Toast bruciati!
        {charTag(ThirdCharacter, "neutral")}:                                   In realtà i suoi non erano mai bruciati, ma sapeva preparare solo quelle cose da tavola fredda.
                                                                                Sono cresciuto mangiando al bar, e per lo più erano panini, capresi, insalate col tonno.
                                                                                Se buttava bene del riso freddo o della pasta al forno.
        {charTag(ThirdCharacter, "jester")}:                                    Le lasagne quando nonna Carmen non aveva ancora perso tutte le rotelle.
        {charTag(ThirdCharacter, "neutral")}:                                   Può sembrare una cosa brutta, ma in realtà per me era uno spasso stare al bar coi miei.
        {charTag(ThirdCharacter, "jester")}:                                    Anche perché non mi potevano controllare sempre.
        {charTag(ThirdCharacter, "neutral")}:                                   C'era però una volta all'anno in cui mamma si impegnava a cucinare, ed era il compleanno di papà.
                                                                                Iniziava due giorni prima a sfornellare torte dolci troppo dure.
                                                                                Parmigiane troppo salate.
        {charTag(ThirdCharacter, "jester")}:                                    E tartine col burro e uova di lompo che attiravano le vespe in un millisecondo.
        {charTag(ThirdCharacter, "neutral")}:                                   Per sopravvivere mia sorella e io iniziavamo a nasconderci negli zainetti pacchetti di patatine e popcorn che rubavamo al bar per una settimana.
                                                                                E ce li mangiavamo mentre facevamo finta di giocare a nascondino o robe simili.
                                                                                Papà invece stoicamente mangiava tutto, facendosi aiutare da litrate di aranciata.
                                                                                Odio quel fallito, ma si impegnava in tutti i modi per non far sentire mai mamma sbagliata.
                                                                                Una volta, quando ha scoperto che ormai non sarebbe più guarita, mamma ha organizzato un ultimo pic nic.
        {charTag(ThirdCharacter, "jester")}:                                    E quando abbiamo aperto il vecchio cestino, c'erano dentro solo patatine e pop corn.
                                                                                Ci ha detto che aveva sempre saputo quello che combinavamo mia sorella e io.
                                                                                E che lo riteneva un bel gesto d'amore.
        {charTag(ThirdCharacter, "melanchonic")}:                               Non le sfuggiva mai nulla.
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "sad")}:                               Non sto piangendo per questo idiota.
                                                                                Assolutamente no.    
                }
        {charTag(ThirdCharacter, "neutral")}:                                   Comunque ho trovato in giro un po' di roba e ho ricreato un set da pic nic.
                                                                                Te l'ho lasciato in cucina.
        {charTag(ThirdCharacter, "jester")}:                                    Chi ci porteresti di noi?                                                                                                                                        

    
        + \ {charTag(PG, "neutral")}:                                           Franco, ho un sacco di domande da fargli, voglio capire come ragiona!
                -> glyph_choice_manager(false, airC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "jester")}:                            Sicuro avresti potuto fare una scelta migliore, tipo me!
                }
        {charTag(ThirdCharacter, "jester")}:                                    Credo uscirei più scemo di quello che già non sono a parlare troppo con Franco.
                                                                                Però di sicuro te la spassi così!
                {
                - are_two_entities_together(Franco, PG):
                {charTag(Franco, "party")}:                                     Preparo le cose per il karaoke!!!
                                                                                E l'estintore.
                                                                                E un paio di carpe d'emergenza, non si sa mai.
                {charTag(Franco, "neutral")}:                                   Mi piace mangiare, tantissimo.
                                                                                Ma l'ultima volta mi sono quasi soffocato con la mia stessa lingua.                                                                
                }                                                                  
                                                                                    

        + \ {charTag(PG, "neutral")}:                                           Non sarebbe male andarci da sol{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} e rilassarmi un po'.
                -> glyph_choice_manager(false, earthC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "jester")}:                            Guarda che anche io so farti rilassare {player_name}!
                }
        {charTag(ThirdCharacter, "neutral")}:                                   Ma vedi un po' te che {player_name} c'ha già le palle piene di noi!
        {charTag(ThirdCharacter, "jester")}:                                    Come non capirti.
                                                                                Soprattutto dopo le paranoie di {charNameOne}.
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:                           Non è che sei come quei ragazzini fastidiosi delle medie, che quando c'hanno la crush passano il tempo a insultare la ragazzina che gli piace?
                {charTag(ThirdCharacter, "jester")}:                            Ti piacerebbe.
                {charTag(FirstCharacter, "annoyed")}:                           Preferirei farmi mangiare viva dalle giga libellule dello stagno.
                }                                                                        

        + \ {charTag(PG, "neutral")}:                                           Ma te, ovvio, <i>vecio</i>!
                -> glyph_choice_manager(false, fireC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "jester")}:                            Pensavo avresti preferito chiacchierartela con una delle donne qui!

                - else:
                {charTag(ThirdCharacter, "jester")}:                            Grande, vecio, grande!
                }
        {charTag(ThirdCharacter, "jester")}:                                    Preparati perché ho un monologo in canna da quando sono qui.
                                                                                Titolo: "Perché l'Inter è meglio di quella cloaca della Juve."
        {charTag(ThirdCharacter, "neutral")}:                                   Svolgimento: "L'Inter non ha mai rubato scudetti."

        + \ {charTag(PG, "neutral")}:                                           {charNameTwo}: c'è ancora il suo compleanno in sospeso da festeggiare.
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "bored")}:                             Sono quasi offeso, vecio!
                                                                                Sono l'unico altro uomo qui e tu passeresti invece il tempo con il fratellino?
                }
        {charTag(ThirdCharacter, "jester")}:                                    Sono sorpreso che {charNameTwo} non abbia ancora dato fuoco a tutto!
        {charTag(ThirdCharacter, "neutral")}:                                   Una cucina sempre aperta, dell'acqua, la sua curiosità.
        {charTag(ThirdCharacter, "jester")}:                                    La prima volta che l'ho visto ho pensato che sarei morto qui.
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:                           Possiamo sempre risolvere questa mancanza.
                }
                {
                - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "energy")}:                           Non ho ancora trovato l'elettricità però!
                } 


        + \ {charTag(PG, "neutral")}:                                           Non mi spiace l'idea di farmi qualche trip politico bevendo con {charNameOne}!
                -> glyph_choice_manager(false, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "bored")}:                             Sono quasi offeso, vecio!
                                                                                Preferisci quella nevrastenica a me!
                }
        {charTag(ThirdCharacter, "neutral")}:                                   Immagino già il divertimento tra voi due.
                                                                                A parlare male di tutti gli uomini che conoscete.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:                            Perché vecio, dopo questa sicuro che sei gay, dai!
                }
        {charTag(ThirdCharacter, "neutral")}:                                   A bere del rosé.
                                                                                E chiedervi come bruciare il patriarcato o stronzate del genere.
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "curious")}:                           Hai appena descritto la mia serata ideale.
                                                                                Quando vuoi ci sto, {player_name}!  
                }                                                                                                                                     
        -

        {charTag(ThirdCharacter, "jester")}:                                    Comunque {charNameOne} mi diceva che il cibo che ha trovato è contato, per cui: zero pic nic per {player_name}.
        {charTag(ThirdCharacter, "neutral")}:                                   Ma grazie per avermi ascoltato.

    -> third_char_closing_storylet ->
    ->->



=== function third_char_kitchen_comments(step)
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive= translator(fifthChar_ActualName)

{step:
- oneKitchen:
{charTag(ThirdCharacter, "neutral")}:                                   Sai che c'è?
                                                                        Mentre te ti occupi del piatto principale, io penso a un contornino.
{charTag(ThirdCharacter, "jester")}:                                    Magari qualcosa che richieda solo qualche piatto, così evitiamo di fare disastri.
{charTag(ThirdCharacter, "neutral")}:                                   Settimana scorsa avevo voglia di cioccolata.
                                                                        Mi son preso uno di quei preparati istantanei, ma non c'ho avuto pazienza.
                                                                        Non diventava duro e così ho messo tre buste di preparato nella dose di latte da una busta.
{charTag(ThirdCharacter, "jester")}:                                    E ho creato una supercolla.

- twoKitchen:
{charTag(ThirdCharacter, "bored")}:                                     Mmm.
                                                                        Non è l'odore che mi aspettavo.
{charTag(ThirdCharacter, "neutral")}:                                   Non del tuo piatto, {player_name}.
                                                                        Sembra una roba invitante.
                                                                        Ma questa cosa che sto facendo.
{charTag(ThirdCharacter, "jester")}:                                    Probabilmente moriremo.
{charTag(ThirdCharacter, "neutral")}:                                   Comunque.

- threeKitchen:
{charTag(ThirdCharacter, "jester")}:                                    C'è qualcosa che si sta muovendo qui nel piatto.
                                                                        Cosa cazz?
{charTag(ThirdCharacter, "neutral")}:                                   Ah no, è solo il condimento che fa le bolle.
{charTag(ThirdCharacter, "bored")}:                                     Aspè.
                                                                        Perché fa le bolle?
{charTag(ThirdCharacter, "jester")}:                                    Cosa ho combinato?   

- fourKitchen:
{charTag(ThirdCharacter, "jester")}:                                    Sto realizzando ora che potrai fare un confronto tra le mie abilità in cucina e quelle di {charNameTwo}.
                                                                        E il fatto che il fratellino avrà fatto sicuramente un lavoro migliore del mio è umiliante.
{charTag(ThirdCharacter, "bored")}:                                     Chissà se {charNameOne} si è bevuta tutto il vino che c'era in giro.
{charTag(ThirdCharacter, "neutral")}:                                   O se magari mi trovo della birra.                                                                        

- fiveKitchen:
{charTag(ThirdCharacter, "neutral")}:                                   Notizia buona: il contornino che ho preparato sembra commestibile.
{charTag(ThirdCharacter, "jester")}:                                    <i>Sembra</i> è la parola chiave.
{charTag(ThirdCharacter, "bored")}:                                     Notizia cattiva: col fatto che {charNameOne} ci ha lasciato solo verdurine e robe da vegani, non sapranno di un cazzo.
{charTag(ThirdCharacter, "neutral")}:                                   Ora lascio riposare un secondo e poi metto tutto nei piatti!

- sixKitchen:
{charTag(ThirdCharacter, "angry")}:                                     Mannaggia a chi comprò Vampeta.
                                                                        E al coglione che ha fatto cascare i piatti.
{charTag(ThirdCharacter, "jester")}:                                    Cioè me, {player_name}.
{charTag(ThirdCharacter, "neutral")}:                                   Niente contorno per il tuo piatto.
{charTag(ThirdCharacter, "jester")}:                                    O adori patate e cocci di ceramica?
}




