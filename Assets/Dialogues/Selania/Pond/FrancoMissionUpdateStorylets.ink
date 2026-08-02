// /*****************************

//     Sollecito commissioni

// ****************************/ 
// === franco_missionOne_solicit
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

//     {charTag(Franco, "party")}:                         Ehi girino!
//     {charTag(Franco, "neutral")}:                       Ricordati di leggere un po' dal tuo libro magico.
//                                                         Io ti aspetto qui.
//     {charTag(Franco, "question")}:                      Ma hai visto che bella che è questa rana riflessa nell'acqua?
//     {charTag(Franco, "party")}:                         Ciao bellezza!

// ->->


// === franco_missionTwo_solicit
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

//     {charTag(Franco, "party")}:                         {player_name}!
//     {charTag(Franco, "question")}:                      Come sta andando con le piante della serra?
//     {charTag(Franco, "neutral")}:                       Torna qui quando ce ne saranno abbastanza per le formiche!

// ->->


// === franco_missionThree_solicit
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
//     ~ temp charNameFour= translator(fourthChar_ActualName)
//     ~ temp charNameFive = translator(fifthChar_ActualName)
    

//     {charTag(Franco, "party")}:                         Ma ecco di nuovo qui il mio girino preferito!
//     {charTag(Franco, "question")}:                      Hai poi chiesto a {charNameFive} come stare bene?
//         {
//             - are_two_entities_together(Mentor, PG):
//             {charTag(FifthCharacter, "hurry")}:         Ma grazie Franco!
//                                                         Ho tantissimi consigli da dare a {player_name}!
//             {
//                 - are_two_entities_together(FirstCharacter, PG):
//             {charTag(FirstCharacter, "annoyed")}:       Non ne dubitavo {charNameFive}.
//             }
        
//         }
//     {charTag(Franco, "neutral")}:                       Intanto sistemo la posta arretrata.
//     {charTag(Franco, "question")}:                      Che poi se deve andare avanti, non dovrebbe essere "avanzata"?
//                                                         Però non si muove.
//                                                         Forse è quindi "posta fermata"?

// ->->


// === franco_missionFour_solicit
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
//     ~ temp charNameFour= translator(fourthChar_ActualName)
//     ~ temp charNameFive = translator(fifthChar_ActualName)
    

//     {charTag(Franco, "party")}:                         {player_name}!
//     {charTag(Franco, "neutral")}:                       Le mie spie mi hanno detto che ancora non hai raccontato stranezze a {charNameFive}!
//         {
//             - are_two_entities_together(Mentor, PG):
//                 {charTag(FifthCharacter, "hurry")}:             Stranezze?
//         }
//     {charTag(Franco, "neutral")}:                       Uh, non ho davvero delle spie.
//                                                         Giusto qualche girino.
//                                                         E Dora l'ape.
//     {charTag(Franco, "party")}:                         E la nostra amica che a volte mi aiuta a capire meglio le cose.

// ->->


// === franco_missionFive_solicit
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
//     ~ temp charNameFour= translator(fourthChar_ActualName)
//     ~ temp charNameFive = translator(fifthChar_ActualName)
    

//     {charTag(Franco, "question")}:                      Girino, sapevi che se metto la zampa nell'acqua si spezza?
//                                                         Ma se poi la tiro fuori, è intera!
//                                                         E non sento dolore!
//     {charTag(Franco, "party")}:                         Questa è magia!
//     {charTag(Franco, "neutral")}:                       Continuo a studiare questa cosa mentre tu provi a vedere cosa succede se parli con due persone assieme.
//         {
//             - are_two_entities_together(FirstCharacter, PG):
//             {charTag(FirstCharacter, "curious")}:       In che senso scusa?
//             {charTag(Franco, "question")}:              In senso diagonale, vedi?
//                                                         Ora la zampa è dritta.
//                                                         Ora è in acqua ed è spezzata!
//         }
//     {charTag(Franco, "party")}:                         Se scopro come succede potrei cambiare il mondo!
//                                                         E tutti un giorno parleranno di Franco la rana!

// ->->


// === franco_missionSix_solicit
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
//     ~ temp charNameFour= translator(fourthChar_ActualName)
//     ~ temp charNameFive = translator(fifthChar_ActualName)
    

//     {charTag(Franco, "neutral")}:                       Parla con la nostra amica comune, girino.
//                                                         Intanto resterò qui a scrivere una lettera di scuse a Tullio e Giulio.
//     {charTag(Franco, "reading")}:	                    "Cari miei amori. Prometto di non dimenticare mai mai più i gemelli al nido..."

// ->->


// === franco_missionSeven_solicit
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

//     {charTag(Franco, "party")}:                         Girino!
//     {charTag(Franco, "neutral")}:                       Come diceva Gambusia de Filippi: c'è fitoplancton per te.
//     {charTag(Franco, "question")}:                      Uh, forse non c'entra molto.
//     {charTag(Franco, "neutral")}:                       Fammi sapere quando hai letto la lettera che ti aspetta alla stazione dei treni.

// ->->


// === franco_missionEight_solicit
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

//     {charTag(Franco, "neutral")}:                       {player_name}, continuano ad arrivarmi lettere dai topi della biblioteca.
//     {charTag(Franco, "question")}:                      Non è che riesci a farci un salto e smuovere qualche racconto?
//                                                         Intanto scelgo la canzone per il prossimo karaoke.
//     {charTag(Franco, "party")}:                         Quasi quasi a questo giro porto "Il ballo del cra cra".
//                                                         O "Craande, Craande, Craande".
//                                                         Oppure ripasso anche il balletto con Tullio e Giulio e ci rifacciamo "Craak!... I did it again".

// ->->

// === franco_missionNine_solicit
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

