/*****************************

    Sollecito missioni

****************************/ 

=== franco_missionOne_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Ehi girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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

    {player_name}! #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Come sta andando con le piante della serra?
    Torna qui quando ce ne saranno abbastanza per le formiche!

-> main


=== franco_missionThree_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Ma ecco di nuovo qui il mio girino preferito!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
    Intanto sistemo la posta arretrata.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Che poi se deve andare avanti, non dovrebbe essere "avanzata"?
    Però non si muove.
    Forse è quindi "posta fermata"?

-> main


=== franco_missionFour_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {player_name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Le mie spie mi hanno detto che ancora non hai raccontato stranezze a {mentorName}!
        {
            - are_two_entities_together(Mentor, PG):
                Stranezze?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        }
    Uh, non ho davvero delle spie.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Giusto qualche girino.
    E Dora l'ape.
    E la nostra amica che a volte mi aiuta a capire meglio le cose.

-> main


=== franco_missionFive_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Girino, sapevi che se metto la zampa nell'acqua si spezza?speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Ma se poi la tiro fuori, è intera!
    Questa è magia!
    Continuo a studiare questa cosa mentre tu provi a parlare assieme a {charNameOne} e {charNameTwo}.
        {
            - are_two_entities_together(FirstCharacter, PG):
                In che senso scusa?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                In senso diagonale, vedi?#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Ora la zampa è dritta.
                Ora è in acqua ed è spezzata!
        }
    Se scopro come succede potrei cambiare il mondo!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    E tutti un giorno parleranno di Franco la rana!

-> main


=== franco_missionSix_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Parla con la nostra amica comune, girino.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Intanto resterò qui a scrivere una lettera di scuse a Tullio e Giulio.
    "Cari miei amori. Prometto di non dimenticare mai mai più i gemelli al nido..."

-> main


=== franco_missionSeven_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Come diceva Gambusia de Filippi: c'è fitoplancton per te.
    Uh, forse non c'entra molto.
    Fammi sapere quando hai letto la lettera che ti aspetta alla stazione dei treni.

-> main


=== franco_missionEight_solicit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {player_name}, continuano ad arrivarmi lettere dai topi della biblioteca. #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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

    Ma sei un portento, girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Pensa che ero qui a dirmi "Servirebbe una persona con una bella testolina, più grande di quella di zia Torba."
    "Una capace di leggere quasi quanto {charNameTwo}."
        {
            - are_two_entities_together(SecondCharacter, PG):
                Quasi però!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Perché io sono il più megagrande lettore della scuola!
        }
    E tu hai già letto tante ma tante delle pagine del libro che ti è stato donato!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    E come dico sempre: la conoscenza è sapere!
    E il sapere è sapore per cui: dimmi come posso aiutarti.
        
        -> frog_about_who_questions

=== franco_missionTwo_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Dove l'ho messo di nuovo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
        E a proposito di cose buone: vediamo come posso aiutarti!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral    

            -> frog_about_who_questions

=== franco_missionThree_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        Mi hanno detto che hai chiesto a {mentorName} di darti qualche consiglio di benessere.
        Come lo so?
        Perché ora li sta dando a tutte le persone che incontra.
            {
                - are_two_entities_together(Mentor, PG):
                    Non a tutte tutte.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    Però poi Franco ho una dritta per quella tensione muscolare!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            }
        Tullio mi ha anche detto: "Franco, sei una brava persona, ma devi farti due domande prima di chiedere certe cose a {player_name}."#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        Gli ho chiesto quali fossero le due domande, e lui mi ha baciato sulla testa.
        E poi mi ha detto "Per fortuna che sei simpatico."
        Ci amiamo così tanto.
        Però ora {mentorName} è più felice.
        E questo posto è un po' più felice.
        E allora io ti rendo un po' più felice: dimmi come posso aiutarti.
        
            -> frog_about_who_questions

=== franco_missionFour_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Questa no.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
    Nemmeno sui bigliettini.#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
        
        -> frog_about_who_questions

=== franco_missionFive_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Avannotti!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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

    Non hai avuto paura di dire una cosa e sembrare stupid{player_pronouns has him:o|{player_pronouns has her:a|ə}}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        {
            - are_two_entities_together(SecondCharacter, PG):
                La nonna dice sempre che non ci sono domande stupide ma solo risposte sbagliate.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        }
    Quindi: non essere come Franco. E se vedi due persone vicine, prova ancora a chiacchierare con loro.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Però una partita tra ananassi io me la guarderei.
    Dopo lo dico a Giulio, magari ne esce qualcosa.
    Come quella volta che abbiamo tirato su una band.
    Ci chiamavamo Depeche pond.
    Ma non è stata una bella idea quella di mettere gli amplificatori in acqua.
    I ricci sono ancora arrabbiati con noi.
    Ma devo aiutarti, mannaggia alla mia distrazione.
    Zio Gracco lo dice sempre: Franco!
    Zio Gracco è un rospo di poche parole.
        
        -> frog_about_who_questions

=== franco_missionSix_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
    <i>La saggezza ha molte facce, e una porta il volto di Franco.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
    E ora quindi è il mio momento di aiutarti.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
        -> frog_about_who_questions

=== franco_missionSeven_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    I gemelli stanno facendo lo sciopero del sonno.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    A fatica mi ricordo il mio nome.
    E tutto perché Giulio non vuole prendergli un cane.
        {
            - are_two_entities_together(SecondCharacter, PG):
                Anche io voglio un caneeeeeeeeeeeeee!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Allora sciopera coi gemelli!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        }
    Comunque è sempre colpa di Dora l'ape.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
                Un po' a piedi, un po' col treno.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        }
    E il mondo ora mi sembra così grande.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    E pieno di possibilità.
    Come quella di avere un cane.
    Ora sto scioperando anche io coi gemelli.
    Ma non sai quanto ho sonno!
    E Dora mi ha detto che hai conosciuto il cane del treno!
    E allora io ti aiuterò con il tuo lavoro.
    Così magari Giulio capisce che sono un bravo girino, e ci prende il cane!
        
        -> frog_about_who_questions

