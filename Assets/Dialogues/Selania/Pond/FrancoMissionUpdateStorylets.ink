/*****************************

    Sollecito missioni

****************************/ 
=== franco_missionOne_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(Franco, "{portrait_Franco()}")}:           Ehi girino!
                                                        Ricordati di leggere un po' dal tuo libro magico.
                                                        Io ti aspetto qui.
                                                        Ma hai visto che bella che è questa rana riflessa nell'acqua?
                                                        Ciao bellezza!

-> main


=== franco_missionTwo_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(Franco, "{portrait_Franco()}")}:           {player_name}!
                                                        Come sta andando con le piante della serra?
                                                        Torna qui quando ce ne saranno abbastanza per le formiche!

-> main


=== franco_missionThree_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(Franco, "{portrait_Franco()}")}:           Ma ecco di nuovo qui il mio girino preferito!
                                                        Hai poi chiesto a {mentorName} come stare bene?
        {
            - are_two_entities_together(Mentor, PG):
                Ma grazie Franco!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Ho tantissimi consigli da dare a {player_name}!
                {
                    - are_two_entities_together(FirstCharacter, PG):
                        Non ne dubitavo {mentorName}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                }
        
        }
    {charTag(Franco, "{portrait_Franco()}")}:           Intanto sistemo la posta arretrata.
                                                        Che poi se deve andare avanti, non dovrebbe essere "avanzata"?
                                                        Però non si muove.
                                                        Forse è quindi "posta fermata"?

-> main


=== franco_missionFour_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(Franco, "{portrait_Franco()}")}:           {player_name}!
                                                        Le mie spie mi hanno detto che ancora non hai raccontato stranezze a {mentorName}!
        {
            - are_two_entities_together(Mentor, PG):
                Stranezze?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        }
    {charTag(Franco, "{portrait_Franco()}")}:           Uh, non ho davvero delle spie.
                                                        Giusto qualche girino.
                                                        E Dora l'ape.
                                                        E la nostra amica che a volte mi aiuta a capire meglio le cose.

-> main


=== franco_missionFive_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(Franco, "{portrait_Franco()}")}:       Girino, sapevi che se metto la zampa nell'acqua si spezza?
                                                    Ma se poi la tiro fuori, è intera!
                                                    E non sento dolore!
                                                    Questa è magia!
                                                    Continuo a studiare questa cosa mentre tu provi a parlare assieme a {charNameOne} e {charNameTwo}.
        {
            - are_two_entities_together(FirstCharacter, PG):
                In che senso scusa?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                {charTag(Franco, "{portrait_Franco()}")}:       In senso diagonale, vedi?
                                                                Ora la zampa è dritta.
                                                                Ora è in acqua ed è spezzata!
        }
    {charTag(Franco, "{portrait_Franco()}")}:       Se scopro come succede potrei cambiare il mondo!
                                                    E tutti un giorno parleranno di Franco la rana!

-> main


=== franco_missionSix_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(Franco, "{portrait_Franco()}")}:       Parla con la nostra amica comune, girino.
                                                    Intanto resterò qui a scrivere una lettera di scuse a Tullio e Giulio.
                                                    "Cari miei amori. Prometto di non dimenticare mai mai più i gemelli al nido..."

-> main


=== franco_missionSeven_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

{charTag(Franco, "{portrait_Franco()}")}:           Girino!
                                                    Come diceva Gambusia de Filippi: c'è fitoplancton per te.
                                                    Uh, forse non c'entra molto.
                                                    Fammi sapere quando hai letto la lettera che ti aspetta alla stazione dei treni.

-> main


=== franco_missionEight_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(Franco, "{portrait_Franco()}")}:       {player_name}, continuano ad arrivarmi lettere dai topi della biblioteca.
                                                    Non è che riesci a farci un salto e smuovere qualche racconto?
                                                    Intanto scelgo la canzone per il prossimo karaoke.
                                                    Quasi quasi a questo giro porto "Il ballo del cra cra".
                                                    O "Craande, Craande, Craande".
                                                    Oppure ripasso anche il balletto con Tullio e Giulio e ci rifacciamo "Craak!... I did it again".

-> main


/*****************************

    Missioni concluse

****************************/ 