//     {charTag(Franco, "reading")}:	                    "E mi rendo conto che le rane non piacciono a tutte le persone."
//                                                         "Ma se per questo nemmeno le persone piacciono a tutte le rane."
//                                                         "E quindi vi chiedo di accogliere mio marito nella vostra Accademia."
//                                                         "Ma senza serpenti."
//                                                         "Quelli ci mangiano."
//     {charTag(Franco, "question")}:                      {player_name}, mi sa che ancora non hai guardato la nuova opera di Giulio, vero?
//     {charTag(Franco, "neutral")}:                       La trovi in camera tua!
//     {charTag(Franco, "reading")}:	                    "PS: ma il vostro campus ha ninfee singole o condivise?"
                                                    
// ->->

// === franco_missionTen_solicit
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

//     {charTag(Franco, "neutral")}:                       {player_name}, quelli del MENSA mi stanno dicendo che li ho diffamati.
//                                                         Solo perché ho scritto sotto un loro post che non è vero che se c'è internet allora uno è tenuto a sapere che la noce moscata non vola.
//                                                         Anche perché ci sono un sacco di cose sbagliate su internet.
//                                                         Tipo che tutte le rane nuotano.
//     {charTag(Franco, "question")}:                      Ma mi sa invece che tu non hai ancora aggiunto un ingrediente extra in cucina, vero?
                                                    

// ->->

// /*****************************

//     Missioni concluse

// ****************************/ 

// === franco_missionOne_closed
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

// //Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
//     {
//         - frog_currentMission has missionOne:
//         {charTag(Franco, "party")}:                 Hai letto il grimorio!
//                                                     Hai una testa grande!

//         - else:
//         {charTag(Franco, "question")}:              Vediamo vediamo vediamo.
//         {charTag(Franco, "neutral")}:               Interessante.
//                                                     Ho dimenticato di ordinare del punteruolo.
//                                                     Devo assolutamente passare a prenderlo dal fiorista prima che Tullio se ne accorga.
//         {charTag(Franco, "party")}:                 Ehi, {player_name}!
//         {charTag(Franco, "neutral")}:               Mi diceva zio Gracco che hai trovato un libro.
//                                                     E che l'hai letto molto.
//         {charTag(Franco, "party")}:                 E come dico sempre ai gemelli: sapere è podere.
//                                                     E se il podere ha uno stagno, allora c'è una rana.
//                                                     E se c'è una rana, sarà felice di sapere anche lei che {player_name} ha letto il suo libro.
//                                                     Sei un bravo girino.
//     }

// //Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
//     ~ frog_currentMission = missionOne

// //E poi scrivo la parte comune

//     {charTag(Franco, "neutral")}:                   Sei capace di leggere quasi quanto {charNameTwo}.
                                                    
//         {
//             - are_two_entities_together(SecondCharacter, PG):
//                 {charTag(SecondCharacter, "energy")}:       Quasi però!
//                                                             Perché io sono il più megagrande lettore della scuola!
//         }

//     {charTag(Franco, "party")}:                             E come dico sempre: la conoscenza è sapere!
//                                                             E il sapere è sapore per cui: dimmi come posso aiutarti.
        
//         -> franco_giftsManagement

// === franco_missionTwo_closed
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

// //Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
//     {
//         - frog_currentMission has missionTwo:
//         {charTag(Franco, "party")}:                 Hai coltivato le piante in serra!

//         - else:
//         {charTag(Franco, "question")}:              L'avresti mai detto?
//         {charTag(Franco, "neutral")}:               I girini sono future rane.
//                                                     Ma se si lanciano sulla terra, non sanno respirare.
//                                                     Da piccolo ci ho provato, e mamma Craazia mi ha detto: "Franco, hai il fango sugli occhi! Svegliati!"
//                                                     Poi mi sono lavato via il fango e ci ho riprovato.
//                                                     A quel punto è arrivato zio Gracco, che mi ha detto: "Non ti azzardare a rifare la algonara con la panna!"
//                                                     E mi ha ributtato in acqua.
//         {charTag(Franco, "party")}:                 Ma c'è una lettera delle formiche!
//         {charTag(Franco, "reading")}:	            "Ci servivano  più piante in serra, era urgente, e {player_name} ci ha aiutate!"
//         {charTag(Franco, "neutral")}:	            Ah, le formiche.
//                                                     Il rapporto tra me e loro è un po' complicato perché.
//                                                     Insomma.
//                                                     Di solito le rane mangiano le formiche.
//         {charTag(Franco, "party")}:                 Ma poi Giulio mi ha fatto diventare vegetariano.
//         {charTag(Franco, "neutral")}:               Ma loro comunque non si fidano.
//                                                     Giulio dice sempre: "Con l'arrivo dei gemelli dovremmo fare le formiche, non comprare cose inutili!"
//                                                     E allora scavo dei cunicoli per tutto lo stagno.
//                                                     E lui mi bacia sulla testa e mi dice: "Fortuna che ti amo."
//         {charTag(Franco, "party")}:                 Anche io lo amo tanto.
//     }

// //Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
//     ~ frog_currentMission = missionTwo

// //E poi scrivo la parte comune

//     {charTag(Franco, "question")}:                  Ma chissà come mai le formiche avevano bisogno di nuove piante.
//     {charTag(Franco, "neutral")}:                   Ah, ecco una loro lettera.
//     {charTag(Franco, "reading")}:	                "Avevamo fame."
//     {charTag(Franco, "party")}:                     Mi sembra una buona motivazione.
//             {
//                 - are_two_entities_together(FirstCharacter, PG):
//                     {charTag(FirstCharacter, "affectionate")}:      Il cibo è sempre una motivazione.
//             }
//     {charTag(Franco, "party")}:                     E a proposito di cose buone: vediamo come posso aiutarti! 

