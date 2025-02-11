//Gestione spostamenti: tempo
VAR changeLocationTimer = 0
VAR changeLocationTrigger = 5

//Gestione spostamenti: luoghi
VAR firstTier = false
VAR secondTier = false
VAR thirdTier = false
VAR fourthTier = false

//Gestione spostamenti: personagge
VAR randomizable_characters = (Mentor)
    
=== randomizer_png_location
//Ho una lista di luoghi che svuoto e poi resetto, così che sia percepibile come effettivamente randomica
//Quando poi avrò le storie un attimo settate, andranno risistemate le condizioni del cambio tier

    //Check stato tier
    {   
            - fifthStory == Ended or sixthStory == Ended or seventhStory == Ended:
                    ~ fourthTier = true
                    
            - (secondStory == Ended && thirdStory == Ended) or (fourthStory == Ended && secondStory == Ended) or (fourthStory == Ended && thirdStory == Ended):
                     ~ thirdTier = true
                     
            - firstStory == Ended:
                     ~ secondTier = true
                     
            - firstStory == Active or firstStory == NotStarted:
                ~ move_entity(Mentor, BusStop)
                     ~ firstTier = true
    }
    
    //Aggiunta delle personagge randomizzabili quando la loro storia è attiva. Non serve la mentore perché va per la sua
    {
        - firstStory == Active && talk_with_first_character:
            ~ randomizable_characters += FirstCharacter
        
        - secondStory == Active && dialogo_personaggia_due:
            ~ randomizable_characters += SecondCharacter
        
        - thirdStory == Active && dialogo_personaggia_tre:
            ~ randomizable_characters += ThirdCharacter
        
        - fourthStory == Active && dialogo_personaggia_quattro:
            ~ randomizable_characters += FourthCharacter    
            
    }
    
    {   //se ho raggiunto il tempo trigger, resetto il valore, metto la mentore tra le randomizzabili, e poi vado avanti.
        - changeLocationTimer == changeLocationTrigger:
            ~ changeLocationTimer = 0
            ~ randomizable_characters += Mentor
            {debug: <i> Il valore del Timer è {changeLocationTimer} e quindi randomizzo il luogo.}
            {   
                
                - fourthTier == true:
                    -> randomizer_fourth_tier
                - thirdTier == true:
                    -> randomizer_third_tier
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