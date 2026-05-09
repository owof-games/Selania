=== cooking_alone ===
    + {are_two_entities_together(FrancoCucina, PG) && entity_location(PG) == Kitchen} [Franco] 
    
    {charTag(Franco, "party")}:                     Girino!
                                                    Eccoti cra!
                                                    Sei {player_pronouns has him:pronto|{player_pronouns has her:pronta|prontə}} per cucinare assieme?
        
        + + \ {charTag(PG, "neutral")}:                      Ci sto!
            -> cooking_with_frog

        + + \ {charTag(PG, "neutral")}:                      Ci penso un attimo.
            -> main

=== cooking_with_frog
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    ~ temp piatto = kitchen_tempRecipeName

    ~ cooking_animations_on()
    
        {charTag(Franco, "party")}:                     Si lo so che è una sorpresa questa cosa del cucinare assieme.
        {charTag(Franco, "question")}:                  E tu mi dirai: "Franco, ma io non me la cavo bene quanto te!"
        {charTag(Franco, "neutral")}:                   E io ti dirò: "Vero, ma i pesci hanno bisogno di noi."
                                                        E poi ti dirò: "E anche zio Gracco."
        {charTag(Franco, "question")}:                  E tu mi dirai: "Ma non è un cuoco famoso lui?"
        {charTag(Franco, "neutral")}:                   E io ti dirò: "Sì, ma gli hanno revocato la licenza dopo che ha invitato a cena una volpe."
        {charTag(Franco, "question")}:                  E tu mi chiederai: "E cosa c'entrano i pesci?"
        {charTag(Franco, "neutral")}:                   E a quel punto ti spiegherò che con tutto il via vai di persone che passano da qui, i pesci sono stressati.
                                                        E se sono stressati non mangiano.
                                                        E tu sai bene che brutto è il mondo senza cibo.
        {charTag(Franco, "party")}:                     Ma apprezzano sempre un buon piatto fatto con amore.
        {charTag(Franco, "neutral")}:                   O per lo meno, con un po' di alghe.
                                                        E poi è un modo carino per ringraziarli per lo spazio che hanno offerto a {charNameOne} e a noi, per avere questa cucina.
                                                        Quindi: zampe in spalla e gambe di pasta frolla e cominciamo!
                                                        Uh, l'estintore.
        {charTag(Franco, "question")}:                  Tullio mi ha detto di portarmi l'estintore.
        {charTag(Franco, "neutral")}:                   Ma mentre cuciniamo, mi dici un po' come stai approcciando questo posto?
                                                        Vai col caos come il famoso Girino Ir Rosponsabile, o sei più una persona ranalitica?

        -> kitchen_moon_feedback ->

            + \ {charTag(PG, "neutral")}:                       <i>Setaccio della polenta analitica.</i>
                    ~ kitchen_recipeNoun = "Polenta"
                -> glyph_choice_manager(true, airC)->
                {charTag(Franco, "party")}:                     Craande!
                {charTag(Franco, "neutral")}:                   Un po' come me.
                                                                Sempre tutto chiaro e sotto controllo.
                {charTag(Franco, "question")}:                  Uh, ma quella è una mia zampa?
                                                                Non sapevo di averne un'altra!
               
            + \ {charTag(PG, "neutral")}:                       <i>Riscaldo l'acqua per della zuppetta empatica.</i>
                    ~ kitchen_recipeNoun = "Zuppetta"
                -> glyph_choice_manager(true, waterC)->    
                {charTag(Franco, "neutral")}:                   Ah, come la tosse di zia Graaak!
                                                                Povera, faceva di quelle bolle sott'acqua.
                                                                Uh, una lettera di Giulio.
                                                                "Amore, la tosse di tua zia era <i>sintomatica.<i>"
                                                                "Empatica è quando Graaak dice che gli dispiace per te, ma poi si incazza comunque."

            + \ {charTag(PG, "neutral")}:                       <i>Impasto una focaccia decisa.</i>
                    ~ kitchen_recipeNoun = "Focaccia"
                -> glyph_choice_manager(true, earthC)->    
                {charTag(Franco, "neutral")}:                   Un approccio con una direzione precisa.
                                                                Un po' come quando Euforbo ha preso la patente.
                                                                Ma i girini hanno solo la coda.
                                                                E quindi la macchina è andata in una sola direzione.
                                                                Decisamente contro la partita di ananassi.

        
            + \ {charTag(PG, "neutral")}:                       <i>Preparo una panzanella caotica.</i>
                    ~ kitchen_recipeNoun = "Panzanella"
                -> glyph_choice_manager(true, fireC)->    
                {charTag(Franco, "question")}:                  Te l'ho mai raccontata la storia di Girino Ir Rosponsabile?
                {charTag(Franco, "neutral")}:                   È questo tizio leggendario, che da piccolo ha provato le cose più assurde.
                                                                Una volta è finito anche dentro la bocca di una carpa.
                                                                Poi ci si è addormentato, e quando si è svegliato era già una rana grande.
                                                                E quella rana si chiama Franco La Rana.
                {charTag(Franco, "party")}:                     Cioè me.
    
            + \ {charTag(PG, "neutral")}:                       <i>Friggo della spirituale cicerchiata.</i>
                    ~ kitchen_recipeNoun = "Cicerchiata"
                -> glyph_choice_manager(true, aetherC)->    
                {charTag(Franco, "question")}:                  Cice.
                                                                Cerch.
                                                                Cicherch.
                                                                Craaaaaaaac!
                                                                Ma che parola è, girino?!?
                {charTag(Franco, "neutral")}:                   Però mi piacciono le cose spirituali.
                                                                Sopratutto quando i gemelli vanno a dormire.
                {charTag(Franco, "party")}:                     Allora con Giulio e Tullio ci beviamo qualcosa e guardiamo una puntata di <i>Gnat's anatomy</i>.
            -    
        
        {charTag(Franco, "party")}:                             Guarda ora cra, il tocco dello chef.
                                                                Un pezzo di muschio.
                                                                Eh?
                                                                Chi se lo aspettava?
        {charTag(Franco, "neutral")}:                           Io aspetto tante cose a dire il vero.
                                                                Di diventare più grosso.
                                                                Mi piacerebbe essere grosso come la famosa rana Bollagorga.
                                                                Così galleggio e non faccio nemmeno la fatica di spostarmi.
                                                                E poi aspetto che il mio tronco divenga un albero.
                                                                E di poter dire "ho smesso di lavorare!"
        {charTag(Franco, "party")}:                             Anche se noi rane non lavoriamo.
        {charTag(Franco, "neutral")}:                           È un'occupazione molto stupida.
        {charTag(Franco, "question")}:                          Ma il tuo lavoro invece, {player_name}?
                                                                Sei {player_pronouns has him:soddisfatto|{player_pronouns has her:soddisfatta|soddisfattə}} di quello che stai facendo?
            
            + \ {charTag(PG, "neutral")}:                       <i>Aggiungo con risolutezza della assafetida.</i>
                    ~ kitchen_recipeAdjective = "risoluta"
                -> glyph_choice_manager(true, earthC)->    
                {charTag(Franco, "party")}:                     Qui il nostro girino sa dove sta andando!
                {charTag(Franco, "neutral")}:                   Non tutti possono dirlo.
                                                                Io non ho ancora capito come sono finito qui.
                                                                Mamma Craazia dice che mi ha portato una cicogna.
                                                                Ma che ha dimenticato la ricevuta e per questo non mi ha potuto rimandare indietro.
                {charTag(Franco, "question")}:                  Chissà se mi diventano le gambe lunghe anche a me allora?
                                                                Così posso nuotare!

            + \ {charTag(PG, "neutral")}:                       <i>Spargo con insicurezza del sommacco.</i>
                    ~ kitchen_recipeAdjective = "insicura"
                -> glyph_choice_manager(true, waterC)->    
                {charTag(Franco, "neutral")}:                   Ora, so che potrebbe stupirti, ma a volte anche io non so cosa faccio.
                                                                Ed è normale.
                {charTag(Franco, "party")}:                     Solo i girini hanno le idee chiare.
                {charTag(Franco, "neutral")}:                   Ma perché non capiscono molto.
                                                                Pensa che Euforbo l'altro giorno mi ha detto che i dinosauri sono esistiti davvero.
                                                                Povero girino.     

            + \ {charTag(PG, "neutral")}:                       <i>Spolvero con disperazione della curcuma.</i>
                    ~ kitchen_recipeAdjective = "disperata"
                -> glyph_choice_manager(true, fireC)->    
                {charTag(Franco, "neutral")}:                   Conosco quella sensazione, girino.
                {charTag(Franco, "party")}                      Ma non disperarti: qui le cose vanno sempre bene.
                {charTag(Franco, "neutral")}:                   Nel senso che chi riscrive non è che dice alle persone che cosa fare.
                                                                Le aiuta solo ad uscire dallo stallo.
                                                                Poi sta a loro decidere dove galoppare.
                {charTag(Franco, "party")}:                     Ho fatto una battuta!
                {charTag(Franco, "neutral")}:                   Un po' come quando faccio un pasticcio e Tullio mi guarda e mi dice: ora sono gatti tuoi.
                                                                Mi fa capire che mi posso prendere delle responsabilità.
                                                                Ma che non posso più prendere dei gatti.    

            + \ {charTag(PG, "neutral")}:                       <i>Incorporo con arroganza del cajun.</i>
                    ~ kitchen_recipeAdjective = "arrogante"
                -> glyph_choice_manager(true, earthC)->    
                {charTag(Franco, "neutral")}:                   Questo è il momento per raccontarti la storia di Bavarana.
                                                                Bavarana era questo tipo convinto di sapere tutto lui, e non ascoltava mai nessuno.
                                                                E passava le notti a gracidare quando tutti volevano dormire.
                                                                E un giorno, stanco delle lamentele di tutte le rane dello stagno, ha detto: "Non ho bisogno di voi, vivrò da solo!"
                                                                E per qualche mese si è sentito superrospo e aveva pure investito in cryptopalude.
                                                                Ma poi un giorno una anguilla se l'è divorato.
                                                                Perché alla fine non è che si va tanto lontani senza gli altri.
                {charTag(Franco, "question")}:                  Mi slegheresti la lingua?
    
            + \ {charTag(PG, "neutral")}:                       <i>Macino con mediocrità del pepe rosa.</i>
                    ~ kitchen_recipeAdjective = "mediocre"
                -> glyph_choice_manager(true, aetherC)->    
                {charTag(Franco, "neutral")}:                   Non è male essere mediocri.
                                                                Pensa a quel modo di dire: "Non è né carne né pesce."
                                                                Noi rane non siamo pesci.
                                                                Non siamo carne come i cani o le note musicali.
                {charTag(Franco, "party")}:                     Ma siamo comunque splendorose, non trovi?
                {charTag(Franco, "neutral")}:                   E respiriamo dalla pelle.
                                                                E sentiamo senza orecchie.
                {charTag(Franco, "party")}:                     Mica male vero?
            -

        {charTag(Franco, "party")}:                             Mi sembra che stia sobbollendo benissimo.
                                                                Questa parola me l'ha insegnata {charNameFive}.
                                                                Prova a insegnarmi tantissime parole lei.
        {charTag(Franco, "question")}:                          Ma quando ho provato a spiegarle come fare le bolle col naso, si è allontanata disgustata.
        {charTag(Franco, "neutral")}:                           <i>Disgustata</i> me l'ha insegnata Tullio.
                                                                Dice che era così la faccia della maestra dei gemelli quando mi sono dimenticato di nuovo di recuperarli dal nido.
                                                                Tullio dice che devo stare più attento, che perdo troppo il filo.
                                                                Cosa strana, visto che non cucio.
        {charTag(Franco, "question")}:                          Come si dice?
                                                                "Chi più cuce, più sbaglia."
        {charTag(Franco, "party")}:                             E visto che non cucio, non sbaglio mai, vero?
        {charTag(Franco, "neutral")}:                           Però {charNameFive} dice che potrei essere una pessima influenza per {charNameTwo}.
        {charTag(Franco, "question")}:                          Cosa strana, perché ho provato la febbre e non l'ho.
                                                                Ma tu che ci lavori tanto assieme, che idea ti sei fatt{player_pronouns has him:o|{player_pronouns has her:a|ə}} di {charNameFive}?

            + \ {charTag(PG, "neutral")}:                       <i>Decoro con della granella di affetto.</i>
                    ~ kitchen_recipeComplement = "granella di affetto"
                -> glyph_choice_manager(true, waterC)->    
                {charTag(Franco, "party")}:                     Eh, ma si vede che tu c'ha il cuore grande.
                {charTag(Franco, "neutral")}:                   Come zia Graaak.
                                                                Per questo deve andare dal dottore.
                                                                Una volta lei gli ha detto: "Ma ovvio dottore che c'ho il cuore grosso, con un nipote così scemo."
                {charTag(Franco, "question")}:                  Non sapevo che la zia avesse un nipote.
                {charTag(Franco, "party")}:                     Per fortuna che ha me.
              
            + \ {charTag(PG, "neutral")}:                       <i>Abbellisco con delle gocce di cioccolato e sospetto.</i>
                    ~ kitchen_recipeComplement = "gocce di cioccolato sospettoso"
                -> glyph_choice_manager(true, earthC)->    
                {charTag(Franco, "question")}:                  Come nei thriller?
                                                                Quindi c'è un crimine?
                                                                E {charNameFive} è sospettata?
                                                                Ora le chiediamo a sorpresa: "Dov'è il malloppo?"
                                                                E lei allora avrà la coda di carpa e si tradirà.
                {charTag(Franco, "party")}:                     E magari del malloppo è del cibo.
                                                                A Franco piace sempre il cibo.
   
            + \ {charTag(PG, "neutral")}:         <i>Guarnisco con un battuto di caramello e indifferenza.</i>
                    ~ kitchen_recipeComplement = "battuto di caramello indifferente"
                -> glyph_choice_manager(true, waterC)->    
                {charTag(Franco, "neutral")}:                   Ah, come quando dividi la spazzatura.
                                                                Uh, una lettera di Giulio.
                                                                "Amore, indifferenza è come quando mamma Craazia è così arrabbiata che fa finta che non esisti."
                {charTag(Franco, "question")}:                  Ah, quella indifferenza.
                {charTag(Franco, "party")}:                     Come quando si gioca a nascondino!
                                                                O a un due tre stella.
                {charTag(Franco, "neutral")}:                   Interessante, girino, interessante.
                                                                Un'altra lettera di Giulio!
                                                                "Ah, amore, hai dimenticato di nuovo di smaltire i residui di alga."
                {charTag(Franco, "question")}:                  Ma perché tocca sempre a me?

            + \ {charTag(PG, "neutral")}:                       <i>Addobbo con strisce di pastella e gratitudine.</i>
                    ~ kitchen_recipeComplement = "strisce di pastella grate"
                -> glyph_choice_manager(true, aetherC)->    
                {charTag(Franco, "party")}:                     Mi piace la gratitudine!
                {charTag(Franco, "neutral")}:                   Anche se a volte mi si brucia un poco.
                {charTag(Franco, "party")}:                     Per fortuna ho uno stomaco di feltro.
                {charTag(Franco, "neutral")}:                   Uh, una lettera di Euforbo.
                                                                "Papà, quella è la <i>gratinatura</i>. La gratitudine è quando dico "Per fortuna l'intelligenza l'ho presa dagli altri papà"!"
                                                                Che ragazzino sveglio, Euforbo.
                {charTag(Franco, "question")}:                  Ma devo dirgli di restituire l'intelligenza a Tullio e Giulio: non è carino tenere a lungo le cose prese in prestito.  

            + \ {charTag(PG, "neutral")}:                       <i>Rifinisco con semi di zucca e fastidio.</i>
                    ~ kitchen_recipeComplement = "semi di zucca infastiditi"
                -> glyph_choice_manager(true, fireC)->    
                {charTag(Franco, "neutral")}:                   Ah, come quel modo di dire.
                                                                "Essere una spina nel Franco."
                                                                Una volta mi è successo.
                {charTag(Franco, "question")}:                  Ma perché ho confuso delle more per delle mosche.
                                                                E volevo andare a farci due parole.
                {charTag(Franco, "neutral")}:                   E sono rimasto lì, bloccato
                                                                E a quel punto mi son detto "Vabbè Franco, fatti un pisolino."
                                                                Ed ero tutto lì rilassato con la lingua fuori.
                                                                Ma poi sono svegliato con le grida disperate di Tullio.
                {charTag(Franco, "question")}:                  Perché si agita così tanto?
            -
        
        {charTag(Franco, "question")}:                          Ma che dici se ci facciamo anche qualcosa da bere, girino?
                                                                Lo sapevi che noi rane beviamo dalla pelle?
        {charTag(Franco, "party")}:                             Ed è una cosa supercomoda.
                                                                E le cose comode sono belle.
        {charTag(Franco, "neutral")}:                           E a proposito di cose comode: non è che ti chiamo "girino" perché non mi importa dei tuoi pronomi.
                                                                Franco La Rana non è uno che si siede sugli agliori.
                                                                È che coi girini non si capisce il sesso, sono tutti uguali.
        {charTag(Franco, "question")}:                          E poi sarebbe tipo <i>strano</i> interessarcene, no?
        {charTag(Franco, "neutral")}:                           Inquietante.
                                                                E a Franco non piace la roba inquietante.
                                                                Solo quella inquiepoche.
                                                                Però è importante una cosa: sapere come stanno i girini.
        {charTag(Franco, "question")}:                          E quindi, girino: come stai?
        
            + \ {charTag(PG, "neutral")}:                       <i>Mi verso un bicchiere di succo gioioso.</i>
                    ~ kitchen_recipePP = "e contorno di gioia"
                -> glyph_choice_manager(true, earthC)->    
                {charTag(Franco, "party")}:                     Il mio sentimento preferito!
                {charTag(Franco, "neutral")}:                   Dopo la fiducia.
                {charTag(Franco, "party")}:                     Io ho molta fiducia in me, girino.
                {charTag(Franco, "neutral")}:                   Da piccolo nessuno credeva in me.
                                                                A volte facevano proprio finta che non esistevo.
                                                                E allora facevo finta di essere un fantasma.
                                                                È facile quando la tua casa è fatta d'acqua.
               
            + \ {charTag(PG, "neutral")}:                       <i>Mi preparo una tazza di tisana rilassata.</i>
                    ~ kitchen_recipePP = "e contorno di rilassatezza"
                -> glyph_choice_manager(true, aetherC)->    
                {charTag(Franco, "neutral")}:                   Lo dico sempre a Tullio e Giulio: amori, la vita va presa con rilassatezza.
                                                                Fanno così tante cose i miei amorini.
                                                                Pensa che Tullio ha una agenda dove segna tutte le cose da fare per i gemelli.
                                                                Non sapevo nemmeno fossero così tante.
                                                                E Giulio invece si occupa della casa.
                                                                E quando sono sul divano e gli dico "beviamo qualcosa e rilassiamoci" si agitano ancora di più.    
   
            + \ {charTag(PG, "neutral")}:                       <i>Mi riempio una tazzina di caffè frenetico.</i>
                    ~ kitchen_recipePP = "e contorno di frenesia"
                -> glyph_choice_manager(true, fireC)->    
                {charTag(Franco, "neutral")}:                   C'è una leggenda tra le rane.
                                                                La leggenda di Ranetica.
                                                                Una rana che nuotava così veloce ma così veloce che quando si muoveva l'acqua bolliva.
                                                                E un giorno era così su di giri che ha nuotato fino al mare, e a me il mare non piace.
                {charTag(Franco, "question")}:                  L'acqua salata mi rovina la pelle.
                                                                E la sabbia si infila negli occhi.
                                                                E la musica mi fa vibrare tutto.
                {charTag(Franco, "party")}:                     Però potrei organizzare una vacanza in Abruzzo coi mariti.
                {charTag(Franco, "neutral")}:                   Una roba più tranquilla.
                                                                Da quando sono nati i gemelli non ci rilassiamo mai.
                {charTag(Franco, "party")}:                     Ma ciao {player_name}!
                                                                Che piacere vederti cra!

            + \ {charTag(PG, "neutral")}:                       <i>Mi offro un goccio dil distillato di curiosità.</i>
                    ~ kitchen_recipePP = "e contorno di curiosità"
                -> glyph_choice_manager(true, airC)->    
                {charTag(Franco, "neutral")}:                   Euforbo è supercurioso.
                                                                L'altro giorno mi ha detto: "Sarei curioso di capire come sei diventato adulto." 
                                                                E io gli ho spiegato che è una cosa che accade da sola, come innamorarsi o attraversare la strada.
                                                                E lui ha detto: "Questa non è una risposta, papà."
                                                                E poi mi ha urlato: "Attento alle macchine!"
                {charTag(Franco, "question")}:                  Non so perché siano tutti così tesi nella mia famiglia.
    
            + \ {charTag(PG, "neutral")}:                       <i>Prendo un bicchiere di acqua annoiata.</i>
                    ~ kitchen_recipePP = "e contorno di noia"
                -> glyph_choice_manager(true, waterC)->    
                {charTag(Franco, "neutral")}:                   Noo, la noia nooo.
                                                                Mi fa venire le bolle nella pancia.
                                                                E prude tutto.
                                                                Eh.
                                                                Uh, una lettera di Tullio.
                                                                "Amore, quella è la processionaria."
                                                                "E non capisco come tu sia arrivato da <i>noia</i> a <i>processionaria</i>."
                                                                "Per fortuna la visita dall'otorino è domani."
                                                                "PS: Ti amo."
                {charTag(Franco, "party")}:                     Che carino che è vero?
                {charTag(Franco, "neutral")}:                   Anche se non avevo mai pensato di farmi un motorino.
                {charTag(Franco, "party")}:                     Però magari ci può fare un giro {charNameTwo}!
                {
                    - thirdChar_storyStatus == story_storyStarted:
                                                                O con l'aiuto di {charNameThree}.
                {charTag(Franco, "neutral")}:                   Sembra uno che le capisce le moto.
                }
            -

        {charTag(Franco, "party")}:                             Girino, come vola il tempo quando ci si diverte!
                                                                Il nostro piatto è pronto!

        ~ recipe_name_creator()
        ~ recipe_name_storage(PG)

        {charTag(Franco, "party")}:                             Pesciolini?
                                                                Ehi, pesciolini.
        {charTag(Franco, "neutral")}:                           Eccovi qui un bel piatto di {kitchen_PGRecipe}.
                                                                Piano, piano.
        {charTag(Franco, "question")}:                          Ehi Marinio, come sta andando poi con quel corso da pilota?
        {charTag(Franco, "neutral")}:                           Sai {player_name}, Marinio ha sempre voluto volare.
                                                                E ora sta imparando come guidare un aereo.
                                                                Anche se sua madre è preoccupata, sai come sono le madri.
                                                                "Ma non sai respirare fuori dall'acqua!"
                                                                "Ma non hai il cappotto!"
                                                                "Poi ti dimenticherai del mio compleanno!"
                                                                Però Marinio vuole tanto bene alla sua mamma.
        {charTag(Franco, "party")}:                             Ogni anno le regala qualcosa di speciale.
        {charTag(Franco, "neutral")}:                           L'anno scorso le ha portato a casa dei simpatici nematodi, gente con cui si è fatto due birre.
                                                                Lei si è arrabbiata molto: non tutti sanno apprezzare il valore di un regalo.
        {charTag(Franco, "party")}:                             Ma a proposito di regalo, girino, ho una cosa per te!
        {charTag(Franco, "neutral")}:                           Basta aggiungerlo come quarto ingrediente, e la persona a cui lo darai sarà presa benissimo.
                                                                E ti dirà qualcosa di importante su di sé.
                                                                Tipo se le stanno simpatici i nematodi.
                                                                Ne ho solo uno da darti, scusa, gli altri me li sono mangiati tutti.
                                                                E ora mi fa male il pancino.
                                                                Mi sa che torno allo stagno, magari Giulio sa come aiutarmi.
        {charTag(Franco, "party")}:                             A dopo!

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
        ~ move_entity(FrancoCucina, Safekeeping)
        ~ kitchen_kitchenOccupied = false
        ~ cooking_animations_off()

        -> achievements_onGame_statusUpdate_RM ->
        -> main