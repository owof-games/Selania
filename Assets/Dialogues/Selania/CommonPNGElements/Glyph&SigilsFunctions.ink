=== color_modifier(partner, number)
//funzione utile per modificare botte di colori
{debug: passo per color_modifier. Il valore di partner è {partner}, quello di number è {number}.}

    {
        - partner == FirstCharacter:
            ~ firstChar_aether = firstChar_aether * number
            ~ firstChar_earth = firstChar_earth * number
            ~ firstChar_air = firstChar_air * number
            ~ firstChar_water = firstChar_water * number
            ~ firstChar_fire= firstChar_fire* number
            
    
        - partner == SecondCharacter:
            ~ secondChar_aether = secondChar_aether * number
            ~ secondChar_earth = secondChar_earth * number
            ~ secondChar_air = secondChar_air * number
            ~ secondChar_water = secondChar_water * number
            ~ secondChar_fire = secondChar_fire * number

    }
->->
  
//Funzione di dispatch comune (sigillo attivo o meno)








//Variazioni per FirstCharacter









//Variazioni per SecondCharacter





//Variazioni per ThirdCharacter