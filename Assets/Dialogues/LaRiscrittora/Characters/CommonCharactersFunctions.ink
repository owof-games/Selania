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
            - storiaCinque == Conclusa or storiaSei == Conclusa or storiaSette == Conclusa:
                    ~ fourthTier = true
                    
            - (storiaDue == Conclusa && storiaTre == Conclusa) or (storiaQuattro == Conclusa && storiaDue == Conclusa) or (storiaQuattro == Conclusa && storiaTre == Conclusa):
                     ~ thirdTier = true
                     
            - storiaUno == Conclusa:
                     ~ secondTier = true
                     
            - storiaUno == InCorso or storiaUno == NonIniziata:
                ~ move_entity(Mentor, BusStop)
                     ~ firstTier = true
    }
    {
        - storiaUno == InCorso && dialogo_personaggia_uno:
            ~ randomizable_characters += PersonaggiaUno
        - storiaDue == InCorso && dialogo_personaggia_due:
            ~ randomizable_characters += PersonaggiaDue
            //Aggiungere poi gli altri
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