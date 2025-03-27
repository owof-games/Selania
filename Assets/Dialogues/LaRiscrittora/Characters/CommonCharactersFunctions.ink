/* ---------------------------------

   Funzioni legate a comparsa e spostamenti personagge 

 ----------------------------------*/
//REMIND: tendenzialmente  metà storia personaggia -> compare nuova personaggia. Fine storia personaggia -> si attiva un nuovo luogo.

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

    //Check stato tier
    {   
            - thirdStory == Ended:
                    ~ fourthTier = true
                    
            - secondStory == Ended:
                     ~ thirdTier = true
                     
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
        
        - thirdStory == Active && talk_with_third_character:
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


/* ---------------------------------

   Gestione avvio e chiusura storie personagge 

 ----------------------------------*/
//Attesa comparsa prima personaggia
VAR delayFirstChar = 5
//Attesa comparsa quarta personaggia
VAR delayFourthChar = 20
    
=== story_time_management_for_PNG

{
    - movementsCounter == delayFirstChar && firstStory == NotStarted:
            ~ move_entity(FirstCharacter, BusStop)
            ~ firstStory = Active
            
//A metà della storia della prima personaggia, compare la seconda      
    - knowing_first_character.four && secondStory == NotStarted:
            ~ move_entity(SecondCharacter, BusStop)    
            ~ secondStory = Active

//A metà della storia della seconda personaggia e finita la prima (così la biblioteca è aperta), compare la terza
    - knowing_second_character.four && firstStory == Ended && thirdStory == NotStarted:
            ~ move_entity(ThirdCharacter, BusStop)    
            ~ thirdStory = Active
            
//Dopo un po' da quando la terza storia è finita, compare una quarta personaggia
    - movementsCounter == delayFourthChar && thirdStory == Ended:
        //Ma magari questo spettro vuole comparire altrove
            ~ move_entity(FourthCharacter, BusStop)
            ~ fourthStory = Active
            
//E quando la storia della quarta è a metà, iniziamo a modo quella della mentore
    - knowing_fourth_character.five && fifthStory == NotStarted:
            ~ fifthStory = Active
                


//Check per l'allontanamento delle personagge
    //- firstStory == Ended && movementsCounter > 10:
        //~ move_entity(FirstCharacter, Safekeeping)
        //~ move_entity(FirstCharacterNotes, BusStop)
        
    //- secondStory == Ended && movementsCounter > 10:
        //~ move_entity(SecondCharacter, Safekeeping)
        //~ move_entity(SecondCharacterNotes, BusStop)
        
    - thirdStory == Ended && movementsCounter > 10:
        ~ move_entity(ThirdCharacter, Safekeeping)
        ~ move_entity(ThirdCharacterNotes, BusStop)
        
    - fourthStory == Ended && movementsCounter > 10:
        ~ move_entity(FourthCharacter, Safekeeping)
        ~ move_entity(FourthCharacterNotes, BusStop)
        
    - fifthStory == Ended && movementsCounter > 10:
        ~ move_entity(Mentor, Safekeeping)
        ~ move_entity(FifthCharacterNotes, BusStop)
}

->->


/* ---------------------------------

   Calcolatori affinità

 ----------------------------------*/
//Per la prima personaggia l'importante è che il blu sia bassissimo
=== firstAffinityCalc ===
    {
        - firstPurple && firstYellow > firstBlue:
            ~ firstCharacterInkLevel ++
            ~ firstCharacterInkLevel ++
                ->->
        - firstPurple or firstYellow > firstBlue:
            ~ firstCharacterInkLevel ++
                ->->
    }

->->

//Per il secondo personaggio la cosa che conta è coerenza. Ha bisogno di stabilità. A manoni la logica sarà: tengo conto di un counter delle domande a cui ha risposto la giocatrice e se un determinato valore è >= di counter - x allora ++, se >= counter -x-1 allora +. Probabilmente da bilanciare.
=== secondAffinityCalc ===
{
    - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 1):
        ~ secondCharacterInkLevel ++
        ~ secondCharacterInkLevel ++
            ->->
    - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 2):
        ~ secondCharacterInkLevel ++
            ->->     
}

->->

    === secondAffinityCheckCalc ===
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        {
            - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 1):
                {charNameTwo}: Sai? Mi sembri una persona che dice sempre le cose giuste.
                {charNameTwo}: Non giuste giuste tipo per me.
                {charNameTwo}: Ma che si assomigliano tutte.
                {charNameTwo}: Non mi dici mica prima mele e poi pere come fanno gli altri adulti.
                {charNameTwo}: Questo mi piace.
                    ->->
            - else:
                {charNameTwo}: Non sono scemo.
                {charNameTwo}: Ho visto che cambi sempre idea.
                {charNameTwo}: Mi rispondi sempre cose diverse.
                {charNameTwo}: Non mi piace.
                {charNameTwo}: Gli adulti fanno così quando voglio avere ragione.
                {charNameTwo}: E io mica sono un bambino.
                    ->->     
        }

        ->-> 

=== secondColourCheck
{debugChangeName: Passo per secondColourCheck.}

