=== mentor ===
+ {are_two_entities_together(Mentor, PG)} [Mentor]
    -> speaking_with_mentor


=== speaking_with_mentor
~ temp charNameOne = uppercaseTranslator(firstCharacterState)
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
~ temp charNameFour= uppercaseTranslator(fourthCharacterState)
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

-> mentor_storylets ->
    {charNameFive}: Come posso esserti utile, {pronouns has him: amico mio|{pronouns has her: amica mia|amicə miə}}?
    - (top)
        //+ [Voglio conoscere meglio il mentore]
        + [Qualcosa non mi è chiaro.]
            -> support
        * (voices){pre_test && not voices}[C'è una voce che mi racconta cose.]
            {charNameFive}: Voce?
            {name}: Sì.
            {name}: Ad esempio mi descrive le piante della serra.
            {name}: O i luoghi in cui entro.
            {charNameFive}: Riscrivere la storie di altre persone richiede una forte empatia.
            {charNameFive}: Sicuramente quella voce è il tuo modo di capire questo luogo.
            {charNameFive}: Un intuito latente che ora è più forte.
            {charNameFive}: Meglio della stanchezza dell'essere mentore, fidati.
                -> top
                
        * (infoImpo){firstCharacterInkLevel has High && not infoImpo} [Cosa significa "la personaggia ti darà una informazione importante"?]
            {charNameFive}: Dove l'hai sentita questa cosa, stellina?
            {name}: Quando stavo per fare le ultime domande a {charNameOne}, {voices: la|una} voce mi ha detto quanto inchiostro avevo e che avrei ricevuto una informazione importante.
            {not voices: {charNameFive}: Per la voce sarà la stanchezza, questo lavoro è faticoso.|{charNameFive}: Come ti dicevo, vedrai che è solo la tua empatia che parla.}
            {charNameFive}: Comunque ogni cosa qui è importante, {name}.
            {charNameFive}: Soprattutto se ti aiuta a raggiungere il tuo obiettivo.
                -> top
        + [Nulla, scusa.]
            -> main
        -
    -> top


=== support
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {charNameFive}: Come posso aiutarti?
    - (top)
        + {gifts_and_ink}[Mi ripeteresti cosa devo fare?]
            -> to_do
        + [Ho una domanda su un luogo.]
            -> tutorial
        + [C'è una cosa che mi riguarda.]
            -> myself
        + [Vorrei parlare d'altro.]
            -> speaking_with_mentor
        -
    -> top   

= myself
    + [Vorrei cambiare il mio nome.]
            -> name_choice -> support
    + [Vorrei cambiare i miei pronomi.]
            -> gender -> support
    + [Vorrei consigli su come stare meglio.]
            -> mindfulness -> support
    + [Vorrei aggiornare la lista dei miei temi delicati.]
            -> trigger_warning   
    + [Sono apposto così, grazie.]
            -> speaking_with_mentor