//             -> franco_giftsManagement

// === franco_missionThree_closed
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
//     ~ temp charNameFour= translator(fourthChar_ActualName)
//     ~ temp charNameFive = translator(fifthChar_ActualName)
    

// //Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
//     {
//         - frog_currentMission has missionThree:
//         {charTag(Franco, "party")}:                 Hai parlato con {charNameFive}!

//         - else:
//         {charTag(Franco, "neutral")}:               Questa è facile.
//                                                     Mi raccomando Franco, non distrarti.
//         {charTag(Franco, "question")}:	            La nostra amica comune, hai presente no?
//                                                     Quella che ci spiega le cose.
//         {charTag(Franco, "neutral")}:               La voce.
//                                                     Ecco.
//         {charTag(Franco, "party")}:                 Mi ha spiegato tante cose su {charNameFive}.
//         {charTag(Franco, "question")}:	            Sapevi ad esempio che può respirare fino a due minuti sott'acqua?
//                                                     {
//                                                         - are_two_entities_together(Mentor, PG):
//                                                             {charTag(FifthCharacter, "hurry")}:             Eh?
//                                                     }
//                                                     {
//                                                         - are_two_entities_together(FirstCharacter, PG):
//                                                             {charTag(FirstCharacter, "curious")}:       Questa me la voglio godere tutta.
//                                                     }
//         {charTag(Franco, "question")}:	            E che mangia solo pesce?
//         {charTag(Franco, "party")}:                 E che le piace giocare?
//                                                     {
//                                                         - are_two_entities_together(SecondCharacter, PG):
//                                                             {charTag(SecondCharacter, "neutral")}:        IM-POS-SI-BI-LE!
//                                                             {
//                                                                 - are_two_entities_together(Mentor, PG):
//                                                                     {charTag(FifthCharacter, "hurry")}:             Guarda che sono bravissima a burraco!
//                                                                     {charTag(SecondCharacter, "neutral")}:          Ma è una roba da vecchi!
//                                                             }
//                                                     }
//         {charTag(Franco, "question")}:	            E che ha una tasca sotto l'ascella dove conserva le pietre che usa per rompere i gusci?
//                                                     {
//                                                         - are_two_entities_together(Mentor, PG):
//                                                             {charTag(FifthCharacter, "neutral")}:                   A dire il vero ne ho anche una in testa, dove raccolgo le sciocchezze dette dalle rane.
//                                                             {charTag(Franco, "neutral")}:                           Ma le rana sono molto sagge, quindi non hai molto da raccogliere.
//                                                     }
//         {charTag(Franco, "neutral")}:               E.
//                                                     Uh, una lettera di Euforbo.
//         {charTag(Franco, "reading")}:	            "Papà Franco, quella è la lontra, non {charNameFive}."
//         {charTag(Franco, "neutral")}:	            Uh.
//                                                     Euforbo.
//         {charTag(Franco, "party")}:                 È più furbo di un pesce rosso.
//         {charTag(Franco, "neutral")}:               Ma {charNameFive}.
//                                                     Di cosa aveva bisogno {charNameFive}?
//         {charTag(TheWitch, witch_state())}:         <i>{charNameFive} ama dare consigli per far star bene le persone.</i>
//         {charTag(Franco, "question")}:	            <i>{charNameFive} crede di potere esistere solo quando si rende utile.</i>
//         {charTag(Franco, "neutral")}:               Esatto.
//                                                     Quella roba lì.
//         {charTag(Franco, "party")}:                 E tu l'hai fatta felice chiedendole un consiglio su come stare bene!
//         {charTag(Franco, "question")}:	            Ma quindi non è {charNameOne} che fa il nido sugli alberi?
//                                                     {
//                                                         - are_two_entities_together(FirstCharacter, PG):
//                                                             {charTag(FirstCharacter, "curious")}:       Esatto!
//                                                                                                         E poi ululo alla luna!
//                                                             {charTag(Franco, "neutral")}:               Devo subito avvisare Euforbo!
//                                                     }
//     }

// //Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
//     ~ frog_currentMission = missionThree

//         {charTag(Franco, "neutral")}:               Prima Tullio mi ha detto: "Franco, sei una brava persona, ma devi farti due domande prima di chiedere certe cose a {player_name}."
//                                                     Gli ho chiesto quali fossero le due domande, e lui mi ha baciato sulla testa.
//                                                     E poi mi ha detto "Per fortuna che sei simpatico."
//         {charTag(Franco, "party")}:                 Ci amiamo così tanto.
//         {charTag(Franco, "neutral")}:               Però ora {charNameFive} è più felice.
//                                                      {
//                                                         - are_two_entities_together(Mentor, PG):
//                                                             {charTag(FifthCharacter, "neutral")}:                   Vero.
//                                                     }
//         {charTag(Franco, "party")}:                 E questo posto è un po' più felice.
//                                                     E allora io ti rendo un po' più felice: dimmi come posso aiutarti.
        
//             -> franco_giftsManagement

// === franco_missionFour_closed
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
//     ~ temp charNameFour= translator(fourthChar_ActualName)
//     ~ temp charNameFive = translator(fifthChar_ActualName)
    

// //Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
//     {
//         - frog_currentMission has missionFour:
//         {charTag(Franco, "party")}:                 Rieccoti {player_name}!

