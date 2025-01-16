=== randomizer_png_location
//Ho una lista di luoghi che svuoto e poi resetto, così che sia percepibile come effettivamente randomica
//Quando poi avrò le storie un attimo settate, andranno risistemate le condizioni del cambio tier
VAR firstTier = false
VAR secondTier = false
VAR thirdTier = false
VAR fourthTier = false
VAR randomizable_characters = (Mentore)
    //Check stato tier
    {   
            - storiaCinque == Conclusa or storiaSei == Conclusa or storiaSette == Conclusa:
                    ~ fourthTier = true
                    
            - (storiaDue == Conclusa && storiaTre == Conclusa) or (storiaQuattro == Conclusa && storiaDue == Conclusa) or (storiaQuattro == Conclusa && storiaTre == Conclusa):
                     ~ thirdTier = true
                     
            - storiaUno == Conclusa:
                     ~ secondTier = true
                     
            - storiaUno == InCorso or storiaUno == NonIniziata:
                ~ move_entity(Mentore, BusStop)
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
                ~ randomizable_characters += Mentore
                -> randomizer_fourth_tier
            - thirdTier == true:
                ~ randomizable_characters += Mentore
                -> randomizer_third_tier
            - secondTier == true:
                ~ randomizable_characters += Mentore
                -> randomizer_second_tier
            - firstTier == true:
                ~ randomizable_characters += Mentore
                -> randomizer_first_tier
    }    



=== randomizer_first_tier
    = top
        ~ temp character = LIST_RANDOM(randomizable_characters)
        ~ temp location = LIST_RANDOM(firstTierPlaces)
        ~ move_entity(character, location)
        ~ randomizable_characters -= character
    
        {debug: {character} si trova in {location}}
        
        {
            - randomizable_characters != ():
                -> top
            - else:
                ->->
        }
        
        {debug: {character} è stato spostato in {location}}
      //  {location:
      //  - Giardino:
      //   ~ move_entity(character, Giardino)
      //  - BusStop:
      //  ~ move_entity(character, BusStop)
      //  - Funghi:
      //  ~ move_entity(character, Funghi)
    // }
    
=== randomizer_second_tier
    = top
        ~ temp character = LIST_RANDOM(randomizable_characters)
        ~ temp location = LIST_RANDOM(secondTierPlaces)
        ~ move_entity(character, location)
        ~ randomizable_characters -= character    
        
        {
            - randomizable_characters != ():
                -> top
            - else:
                ->->
        }
    
    // {mentore_location:
    //     - Giardino:
    //         ~ move_entity(Mentore, Giardino)
    //         ~ luoghiAttiviSecondoTier -= Giardino
    //         ~ luoghiMentoreIncontrato += Giardino
    //     - BusStop:
    //         ~ move_entity(Mentore, BusStop)
    //         ~ luoghiAttiviSecondoTier -= BusStop
    //         ~ luoghiMentoreIncontrato += BusStop
    //     - Falene:
    //         ~ move_entity(Mentore, Falene)
    //         ~ luoghiAttiviSecondoTier -= Falene
    //         ~ luoghiMentoreIncontrato += Falene
    //     - Funghi:
    //         ~ move_entity(Mentore, Funghi)
    //         ~ luoghiAttiviSecondoTier -= Funghi
    //         ~ luoghiMentoreIncontrato += Funghi
    
    // }
    {debug: {character} è stato spostato in {location}}
    ->->

=== randomizer_third_tier
    = top
        ~ temp character = LIST_RANDOM(randomizable_characters)
        ~ temp location = LIST_RANDOM(thirdTierPlaces)
        ~ move_entity(character, location)
        ~ randomizable_characters -= character
        
        {debug: {character} si trova in {location}}
        
        {
            - randomizable_characters != ():
                -> top
            - else:
                ->->
        }
        
        {debug: {character} è stato spostato in {location}}
    
    // {mentore_location:
    //     - Giardino:
    //         ~ move_entity(Mentore, Giardino)
    //         ~ luoghiAttiviTerzoTier -= Giardino
    //         ~ luoghiMentoreIncontrato += Giardino
    //     - BusStop:
    //         ~ move_entity(Mentore, BusStop)
    //         ~ luoghiAttiviTerzoTier -= BusStop
    //         ~ luoghiMentoreIncontrato += BusStop
    //     - Biblioteca:
    //         ~ move_entity(Mentore, Biblioteca)
    //         ~ luoghiAttiviTerzoTier -= Biblioteca
    //         ~ luoghiMentoreIncontrato += Biblioteca
    //     - Falene:
    //         ~ move_entity(Mentore, Falene)
    //         ~ luoghiAttiviTerzoTier -= Falene
    //         ~ luoghiMentoreIncontrato += Falene
    //     - Funghi:
    //         ~ move_entity(Mentore, Funghi)
    //         ~ luoghiAttiviTerzoTier -= Funghi
    //         ~ luoghiMentoreIncontrato += Funghi

    // }
        ->->
    
=== randomizer_fourth_tier
        = top
        ~ temp character = LIST_RANDOM(randomizable_characters)
        ~ temp location = LIST_RANDOM(firstTierPlaces)
        ~ move_entity(character, location)
        ~ randomizable_characters -= character
        
        {debug: {character} si trova in {location}}
        
        {
            - randomizable_characters != ():
                -> top
            - else:
                ->->
        }
        
        {debug: {character} è stato spostato in {location}}
    // {mentore_location:
    //     - Giardino:
    //         ~ move_entity(Mentore, Giardino)
    //         ~ luoghiAttiviTerzoTier -= Giardino
    //         ~ luoghiMentoreIncontrato += Giardino
    //     - BusStop:
    //         ~ move_entity(Mentore, BusStop)
    //         ~ luoghiAttiviTerzoTier -= BusStop
    //         ~ luoghiMentoreIncontrato += BusStop
    //     - Biblioteca:
    //         ~ move_entity(Mentore, Biblioteca)
    //         ~ luoghiAttiviTerzoTier -= Biblioteca
    //         ~ luoghiMentoreIncontrato += Biblioteca
    //     - Falene:
    //         ~ move_entity(Mentore, Falene)
    //         ~ luoghiAttiviTerzoTier -= Falene
    //         ~ luoghiMentoreIncontrato += Falene
    //     - Funghi:
    //         ~ move_entity(Mentore, Funghi)
    //         ~ luoghiAttiviTerzoTier -= Funghi
    //         ~ luoghiMentoreIncontrato += Funghi
    //     - Tisane:
    //         ~ move_entity(Mentore, Tisane)
    //         ~ luoghiAttiviTerzoTier -= Tisane
    //         ~ luoghiMentoreIncontrato += Tisane

    // }
        ->->