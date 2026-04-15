//Storylets sul secondo personaggio
    === that_little_liar_storylet
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        {
        
            - mentor_riccioMentoreViciniColpo == true:
                {charTag(Mentor, "sad")}:                   {not tutorial_mentorTalkingChoiceRelationship: Ti prego|{player_name}}, almeno tu sii ragionevole. Non ho fatto male a nessuno.
                {charTag(SecondCharacter, "angry")}:        Bugiarda!
                                                            Sei vecchia e cattiva e bugiarda!
                        ~ change_entity_place(SecondCharacter)
            
            - else:
                {charTag(Mentor, "neutral")}:                  {not tutorial_mentorTalkingChoiceRelationship: Perdonami,|{player_name}}, hai rispedito quel bambino a casa?
                    {
                        - are_two_entities_together(SecondCharacter, PG):
                        {charTag(Mentor, "bored")}:             A quanto vedo no.
                        {charTag(SecondCharacter, "angry")}:    Vecchia strega!
                                                                Sei vecchia e cattiva e mi hai fatto male!
                            ~ change_entity_place(SecondCharacter)
                            
                        {charTag(Mentor, "sad")}:               {charNameTwo}!
                                                                Torna qui!
                                                                Cavolo.
                    }
        
        }
    
        {charTag(Mentor, "sorry")}:                             Questo posto non è adatto a chi è così giovane.
                                                                Non ce l'ho con lui, ma i pericoli qui sono tanti: i binari, lo stagno, la serra pericolante, e le bestie della foresta.
        {charTag(Mentor, "sad")}:                               E potrei continuare per ore.
        {charTag(Mentor, "neutral")}:                           E non è nemmeno è un bambino facilissimo.
                                                                Ho perso il conto delle bugie che mi ha detto da quando è arrivato.
            {
                - are_two_entities_together(Franco, PG):
                {charTag(Franco, "{portrait_Franco()}")}:       Sono bugie solo se hanno le gambe corte.
                                                                Ma {charNameTwo} ha quattro zampette.
                                                                Quindi al massimo sono...
                                                                Cosa sono?
                {
                    - are_two_entities_together(FirstCharacter, PG):
                        {charTag(FirstCharacter, "curious")}:   Se due gambe fanno una bugia, il doppio fa una duogia?
                    {charTag(Franco, "{portrait_Franco()}")}:   Esatto!
                                                                Sono sicuro che è il termine scientifico!
                                                                Quindi {charNameTwo} non può dire bugie, ma solo duogie!
                        {charTag(Mentor, "bored")}:             Basta!
                        {charTag(Mentor, "neutral")}:           Quel bambino è inaffidabile!

                    - else:
                        {charTag(Mentor, "bored")}:             Franco!
                        {charTag(Mentor, "neutral")}:           Quel bambino dice solo sciocchezze e bugie da quando è qui!    
                }
            }
        {charTag(Mentor, "sad")}:                                E mi ha tirato un calcio!
            
        
            {
                -not_talk:
                    {charTag(PG, "neutral")}:                   Gli hai fatto male? Perché lui ne è convinto.
                    {charTag(Mentor, "neutral")}:               L'ho afferrato perché faceva i salti nello stagno.
                    {charTag(Mentor, "sad")}:                   Ma non so cosa c'è in quell'acqua lurida.
                    {charTag(Mentor, "sorry")}:                 Forse l'ho stretto più di quanto volessi.
                    {charTag(Mentor, "neutral")}:               Ma non l'ho fatto apposta.
                
                - else:
                    {charTag(Mentor, "sorry")}:                 Stavo solo cercando di fermarlo.
                                                                Continuava a saltare nello stagno, e non ho idea di cosa possa esserci in quell'acqua lurida e limacciosa.
                    {
                        - are_two_entities_together(Franco, PG):
                            {charTag(Franco, "{portrait_Franco()}")}:       I miei figli.
                    }
            } 

        {charTag(Mentor, "sad")}:                               Mi spiace se si è spaventato.
        {charTag(Mentor, "neutral")}:                               E mi fa tenerezza, sai?
        {charTag(Mentor, "hurry")}:                             Mi sembra un riccio.
                                                                Così carino, tenero.
        {charTag(Mentor, "neutral")}:                               Quando è assorto nei suoi discorsi sugli animali o è incuriosito da qualcosa è adorabile.
        {charTag(Mentor, "sad")}:                               Ma poi provi ad avvicinarti, a conoscerlo meglio, e ti fa male.
        {charTag(Mentor, "sorry")}:                             Mi spiace di avere perso la pazienza con lui.
                                                                E so che non è un'emozione nobile per una mentore, ma sono rimasta ferita da quel calcio.
                                                                E anche per questo ti chiedo di occupartene tu, così che i miei sentimenti non complichino la situazione.
        {charTag(Mentor, "neutral")}:                               Trova un modo per allontanarlo.
                                                                Velocemente, se riesci.
            {
                - are_two_entities_together(FirstCharacter, PG):
                    {charTag(FirstCharacter, "annoyed")}:       Se allontanate {charNameTwo} io qui muoio di noia!
            }

            -> mentor_closing_storylet ->
            -> main
    
    === addressing_violence
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        {
            - mentor_riccioMentoreViciniColpo:
                {charTag(PG, "neutral")}:                       Dopo la discussione di prima ho riparlato con {charNameTwo}, e dice che gli hai dato uno strattone {mentorName}.
                                                                Che ti sei comportata da prepotente.
            
            - else:
                {charTag(PG, "neutral")}:                       Ho parlato con {charNameTwo}, e dice che gli hai dato uno strattone, {mentorName}.
                                                                Che ti sei comportata da prepotente.
        }
            
        {
            - are_two_entities_together(PG, SecondCharacter):
                {charTag(SecondCharacter, "melanchonic")}:      E a {charNameTwo} non va di venir picchiato di nuovo, per cui se ne va.
                        ~ change_entity_place(SecondCharacter)
        }

    {charTag(Mentor, "bored")}:                                 Non sono stata prepotente!
    {charTag(Mentor, "sorry")}:                                 Volevo solo che non si facesse del male!
    {charTag(Mentor, "neutral")}:                               Quel bambino stava saltando senza pensare a quello che stava facendo.
    {charTag(Mentor, "bored")}:                                 E il mio lavoro è proteggervi!
                                                                Se si fosse!
    {charTag(Mentor, "sad")}:                                   Se.  
                                                                Io.
    {charTag(Mentor, "sorry")}:                                 A me.
                                                                Mi spiace.
                                                                Non dovevo.
        {
            - are_two_entities_together(PG, FirstCharacter):
                {charTag(FirstCharacter, "annoyed")}:           E fino a qui c'eravamo tutt3.
        }
    {charTag(Mentor, "neutral")}:                               Non mi piace arrabbiarmi, {player_name}.
    {charTag(Mentor, "sad")}:                                   E quando accade non so cosa fare.
                                                                E forse la cosa peggiore è che.
    {charTag(Mentor, "neutral")}:                               No.
                                                                Non me la sento.
        
        +\ {charTag(PG, "neutral")}:                             Che razionalmente sai che è sbagliato?
                -> glyph_modifier_variation_management(Mentor, airC)->

            {charTag(Mentor, "neutral")}:                       Mi sento potente.
                                                                Forte.
                                                                Ascoltata.
            {charTag(Mentor, "sorry")}:                         Lo so che è terribile {player_name}, ma se alzo le mani, una parte di me per una volta si sente qualcuno.
            {charTag(Mentor, "sad")}:                           Non so come guardare questa cosa, come affrontarla.
            {
                - are_two_entities_together(PG, FirstCharacter):
                    {charTag(FirstCharacter, "affectionate")}:  Vedere il problema è il passo più grande, {mentorName}.
                                                                L'importante è che non sia l'unico.
            }

        +\ {charTag(PG, "neutral")}:                             Che è bello perdere il controllo, ribellarsi.
                -> glyph_modifier_variation_management(Mentor, fireC)->

            {charTag(Mentor, "sorry")}:                         Peggio.
            {charTag(Mentor, "neutral")}:                       Il controllo non si perde, {player_name}.
                                                                Si decide sempre se fare o meno il salto da "non alzare le mani" a "dai uno schiaffo"
            {charTag(Mentor, "sad")}:                           E io quel salto l'ho fatto volontariamente.
            {charTag(Mentor, "neutral")}:                       Sento il bisogno di.
                                                                Non so.
            {charTag(Mentor, "sorry")}:                         Di farmi rispettare.
                {
                    - are_two_entities_together(PG, FirstCharacter):
                        {charTag(FirstCharacter, "neutral")}:   Questa roba vuoi non è rispetto ma paura.
                                                                Non la meglio cosa, non trovi?
                }
            
        +\ {charTag(PG, "neutral")}:                             Arrabbiarsi è umano, il problema è la violenza.
                -> glyph_modifier_variation_management(Mentor, waterC)->

            {charTag(Mentor, "bored")}:                         Arrabbiarsi è da deboli.
            {charTag(Mentor, "neutral")}:                       Lo fai quando non comprendi le tue emozioni.
                                                                E quando non provi empatia per le altre persone.
                                                                No.
            {charTag(Mentor, "sorry")}:                         Arrabbiarsi magari è umano, ma non è degno del mio ruolo.
                {
                    - are_two_entities_together(PG, FirstCharacter):
                        {charTag(FirstCharacter, "neutral")}:   E questo è il momento in cui qualcunə dovrebbe dirti di andare in terapia.
                                                                Mi prenderò questo compito.
                        {charTag(FirstCharacter, "affectionate")}: {mentorName}: cercati unə terapeuta, per favore.
                }
            
        +\ {charTag(PG, "neutral")}:                             Sei stata crudele, e hai rovinato la festa per {charNameTwo}.
                -> glyph_modifier_variation_management(Mentor, earthC)->

            {charTag(Mentor, "bored")}:                         Essere {player_pronouns has him:riscrittore|{player_pronouns has her:riscrittora|riscrittorə}} chiede empatia, {player_name}.
            {charTag(Mentor, "sad")}:                           Ma sì.
                                                                Sono stata crudele, punto.
            
        +\ {charTag(PG, "neutral")}:                             <i>Resto in silenzio.</i>
                -> glyph_modifier_variation_management(Mentor, aetherC)->

            {charTag(Mentor, "sad")}:                           La cosa peggiore è che non mi piace arrabbiarmi, ma mi fa sentire potente.
            {charTag(Mentor, "neutral")}:                       Visibile.
            {charTag(Mentor, "hurry")}:                         Per pochi secondi mi sembra di potermi far rispettare.
            {charTag(Mentor, "bored")}:                         A volte <b>voglio</b> arrabbiarmi.
            {charTag(Mentor, "sorry")}:                         Perché è l'unico modo per farmi ascoltare.
                {
                    - are_two_entities_together(PG, FirstCharacter):
                        {charTag(FirstCharacter, "sad")}:       Totale esperienza femminile, ama.
                        {charTag(FirstCharacter, "neutral")}:   Ma non toglie il problema di ciò che hai fatto.
                }
        -
    {charTag(Mentor, "neutral")}:                               Comunque c'è una sola cosa sensata da fare.
        {
            - are_two_entities_together(Franco, PG):
                {charTag(Franco, "{portrait_Franco()}")}:       Insegnarmi a nuotare?
        }
    {charTag(Mentor, "neutral")}:                               Chiedere scusa a {charNameTwo}.
                                                                E vedere se avrà voglia di perdonarmi.
                                                                Grazie per l'ascolto, {player_name}.
    {charTag(Mentor, "hurry")}:                                 Sono sicura che diventerai {player_pronouns has him:un ottimo riscrittore|{player_pronouns has her:un'ottima riscrittora| unə ottimə riscrittorə}}.

        
        -> mentor_closing_storylet ->
        -> main
    
=== a_story_of_transformation

    {charTag(Mentor, "neutral")}:                               Sono un po' pensierosa {player_name}.
                                                                Prima mi sono concessa una pausa in biblioteca.
    {charTag(Mentor, "sorry")}:                                 Una pausa piccolissima.
    {charTag(Mentor, "neutral")}:                               E ho letto questo racconto, si chiama <b>Il cancello</b>.
                                                                E la protagonista...
                                                                Non so se ti capita mai di leggere una storia che non è la tua, eppure ti accende ricordi, ti accende modi diversi di guardare i tuoi ricordi.
    {charTag(Mentor, "sad")}:                                   Leggo poco perché a volte le storie mi entrano nella testa e non riesco a star bene fino a quando non sono concluse.
    {charTag(Mentor, "neutral")}:                               E Liliana.
                                                                Non so.
                                                                Liliana mi ricorda la persona che sono stata.
    {charTag(Mentor, "sad")}:                                   La persona che poteva anche arrabbiarsi.
                                                                E la sua stanchezza.
    {charTag(Mentor, "sorry")}:                                 Ti senti mai così {player_pronouns has him:stanco|{player_pronouns has her:stanca|stancə}} che vorresti sparire per un po' dal mondo, e basta?

        +\ {charTag(PG, "neutral")}:                             Non si può sparire, per cui è un pensiero abbastanza inutile.
                -> glyph_modifier_variation_management(Mentor, airC)->

            {charTag(Mentor, "bored")}:                         Un pensiero non è inutile.
            {charTag(Mentor, "neutral")}:                       Un pensiero è solo un pensiero.
                                                                E a volte ti fa stare bene anche quando non può essere vero.
                {
                    - are_two_entities_together(FirstCharacter, PG):
                        {charTag(FirstCharacter, "curious")}:   Potrei scrivere una canzone su questa cosa.
                }
    
        +\ {charTag(PG, "neutral")}:                            Ma Liliana è stanca dell'ingiustizia, non del mondo. E ha reagito.
                -> glyph_modifier_variation_management(Mentor, fireC)->

            {charTag(Mentor, "neutral")}:                       Ma una magari a volte ha voglia di non reagire e basta.
            {charTag(Mentor, "hurry")}:                         E di agire.
                                                                No?
            {charTag(Mentor, "neutral")}:                       Di fare quello che vuole.
            {charTag(Mentor, "bored")}:                         E non solo rispondere a quello che ha attorno.
     
        +\ {charTag(PG, "neutral")}:                            Vorresti sparire dal mondo, o da te?
                -> glyph_modifier_variation_management(Mentor, aetherC)->

            {charTag(Mentor, "sorry")}:                         Cambierebbe poi così tanto?
            {charTag(Mentor, "sad")}:                           No, è una cosa stupida da dire.
            {charTag(Mentor, "neutral")}:                       Ed è stato stupido dire di voler sparire.
                                                                Lascia perdere.
    
        +\ {charTag(PG, "neutral")}:                            No, però mi capita di fare dei grandiosi pisolini.
                -> glyph_modifier_variation_management(Mentor, earthC)->

            {charTag(Mentor, "neutral")}:                       Pensavo a qualcosa di più impegnativo.
                                                                Qualcosa che non si risolve dormendo.
            {charTag(Mentor, "sad")}:                           Ma comunque tempo per dormire non l'ho mai.
            {
                - are_two_entities_together(SecondCharacter, PG): 
                    {charTag(SecondCharacter, "angry")}:        Lo dico sempre: i pisolini sono no-io-si!
                    
            } 
            
        +\ {charTag(PG, "neutral")}:                            A volte vorrei solo diventare invisibile.
                -> glyph_modifier_variation_management(Mentor, waterC)->

            {charTag(Mentor, "neutral")}:                       Esatto, {player_name}.
            {charTag(Mentor, "sad")}:                           So che è una scelta egoista.
                                                                Perché abbiamo una responsabilità verso il mondo.
                                                                Ma questo mondo a volte sa essere davvero <b>troppo</b>.
        -    
    {charTag(Mentor, "hurry")}:                                 Comunque alla fine Liliana con la sua rabbia trova un modo per cambiare.
                                                                E quando riesce a vedere la sua casa come uno spazio brillante, mi ha fatto pensare: questa è l'essenza stessa della riscrittura.

        -> mentor_closing_storylet ->
        -> main   


=== dog_mentor
    {
        - contentsTrainStop has PG:
            {
                - contentsTrainStop has DoggoNoLetters:
                    {charTag(Mentor, "hurry")}:                 Ma quanto sei carina cagnolina!
                                                                Ma quanto!
                                                                Andiamo a fare due passi?
                                                                Giochiamo con il bastoncino?
                    {charTag(Doggo, "neutral")}:                Woof!
                
                - else:
                    {charTag(Mentor, "hurry")}:                 Ehi {player_name}!
                                                                Hai visto quella cagnolina prima?
                    {charTag(Mentor, "neutral")}:               Era lì sotto il tabellone.
                    {charTag(Mentor, "hurry")}:                 Con un musino adorabile.
                    {charTag(Mentor, "sorry")}:                 Ho provato a giocarci, ma si è allontanata.
            }
        - else:
            {charTag(Mentor, "hurry")}:                         Ehi {player_name}!
                                                                Hai visto quella cagnolina prima?
            {charTag(Mentor, "neutral")}:                       Era lì sotto il tabellone della stazione.
            {charTag(Mentor, "hurry")}:                         Con un musino adorabile.
            {charTag(Mentor, "sorry")}:                         Ho provato a giocarci, ma si è allontanata.
    }

    -> mentor_closing_storylet ->
    -> main


=== about_olobino
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {charTag(Mentor, "bored")}:                             Ma che diavolo è successo alla serra!
        {charTag(Mentor, "sorry")}:                             Scusa.
        {charTag(Mentor, "neutral")}:                           Ma mi è preso un colpo quando ho visto quella.
        {charTag(Mentor, "bored")}:                             Cos'è quella roba che cresce sui vetri?
                                                                Ci sono troppi cambiamenti.
        {charTag(Mentor, "sad")}:                               Troppi cambiamenti!
        {charTag(Mentor, "neutral")}:                           Devo fare qualcosa.
            ~ change_entity_place(Mentor)

                {
                    - are_two_entities_together(FirstCharacter, PG):
                        {charTag(FirstCharacter, "sad")}:        Quella donna ha bisogno di una vacanza.
                }

                {
                    - are_two_entities_together(Franco, PG):
                    {charTag(Franco, "{portrait_Franco()}")}:   Urlare non è già fare qualcosa?
                                                                Zia Graaak lo dice sempre, che non è vero che non fa nulla, perché ci sgrida tutto il giorno.
                }
    
    -> mentor_closing_storylet ->
    -> main

=== again_about_olobino
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {charTag(Mentor, "neutral")}:                           Curioso, {player_name}.
                                                                Prima ho dato un'occhiata alla serra, e quel fungo gigante.
                                                                Insomma.
        {charTag(Mentor, "hurry")}:                             L'ha resa più stabile.
        {charTag(Mentor, "neutral")}:                           Ma non mi piace molto.
                                                                Lo terrò sotto controllo.
        {charTag(Mentor, "sorry")}:                             Anche per evitare che qualcunə se lo mangi e stia male.
            {
                - are_two_entities_together(FirstCharacter, PG):
                    {charTag(FirstCharacter, "curious")}:       Credo mi offrirò come cavia per capire, ehm, i suoi pericoli.
                    {
                        - are_two_entities_together(SecondCharacter, PG):
                            {charTag(SecondCharacter, "energy")}:   Anche io anche io anche io!
                                                                    Mi piace provare le cose!
                            {charTag(Mentor, "bored")}:             Non credo sia il caso, per nessuno dei due!
                    } 
            }
            {
                - are_two_entities_together(Franco, PG):
                    {charTag(Franco, "{portrait_Franco()}")}:       La mia famiglia lo mangia da anni e va tutto bene.
                                                                    A parte quella volta che mamma Craazia ha iniziato a cantare in melanzanese.
            }

    
    -> mentor_closing_storylet ->
    -> main

=== mentor_rage
Mentore sbrocca

    -> mentor_closing_storylet ->
    -> main
        
    
 
//Fine della demo
    === ending_demo
    ~ temp mentorName = translator(mentor_ActualName)

        {charTag(Mentor, "neutral")}:                       Sembra che la demo sia finita qui, {player_name}.
                                                            Potrai girare ancora per gli spazi aperti.
                                                            Continuare a leggere le storie della <b><i>biblioteca</b></i>.
                                                            Coltivare cosa rimane da coltivare nella <b><i>serra</b></i>.
                                                            Creare nuovi sigilli.
                                                            Ma non compariranno nuove persone bisognose.
                                                            Se te la senti, dopo aver chiuso l'esperienza potrai rispondere a qualche domanda su <i>Selanìa</i>.
                                                            E aggiungere in wishlist su Steam il gioco.
                                                            Un gesto semplice che aiuta i giochi indie a essere più visibili.
                                                            Grazie di cuore, e buona vita.
                                                            A presto!
    -> main