//         - else:
//         {charTag(Franco, "neutral")}:               Quando ero ancora un girino, mamma Craazia mi diceva sempre:
//                                                     "Tuo fratello Clodoveo ha preso la mia intelligenza."
//                                                     "Tua sorella Boemonda la bellezza di tuo padre."
//                                                     E poi continuava così elencando tuttə lə miə centottantasei fradellə.
//                                                     E infine.
//                                                     "Tu, Franco. Hai delle belle pupille."
//         {charTag(Franco, "party")}:                 Mi piacciono le mie pupille, mi fanno vedere tante cose.
//         {charTag(Franco, "neutral")}:               Cose strane.
//                                                     E le cose strane vanno condivise, così le persone sanno cosa aspettarsi dal mondo.
//                                                     Come quando ho scoperto che gli umani chiamano la mia pancia "tronco".
//                                                     Come il tronco degli alberi.
//                                                     E allora ho capito che noi rane nasciamo girini, diventiamo rane, e poi, quando siamo vecchie, alberi.
//         {charTag(Franco, "party")}:                 Bello, vero?
//                                                     Il mondo è un po' una grande rana.
//     }

// //Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
//     ~ frog_currentMission = missionFour

//         {charTag(Franco, "neutral")}:               E poi.
//         {charTag(Franco, "question")}:	            Ma dov'era?
//                                                     Questa no.
//                                                     Nemmeno questa.
//         {charTag(Franco, "neutral")}:               {player_name}, tu non sai quanto sia bravo mio marito Tullio ad allungare lo stagno quando parla.
//                                                     Non arriva mai al punto.
//                                                     {
//                                                     - are_two_entities_together(FirstCharacter, PG):
//                                                         {charTag(FirstCharacter, "neutral")}:           Perché tu arrivi sempre al punto, Franco.
//                                                         {charTag(Franco, "neutral")}:                   Sì sì, sempre.
//                                                                                                         Preciso cone una mosca.
//                                                         {charTag(FirstCharacter, "annoyed")}:           Non credo che.
//                                                                                                         Ah, lascia perdere.
//                                                         {charTag(Franco, "party")}:                     Non perdo mai.
//                                                                                                         E Tullio non perde mai la parola.
//                                                     }
//         {charTag(Franco, "neutral")}:               Nemmeno sui bigliettini.
//                                                     Ah, ecco qui.
//         {charTag(Franco, "reading")}:	            "Ricordati di recuperare i gemelli al nido."
//         {charTag(Franco, "neutral")}:               No, non era questo.
//         {charTag(Franco, "reading")}:	            "Ricordati <b>davvero</b> di recuperare i gemelli al nido. Non come quella volta che sono tornati con l'anatra delle otto da soli."
//                                                     "A proposito di anatre: le sorelle Qualqui vengono per cena. Mi prendi due etti di termiti e qualche seme? Ti amo."
//         {charTag(Franco, "neutral")}:               Dall'arrivo dei gemelli ha un tritone per capello.
//                                                     Avere centosedici figli non è una passeggiata.
//                                                     Sempre meglio di zia Graaak, che ormai va per il migliaio.
//         {charTag(Franco, "neutral")}:               Non hai idea del casino del ricordare tutti i compleanni, {player_name}!
//         {charTag(Franco, "question")}:	            Ma io dovevo dirti qualcosa.
//                                                     Cosa?
//         {charTag(Franco, "party")}:                 Ah sì: che il gossip è importante.
//                                                     Per cui grazie per aver parlato con {charNameFive} delle cose insolite che hai incontrato.
//                                                     Non sai quanto abbia bisogno quella donna di uscire dal suo guscio.
//         {charTag(Franco, "party")}:                 Per cui: vediamo come posso aiutarti!
        
//         -> franco_giftsManagement

// === franco_missionFive_closed
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

// //Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
//     {
//         - frog_currentMission has missionFive:
//         {charTag(Franco, "party")}:                 Ma ciao chiacchieron{player_pronoun has him:e|{player_pronoun has her:a|ə}}!

//         - else:
//         {charTag(Franco, "party")}:                 Tra qualche sera c'è il karaoke di cugina Sputt.
//                                                     Non hai idea delle cose che accadono durante le sue feste, girino!
//         {charTag(Franco, "neutral")}:               L'anno scorso ero così ubriaco di grappa d'alghe che ho addirittura...
//                                                     Oh, mi vergogno a dirlo.
//                                                     No, non posso dirlo.
//                                                     Una cosa così stupida.
//                                                     Ehi, una lettera di Tullio!
//         {charTag(Franco, "reading")}:	            "Diglielo amore, ti supplico, diglielo e lascial{player_pronoun has him:o|{player_pronoun has her:a|ə}} andare."
//         {charTag(Franco, "neutral")}:               Uh.
//                                                     Insomma, {player_name}!
//         {charTag(Franco, "party")}:                 Ho <b>nuotato</b>!
//         {charTag(Franco, "question")}:              Non è assurdo?
//                                                     Una rana che nuota!
//         {charTag(Franco, "neutral")}:               Quando l'ho raccontato ai girini, mi hanno preso per pazzo!
//                                                     Anche perché poi ovviamente sono quasi annegato.
//                                                     Quest'anno ho promesso che non toccherò la grappa.
//                                                     Niente, zero.
//                                                     Sennò chissà cosa farò.
//         {charTag(Franco, "party")}:                 Magari mi metto addirittura a <b>saltare</b>!
//         {charTag(Franco, "question")}:              Te la immagini, girino?
//                                                     Una rana che salta?
//         {charTag(Franco, "neutral")}:               Ma c'è una lettera di Giulio.
//         {charTag(Franco, "reading")}:	            "Di{player_pronoun has him:gli|{player_pronoun has her:lle|llə}} della commissione, Franco, abbi pietà per quella povera creatura!"
//         {charTag(Franco, "question")}:              Oggi i mariti sono un po' nervosetti.
//     }

// //Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
//     ~ frog_currentMission = missionFive