=== franco_missionOne_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Dato che potrebbe trattarsi di una missione fatta in autonomia, aggiungo (solo ora) la missione a quelle completate.
    ~ frog_currentMission = missionOne  

    {charTag(Franco, "{portrait_Franco()}")}:       Ma sei un portento, girino!
                                                    Pensa che ero qui a dirmi "Servirebbe una persona con una bella testolina, più grande di quella di zia Torba."
                                                    "Una capace di leggere quasi quanto {charNameTwo}."
        {
            - are_two_entities_together(SecondCharacter, PG):
                Quasi però!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Perché io sono il più megagrande lettore della scuola!
        }
    {charTag(Franco, "{portrait_Franco()}")}:       E tu hai già letto tante ma tante delle pagine del libro che ti è stato donato!
                                                    E come dico sempre: la conoscenza è sapere!
                                                    E il sapere è sapore per cui: dimmi come posso aiutarti.
        
        -> franco_giftsManagement

=== franco_missionTwo_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Dato che potrebbe trattarsi di una missione fatta in autonomia, aggiungo (solo ora) la missione a quelle completate.
    ~ frog_currentMission = missionTwo

    {charTag(Franco, "{portrait_Franco()}")}:       Dove l'ho messo di nuovo.
                                                    Ah eccolo!
                                                    Mi hanno scritto le formiche per dirmi che ti stai prendendo cura della serra!
                                                    Ed è una cosa grandiosa girino, e sai perché?
                                                    Io no.
                                                    Ah no, eccolo, me lo scrivono sempre le formiche.
                                                    "Avevamo fame."
                                                    Mi sembra una buona motivazione.
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Il cibo è sempre una motivazione.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
            }
    {charTag(Franco, "{portrait_Franco()}")}:       E a proposito di cose buone: vediamo come posso aiutarti! 

            -> franco_giftsManagement

=== franco_missionThree_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Dato che potrebbe trattarsi di una missione fatta in autonomia, aggiungo (solo ora) la missione a quelle completate.
    ~ frog_currentMission = missionThree

    {charTag(Franco, "{portrait_Franco()}")}:       Girino!
                                                    Mi hanno detto che hai chiesto a {mentorName} di darti qualche consiglio di benessere.
                                                    Come lo so?
                                                    Perché ora li sta dando a tutte le persone che incontra.
            {
                - are_two_entities_together(Mentor, PG):
                    Non a tutte tutte.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    Però poi Franco ho una dritta per quella tensione muscolare!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            }
    {charTag(Franco, "{portrait_Franco()}")}:       Tullio mi ha anche detto: "Franco, sei una brava persona, ma devi farti due domande prima di chiedere certe cose a {player_name}."
                                                    Gli ho chiesto quali fossero le due domande, e lui mi ha baciato sulla testa.
                                                    E poi mi ha detto "Per fortuna che sei simpatico."
                                                    Ci amiamo così tanto.
                                                    Però ora {mentorName} è più felice.
                                                    E questo posto è un po' più felice.
                                                    E allora io ti rendo un po' più felice: dimmi come posso aiutarti.
        
            -> franco_giftsManagement

=== franco_missionFour_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Dato che potrebbe trattarsi di una missione fatta in autonomia, aggiungo (solo ora) la missione a quelle completate.
    ~ frog_currentMission = missionFour

    {charTag(Franco, "{portrait_Franco()}")}:       Questa no.
                                                    Nemmeno questa.
                                                    {player_name}, tu non sai quanto sia bravo mio marito Tullio ad allungare lo stagno quando parla.
                                                    Non arriva mai al punto.
        {
        - are_two_entities_together(FirstCharacter, PG):
            Perché tu arrivi sempre al punto, Franco.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            Sì sì, sempre.#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Preciso cone una mosca.
            Non credo che.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            Ah, lascia perdere.
            Non perdo mai.#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            E Tullio non perde mai la parola.
        }
    {charTag(Franco, "{portrait_Franco()}")}:       Nemmeno sui bigliettini.
                                                    Ah, ecco qui.
                                                    "Ricordati di recuperare i gemelli al nido."
                                                    No, non era questo.
                                                    "Ricordati <b>davvero</b> di recuperare i gemelli al nido. Non come quella volta che sono tornati con l'anatra delle otto da soli."
                                                    "A proposito di anatre: le sorelle Qualqui vengono per cena. Mi prendi due etti di termiti e qualche seme? Ti amo."
                                                    Dall'arrivo dei gemelli ha un tritone per capello.
                                                    Avere centosedici figli non è una passeggiata.
                                                    Sempre meglio di zia Graaak, che ormai va per il migliaio.
                                                    Non hai idea del casino del ricordare tutti i compleanni, {player_name}!
                                                    Ma io dovevo dirti qualcosa.
                                                    Cosa?
                                                    Ah sì: che il gossip è importante.
                                                    Per cui grazie per aver parlato con {mentorName} delle cose insolite che hai incontrato.
                                                    Non sai quanto abbia bisogno quella donna di uscire dal suo guscio.
                                                    Per cui: vediamo come posso aiutarti!
        
        -> franco_giftsManagement

