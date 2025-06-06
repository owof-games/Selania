/* ---------------------------------

   Funzioni legate a comparsa e spostamenti personagge 

 ----------------------------------*/
//REMIND: metà storia personaggia -> compare nuova personaggia. Fine storia personaggia -> si attiva un nuovo luogo.

//Gestione spostamenti: tempo
    VAR changeLocationTimer = 0
    VAR changeLocationTrigger = 3

//Settaggio luoghi attivi a seconda del tier
    VAR firstTierPlaces =(Forest, BusStop, GreenhouseMiddlePath)
    VAR secondTierPlaces =(Forest, BusStop, Library, GreenhouseMiddlePath)
    VAR thirdTierPlaces = (Forest, BusStop, Library, Nest, GreenhouseMiddlePath)
    VAR fourthTierPlaces = (Forest, BusStop, Library, Nest, Laboratory, GreenhouseMiddlePath)

//Gestione spostamenti: luoghi. I luoghi si aprono alla fine di ogni storia.
    //First tier: tier iniziale.
    VAR firstTier = false
    //Second tier. Con la fine della prima storia.
    VAR secondTier = false
    //Third Tier. Con la fine della seconda storia.
    VAR thirdTier = false
    //Fourth Tier. Con la fine della terza storia.
    VAR fourthTier = false

//Gestione spostamenti: personagge
    VAR randomizable_characters = (Mentor)
    
=== randomizer_png_location
//Ho una lista di luoghi che svuoto e poi resetto, così che sia percepibile come effettivamente randomica
// -> commentate cose per la demo

    //Check stato tier
    {   
            // - thirdStory == Ended:
                    //~ fourthTier = true
                    
            // - secondStory == Ended:
                     //~ thirdTier = true
                     
            - firstStory == Ended:
                     ~ secondTier = true
                     //Abilito l'accesso alla library
                     ~ move_entity(FromForestToLibraryDesat, Safekeeping)
                     ~ move_entity(FromForestToLibrary, Forest)
                     
            - firstStory == Active or firstStory == NotStarted:
                ~ move_entity(Mentor, BusStop)
                     ~ firstTier = true
    }
    
    //Aggiunta delle personagge randomizzabili quando la loro storia è attiva. Non serve la mentore perché va per la sua
    {
        - firstStory == Active && talk_with_first_character:
            ~ randomizable_characters += FirstCharacter
        
        - secondStory == Active && talk_with_second_character:
            ~ randomizable_characters += SecondCharacter
        
        // - thirdStory == Active && talk_with_third_character:
            // ~ randomizable_characters += ThirdCharacter
        
        // - fourthStory == Active && dialogo_personaggia_quattro:
            // ~ randomizable_characters += FourthCharacter    
            
    }
    
    {//se ho raggiunto il tempo trigger, resetto il valore, metto la mentore tra le randomizzabili, e poi vado avanti.
        - changeLocationTimer == changeLocationTrigger:
            ~ changeLocationTimer = 0
            ~ randomizable_characters += Mentor
            {debug: <i> Il valore del Timer è {changeLocationTimer} e quindi randomizzo il luogo.}
            {   
                
                //- fourthTier == true:
                    //-> randomizer_fourth_tier
                //- thirdTier == true:
                    //-> randomizer_third_tier
                - secondTier == true:
                    -> randomizer_second_tier
                - firstTier == true:
                    -> randomizer_first_tier
            }
        //altrimenti, aumento il valore e skippo
        - else:
        {debug: <i>il valore del Timer è {changeLocationTimer} e quindi lo aumento.}
            ~ changeLocationTimer ++
            ->->

    }

=== randomizer_first_tier
    = top
        ~ temp character = LIST_RANDOM(randomizable_characters)
        ~ temp location = LIST_RANDOM(firstTierPlaces)
        ~ move_entity(character, location)
        ~ randomizable_characters -= character
    
        {debug: <i> {character} si trova in {location}.}
        
        {
            - randomizable_characters != ():
                -> top
            - else:
                ->->
        }
        
    {debug:<i> {character} è stato spostato in {location}.}

=== randomizer_second_tier
    = top
        ~ temp character = LIST_RANDOM(randomizable_characters)
        ~ temp location = LIST_RANDOM(secondTierPlaces)
        ~ move_entity(character, location)
        ~ randomizable_characters -= character    
        
        {debug: <i>{character} si trova in {location}.}       
        
        {
            - randomizable_characters != ():
                -> top
            - else:
                ->->
        }

    {debug: <i>{character} è stato spostato in {location}.}
    ->->

=== randomizer_third_tier
    = top
        ~ temp character = LIST_RANDOM(randomizable_characters)
        ~ temp location = LIST_RANDOM(thirdTierPlaces)
        ~ move_entity(character, location)
        ~ randomizable_characters -= character
        
        {debug: <i>{character} si trova in {location}.}
        
        {
            - randomizable_characters != ():
                -> top
            - else:
                ->->
        }
        
        {debug: <i>{character} è stato spostato in {location}.}
    

        ->->
    
=== randomizer_fourth_tier
        = top
        ~ temp character = LIST_RANDOM(randomizable_characters)
        ~ temp location = LIST_RANDOM(firstTierPlaces)
        ~ move_entity(character, location)
        ~ randomizable_characters -= character
        
        {debug: <i> {character} si trova in {location}.}
        
        {
            - randomizable_characters != ():
                -> top
            - else:
                ->->
        }
        
        {debug:<i> {character} è stato spostato in {location}.}

        ->->