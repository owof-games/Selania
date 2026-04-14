/*******************************

    Elementi vari di storia

******************************/ 
=== franco_intro
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    ~ player_somethingStrange += strangeFrog
    ~ book_BGVariations ++
    ~ grimoire_franco += grimFrancoFirst

    {charTag(Franco, "{portrait_Franco()}")}:       Ma dove avevo messo quel.
                                                    Eccola cra!
                                                    No.
                                                    No no no questo è disgustoso.
                                                    Eppure.
                                                    Ehi!
                                                    Tu devi essere {player_name}!
                                                    Io sono Franco La Rana!
                                                        ~ frog_nameDiscovered = true
                                                    {charNameTwo} mi ha parlato di te.
                                                    Ha una bella testolina quel girino!
    {
        - are_two_entities_together(SecondCharacter, PG):
                                                    Anche la tua mi piace, Franco!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
    }
    {charTag(Franco, "{portrait_Franco()}")}:       Sei qui sicuramente qui per il dono.
                                                    Come si dice: chi dorme non piglia lombrichi.
                                                    Dovrei averlo qui.
                                                    No.
                                                    Dove l'ho messo?
                                                    L'avranno preso i gemelli?
                                                    Facciamo così: mentre lo cerco ti do qualcosa da fare.
                                                    Ma non una cosa da fare qualsiasi.
                                                    Qualcosa di utile per chi vive questo posto.
                                                    Come dice zia Graaak: una zampa vale l'altra.
                                                    Non che zia Graaak sia particolarmente brava negli affari.
                                                    Ma sempre meglio di mio cugino Braaak, che ha venduto una foglia di loto intera per una biscia.
                                                    Al funerale erano tutti molto molto imbarazzati.
                                                    Tranne la biscia: quella aveva ancora fame.
                                                    Insomma: tu aiuti me, e io aiuto te.
        {
            - are_two_entities_together(FirstCharacter, PG):
                                                    Livello di confusione: sì.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
        }

    -> welcoming_frog.top2

=== franco_feedback_mission_one_closed ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {charTag(Franco, "{portrait_Franco()}")}:       Ehi girino, grazie ancora per prima.
                                                        Euforbo all'inizio era confuso, si è portato il sigillo in camera.
                                                        Poi è venuto in soggiorno a fare le sue cose, e quando i suoi fratelli gli hanno dato noia <>

        {
            - glyph_earthFireSigils has nest_francoChosenSigil:
                                                        all'inizio si è agitato, ma poi ha iniziato a nuotare veloce veloce e a scaricare la tensione.
            - glyph_earthAirSigils has nest_francoChosenSigil:
                                                        ha preso un grande respiro e poi si è messo a cucinare con Tullio, e si è rilassato.
            - glyph_earthWaterSigils has nest_francoChosenSigil:
                                                        li ha ignorati, si è messo le sue cuffie preferite e ha iniziato a disegnare, ed era tutto felice.
            - glyph_earthAetherSigils has nest_francoChosenSigil:
                                                        si è avvicinato a Giulio, e si è messo a leggere con lui.
        }

                                                        Per il resto della serata l'ho visto più sereno.
                                                        Ha anche riso a una mia battuta!
        
    ~ grimoire_franco += grimFrancoMissionOneFeedback
    -> welcoming_frog.top2


=== franco_allDocuments ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(Franco, "{portrait_Franco()}")}:           Girino!
                                                        Hai trovato tutti i documenti della vecchia congrega!
                                                        E tu mi dirai: "Come fai a saperlo, Franco?"
                                                        E io ti dirò: "Perché Franco sa tutto! Tranne nuotare."
                                                        Soprattutto se è Franco a fare le cose.
                                                        Anche se non me le ricordo proprio tutte tutte.
                                                        Tipo come quando apro il frigo e poi non ricordo perché l'ho aperto.
                                                        E poi ci trovo dentro la tessera della palestra a cui non sono mai andato.
                                                        E zia Graaak che si fa un pisolino.
                                                        Una volta ha dormito così tanto che quando si è svegliata aveva altri centoquindici nipotini!
                                                        Mia sorella è molto pratica, e quindi li ha chiamati per numero.
                                                        Uh, una lettera di Euforbo!
                                                        "Papà, devi dire a {player_name} che abbiamo messo in giro noi i documenti!"
                                                        Giusto!
                                                        Ero lì che mi dicevo: "Mmm, quando mi spiegano le cose tutte assieme mi distraggo, e a quel punto non capisco proprio nulla."
                                                        Ma ho pensato fosse importante per te conoscere quella storia.
                                                        E a quel punto mi son detto: "Ok Franco, facciamo un gioco. Ogni volta che {player_name} fa certe cose, metti un nuovo documento sulla panchina."
                                                        E ho fatto anche uno schema molto colorato che spiegava quando dovevo darti i documenti.
                                                        Ma poi me lo sono dimenticato.
                                                        Fino a quando poco fa Euforbo non mi ha detto "Ehi papà, ho trovato una logica per dare quei vecchi appunti a {player_name}".
                                                        E visto che sa che a volte mi distraggo, ha fatto tutto lui il lavoro.
                                                        Devo ringraziarlo.
                                                        Magari gli compro il prossimo "Starview Galley".
                                
    ~ grimoire_franco += grimFrancoAllDocuments
    -> welcoming_frog.top2