=== franco_missionFive_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Dato che potrebbe trattarsi di una missione fatta in autonomia, aggiungo (solo ora) la missione a quelle completate.
    ~ frog_currentMission = missionFive

    {charTag(Franco, "{portrait_Franco()}")}:       Avannotti!
                                                    Era "avannotti".
                                                    Non "ananassi."
                                                    Franco, hai sempre la testa tra le alghe.
                                                    Cosa buffa, {player_name}.
                                                    Prima mio marito Tullio e l'altro marito, Giulio, stavano parlando di una partita di pallanuoto tra ananassi.
                                                    E, girino, quanto ero confuso!
                                                    Però a volte ho paura di sembrare tonto come una conchiglia, e quindi non chiedo nulla.
                                                    Invece sono contento che prima hai partecipato alla conversazione tra {charNameOne} e {charNameTwo}, girino.
        {
            - are_two_entities_together(FirstCharacter, PG):
                Ci stavi spiando quindi?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        }                        

    {charTag(Franco, "{portrait_Franco()}")}:       Non hai avuto paura di dire una cosa e sembrare stupid{player_pronouns has him:o|{player_pronouns has her:a|ə}}!
        {
            - are_two_entities_together(SecondCharacter, PG):
                La nonna dice sempre che non ci sono domande stupide ma solo risposte sbagliate.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        }
    {charTag(Franco, "{portrait_Franco()}")}:       Quindi: non essere come Franco. E se vedi due persone vicine, prova ancora a chiacchierare con loro.
                                                    Però una partita tra ananassi io me la guarderei.
                                                    Dopo lo dico a Giulio, magari ne esce qualcosa.
                                                    Come quella volta che abbiamo tirato su una band.
                                                    Ci chiamavamo Depeche pond.
                                                    Ma non è stata una bella idea quella di mettere gli amplificatori in acqua.
                                                    I ricci sono ancora arrabbiati con noi.
                                                    Ma devo aiutarti, mannaggia alla mia distrazione.
                                                    Zio Gracco lo dice sempre: Franco!
                                                    Zio Gracco è un rospo di poche parole.
        -> franco_giftsManagement

=== franco_missionSix_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Dato che potrebbe trattarsi di una missione fatta in autonomia, aggiungo (solo ora) la missione a quelle completate.
    ~ frog_currentMission = missionSix  

    {charTag(Franco, "{portrait_Franco()}")}:       Girino!
                                                    Ho saputo che finalmente hai parlato con la nostra amica comune!
                                                    E tu dirai: "Ma Franco, come fai a sapere sempre tutto?"
                                                    E io ti dirò: "Ma Franco è sempre la prima ruota del gatto, ovvio che sa tutto!"
                                                    E tu dirai: "Ma i gatti non hanno le ruote."
                                                    E allora io dirò: "I gatti hanno tante cose, ma non ce le vogliono fare sapere!"
                                                    E poi ti dirò: "Una volta ho conosciuto un gatto con un buffo cappello in testa."
                                                    E quando gli ho chiesto: "Giovandomenico, ma cosa ci fai con un cappello così in testa?"
                                                    Lui mi ha detto: "Meow!"
                                                    I gatti sono così saggi.
                                                    Ma zia Graaak dice sempre: tanto va la gatta allo stagno, che ci rimette il girino.
                                                    Uh, una lettera di Tullio.
                                                    "Franco, di a quel{player_pronouns has her:la|lə} pover{player_pronouns has him:o|{player_pronouns has her:a|ə}} {player_name} quello che devi dir{player_pronouns has him:gli|{player_pronouns has her:le|lə}}!"
                                                    Uh, è sempre così nervoso.
                                                    Comunque {player_name}: sono felice che hai parlato con chi sai tu.
                                                    Perché il lavoro che fai è molto delicato.
                                                    Molto.
                                                    Ed è bello avere una guida, un'alleata così saggia.
    {charTag(TheWitch, "{witch_state()}")}:         <i>La saggezza ha molte facce, e una porta il volto di Franco.</i>
    {charTag(Franco, "{portrait_Franco()}")}:       E ora quindi è il mio momento di aiutarti.
        
        -> franco_giftsManagement