//         {charTag(Franco, "party")}:                 Avannotti!
//                                                     Ora ricordo!
//                                                     Era "avannotti".
//                                                     Non "ananassi."
//         {charTag(Franco, "neutral")}:               Franco, hai sempre la testa tra le alghe.
//         {charTag(Franco, "party")}:                 Cosa buffa, {player_name}.
//         {charTag(Franco, "neutral")}:               Prima mio marito Tullio e l'altro marito, Giulio, stavano parlando di una partita di pallanuoto tra ananassi.
//         {charTag(Franco, "question")}:              E, girino, quanto ero confuso!
//                                                     Però a volte ho paura di sembrare tonto come una conchiglia, e quindi non chiedo nulla.
//         {charTag(Franco, "party")}:                 Invece sono contento che prima hai visto cosa succede quando due persone parlano tra loro.
//         {charTag(Franco, "neutral")}:               Alcune cose si complicano, altre sono più chiare!
//                                                     Quindi: non essere come Franco. E se vedi due persone vicine, prova ancora a chiacchierare con loro.
//                                                     Però una partita tra ananassi io me la guarderei.
//         {charTag(Franco, "question")}:              Dopo lo dico a Giulio, magari ne esce qualcosa.
//         {charTag(Franco, "party")}:                 Come quella volta che abbiamo tirato su una band.
//                                                     Ci chiamavamo Depeche pond.
//         {charTag(Franco, "neutral")}:               Ma non è stata una bella idea quella di mettere gli amplificatori in acqua.
//                                                     I ricci sono ancora arrabbiati con noi.
//                                                     Ma devo aiutarti, mannaggia alla mia distrazione.
//                                                     Zio Gracco lo dice sempre: Franco!
//                                                     Zio Gracco è un rospo di poche parole.
//         -> franco_giftsManagement

// === franco_missionSix_closed
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

// //Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
//     {
//         - frog_currentMission has missionSix:
//         {charTag(Franco, "party")}:                 Finalmente l'hai conosciuta!

//         - else:
//         {charTag(Franco, "neutral")}:               Prima c'è stato l'incontro tra genitori e insegnanti.
//                                                     Non è facilissimo quando ci sono così tanti girini in giro.
//                                                     "Girini in giro", suona bene!
//                                                     Potrei farci una canzone trap!
//                                                     "Girano i girini col girello nel girotondo".
//                                                     "Girano e si agitano e smuovono il fondo!"
//                                                     "Sono profondo!"
//                                                     E poi?
//         {charTag(Franco, "party")}:                 "Ah."
//         {charTag(Franco, "question")}:              O è meglio "Yeah"?
//         {charTag(Franco, "neutral")}:               Ah no, stavo parlando dell'incontro con gli insegnanti.
//                                                     Ci sono anni in cui un incontro dura settimane.
//                                                     Una volta c'erano così tanti girini che abbiamo avuto più tempo speso all'incontro che non con le lezioni.
//                                                     Ora però ci sono classi più piccole.
//                                                     Soprattutto dopo <b>quel</b> fattaccio con l'airone.
//                                                     Glielo avevano detto tutti a zio Gracco che non aveva davvero la faccia da critico gastronomico.
//                                                     Poveri girini.
//         {charTag(Franco, "party")}:                 Però poteva andare peggio, per fortuna ci ha aiutato la nostra amica comune, quella della discarica.
//                                                     {
//                                                         - are_two_entities_together(SecondCharacter, PG):
//                                                             {charTag(SecondCharacter, "emotional")}:        C'è qualcuno nella discarica?!
                                                                
//                                                     }

//                                                     {
//                                                         - are_two_entities_together(FirstCharacter, PG):
//                                                             {charTag(FirstCharacter, "curious")}:           C'è un'altra persona qui in giro?
                                                                
//                                                     }

//                                                     {
//                                                         - are_two_entities_together(ThirdCharacter, PG):
//                                                             {charTag(ThirdCharacter, "bored")}:             Questo posto è pieno di donne.
                                                                
//                                                     }

//                                                     {
//                                                         - are_two_entities_together(Mentor, PG):
//                                                             {charTag(FifthCharacter, "bored")}:             C'è una discarica?!?
                                                                
//                                                     }
//     }

// //Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
//     ~ frog_currentMission = missionSix

//         {charTag(Franco, "neutral")}:               Non mi è ancora chiaro perché decida di stare in quella discarica.
//         {charTag(TheWitch, witch_state())}:         La discarica è un promemoria delle nostre responsabilità.
//         {charTag(Franco, "neutral")}:               Un po' come quando Tullio mi mette i promemoria sul cellulare.
//                                                     Ma poi dimentico il cellulare a casa.
//         {charTag(Franco, "party")}:                 Ma sono felice che hai parlato con la nostra amica comune!
//         {charTag(Franco, "question")}:              E tu dirai: "Ma Franco, come fai a sapere sempre tutto?"
//         {charTag(Franco, "neutral")}:               E io ti dirò: "Ma Franco è sempre la prima ruota del gatto, ovvio che sa tutto!"
//         {charTag(Franco, "question")}:              E tu dirai: "Ma i gatti non hanno le ruote."
//         {charTag(Franco, "neutral")}:               E allora io dirò: "I gatti hanno tante cose, ma non ce le vogliono fare sapere!"
//                                                     E poi ti dirò: "Una volta ho conosciuto un gatto con un buffo cappello in testa."
//         {charTag(Franco, "question")}:              E quando gli ho chiesto: "Giovandomenico, ma cosa ci fai con un cappello così in testa?"
//         {charTag(Franco, "neutral")}:               Lui mi ha detto: "Meow!"
//         {charTag(Franco, "party")}:                 I gatti sono così saggi.
//         {charTag(Franco, "neutral")}:               Ma zia Graaak dice sempre: tanto va la gatta allo stagno, che ci rimette il girino.
//         {charTag(Franco, "reading")}:	            Uh, una lettera di Tullio.
//                                                     "Franco, di a quel{player_pronoun has her:la|lə} pover{player_pronoun has him:o|{player_pronoun has her:a|ə}} {player_name} quello che devi dir{player_pronoun has him:gli|{player_pronoun has her:le|lə}}!"
//         {charTag(Franco, "question")}:              Uh, è sempre così teso.
//         {charTag(Franco, "party")}:                 Comunque {player_name}: sono felice che hai parlato con lei.
//                                                     Perché il lavoro che fai è molto delicato.
//         {charTag(Franco, "neutral")}:               Molto.
//                                                     Ed è bello avere una guida, un'alleata così saggia.
//         {charTag(TheWitch, witch_state())}:         <i>La saggezza ha molte facce, e una porta il volto di Franco.</i>
//         {charTag(Franco, "party")}:                  E ora quindi è il mio momento di aiutarti.
        
