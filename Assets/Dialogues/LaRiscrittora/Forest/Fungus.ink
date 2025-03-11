//Variabili per mettere in pausa la conversazione
    VAR fungusPauseTalking = 0
    VAR fungusCharPauseDurantion = 6
    
=== the_fungus
+ {are_two_entities_together(TheFungus, PG)} [TheFungus]
   ->talking_fungus
    
    
=== talking_fungus
~ temp charNameOne = uppercaseTranslator(firstCharacterState)
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
~ temp charNameFour = uppercaseTranslator(fourthCharacterState)
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

{
    //Check post storie
        - not first_story_ended_check && firstStory == Ended:
            -> first_story_ended_check
        - not second_story_ended_check && secondStory == Ended:
            -> second_story_ended_check
        - not third_story_ended_check && thirdStory == Ended:
            -> third_story_ended_check
        - not fourth_story_ended_check && fourthStory == Ended:
            -> fourth_story_ended_check
        - not fifth_story_ended_check && fifthStory == Ended:
            -> fifth_story_ended_check    
    
    //Storylets
    - fungusPauseTalking == 0 && firstStory == Ended:
        -> fungus_storylets
    
    - else:
        -> descriptions
}

    = first_story_ended_check
        ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
        ~ temp charNameFour = uppercaseTranslator(fourthCharacterState)
        ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
    <i>Le nuove radici ci mettono in contatto con la terra che ci circonda.</i>
    <i><b>Ci.</b></i>
    <i>La cicatrice rimane, ma da essa esplode la vita.</i>
    <i>Torniamo a percepirci, questa è gioia.</i>
    <i>E {name} ci ha portato questa gioia.</i>
    
         + [Posso sfiorarti?]
            ~ playerGreen ++
            <i>Sfioraci.</i>
            <i>{name} sente la voce del Canto delle Compagne.</i>
            <i>{name} realizza che è collegata a {charNameOne}.</i>
            <i>Che tutto riporta a pochi istanti fa, quando ha sfiorato il suo stesso viso, e ha portato un ricordo.</i>
            <i>E quel ricordo, {name}, è ora che ci stai sfiorando.</i>
            
        + [Esci dalla mia testa!]
                ~ playerRed ++
            <i>Non siamo nella tua testa.</i>
            <i>Non più di quanto tu sia nella tua testa.</i>
            <i>Non meno di quanto tu sei in noi.</i>
            <i>È come se ci chiedessi di non essere.</i>
            <i>E questa è una cosa che è ma non sarà.</i>
            
        + [Le piante non dovrebbero parlare.]
            ~ playerBlue ++
            <i>Non siamo una pianta.</i>
            <i>Non una soltanto.</i>
            <i>E non parliamo.</i>
            <i>Ascoltiamo.</i>
            <i>Elaboriamo.</i>
            <i>Trasmettiamo.</i>
            <i>Assieme a te.</i>
            
        + [Ci piace la gioia!]
            ~ playerYellow ++
            <i>E a noi piace {name}.</i>
            <i>E tutte le emozioni che si spostano in questo terreno e nell'aria.</i>
            <i>E tutti i tempi che {name} vive, ha vissuto e vivrà.</i>
        
        + [La tua voce mi guida dal mio arrivo.]
            ~ playerPurple ++
            <i>E la tua guida noi, {name}.</i>
            <i>La separazione è una illusione.</i>
            <i>{name} è noi, noi siamo {charNameOne}.</i>
            <i>{charNameOne} è {charNameFive}.</i>
            <i>E {charNameFive} è {name}.</i>
        -
    
    <i>Le nostre radici cercano di imparare le voci del terreno.</i>
    <i>Il terreno ci racconta che {name} ha appena compiuto qualcosa di importante.</i>
    <i>Osserviamo {name} e ci chiediamo cosa provi dopo aver aiutato {charNameOne}.</i>
    
        + [Mi chiedo se sono all'altezza di tutto questo.]
                ~ playerGreen ++
            <i>All'altezza per {charNameOne}?</i>
            <i>All'altezza per {name}?</i>
            <i>O all'altezza per soddisfare {charNameFive}?</i>
            <i>La serra è tiepida, la biblioteca brilla di vita, e le nubi dicono che {name} è dove deve essere.</i>
            
        + [Sono felice per lei, ma il mondo non dovrebbe fare così paura.]
                ~ playerRed ++
            <i>Non è il mondo a fare paura.</i>
            <i>Il mondo gira e muta e muore e rinasce.</i>
            <i>Sono le regole degli uomini a generare la paura.</i>
            <i>Ma così come l'acqua cancella anche la pietra più dura, {name} e {charNameOne} possono piegare le regole più severe.</i>
            <i>Con l'aiuto di altre goccie.</i>
            
        + [Non ho apprezzato la sua mancanza di senso pratico.]
                ~ playerBlue ++
            <i>{charNameOne} possiede un forte senso pratico.</i>
            <i>Soltanto, è diverso da quello di {name}.</i>
            <i>O di {charNameFive}.</i>
            <i>Il senso pratico del falco va verso l'alto.</i>
            <i>Quello della talpa verso il basso.</i>
            <i>E {charNameOne} segue ora la sua direzione.</i>
            
        + [Pensavo sarebbe stato più divertente.]
                ~ playerYellow ++
            <i>Quando il leone salta su un altro leone, trova la rissa.</i>
            <i>Ma quando un leoncino salta su un altro leoncino, trova ruzzoloni e corse.</i>
            <i>Il gioco non è nell'azione, ma nell'attitudine.</i>
            <i>Quale attitudine è radicata nelle azioni di {name}?</i>
        
        + [Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.]
                ~ playerPurple ++
            <i>La luna immobile sposta oceani.</i>
            <i>Il vento invisibile sradica alberi.</i>
            <i>{charNameOne} respira e il mondo ruota un po' più rapido.</i>
            <i>E {name} decide di osservare le cose nell'interezza.</i>
                
        -
    <i>L'acqua nel terreno ci racconta che {charNameFive} ha molto aiutato {name} in questo viaggio.</i>
    <i>Anche noi vogliamo aiutare {name}, e per questo condividiamo una cosa.</i>
    <i>{name} può seguire la voce di {charNameFive} e scegliere di studiare la persona che ha davanti come un uomo studia la vita attraverso un libro.</i>
    <i>Oppure {name} può decidere di essere sé {pronouns has him: stesso|{pronouns has her: stessa|stessə}}, anche se questo può creare attrito con l'altra persona.</i>
    <i>E scoprire che alcune persone hanno bisogno di venire contraddette.</i>
    <i>A volte l'attrito genera fastidio, o volte genera fuoco.</i>
    <i>A volte brucia il vecchio, permettendo al nuovo di crescere.</i>
    <i>Nessuna persona è uguale, nessuna persona vuole lo stesso trattamento.</i>
    <i>Ma altri funghi solleticano e distraggono le nostre nuove radici.</i>
    <i>Ringraziandoti ancora {name} per ora ti congediamo.</i>
    <i>Ma anche dall'altra parte del mondo sai già che non saremo mai lontani.</i>
            -> main
    
    
    = second_story_ended_check
        ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
        ~ temp charNameFour = uppercaseTranslator(fourthCharacterState)
        ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        
        + [Mi chiedo se sono all'altezza di tutto questo.]
                ~ playerGreen ++
            
        + [Sono felice per lei, ma il mondo non dovrebbe fare così paura.]
                ~ playerRed ++
            
        + [Non ho apprezzato la sua mancanza di senso pratico.]
                ~ playerBlue ++
     
        + [Pensavo sarebbe stato più divertente.]
                ~ playerYellow ++
 
        + [Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.]
                ~ playerPurple ++
        
        -    
            -> main
        
    = third_story_ended_check
        ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
        ~ temp charNameFour = uppercaseTranslator(fourthCharacterState)
        ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        
        + [Mi chiedo se sono all'altezza di tutto questo.]
                ~ playerGreen ++
            
        + [Sono felice per lei, ma il mondo non dovrebbe fare così paura.]
                ~ playerRed ++
            
        + [Non ho apprezzato la sua mancanza di senso pratico.]
                ~ playerBlue ++
     
        + [Pensavo sarebbe stato più divertente.]
                ~ playerYellow ++
 
        + [Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.]
                ~ playerPurple ++
        -        
            -> main  
        
    = fourth_story_ended_check
        ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
        ~ temp charNameFour = uppercaseTranslator(fourthCharacterState)
        ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        
        + [Mi chiedo se sono all'altezza di tutto questo.]
                ~ playerGreen ++
            
        + [Sono felice per lei, ma il mondo non dovrebbe fare così paura.]
                ~ playerRed ++
            
        + [Non ho apprezzato la sua mancanza di senso pratico.]
                ~ playerBlue ++
     
        + [Pensavo sarebbe stato più divertente.]
                ~ playerYellow ++
 
        + [Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.]
                ~ playerPurple ++
        -        
        
            -> main 
    
    = fifth_story_ended_check
        ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
        ~ temp charNameFour = uppercaseTranslator(fourthCharacterState)
        ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        
        + [Mi chiedo se sono all'altezza di tutto questo.]
                ~ playerGreen ++
            
        + [Sono felice per lei, ma il mondo non dovrebbe fare così paura.]
                ~ playerRed ++
            
        + [Non ho apprezzato la sua mancanza di senso pratico.]
                ~ playerBlue ++
     
        + [Pensavo sarebbe stato più divertente.]
                ~ playerYellow ++
 
        + [Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.]
                ~ playerPurple ++
        -        
            -> main
        
=== fungus_storylets
    {   
        //Qui tracciamo le condizioni per determinati storylets. Me lo immagino silenzioso comunque fino a quando non esplode la situa col terzo personaggio.
        - firstTier == true:
            -> one
        
        - else:
            -> descriptions
    }
    
    = one
     <i>{~ I rami tozzi sono spine verso il cielo.|Non si vedono radici.|Il tronco si torce inquieto.|L'erba osserva lontana dalla base della pianta.}</i>
    -> main
    
    = two
    
    -> main

    = three
    
    -> main

    = four
    
    -> main

=== descriptions
    {   
        //Opinioni dopo la fine della terza storia
        - fourthTier == true:
            -> four
        //Opinioni dopo la fine della seconda storia    
        - thirdTier == true:
            -> three
        //Opinioni dopo la fine della prima storia      
        - secondTier == true:
            -> two
        //Opinioni presenti da inizio gioco    
          - firstTier == true:
            -> one
    }
    
    = one
     <i>{~ I rami sono spine verso il cielo.|Non si vedono radici.|Il tronco si torce inquieto.|L'erba osserva lontana dalla base della pianta.}</i>
        -> main
    
    = two
    <i>{~ Le radici hanno trovato vecchi tesori.|I bruchi solleticano le giovani radici.|Porcellini di terra si riparano tra le nostre radici.}</i>
    -> main

    = three
    
    -> main

    = four
    
    -> main