=== franco_missionSeven_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Dato che potrebbe trattarsi di una missione fatta in autonomia, aggiungo (solo ora) la missione a quelle completate.
    ~ frog_currentMission = missionSeven

    {charTag(Franco, "{portrait_Franco()}")}:       I gemelli stanno facendo lo sciopero del sonno.
                                                    A fatica mi ricordo il mio nome.
                                                    E tutto perché Giulio non vuole prendergli un cane.
        {
            - are_two_entities_together(SecondCharacter, PG):
                Anche io voglio un caneeeeeeeeeeeeee!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                {charTag(Franco, "{portrait_Franco()}")}:       Allora sciopera coi gemelli!
        }
    {charTag(Franco, "{portrait_Franco()}")}:       Comunque è sempre colpa di Dora l'ape.
                                                    Quella passa il tempo a svolazzare in giro, e poi se ne sta lì sulla riva a bere acqua e raccontare cose.
                                                    E ha detto ai gemelli del cane alla fermata del treno.
                                                    Scusa, sono arrabbiato.
                                                    Dora è una brava ape, buona come l'alga.
                                                    Ma ho sonno!
                                                    E l'altra sera l'ho detto ai gemelli.
                                                    Li ho fatti sedere tutti e centosedici in cerchio.
                                                    "Un cane non sa respirare sott'acqua, punto."
                                                    Ma poi Euforbo, che è il più sveglio dei gemelli, ha un mese e mezzo ma sta già nella classe dei tre mesi, mi dice: "Papà, siamo anfibi."
                                                    "E quindi?" gli chiedo, sperando solo di andare a dormire.
                                                    "E quindi sappiamo respirare fuori dall'acqua, papà Franco!"
                                                    E la sorpresa, {player_name}!
                                                    Non ci avevo mai pensato, ma respiro fuori dall'acqua!
        {
            - are_two_entities_together(FirstCharacter, PG):
                Franco, ma tu come ci sei arrivato all'età adulta?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                {charTag(Franco, "{portrait_Franco()}")}:       Un po' a piedi, un po' col treno.
        }
    {charTag(Franco, "{portrait_Franco()}")}:       E il mondo ora mi sembra così grande.
                                                    E pieno di possibilità.
                                                    Come quella di avere un cane.
                                                    Ora sto scioperando anche io coi gemelli.
                                                    Ma non sai quanto ho sonno!
                                                    E Dora mi ha detto che hai conosciuto il cane del treno!
                                                    E allora io ti aiuterò con il tuo lavoro.
                                                    Così magari Giulio capisce che sono un bravo girino, e ci prende il cane!
        
        -> franco_giftsManagement