//         -> franco_giftsManagement

// === franco_missionSeven_closed
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

// //Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
//     {
//         - frog_currentMission has missionSeven:
//         {charTag(Franco, "party")}:                 Hai conosciuto la cagnolina!

//         - else:
//         {charTag(Franco, "neutral")}:               Mannaggina che sonno, girino.
//         {charTag(Franco, "question")}:              Ma sai una cosa?
//         {charTag(Franco, "party")}:                 Mi diceva Dora che hai conosciuto la cagnolina della posta!
//         {charTag(Franco, "neutral")}:               E che hai letto una lettera.
//         {charTag(Franco, "question")}:              Non è ora di frasi un pisolino assieme, che ne dici?
//         {charTag(Franco, "neutral")}:               Uh, una lettera di zio Gracco!
//         {charTag(Franco, "reading")}:	            "Franco, c'è questo tizio che sembra un recensore magnifico!"
//                                                     "E ha definito i miei lombrichi all'amatriciana "sublimi"!"
//                                                     "Deve avere ovviamente buon gusto."
//                                                     "Avrebbe bisogno di un po' di spazio per dormire, ma qui stiamo attendendo una nuova schiusa."
//                                                     "Non è che puoi ospitarlo tu?"
//                                                     "Si firma Signor Gufo de Predatoris."
//                                                     "Puoi contattarlo tramite la carpa della sera."
//                                                     "Anche se l'ultima è sparita da qualche giorno."
//         {charTag(Franco, "neutral")}:               Mmm.
//         {charTag(Franco, "question")}:              Che cosa strana.
//                                                     Non dovrebbe essere "Signore Gufo" invece di "Signor Gufo"?
//                                                     Sennò è come se dicessi "Ciao, sono la Ran Franco", no?
//     }

// //Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
//     ~ frog_currentMission = missionSeven

//         {charTag(Franco, "neutral")}:               I gemelli stanno facendo lo sciopero del sonno.
//                                                     A fatica mi ricordo il mio nome.
//                                                     E tutto perché Giulio non vuole prendergli un cane.
//         {
//             - are_two_entities_together(SecondCharacter, PG):
//                 {charTag(SecondCharacter, "energy")}:       Anche io voglio un caneeeeeeeeeeeeee!
//                 {charTag(Franco, "party")}:                 Allora sciopera coi gemelli!
//         }
//         {charTag(Franco, "neutral")}:               Comunque è sempre colpa di Dora l'ape.
//                                                     Quella passa il tempo a svolazzare in giro, e poi se ne sta lì sulla riva a bere acqua e raccontare cose.
//                                                     E ha detto ai gemelli della cagnolina alla fermata del treno.
//                                                     Scusa, sono arrabbiato.
//         {charTag(Franco, "party")}:                 Dora è una brava ape, buona come l'alga.
//         {charTag(Franco, "neutral")}:               Ma ho sonno!
//                                                     E l'altra sera l'ho detto ai gemelli.
//                                                     Li ho fatti sedere tutti e centosedici in cerchio.
//                                                     "Un cane non sa respirare sott'acqua, punto."
//                                                     Ma poi Euforbo, che è il più sveglio dei gemelli, ha un mese e mezzo ma sta già nella classe dei tre mesi, mi dice: "Papà, siamo anfibi."
//         {charTag(Franco, "question")}:              "E quindi?" gli chiedo, sperando solo di andare a dormire.
//         {charTag(Franco, "neutral")}:               "E quindi sappiamo respirare anche fuori dall'acqua, papà Franco!"
//         {charTag(Franco, "party")}:                 E la sorpresa, {player_name}!
//                                                     Non ci avevo mai pensato, ma respiro fuori dall'acqua!
//                                                     {
//                                                         - are_two_entities_together(FirstCharacter, PG):
//                                                             {charTag(FirstCharacter, "annoyed")}:           Franco, ma tu come ci sei arrivato all'età adulta?
//                                                             {charTag(Franco, "neutral")}:                   Un po' a piedi, un po' col treno.
//                                                     }
//         {charTag(Franco, "party")}:                 E il mondo ora mi sembra così grande.
//                                                     E pieno di possibilità.
//                                                     Come quella di avere un cane.
//                                                     Ora sto scioperando anche io coi gemelli.
//         {charTag(Franco, "neutral")}:               Ma non sai quanto ho sonno!
//                                                     E se ora ti aiuto col tuo lavoro, magari Giulio capisce che sono un bravo girino, e ci prende il cane!
        
//         -> franco_giftsManagement

// === franco_missionEight_closed
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

// //Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
//     {
//         - frog_currentMission has missionEight:
//         {charTag(Franco, "party")}:                 Ecco qui {player_pronoun has him:il|{player_pronoun has her:la|lə}} campion{player_pronoun has him:e|{player_pronoun has her:essa|essə}} di bibliotecosità!

