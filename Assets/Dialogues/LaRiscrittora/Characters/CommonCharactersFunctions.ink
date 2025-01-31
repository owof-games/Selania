=== randomizer_png_location
//Ho una lista di luoghi che svuoto e poi resetto, così che sia percepibile come effettivamente randomica
//Quando poi avrò le storie un attimo settate, andranno risistemate le condizioni del cambio tier
VAR firstTier = false
VAR secondTier = false
VAR thirdTier = false
VAR fourthTier = false
VAR randomizable_characters = (Mentor)
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
    {
        - firstStory == Active && talk_with_first_character:
            ~ randomizable_characters += FirstCharacter
        - secondStory == Active && dialogo_personaggia_due:
            ~ randomizable_characters += SecondCharacter
            //Aggiungere poi gli altri. La logica è: iniziano a spostarsi dopo che ci abbiamo parlato.
    }
    
    
    {   
            - fourthTier == true:
                ~ randomizable_characters += Mentor
                -> randomizer_fourth_tier
            - thirdTier == true:
                ~ randomizable_characters += Mentor
                -> randomizer_third_tier
            - secondTier == true:
                ~ randomizable_characters += Mentor
                -> randomizer_second_tier
            - firstTier == true:
                ~ randomizable_characters += Mentor
                -> randomizer_first_tier
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