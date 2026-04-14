=== cooking_with_frog
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ temp piatto = kitchen_tempRecipeName

            -> cooking_animations_on ->
    
        {charTag(Franco, "{portrait_Franco()}")}:       Si lo so che è una sorpresa questa cosa del cucinare assieme.
                                                        E tu mi dirai: "Franco, ma io non me la cavo bene quanto te!"
                                                        E io ti dirò: "Vero, ma i pesci hanno bisogno di noi."
                                                        E poi ti dirò: "E anche zio Gracco."
                                                        E tu mi dirai: "Ma non è un cuoco famoso lui?"
                                                        E io ti dirò: "Sì, ma gli hanno revocato la licenza dopo che ha invitato a cena una volpe."
                                                        E tu mi chiederai: "E cosa c'entrano i pesci?"
                                                        E a quel punto ti spiegherò che con tutto il via vai di persone che passano da qui, i pesci sono stressati.
                                                        E se sono stressati non mangiano.
                                                        E tu sai bene che brutto è il mondo senza cibo.
                                                        Ma apprezzano sempre un buon piatto fatto con amore.
                                                        O per lo meno, con un po' di alghe.
                                                        E poi è un modo carino per ringraziarli per lo spazio che hanno offerto a {charNameOne} e a noi, per avere questa cucina.
                                                        Quindi: zampe in spalla e gambe di pasta frolla e cominciamo!
                                                        Uh, l'estintore.
                                                        Tullio mi ha detto di portarmi l'estintore.
                                                        Ma mentre cuciniamo, mi dici un po' come stai approcciando questo posto?
                                                        Vai col caos come il famoso Girino Ir Rosponsabile, o sei più una persona ranalitica?

        -> kitchen_moon_feedback ->

            + <i>Setaccio della polenta analitica.</i>
                    ~ kitchen_recipeNoun = "Polenta"
                -> glyph_modifier_variation_management(PG, airC)->
                {charTag(Franco, "{portrait_Franco()}")}:       Craande!
                                                                Un po' come me.
                                                                Sempre tutto chiaro e sotto controllo.
                                                                Uh, ma quella è una mia zampa?
                                                                Non sapevo di averne quattro!
               
            + <i>Riscaldo l'acqua per della zuppetta empatica.</i>
                    ~ kitchen_recipeNoun = "Zuppetta"
                -> glyph_modifier_variation_management(PG, waterC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Ah, come la tosse di zia Graaak!
                                                                Povera, faceva di quelle bolle sott'acqua.
                                                                Uh, una lettera di Giulio.
                                                                "Amore, la tosse di tua zia era <i>sintomatica.<i>"
                                                                "Empatica è quando Graaak dice che gli dispiace per te, ma poi si incazza comunque."

            + <i>Impasto una focaccia decisa.</i>
                    ~ kitchen_recipeNoun = "Focaccia"
                -> glyph_modifier_variation_management(PG, earthC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Un approccio con una direzione precisa.
                                                                Un po' come quando Euforbo ha preso la patente.
                                                                Ma i girini hanno solo la coda.
                                                                E quindi la macchina è andata in una sola direzione.
                                                                Decisamente contro la partita di ananassi.

        
            + <i>Preparo una panzanella caotica.</i>
                    ~ kitchen_recipeNoun = "Panzanella"
                -> glyph_modifier_variation_management(PG, fireC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Te l'ho mai raccontata la storia di Girino Ir Rosponsabile?
                                                                È questo tizio leggendario, che da piccolo ha provato le cose più assurde.
                                                                Una volta è finito anche dentro la bocca di una carpa.
                                                                Poi ci si è addormentato, e quando si è svegliato era già una rana grande.
                                                                E quella rana si chiama Franco La Rana.
                                                                Cioè me.
    
            + <i>Friggo della spirituale cicerchiata.</i>
                    ~ kitchen_recipeNoun = "Cicerchiata"
                -> glyph_modifier_variation_management(PG, aetherC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Cice.
                                                                Cerch.
                                                                Cicherch.
                                                                Craaaaaaaac!
                                                                Ma che parola è, girino?!?
                                                                Però mi piacciono le cose spirituali.
                                                                Sopratutto quando i gemelli vanno a dormire.
                                                                Allora con Giulio e Tullio ci beviamo qualcosa e guardiamo una puntata di <i>Gnat's anatomy</i>.
            -    
        
        {charTag(Franco, "{portrait_Franco()}")}:       Guarda ora cra, il tocco dello chef.
                                                        Un pezzo di muschio.
                                                        Eh?
                                                        Chi se lo aspettava?
                                                        Io aspetto tante cose a dire il vero.
                                                        Di diventare più grosso.
                                                        Mi piacerebbe essere grosso come la famosa rana Bollagorga.
                                                        Così galleggio e non faccio nemmeno la fatica di spostarmi.
                                                        E poi aspetto che il mio tronco divenga un albero.
                                                        E di poter dire "ho smesso di lavorare!"
                                                        Anche se noi rane non lavoriamo.
                                                        È un'occupazione molto stupida.
                                                        Ma il tuo lavoro invece, {player_name}?
                                                        Sei {player_pronouns has him:soddisfatto|{player_pronouns has her:soddisfatta|soddisfattə}} di quello che stai facendo?
            
            + <i>Aggiungo con risolutezza della assafetida.</i>
                    ~ kitchen_recipeAdjective = "risoluta"
                -> glyph_modifier_variation_management(PG, earthC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Qui il nostro girino sa dove sta andando!
                                                                Non tutti possono dirlo.
                                                                Io non ho ancora capito come sono finito qui.
                                                                Mamma Craazia dice che mi ha portato una cicogna.
                                                                Ma che ha dimenticato la ricevuta e per questo non mi ha potuto rimandare indietro.
                                                                Chissà se mi diventano le gambe lunghe anche a me allora?

            + <i>Spargo con insicurezza del sommacco.</i>
                    ~ kitchen_recipeAdjective = "insicura"
                -> glyph_modifier_variation_management(PG, waterC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Ora, so che potrebbe stupirti, ma a volte anche io non so cosa faccio.
                                                                Ed è normale.
                                                                Solo i girini hanno le idee chiare.
                                                                Ma perché non capiscono molto.
                                                                Pensa che Euforbo l'altro giorno mi ha detto che i dinosauri sono esistiti davvero.
                                                                Povero girino.     

            + <i>Spolvero con disperazione della curcuma.</i>
                    ~ kitchen_recipeAdjective = "disperata"
                -> glyph_modifier_variation_management(PG, fireC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Conosco quella sensazione, girino.
                                                                Ma non disperarti: qui le cose vanno sempre bene.
                                                                Nel senso che chi riscrive non è che dice alle persone che cosa fare.
                                                                Le aiuta solo ad uscire dallo stallo.
                                                                Poi sta a loro decidere dove galoppare.
                                                                Ho fatto una battuta!
                                                                Un po' come quando faccio un pasticcio e Tullio mi guarda e mi dice: ora sono gatti tuoi.
                                                                Mi fa capire che mi posso prendere delle responsabilità.
                                                                Ma che non posso più prendere dei gatti.    

            + <i>Incorporo con arroganza del cajun.</i>
                    ~ kitchen_recipeAdjective = "arrogante"
                -> glyph_modifier_variation_management(PG, earthC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Questo è il momento per raccontarti la storia di Bavarana.
                                                                Bavarana era questo tipo convinto di sapere tutto lui, e non ascoltava mai nessuno.
                                                                E passava le notti a gracidare quando tutti volevano dormire.
                                                                E un giorno, stanco delle lamentele di tutte le rane dello stagno, ha detto: "Non ho bisogno di voi, vivrò da solo!"
                                                                E per qualche mese si è sentito superrospo e aveva pure investito in cryptopalude.
                                                                Ma poi un giorno una anguilla se l'è divorato.
                                                                Perché alla fine non è che si va tanto lontani senza gli altri.
                                                                Mi slegheresti la lingua?
    
            + <i>Macino con mediocrità del pepe rosa.</i>
                    ~ kitchen_recipeAdjective = "mediocre"
                -> glyph_modifier_variation_management(PG, aetherC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Non è male essere mediocri.
                                                                Pensa a quel modo di dire: "Non è né carne né pesce."
                                                                Noi rane non siamo pesci.
                                                                Non siamo carne come le mucche o i maiali.
                                                                Ma siamo comunque splendorose, non trovi?
                                                                E respiriamo dalla pelle.
                                                                E sentiamo senza orecchie.
                                                                Mica male vero?
            -

        {charTag(Franco, "{portrait_Franco()}")}:       Mi sembra che stia sobbollendo benissimo.
                                                        Questa parola me l'ha insegnata {mentorName}.
                                                        Prova a insegnarmi tantissime parole lei.
                                                        Ma quando ho provato a spiegarle come fare le bolle col naso, si è allontanata disgustata.
                                                        <i>Disgustata</i> me l'ha insegnata Tullio.
                                                        Dice che era così la faccia della maestra dei gemelli quando mi sono dimenticato di nuovo di recuperarli dal nido.
                                                        Tullio dice che devo stare più attento, che perdo troppo il filo.
                                                        Cosa strana, visto che non cucio.
                                                        Come si dice?
                                                        "Chi più cuce, più sbaglia."
                                                        E visto che non cucio, non sbaglio mai, vero?
                                                        Però {mentorName} dice che potrei essere una pessima influenza per {charNameTwo}.
                                                        Cosa strana, perché ho provato la febbre e non l'ho.
                                                        Ma tu che ci lavori tanto assieme, che idea ti sei fatt{player_pronouns has him:o|{player_pronouns has her:a|ə}} di {mentorName}?

            + <i>Decoro con della granella di affetto.</i>
                    ~ kitchen_recipeComplement = "con granella di affetto"
                -> glyph_modifier_variation_management(PG, waterC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Eh, ma si vede che tu c'ha il cuore grande.
                                                                Come zia Graaak.
                                                                Per questo deve andare dal dottore.
                                                                Una volta lei gli ha detto: "Ma ovvio dottore che c'ho il cuore grosso, con un nipote così scemo."
                                                                Non sapevo che la zia avesse un nipote.
                                                                Per fortuna che ha me.
              
            + <i>Abbellisco con delle gocce di cioccolato e sospetto.</i>
                    ~ kitchen_recipeComplement = "con gocce di cioccolato e sospetto"
                -> glyph_modifier_variation_management(PG, earthC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Come nei thriller?
                                                                Quindi c'è un crimine?
                                                                E {mentorName} è sospettata?
                                                                Ora le chiediamo a sorpresa: "Dov'è il malloppo?"
                                                                E lei allora avrà la coda di carpa e si tradirà.
                                                                E magari del malloppo è del cibo.
                                                                A Franco piace sempre il cibo.
   
            + <i>Guarnisco con un battuto di caramello e indifferenza.</i>
                    ~ kitchen_recipeComplement = "con battuto di caramello e indifferenza"
                -> glyph_modifier_variation_management(PG, waterC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Ah, come quando dividi la spazzatura.
                                                                Uh, una lettera di Giulio.
                                                                "Amore, indifferenza è come quando mamma Craazia è così arrabbiata che fa finta che non esisti."
                                                                Ah, quella indifferenza.
                                                                Come quando si gioca a nascondino!
                                                                O a un due tre stella.
                                                                Interessante, girino, interessante.
                                                                Un'altra lettera di Giulio!
                                                                "Ah, amore, hai dimenticato di nuovo di smaltire i residui di alga."
                                                                Ma perché tocca sempre a me?

            + <i>Addobbo con strisce di pastella e gratitudine.</i>
                    ~ kitchen_recipeComplement = "con strisce di pastella e gratitudine"
                -> glyph_modifier_variation_management(PG, aetherC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Mi piace la gratitudine!
                                                                Anche se a volte mi si brucia un poco.
                                                                Per fortuna ho uno stomaco di feltro.
                                                                Uh, una lettera di Euforbo.
                                                                "Papà, quella è la <i>gratinatura</i>. La gratitudine è quando dico "Per fortuna l'intelligenza l'ho presa dagli altri papà"!"
                                                                Che ragazzino sveglio, Euforbo.
                                                                Ma devo dirgli di restituire l'intelligenza a Tullio e Giulio: non è carino tenere a lungo le cose prese in prestito.  

            + <i>Rifinisco con semi di zucca e fastidio.</i>
                    ~ kitchen_recipeComplement = "con semi di zucca e fastidio"
                -> glyph_modifier_variation_management(PG, fireC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Ah, come quel modo di dire.
                                                                "Essere una spina nel Franco."
                                                                Una volta mi è successo.
                                                                Ma perché ho confuso delle more per delle mosche.
                                                                E volevo andare a farci due parole.
                                                                E sono rimasto lì, bloccato
                                                                E a quel punto mi son detto "Vabbè Franco, fatti un pisolino."
                                                                Ed ero tutto lì rilassato con la lingua fuori.
                                                                Ma poi sono svegliato con le grida disperate di Tullio.
                                                                Si agita sempre troppo.
            -
        
        {charTag(Franco, "{portrait_Franco()}")}:       Ma che dici se ci facciamo anche qualcosa da bere, girino?
                                                        Lo sapevi che noi rane beviamo dalla pelle?
                                                        Ed è una cosa supercomoda.
                                                        E le cose comode sono belle.
                                                        E a proposito di cose comode: non è che ti chiamo "girino" perché non mi importa dei tuoi pronomi.
                                                        Franco La Rana non è uno che si siede sugli agliori.
                                                        È che coi girini non si capisce il sesso, sono tutti uguali.
                                                        E poi sarebbe tipo <i>strano</i> interessarcene, no?
                                                        Inquietante.
                                                        E a Franco non piacciono le cose inquietanti.
                                                        Però è importante una cosa: sapere come stanno i girini.
                                                        E quindi, girino: come stai?
        
            + <i>Mi verso un bicchiere di succo gioioso.</i>
                    ~ kitchen_recipePP = "e contorno di gioia"
                -> glyph_modifier_variation_management(PG, earthC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Il mio sentimento preferito!
                                                                Dopo la fiducia.
                                                                Io ho molta fiducia in me, girino.
                                                                Da piccolo nessuno credeva in me.
                                                                A volte facevano proprio finta che non esistevo.
                                                                E allora facevo finta di essere un fantasma.
                                                                È facile quando la tua casa è fatta d'acqua.
               
            + <i>Mi preparo una tazza di tisana rilassata.</i>
                    ~ kitchen_recipePP = "e contorno di rilassatezza"
                -> glyph_modifier_variation_management(PG, aetherC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Lo dico sempre a Tullio e Giulio: amori, la vita va presa con rilassatezza.
                                                                Fanno così tante cose i miei amorini.
                                                                Pensa che Tullio ha una agenda dove segna tutte le cose da fare per i gemelli.
                                                                Non sapevo nemmeno fossero così tante.
                                                                E Giulio invece si occupa della casa.
                                                                E quando sono sul divano e gli dico "beviamo qualcosa e rilassiamoci" si agitano ancora di più.    
   
            + <i>Mi riempio una tazzina di caffè frenetico.</i>
                    ~ kitchen_recipePP = "e contorno di frenesia"
                -> glyph_modifier_variation_management(PG, fireC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       C'è una leggenda tra le rane.
                                                                La leggenda di Ranetica.
                                                                Una rana che nuotava così veloce ma così veloce che quando si muoveva l'acqua bolliva.
                                                                E un giorno era così su di giri che ha nuotato fino al mare, e a me il mare non piace.
                                                                L'acqua salata mi rovina la pelle.
                                                                E la sabbia si infila negli occhi.
                                                                E la musica mi fa vibrare tutto.
                                                                Però potrei organizzare una vacanza in Abruzzo coi mariti.
                                                                Una roba più tranquilla.
                                                                Da quando sono nati i gemelli non ci rilassiamo mai.
                                                                Ma ciao {player_name}!
                                                                Che piacere vederti cra!

            + <i>Mi offro un goccio dil distillato di curiosità.</i>
                    ~ kitchen_recipePP = "e contorno di curiosità"
                -> glyph_modifier_variation_management(PG, airC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Euforbo è supercurioso.
                                                                L'altro giorno mi ha detto: "Sarei curioso di capire come sei diventato adulto." 
                                                                E io gli ho spiegato che è una cosa che accade da sola, come innamorarsi o attraversare la strada.
                                                                E lui ha detto: "Questa non è una risposta, papà."
                                                                E poi mi ha urlato: "Attento alle macchine!"
                                                                Non so perché siano tutti così tesi nella mia famiglia.
    
            + <i>Prendo un bicchiere di acqua annoiata.</i>
                    ~ kitchen_recipePP = "e contorno di noia"
                -> glyph_modifier_variation_management(PG, waterC)->    
                {charTag(Franco, "{portrait_Franco()}")}:       Noo, la noia nooo.
                                                                Mi fa venire le bolle nella pancia.
                                                                E prude tutto.
                                                                Eh.
                                                                Uh, una lettera di Tullio.
                                                                "Amore, quella è la processionaria."
                                                                "E non capisco come tu sia arrivato da <i>noia</i> a <i>processionaria</i>."
                                                                "Per fortuna la visita dall'otorino è domani."
                                                                "PS: Ti amo."
                                                                Che carino che è vero?
                                                                Anche se non avevo mai pensato di farmi un motorino.
                                                                Però magari ci può fare un giro {charNameTwo}!
                                                                Mi sembra un tipo a posto per queste cose.
            -

        {charTag(Franco, "{portrait_Franco()}")}:       Girino, come vola il tempo quando ci si diverte!
        E il nostro piatto è pronto!
            -> recipe_name_creator ->
            -> recipe_name_storage(PG) ->
        {charTag(Franco, "{portrait_Franco()}")}:       Pesciolini?
                                                        Ehi, pesciolini.
                                                        Eccovi qui un bel piatto di {kitchen_PGCharRecipe}.
                                                        Piano, piano.
                                                        Ehi Marinio, come sta andando poi con quel corso da pilota?
                                                        Sai {player_name}, Marinio ha sempre voluto volare.
                                                        E ora sta imparando come guidare un aereo.
                                                        Anche se sua madre è preoccupata, sai come sono le madri.
                                                        "Ma non sai respirare fuori dall'acqua!"
                                                        "Ma non hai il cappotto!"
                                                        "Poi ti dimenticherai del mio compleanno!"
                                                        Però Marinio vuole tanto bene alla sua mamma.
                                                        Ogni anno le regala qualcosa di speciale.
                                                        L'anno scorso le ha portato a casa dei simpatici nematodi, gente con cui si è fatto due birre.
                                                        Lei si è arrabbiata molto: non tutti sanno apprezzare il valore di un regalo.
                                                        Ma a proposito di regalo, girino, ho una cosa per te!
                                                        Quando cucinerai con qualcunə, questa cosa piacerà a tutt3, promesso!
                                                        Basta aggiungerlo come quarto ingrediente, e la persona a cui lo darai sarà presa benissimo.
                                                        E ti dirà qualcosa di importante su di sé.
                                                        Tipo se le stanno simpatici i nematodi.
                                                        Ne ho solo uno da darti, scusa, gli altri me li sono mangiati tutti.
                                                        E ora mi fa male il pancino.
                                                        Mi sa che torno allo stagno, magari Giulio sa come aiutarmi.
                                                        A dopo!

        @animation:Backpack
                    
        ~ backpack_findedGifts += universalIngredient
        ~ greenhouse_findedCultivables += universalIngredient
        ~ frog_otherGifts -= universalIngredient
        ~ frog_allMissionsCompleted += frog_currentMission
        ~ franco_pauseSpecialStorylets()
        ~ frog_currentMission = ()
        ~ kitchen_allChefs += PG
        //Rimetto a posto i vari assets
        ~ move_entity(Franco, Pond)
        ~ kitchen_kitchenOccupied = false

        -> achievements_onGame_statusUpdate_RM ->
        -> cooking_animations_off ->
        -> main