=== franco_missionEight_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Dato che potrebbe trattarsi di una missione fatta in autonomia, aggiungo (solo ora) la missione a quelle completate.
    ~ frog_currentMission = missionEight

    {charTag(Franco, "{portrait_Franco()}")}:       "Caro zio Gracco."
                                                    "La algonara è stata inventata nemmeno cento schiuse fa."
                                                    "Quindi se ci metto la panna no, non è un crimine contro lo stagno."
                                                    "Tuo nipote Franco."
                                                    "PS: potresti tenere i gemelli sabato? Vorrei andare alla partita degli ananassi con Tullio e Giulio. Grazie mille."
                                                    "PPS: non è che mi passeresti anche la ricetta per la frittura di opilione? Grazie mille!"
                                                    Ehi {player_name}, eccoti cra!
                                                    Scusa, ero preso dalla corrispondenza.
                                                    Mi passa tra poco la carpa del pomeriggio, e quella è pignola con la posta.
                                                    Come si dice? Cerca sempre la squama nel batterio.
                                                    O era il batterio nella salamandra?
                                                    No, quella era la parola segreta per il karaoke di cugina Sputt.
                                                    Cugina è una che canta benissimo, girino!
                                                    Ha una voce così forte che a volte vengono a lamentarsi anche i topi della biblioteca.
                                                    E a proposito di biblioteca!
                                                    Ho visto che hai ascoltato il mio consiglio e hai letto qualche racconto!
                                                    Un po' ti invidio: se tocco la carta i libri si rovinano.
                                                    Però la nostra amica comune a volte mi legge qualche storia.
                                                    La mia preferita è quella del principe ranocchio.
                                                    Quando lei lo bacia e le vengono tutte le verruche.
        {
            - are_two_entities_together(FirstCharacter, PG):
                Onesto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        }
    {charTag(Franco, "{portrait_Franco()}")}:       Gli umani dovrebbero imparare a lasciarci in pace.
        {
            - are_two_entities_together(SecondCharacter, PG):
                Anche io?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                {
                    - frog_and_second_char_chit_chat:
                        {charTag(Franco, "{portrait_Franco()}")}:       Ma abbiamo già detto che tu sei una rana, {charNameTwo}!
                    - else:
                        {charTag(Franco, "{portrait_Franco()}")}:       Mmm.
                                                                        Io non sono sicuro che tu sei un umano.
                                                                        Sei troppo basso.    
                }
                                                                        Ma quando sei qui mi diverto tanto.
                                                                        Quindi sono in pace.
    }
    {charTag(Franco, "{portrait_Franco()}")}:       E a proposito di pace: vediamo come posso aiutarti!
        
        -> franco_giftsManagement

=== special_mission_one_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        //Associo ~ glyph_actualActiveSigil al sigillo di Franco
        ~ glyph_actualActiveSigil = nest_francoChosenSigil
        @animation:RewriterBook

        {charTag(Franco, "{portrait_Franco()}")}:       Girino, ma che carino questo sigillo!
        {charTag(TheWitch, "{witch_state()}")}:         {player_name} ha trovato {sigils_translator(nest_francoChosenSigil)}.
        {charTag(Franco, "{portrait_Franco()}")}:       {sigils_translator(nest_francoChosenSigil)}, suona bene.
                                                        Spero che la nostra amica comune ti dia anche le informazioni utili per capire come funzioni.
        {charTag(TheWitch, "{witch_state()}")}:         {player_name} troverà le informazioni su {sigils_translator(nest_francoChosenSigil)} direttamente nel Grimorio.

            //Aggiorno i testi
            ~ glyph_grimoireTripleSigilsUpdater()
            ~ glyph_grimoireTripleSigilsUpdater()
            ~ glyph_grimoireTripleSigilsUpdater()
            //Poi aggiorno il sigillo principale
            ~ glyph_grimoireMainSigilsUpdater()
            //E svuoto glyph_actualActiveSigil
            ~ glyph_actualActiveSigil = ()
            
        {charTag(Franco, "{portrait_Franco()}")}:       Ora vado da Euforbo e glielo dono subito.
                                                        Chissà se lo deve mangiare?
                                                        O metterlo in testa?
                                                        Magari ci si fa un cappellino?
                                                        Uh, tieniti pure la pietra, così puoi scoprire altri sigilli.
                                                        Magari ti aiutano a dire le tue emozioni.

        ~ move_entity(Franco, Pond)
        ~ frog_allMissionsCompleted += frog_currentMission
        ~ frog_currentMission = ()
        ~ frog_aboutGiftRequest = ()
        //Metto in pausa le missioni speciali
        ~ franco_pauseSpecialStorylets()
        ~ nest_francoUsedEarth = false
        //Riattivo poi i tasti se posseduti
        -> nest_reactivateGliphs ->
        
        -> main
            