=== franco_missionEight_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    "Caro zio Gracco."#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
    Gli umani dovrebbero imparare a lasciarci in pace.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        {
            - are_two_entities_together(SecondCharacter, PG):
                Anche io?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                {
                    - frog_and_second_char_chit_chat:
                        Ma abbiamo già detto che tu sei una rana, {charNameTwo}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    - else:
                        Mmm.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        Io non sono sicuro che tu sei un umano.
                        Sei troppo basso.    
                }
                Ma quando sei qui mi diverto tanto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Quindi sono in pace.
    }
    E a proposito di pace: vediamo come posso aiutarti!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
        -> frog_about_who_questions

=== special_mission_one_closed
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        //Associo ~ glyph_actualActiveSigil al sigillo di Franco
        ~ glyph_actualActiveSigil = nest_francoChosenSigil
        @animation:RewriterBook

        Girino, ma che carino questo sigillo!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        {player_name} ha trovato {sigils_translator(nest_francoChosenSigil)}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        {sigils_translator(nest_francoChosenSigil)}, suona bene.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        Spero che la nostra amica comune ti dia anche le informazioni utili per capire come funzioni.
        {player_name} troverà le informazioni su {sigils_translator(nest_francoChosenSigil)} direttamente nel Grimorio.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}

            //Aggiorno i testi
            ~ glyph_grimoireTripleSigilsUpdater()
            ~ glyph_grimoireTripleSigilsUpdater()
            ~ glyph_grimoireTripleSigilsUpdater()
            //Poi aggiorno il sigillo principale
            ~ glyph_grimoireMainSigilsUpdater()
            //E svuoto glyph_actualActiveSigil
            ~ glyph_actualActiveSigil = ()
            
        Ora vado da Euforbo e glielo dono subito.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
        ~ frog_pauseSpecialMission = frog_pauseSpecialMissionMax
        ~ nest_francoUsedEarth = false
        //Riattivo poi i tasti se posseduti
        -> nest_reactivateGliphs ->
        
        -> main
            