//         - else:
//         {charTag(Franco, "neutral")}:               Euforbo ha portato a casa una pulce d'acqua.
//                                                     La maestra vuole che imparino a prendersi cura di altre forme di vita.
//                                                     Gli altri gemelli hanno già divorato le loro pulci, ma Euforbo ha un altro cuore.
//         {charTag(Franco, "question")}:              Che un po' è ovvio: non è che potrebbe condividere il cuore con un altro gemello.
//                                                     O con Tullio.
//                                                     O con Giulio.
//                                                     O con me.
//         {charTag(Franco, "neutral")}:               Anche se Tullio mi dice sempre "Ti ho nel cuore".
//         {charTag(Franco, "question")}:              Che è una cosa che un po' mi confonde.
//         {charTag(Franco, "neutral")}:               Come quando Giulio dice "Euforbo ha la testa sulle spalle."
//         {charTag(Franco, "question")}:              Ma è un girino, al massimo ha la testa sull'addome.
//                                                     A volte quando condivido questi dubbi, Euforbo mi bacia sulla fronte e mi dice: "Papà, perché non torni a scuola?"
//         {charTag(Franco, "neutral")}:               Mamma Craazia diceva sempre che prendo tutto alla lettera.
//                                                     Forse per questo mi scrivono così spesso.
//         {charTag(Franco, "party")}:                 Ma a proposito di scrivere!
//                                                     I topi della biblioteca mi hanno detto che hai portato un po' di movimento.
//                                                     Hai addirittura letto dei racconti, e sono così felici
//         {charTag(Franco, "neutral")}:               I racconti.
//                                                     E i topi.
//                                                     E forse anche le lettere.
//         {charTag(Franco, "question")}:              Uh, è da un po' che non mi scrivono.
//     }

// //Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
//     ~ frog_currentMission = missionEight

//         {charTag(Franco, "neutral")}:               Devo rispondere allo zio!
//         {charTag(Franco, "reading")}:	            "Caro zio Gracco."
//                                                     "La algonara è stata inventata nemmeno cento schiuse fa."
//                                                     "Quindi se ci metto la panna no, non è un crimine contro lo stagno."
//                                                     "Tuo nipote Franco."
//                                                     "PS: potresti tenere i gemelli sabato? Vorrei andare alla seconda partita degli ananassi con Tullio e Giulio. Grazie mille."
//                                                     "PPS: non è che mi passeresti anche la ricetta per la frittura di opilione? Grazie mille!"
//         {charTag(Franco, "neutral")}:               Fatto.
//                                                     Mi passa tra poco la carpa del pomeriggio, e quella è pignola con la posta.
//         {charTag(Franco, "question")}:              Come si dice? Cerca sempre la squama nel batterio.
//                                                     O era il batterio nella salamandra?
//         {charTag(Franco, "neutral")}:               No, quella era la parola segreta per il karaoke di cugina Sputt.
//         {charTag(Franco, "party")}:                 Cugina è una che canta benissimo, girino!
//                                                     Ha una voce così forte che a volte vengono a lamentarsi anche i topi della biblioteca.
//         {charTag(Franco, "neutral")}:               Forse ora che hai letto si calmano un poco.
//                                                     Un po' ti invidio, sai?
//                                                     Se tocco la carta i libri si rovinano.
//                                                     Però la nostra amica comune a volte mi legge qualche storia.
//         {charTag(Franco, "party")}:                 La mia preferita è quella del principe ranocchio.
//                                                     Quando lei lo bacia e le vengono tutte le verruche.
//                                                     {
//                                                         - are_two_entities_together(FirstCharacter, PG):
//                                                             {charTag(FirstCharacter, "neutral")}:         Onesto.
//                                                     }
//         {charTag(Franco, "neutral")}:               Gli umani dovrebbero imparare a lasciarci in pace.
//                                                     {
//                                                         - are_two_entities_together(SecondCharacter, PG):
//                                                             {charTag(SecondCharacter, "melanchonic")}:          Anche io?
//                                                             {
//                                                                 - grimoire_secondChar has grimSecondCharFranco:
//                                                                     {charTag(Franco, "neutral")}:               Ma abbiamo già detto che tu sei una rana, {charNameTwo}!
//                                                                 - else:
//                                                                     {charTag(Franco, "neutral")}:               Mmm.
//                                                                                                                 Io non sono sicuro che tu sei un umano.
//                                                                                                                 Sei troppo basso.    
//                                                             }
//                                                     {charTag(Franco, "party")}:                                 Ma quando sei qui mi diverto tanto.
//                                                                                                                 Quindi sono in pace.
//                                                 }
//     {charTag(Franco, "party")}:                     E a proposito di pace: vediamo come posso aiutarti!
        
//         -> franco_giftsManagement



// === franco_missionNine_closed
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

// //Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
//     {
//         - frog_currentMission has missionNine:
//         {charTag(Franco, "party")}:                 Hai guardato il ritratto di Giulio!

