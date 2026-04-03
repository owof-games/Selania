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

    Ma dove avevo messo quel.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Eccola cra!
    No.
    No no no questo è disgustoso.
    Eppure.
    Ehi!
    Tu devi essere {player_name}!
    Io sono Franco La Rana!
        ~ frog_nameDiscovered = true
    {charNameTwo} mi ha parlato di te.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Ha una bella testolina quel girino!
        {
            - are_two_entities_together(SecondCharacter, PG):
                Anche la tua mi piace, Franco!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        }
    E tu sei sicuramente qui per il dono.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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

    ->->

=== feedback_mission_one_closed ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Ehi girino, grazie ancora per prima.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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

    ->->






