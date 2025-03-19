=== bus_stop ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Qui non compaiono anime e animelle
//Da qui possiamo riprendere una storia in corso, o prenderne una nuova. Se c'è una storia in corso le altre non sono accessibili, e plausibilmente vedremo il fantasma di turno che ci aspetta.
{bus_stop==1: <i>Questa è la stazione del treno.|<i>{~ La stazione profuma di partenze.|La panchina aspetta fremente una nuova conoscenza.|Sulle vette la luce brilla leggera.|Un vento fresco ti sospinge lungo la strada.|Le lettere ondeggiano sulla bacheca.|L'odore della foresta scalda il sentiero.}</i>}
    + [Mi guardo attorno.]
    -
        -> main
        
        
=== starting_note ===
    + {are_two_entities_together(StartingNote, PG)}[StartingNote]
        ???: Grazie per quello che hai fatto, Mentore.
        ???: Le cose qui ora hanno ripreso a funzionare.
        ???: Spero un giorno di incontarti ancora.
            -> main

-> main

=== first_character_notes ===
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    + {are_two_entities_together(FirstCharacterNotes, PG)}[FirstCharacterNotes]
    
        {
            - not one:
                -> one
                
            - not two:
                {  
                    - firstWritingPause < 0:
                        -> two
                    - else:
                        -> one
                }
                
            - not three:
                {  
                    - firstWritingPause < 0:
                        -> three
                    - else:
                        -> two
                }
            
            - else:
                -> three
            
        }
    
    = one
    {charNameOne}: Ciao {name}, come stai?
    {charNameOne}: Alla fine Talco è sempre statə qui.
    {charNameOne}: Non pensavo avrebbe creduto alla mia storia, sai?
    {charNameOne}: E invece ora si è messə in testa di insegnare agli scoiattoli a suonare le noci.
       {
            - firstCharacterPossibleStates has Triangolo:
                {charNameOne}: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameOne}: Voglio creare un piccolo esercito di suonatori in difesa degli alberi.
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameOne}: Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
                {charNameOne}: E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
            - firstCharacterPossibleStates has Ocarina:
                {charNameOne}: Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
            - firstCharacterPossibleStates has Violino:
                {charNameOne}: Sembrerà assurdo, ma mi sono resa conto che forse, con la musica, possiamo parlare con gli animali.
                {charNameOne}: Se così fosse, potrei dimostrare che siamo tutto fuorché distanti.
        }
    {charNameOne}: Spero che lì vada tutto bene.
    {charNameOne}: Alla prossima lettera.
    {charNameOne}: <i>{charNameOne}</i>
            ~ firstWritingPause = firstWritingPauseDuration
        -> main
    
    = two
    {charNameOne}: Ciao {name}, qui è sempre {charNameOne}.
    {charNameOne}: Sono passate settimane dal mio ritorno, e finalmente ho avuto il coraggio di parlare con mio padre.
       {
            - firstCharacterPossibleStates has Triangolo:
                {charNameOne}: Quando gli ho detto che seguirò il suo consiglio e mi cercherò un lavoro vero, è sembrato deluso.
                {charNameOne}: Nei prossimi giorni farò un colloquio nella agenzia dove lavora.
                {charNameOne}: Forse smistare merci è un altro modo di suonare musica.
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameOne}: Le cose non sono andate bene, abbiamo litigato per tutto il tempo.
                {charNameOne}: Sinceramente a volte la mia rabbia mi spaventa, non è qualcosa che pensavo nemmeno di possedere.
                {charNameOne}: Per assurdo però da quando gli ho detto che è la mia vita e ho il diritto di fare i miei errori, ci sentiamo più spesso.
                {charNameOne}: Non so se voglio rivederlo subito, ma forse le cose stanno cambiando per il meglio.
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameOne}: Gli ho parlato di nonno, e gli ho detto che voglio seguire le sue tracce.
                {charNameOne}: Sul momento è rimasto interdetto, ma poi si è messo a piangere.
                {charNameOne}: Mi ha chiesto del tempo per decidere se e cosa potrebbe fare per aiutarmi.
            - firstCharacterPossibleStates has Ocarina:
                {charNameOne}: Ha passato il tempo a dirmi che non prendo nulla sul serio.
                {charNameOne}: Parlargli dell'orchestra di topolini e scoiattoli non ha aiutato.
                {charNameOne}: Forse cambierà idea quando avrò finito di addestrare le falene.
            - firstCharacterPossibleStates has Violino:
                {charNameOne}: Per la prima volta credo di averlo capito.
                {charNameOne}: Non ci siamo trovati, non riesce a comprendere perché per me sia importante fare qualcosa di utile, di trasformativo per tutt3.
                {charNameOne}: Ma ho visto nella sua preoccupazione la paura sincera che possa avere una vita difficile.
                {charNameOne}: Spero un giorno di scrivere una canzone che gli faccia capire che l'unica vita difficile per me è una vita che non pensa al prossimo.
        }
    {charNameOne}: E lì invece? Come stanno le tue piante?
    {charNameOne}: Sono arrivate nuove persone interessanti?
    {charNameOne}: A presto, <i>{charNameOne}</i>.
        ~ firstWritingPause = firstWritingPauseDuration
        -> main
        
    = three
    {charNameOne}: terza lettera
        ~ firstWritingPause = firstWritingPauseDuration
    -> main
    
=== second_character_notes ===
//Mettere cose sul rapporto con nonna, papà. mamma, fratello, animali, futuro.
    + {are_two_entities_together(SecondCharacterNotes, PG)}[SecondCharacterNotes]
    
    {
            - not one:
                -> one
                
            - not two && secondWritingPause < 0:
                -> two
                
            - not three && secondWritingPause < 0:
                -> three
            
        }
    
    = one
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    {charNameTwo}: Lettere random note da parte della personaggia
        ~ secondWritingPause = secondWritingPauseDuration
        -> main
    
    = two
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    {charNameTwo}: seconda lettera
    ~ secondWritingPause = secondWritingPauseDuration
        -> main
    
    = three
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    {charNameTwo}: terza lettera
    ~ secondWritingPause = secondWritingPauseDuration

        -> main
    
=== third_character_notes ===
//Forse le sue lettere saranno scritte da una persona cara, vicina.
    + {are_two_entities_together(ThirdCharacterNotes, PG)}[ThirdCharacterNotes]
    {
            - not one:
                -> one
                
            - not two && thirdWritingPause < 0:
                -> two
                
            - not three && thirdWritingPause < 0:
                -> three
            
        }
        
    = one
    ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
    {charNameThree}: Lettere random note da parte della personaggia
        ~ thirdWritingPause = thirdWritingPauseDuration
        -> main
    
    = two
    ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
    {charNameThree}: seconda lettera
        ~ thirdWritingPause = thirdWritingPauseDuration
        -> main
    
    = three
    ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
    {charNameThree}: terza lettera
        ~ thirdWritingPause = thirdWritingPauseDuration
        -> main
    
=== fourth_character_notes ===
    + {are_two_entities_together(FourthCharacterNotes, PG)}[FourthCharacterNotes]
    Lettere random note da parte della personaggia
    -> main

=== fifth_character_notes ===
    + {are_two_entities_together(FifthCharacterNotes, PG)}[FifthCharacterNotes]
    Lettere random note da parte della personaggia
    -> main