//         - else:
//         {charTag(Franco, "neutral")}:               Mi è arrivata una lettera dall'Accademia dei Bei Party.
//         {charTag(Franco, "reading")}:	            "Esimio dottor Franco Lelio Arpagone Romualdo Arcezio Nepomiceno Alcuino."
//                                                     "Le scriviamo in merito alla sua applicazione fatta per le veci del signor Giulio Igidio Liutprando Rigoberto Odovilio Sulpicio Policarpo Oruccio."
//                                                     "E per l'ottava volta le ripetiamo che, per quanto apprezziamo gli sforzi del signor Giulio Il Rospo, noi siamo un'agenzia di viaggi e NON"
//                                                     "E ripetiamo NON"
//                                                     "Un'accademia di pittura."
//                                                     "Per cui NO, non abbiamo borse di studio per il signor Giulio Il Rospo e"
//                                                     "NO, non doniamo blocchi di marmo di Craackrara"
//                                                     "E NO, non è che escludiamo il signor Giulio Il Rospo dai nostri corsi per un pregiudizio contro le rane."
//                                                     "Ma noi non facciamo corsi di alcun tipo perché noi siamo una AGENZIA DI VIAGGI!"
//                                                     "Se le interessa, abbiamo un pacchetto famiglia molto conveniente per l'isola dei serpenti."
//                                                     "Cordialmente."
//                                                     "Lo staff ABP."
//                                                     "PS: e comunque i ritratti del signor Giulio Il Rospo sono brutti."
//         {charTag(Franco, "party")}:                 {player_name}, questa Accademia è così esclusiva!
//                                                     Sono due anni che provo a coronare il sogno di Giulio di diventare pittore.
//         {charTag(Franco, "neutral")}:               Tutto questo è crudele.
//         {charTag(Franco, "question")}:              Potrei forse andare a parlare loro di persona?
//         {charTag(Franco, "party")}:                 Però so che tu hai già visto una delle sue opere, il nuovo ritratto che è appeso in camera tua!                                                
//     }

// //Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
//     ~ frog_currentMission = missionNine

//         {charTag(Franco, "neutral")}:               E voglio chiederti cosa ne pensi.
//                                                     Ma poi ho paura che mi dici che non ti piace.
//                                                     Perché Giulio ci rimarrebbe male.
//                                                     E non mi va che lui ci rimanga male.
//                                                     Perché poi allora sarebbe penserebbe che è colpa sua se non lo prendono all'Accademia.
//                                                     Ma secondo me è una cosa stupida quella di sentirsi in colpa.
//                                                     Perché fai le cose che sai fare come le sai fare e per chi le sai fare.
//         {charTag(Franco, "question")}:              E se non vanno bene all'Accademia, magari andranno bene in camera tua, no?
//         {charTag(Franco, "party")}:                 Sicuramente va bene in camera tua!
                                                    
//         {charTag(Franco, "party")}:                 E a proposito di cose che vanno bene: vediamo come posso aiutarti!
        
//         -> franco_giftsManagement



// === franco_missionTen_closed
//     ~ temp charNameOne = translator(firstChar_ActualName)
//     ~ temp charNameTwo = translator(secondChar_ActualName)
//     ~ temp charNameThree = translator(thirdChar_ActualName)
    

// //Prima cosa: dato che posso arrivare qui dopo una commissione, oppure in modo autonomo, creo una differenza che è legata semplicemente alla presenza o meno di questa commissione in frog_currentMission
//     {
//         - frog_currentMission has missionTen:
//         {charTag(Franco, "party")}:                 Hai completato la commissione!

//         - else:
//         {charTag(Franco, "neutral")}:               Ti svelo un segreto.
//         {charTag(Franco, "question")}:              Sapevi che Franco, questo Franco, non un altro Franco, tipo Franco il postino o Franco il cugino di Pino.
//                                                     E neanche quel cugino Franco che ha deciso di fare il poliziotto, e allora zia Graaak l'ha buttato fuori di casa.
//         {charTag(Franco, "neutral")}:               No no, questo Franco che vedi qui davanti a te, lo sapevi che è un socio MENSA?
//                                                     Non è che la cosa mi rende molto orgoglioso: è un po' snob come posto.
//                                                     E poi non penso capiscano proprio proprio bene che il test per entrare è pieno di limiti.
//                                                     E che magari non è che una rana non ce la fa ad entrarci perché è stupida, ma perché è una poveraccia.
//                                                     Però l'ho fatto perché zio Gracco insisteva.
//                                                     Dice che è fondamentale per trovare certi tipi di lavoro.
//                                                     E io continuo a dirglielo che non voglio lavorare.
//                                                     Soprattutto non in cucina.
//                                                     Che è difficilissimo mettere l'ingrediente giusto.
//                                                     E al MENSA hanno i corsi per gli ingredienti.
//                                                     E anche per scegliere i mestoli.
//                                                     Mica per niente si chiama Mestolo, Erbazzone, Nocciola: Scegliere Accuratamente.
//                                                     Se gli dico che non mi piacciono le nocciole, mi tolgono la tessera?
//         {charTag(Franco, "party")}:                 Però so che tu sai fare le scelte giuste, {player_name}.
//                                                     E infatti hai già completato una commissione prima ancora che te lo chiedessi, e aggiunto un ingrediente extra in cucina!
                                                                  
//     }

// //Poi per come funziona il codice, aggiungo comunque la commissione alla current mission, così sono sicura che il resto del codice funzioni correttamente anche se dovesse essere una commissione compiuta in autonomia
//     ~ frog_currentMission = missionTen

//         {charTag(Franco, "question")}:              Non so se lo sapevi già, ma ogni persona ha le sue cose preferite.
//                                                     E quelle schiferite.
//         {charTag(Franco, "neutral")}:               Per cui non arrabbiarti se qualcosa non è piaciuto.
//                                                     Tipo a me non piace il formaggio.
//         {charTag(Franco, "question")}:              Fa delle cose strane quando cade in acqua.
//                                                     Però con l'ingrediente giusto finisce che magari la persona ti dice anche delle cose molto personali.
//         {charTag(Franco, "neutral")}:               Come quando ho messo la grappa nella zuppa di Tullio.
//                                                     E poi mi ha detto che vorrebbe comprarsi una moto, ma che le fanno troppo grandi per noi rane.
                                                    
//         {charTag(Franco, "party")}:                 E a proposito di cose grandi: vediamo come posso aiutarti!
        
//         -> franco_giftsManagement




            