VAR secondRedMax = false
VAR secondBlueMax = false
VAR secondYellowMax = false
VAR secondGreenMax = false
VAR secondPurpleMax = false

//Resettiamo, così che per ogni scelta sia tutto su falso per sicurezza.
~  secondYellowMax = false
~  secondGreenMax = false
~  secondBlueMax = false
~  secondPurpleMax = false
~  secondRedMax = false


{
//Potrebbe capitare un pareggio, e va bene così, così non è punitivo per la giocatrice.
    - secondRed >= secondBlue && secondRed >= secondYellow && secondRed >= secondGreen && secondRed >= secondPurple && secondRed >= secondGreen:
                ~  secondRedMax = true
    {debugChangeName: Il valore di secondRedMax è {secondRedMax}.}
    
    - secondBlue >= secondRed && secondBlue >= secondYellow && secondBlue >= secondGreen && secondBlue >= secondPurple && secondBlue >= secondGreen:
                ~  secondBlueMax = true
     {debugChangeName: Il valore di secondBlueMax è {secondBlueMax}.}
     
    - secondGreen >= secondBlue && secondGreen >= secondYellow && secondGreen >= secondGreen && secondGreen >= secondPurple && secondGreen >= secondRed:
                ~  secondGreenMax = true
        {debugChangeName: Il valore di secondGreenMax è {secondGreenMax}.}  
        
    - secondPurple >= secondBlue && secondPurple >= secondYellow && secondPurple >= secondGreen && secondPurple >= secondRed && secondPurple >= secondGreen:
                ~  secondPurpleMax = true
        {debugChangeName: Il valore di secondPurpleMax è {secondPurpleMax}.}  
        
    - secondYellow >= secondBlue && secondYellow >= secondRed && secondYellow >= secondGreen && secondYellow >= secondPurple && secondYellow >= secondGreen:
                ~  secondYellowMax = true 
    {debugChangeName: Il valore di secondGreenMax è {secondGreenMax}.}                  


}

->->
    

=== function secondStatementVariation(color)
~ temp secondCheckColor = false
{debugChangeName: Passo per function secondStatementVariation.}

    {
        - color == red:
           ~ secondCheckColor = secondRedMax
        - color == blue:
            ~ secondCheckColor = secondBlueMax
        - color == yellow:
            ~ secondCheckColor = secondYellowMax
        - color == green:
            ~ secondCheckColor = secondGreenMax
        - color == purple:
            ~ secondCheckColor = secondPurpleMax
            
    }

    {debugChangeName: Il valore di secondCheckColor è {secondCheckColor}.}                    
    {
    - secondCheckColor:
        {
         - secondCharacterPossibleStates hasnt IlCorvo:
            ~ secondCharacterPossibleStates ++
            {debugChangeName: Aumento lo stato del secondo personaggio, che ora è {secondCharacterPossibleStates }}
        }
    
    - else:
        {
         - secondCharacterPossibleStates hasnt IlRiccio:
        ~ secondCharacterPossibleStates --
        {debugChangeName: Diminuisco lo stato del secondo personaggio, che ora è {secondCharacterPossibleStates }}
        }
    	            
    }  
    
    
=== thirdAffinityCalc ===

->->

//Settaggio nome quando partiamo con la discussione
=== firstNaming ===
    {
        - (firstBlue > firstGreen) && (firstBlue > firstRed) && (firstBlue > firstYellow) && (firstBlue > firstPurple):
            ~ firstCharacterPossibleStates += Triangolo
                ->->
                
        - (firstRed > firstGreen) && (firstRed > firstBlue) && (firstRed > firstYellow) && (firstRed > firstPurple):
            ~ firstCharacterPossibleStates += RagazzaOrchestra
                ->->
                
        - (firstGreen > firstBlue) && (firstGreen > firstRed) && (firstGreen > firstYellow) && (firstGreen > firstPurple):
            ~ firstCharacterPossibleStates += FlautoDolce    
                ->->
                
        - (firstYellow > firstGreen) && (firstYellow > firstRed) && (firstYellow > firstBlue) && (firstYellow > firstPurple):
            ~ firstCharacterPossibleStates += Ocarina   
                ->->
                
        - (firstPurple > firstGreen) && (firstPurple > firstRed) && (firstPurple > firstYellow) && (firstPurple > firstBlue):
            ~ firstCharacterPossibleStates += Violino    
                ->->
                
        - else:
            ~ firstCharacterPossibleStates += Chitarra 
            ->->
                
    }

->->

=== secondNaming ==
    {
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 1):
            ~ secondCharacterPossibleStates += IlCorvo
                ->->
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 2):
            ~ secondCharacterPossibleStates += IlCapibara   
                ->-> 
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 3):
            ~ secondCharacterPossibleStates += IlDelfino    
                ->->
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 4):
            ~ secondCharacterPossibleStates += IlLupo
                ->->
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 5):
            ~ secondCharacterPossibleStates += IlGrizzly
                ->->
        - else:     
            ~ secondCharacterPossibleStates += IlRiccio
                ->->
    }
->->

=== thirdNaming ===

->->

=== fourthNaming ===

->->

=== fifthNaming ===

->->