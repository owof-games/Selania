=== bus_stop ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Qui non compaiono anime e animelle
//Da qui possiamo riprendere una storia in corso, o prenderne una nuova. Se c'è una storia in corso le altre non sono accessibili, e plausibilmente vedremo il fantasma di turno che ci aspetta.
{bus_stop==1: <i>Questa è la fermata del bus</i>|<i>{~ La fermata è pacifica|La fermata attende il prossimo arrivo|Sulle vette brilla luce leggera|Un vento fresco ti sospinge lungo la strada}</i>}.
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
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    + {are_two_entities_together(FirstCharacterNotes, PG)}[FirstCharacterNotes]
    
        {
            - one == 0:
                -> one
            - else:
                -> two
    
        }
    
    = one
    {charNameUno}: Ciao {name}, come stai?
    {charNameUno}: Alla fine Talco è sempre statə qui.
    {charNameUno}: Non pensavo avrebbe creduto alla mia storia, sai?
    {charNameUno}: E invece ora si è messə in testa di insegnare agli scoiattoli a suonare le noci.
       {
            - firstCharacterPossibleStates has Triangolo:
                {charNameUno}: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameUno}: Voglio creare un piccolo esercito di suonatori in difesa degli alberi.
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameUno}: Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
                {charNameUno}: E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
            - firstCharacterPossibleStates has Ocarina:
                {charNameUno}: Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
            - firstCharacterPossibleStates has Violino:
                {charNameUno}: Sembrerà assurdo, ma mi sono resa conto che forse, con la musica, possiamo parlare con gli animali.
                {charNameUno}: Se così fosse, potrei dimostrare che siamo tutto fuorché distanti.
        }
    {charNameUno}: Spero che lì vada tutto bene.
    {charNameUno}: Alla prossima lettera.
    {charNameUno}: <i>{charNameUno}</i>

        -> main
    
    = two
    {charNameUno}: Ciao {name}, qui è sempre {charNameUno}.
    {charNameUno}: Sono passate settimane dal mio ritorno, e finalmente ho avuto il coraggio di parlare con mio padre.
       {
            - firstCharacterPossibleStates has Triangolo:
                {charNameUno}: Quando gli ho detto che seguirò il suo consiglio e mi cercherò un lavoro vero, è sembrato deluso.
                {charNameUno}: Nei prossimi giorni farò un colloquio nella agenzia dove lavora.
                {charNameUno}: Forse smistare merci è un altro modo di suonare musica.
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameUno}: Le cose non sono andate bene, abbiamo litigato per tutto il tempo.
                {charNameUno}: Sinceramente a volte la mia rabbia mi spaventa, non è qualcosa che pensavo nemmeno di possedere.
                {charNameUno}: Per assurdo però da quando gli ho detto che è la mia vita e ho il diritto di fare i miei errori, ci sentiamo più spesso.
                {charNameUno}: Non so se voglio rivederlo subito, ma forse le cose stanno cambiando per il meglio.
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameUno}: Gli ho parlato di nonno, e gli ho detto che voglio seguire le sue tracce.
                {charNameUno}: Sul momento è rimasto interdetto, ma poi si è messo a piangere.
                {charNameUno}: Mi ha chiesto del tempo per decidere se e cosa potrebbe fare per aiutarmi.
            - firstCharacterPossibleStates has Ocarina:
                {charNameUno}: Ha passato il tempo a dirmi che non prendo nulla sul serio.
                {charNameUno}: Parlargli dell'orchestra di topolini e scoiattoli non ha aiutato.
                {charNameUno}: Forse cambierà idea quando avrò finito di addestrare le falene.
            - firstCharacterPossibleStates has Violino:
                {charNameUno}: Per la prima volta credo di averlo capito.
                {charNameUno}: Non ci siamo trovati, non riesce a comprendere perché per me sia importante fare qualcosa di utile, di trasformativo per tutt3.
                {charNameUno}: Ma ho visto nella sua preoccupazione la paura sincera che possa avere una vita difficile.
                {charNameUno}: Spero un giorno di scrivere una canzone che gli faccia capire che l'unica vita difficile per me è una vita che non pensa al prossimo.
        }
    {charNameUno}: E lì invece? Come stanno le tue piante?
    {charNameUno}: Sono arrivate nuove persone interessanti?
    {charNameUno}: A presto, <i>{charNameUno}</i>.
        -> main
    
=== second_character_notes ===
    + {are_two_entities_together(SecondCharacterNotes, PG)}[SecondCharacterNotes]
    Lettere random note da parte della personaggia
    -> main
    
=== third_character_notes ===
    + {are_two_entities_together(ThirdCharacterNotes, PG)}[ThirdCharacterNotes]
    Lettere random note da parte della personaggia
    -> main
    
=== fourth_character_notes ===
    + {are_two_entities_together(FourthCharacterNotes, PG)}[FourthCharacterNotes]
    Lettere random note da parte della personaggia
    -> main

=== fifth_character_notes ===
    + {are_two_entities_together(FifthCharacterNotes, PG)}[FifthCharacterNotes]
    Lettere random note da parte della personaggia
    -> main

=== sixth_character_notes ===
    + {are_two_entities_together(SixthCharacterNotes, PG)}[SixthCharacterNotes]
    Lettere random note da parte della personaggia
    -> main

=== seventh_character_notes ===
    + {are_two_entities_together(SeventhCharacterNotes, PG)}[SeventhCharacterNotes]
    Lettere random note da parte della personaggia
    -> main