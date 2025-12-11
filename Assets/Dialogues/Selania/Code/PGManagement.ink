//Nome giocatrice e player_pronouns
    VAR player_name = "Senza nome"
    VAR player_nameChosen = false
    LIST player_pronouns = him, her, they
    
//Gestione "cose strane" di cui parlare con mentore
    VAR player_somethingStrange = 0
    
//Tracciamento dei luoghi accessibili alla giocatrice
    VAR player_accessiblePlaces = (Bedroom, TrainStop, Forest, Pond)

//Ricetta cucinata con la rana
    VAR kitchen_PGCharRecipe = ""   

//Tracciamento colori giocatrice
    VAR player_purple = 0.00
    VAR player_yellow = 0.00
    VAR player_blue = 0.00
    VAR player_green = 0.00
    VAR player_red = 0.00

//Per funzione aggiornamento colore: tengono conto del valore di quel colore dellx PNG la cui storia è stata appena conclusa
    VAR temp_endedPNGRed = 0.00
    VAR temp_endedPNGGreen = 0.00
    VAR temp_endedPNGBlue = 0.00
    VAR temp_endedPNGYellow = 0.00
    VAR temp_endedPNGPurple  = 0.00    
    

// Lista che indica i possibli esiti delle varie sezioni dell'albero
    LIST player_possibleStepsStatus = emptyStatus, blueStatus, purpleStatus, greenStatus, yellowStatus, redStatus, mixedStatus
    
    //E tracciamento dei vari status delle singole storie
    VAR player_firstStepStatus = emptyStatus
    VAR player_secondStepStatus = emptyStatus
    VAR player_thirdStepStatus = emptyStatus
    VAR player_fourthStepStatus = emptyStatus
    VAR player_fifthStepStatus = emptyStatus


//Lista che indica in modo progressivo gli step di avanzamento della crescita dellx PG e, quindi, dell'albero nella foresta
    LIST player_advancingSteps = player_firstStepClosed, player_secondStepClosed, player_thirdStepClosed, player_fourthStepClosed, player_fifthStepClosed

    //Questa è una variabile temporanea che utilizzo in function PG_advance_management(charES) per poter tracciare quante storie ho concluso prima di questa, in modo da aggiornare la sezione corretta dell'albero (prima, seconda etc) col giusto colore (es: yellowStatus)
    VAR player_orderGrowingTreeUpdater = ()


//Traccio gli spostamenti della personaggia per gestire la comparsa delle personagge
    VAR player_movementsCounter = 0


/* ---------------------------------

      Functions 

 ----------------------------------*/


//Per assegnare/cambiare player_pronouns di riferimento
=== gender ===
    <i>Quali pronomi fanno sentire {player_name} la persona che è?</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
    + {gender> 1} [Chiamami coi pronomi {player_pronouns has him:maschili|{player_pronouns has her:femminili|neutri}}.]
        ->->
    + {gender > 1} [<i>Cambio i miei pronomi.]
        -> top
    + ->
    
    - (top)
    I miei pronomi sono...#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        + [Mi trovo a mio agio col maschile.]
            ~ player_pronouns = ()
            ~ player_pronouns += him
        
        + [Preferisco i pronomi femminili.]
            ~ player_pronouns = ()
            ~ player_pronouns += her
        
        + [Vai di neutro.]
            ~ player_pronouns = ()
            ~ player_pronouns += they
        -
        ->->

//Per la scelta del nome
=== name_choice ===
    <i>Un nome è un incantesimo, una possibilità.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
    <i>Quale nome verrà pronunciato?

        + {name_choice > 1} [Il mio nome è {player_name}.]
            ->->
        
        + {name_choice > 1}[<i>Voglio cambiare nome.]
            ~ player_nameChosen = false
            -> top
        
        + ->
    
    - (top)
        Il mio nome è...#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        ~ temp random_name = "{~ Alessio|Gianni|Matteo|Alessandro|Lorenzo|Diego|Tommaso|Riccardo|Leonardo|Gabriele|Edoardo|Samuele|Liam|Nathan|Noah|Enea|Cesare|Ivo|Arturo|Nevio|Ettore|Roberto|Valerio|Pierluigi|Gianmaria|Gianmarco|Maurizio|Emanuele|Niccolò|Nicola|Filippo|Santiago|Alberto|Corrado|Ernesto|Giuliano|Ivan|Juri|Lupo|Tancredi|Jacob|Micahel|Ethan|Joshua|Daniel|Aurelio|Mario|Stefano|Cristian|Carmine|Ciro|Corrado|Carlo|Cesare|Carlo|Dante|Dario|Davide|Damiano|Diego|Domenico|Dino|Eugenio|Flavio|Filippo|Fabio|Francesco|Gaetano|Giordano|Giovanni|Alex|Alexander|Luca|Jacopo|Milo|Cristiano|Thomas|Lucas|Joele|Massimo|Giosuè|Oliver|William|James|Lucas|Henry|John|Ryan|Ethan|Gus|Logan|Nolan|Sean|Tyler|Ursula|Adowa|Amina|Fayola|Dara|Makena|Rashida|Zahra|Ashaki|Obioma|Terehasa|Zainabu|Busara|Dafina|Kamohelo|Mbhali|Aya|Mariam|Adama|Fatouma|Jeannette|Hong|Yu|Min|Xin|Bin|Cheng|Zhen|Eriko|Fujiko|Ikuyo|Keiko|Madoka|Natsumi|Rumiko|Ryo|Toyoko|Yumi|Yuki|Tamafune|Kaori|Chikako|Atsuko|Shaila|Ravi|Gita|Manju|Urmila|Sita|Nirmala|Savita|Kamal|Aadhya|Bimala|Chandra|Uma|Rita|Maura|Giulia|Francesca|Cecilia|Ilaria|Vittoria|Cinzia|Marisa|Antonia|Antonietta|Valeria|Maria|Olga|Tatyana|Natalya|Irina|Svetlana|Ekaterina|Cristina|Kristina|Emma|Jade|Louise|Chloé|Camille|Inès|Sarah|Ivy|Taylor|Sophia|Rosie|Poppy|Sienna|Karen|Ruby|Eva|Violet|Margot|Aurora|Elizabeth|Scarlett|Virginia|Atsushi|Dalai|Edoardo |Haoyu|Ming|Masao|Toshi|Song|Wei|Lang|Wei|Akio|Akihiro|Fumihiko|Bishamon|Chikayoshi|Daiichi|Fumihiro|Genjo|Hiromu|Mitsuo|Vyomesh|Vishwatma|Umachandra|Tarkesh|Sujan|Ranjeet|Mattia|Gabriele|Marco|Prajit|Nripendra|Kundan|Sergey|Aleksandr|Roman|Denis|Igor|Anton|Lev|Pavel|Kirill|Oleg|Stanislav|Antoine|Alexandre|Étienne|François|Henri|Louis|Olivier|Pierre|Vincent|Paul|Almira|Amalia|Charo|Carmen|Clarissa|Elena|Claudia|Estella|Zita|Zoe|Veronica|Fabio|Felix|Jago|Jose|Jorde|Rodrigo|Sergio|Andrea|Harper|Dakota|Blue|Elliot|Kraken|Charlie|Avery|Jordan |Felice|Noah|Celeste|Fiore|Diamante|Evan|Leslie|Lago|Fiume|Casey|Harper|Sidney|Gail|Syb|Max|Nicky|Sasha|Carmine|Beatrice|Asad|Danilo|Sissi|Javi|Salvo|Sven|Jacopo|Letizia|Ren|Pablo|Guido|Arianna|Simão|Nicolò|Ivana}"
        
        + (nome_scelto)[<b>{random_name}</b>]
            ~ player_name = random_name
            ~ player_nameChosen = true
        + [<i>No, non è questo il mio nome.]
            ~ player_nameChosen = false
            -> top
        - 
            ->->

=== function PG_advance_management(charES)
//Chiamo questa funzione a fine di una riscrittura, inserendo il valore della personaggia (es: player_firstStepClosed).
//Controllo quante sono le storie concluse, in modo da poter inserire quella personaggia nell'ordine di conclusione delle storie previsto (es: se c'è già una storia chiusa in story_endedStories e ho chiuso player_firstStepClosed, allora metterò firstChar_storyEndingPosition come story_twoStoriesClosed.

{debug: <i>Passo per PG_advance_management. Il valore di charES è {charES}.}

{
	- LIST_COUNT(story_endedStories) == 1:
	   {debug: <i>L'elenco di oggetti nella lista endendStories è {story_endedStories}, pari a 1. Per questo vado ad assegnare il valore di prima storia finita a {charES}.}
		~ player_orderGrowingTreeUpdater = player_firstStepClosed
		{
			- charES == FirstCharacter:
				~ firstChar_storyEndingPosition = story_oneStoryClosed
			{debug: <i>Dato che charES coincide con {charES}. Il valore di firstChar_storyEndingPosition è {firstChar_storyEndingPosition}.}
			
			- charES == SecondCharacter:
				~ secondChar_storyEndingPosition = story_oneStoryClosed
			{debug: <i>Dato che charES coincide con {charES}. Il valore di secondChar_storyEndingPosition è {secondChar_storyEndingPosition}.}
						
			- charES == ThirdCharacter:
				~ thirdChar_storyEndingPosition = story_oneStoryClosed
			{debug: <i>Dato che charES coincide con {charES} Il valore di thirdChar_storyEndingPosition è {thirdChar_storyEndingPosition}.}	
		}
		
	- LIST_COUNT(story_endedStories) == 2:
		~ player_orderGrowingTreeUpdater = player_secondStepClosed
		{
			- charES == FirstCharacter:
				~ firstChar_storyEndingPosition = story_twoStoriesClosed
			{debug: <i>Dato che charES coincide con {charES}. Il valore di firstChar_storyEndingPosition è {firstChar_storyEndingPosition}.}	
			
			- charES == SecondCharacter:
				~ secondChar_storyEndingPosition = story_twoStoriesClosed
			{debug: <i>Dato che charES coincide con {charES}. Il valore di secondChar_storyEndingPosition è {secondChar_storyEndingPosition}.}	
			
			- charES == ThirdCharacter:
				~ thirdChar_storyEndingPosition = story_twoStoriesClosed
			{debug: <i>Dato che charES coincide con {charES} Il valore di thirdChar_storyEndingPosition è {thirdChar_storyEndingPosition}.}	
		}		
		
		
	 - LIST_COUNT(story_endedStories) == 3:
		 ~player_orderGrowingTreeUpdater = player_thirdStepClosed
		{
			- charES == FirstCharacter:
				~ firstChar_storyEndingPosition = story_threeStoriesClosed
			
			- charES == SecondCharacter:
				~ secondChar_storyEndingPosition = story_threeStoriesClosed
			
			- charES == ThirdCharacter:
				~ thirdChar_storyEndingPosition = story_threeStoriesClosed	
		}		 
		 
		 
		 
}


{debug: <i>Ho finito di assegnare l'ordine di conclusione delle storie, e passo ad aggiornare i colori.}

    {
        - charES == FirstCharacter:
            ~ temp_endedPNGRed = firstChar_red
            ~ temp_endedPNGGreen = firstChar_green
            ~ temp_endedPNGBlue = firstChar_blue
            ~ temp_endedPNGYellow = firstChar_yellow
            ~ temp_endedPNGPurple = firstChar_purple
            
        - charES == SecondCharacter:
            ~ temp_endedPNGRed = secondChar_red
            ~ temp_endedPNGGreen = secondChar_green
            ~ temp_endedPNGBlue = secondChar_blue
            ~ temp_endedPNGYellow = secondChar_yellow
            ~ temp_endedPNGPurple = secondChar_purple
            
    
    }

    //Qui aggiorno i valori delle scelte della player
    ~ player_red = player_red + temp_endedPNGRed
        {debug: Il valore di PlayerRed è {player_red}}
    ~ player_purple = player_purple + temp_endedPNGPurple
        {debug: Il valore di player_purple è {player_purple}}
    ~ player_green = player_green + temp_endedPNGGreen
        {debug: Il valore di player_green è {player_green}}
    ~ player_yellow = player_yellow + temp_endedPNGYellow
        {debug: Il valore di player_yellow è {player_yellow}}
    ~ player_blue = player_blue + temp_endedPNGBlue
        {debug: Il valore di player_blue è {player_blue}}


    //E poi confronto quella che è la storia della personaggia, la progressione delle sue scelte: di fatto per ora basta che non ci siano pareggi tra colori per evitare il marrone. A quel punto emerge il colore dominante.
    {
        - (player_green > player_blue) && (player_green > player_red) && (player_green > player_yellow) && (player_green > player_purple):
            
            {
                - player_orderGrowingTreeUpdater == player_firstStepClosed:
                    ~ player_firstStepStatus = ()
                    ~ player_firstStepStatus += greenStatus
                   {debug: Lo status di player_firstStepStatus è {player_firstStepStatus}}
                
                - player_orderGrowingTreeUpdater == player_secondStepClosed:
                    ~ player_secondStepStatus = ()
                    ~ player_secondStepStatus += greenStatus
                    {debug: Lo status di player_secondStepStatus è {player_secondStepStatus}}    
                // - player_orderGrowingTreeUpdater == thirdChar_storyStatus:
                //     ~ player_thirdStepStatus += greenStatus
                // - player_orderGrowingTreeUpdater == fourthChar_storyStatus:
                //     ~ player_fourthStepStatus += greenStatus
                // - player_orderGrowingTreeUpdater == fifthChar_storyStatus:
                //     ~ player_fifthStepStatus += greenStatus
                      - else:
                        ERRORE
                        ~ temp yww = 1/0
            }
        
        - (player_blue > player_green) && (player_blue > player_red) && (player_blue > player_yellow) && (player_blue > player_purple):
            {
                - player_orderGrowingTreeUpdater == player_firstStepClosed:
                    ~ player_firstStepStatus = ()
                    ~ player_firstStepStatus += blueStatus
                    {debug: Lo status di player_firstStepStatus è {player_firstStepStatus}}
                
                - player_orderGrowingTreeUpdater == player_secondStepClosed:
                    ~ player_secondStepStatus = ()
                    ~ player_secondStepStatus += blueStatus
                    {debug: Lo status di player_secondStepStatus è {player_secondStepStatus}}  
                
                // - player_orderGrowingTreeUpdater == thirdChar_storyStatus:
                //     ~ player_thirdStepStatus += blueStatus
                // - player_orderGrowingTreeUpdater == fourthChar_storyStatus:
                //     ~ player_fourthStepStatus += blueStatus
                // - player_orderGrowingTreeUpdater == fifthChar_storyStatus:
                //     ~ player_fifthStepStatus += blueStatus
                      - else:
                        ERRORE
                        ~ temp ywww = 1/0
            }        
        
        - (player_red > player_green) && (player_red > player_blue) && (player_red > player_yellow) && (player_red > player_purple):
            {
                - player_orderGrowingTreeUpdater == player_firstStepClosed:
                    ~ player_firstStepStatus = ()
                    ~ player_firstStepStatus += redStatus
                    {debug: Lo status di player_firstStepStatus è {player_firstStepStatus}}
                
                - player_orderGrowingTreeUpdater == player_secondStepClosed:
                    ~ player_secondStepStatus = ()
                    ~ player_secondStepStatus += redStatus
                    {debug: Lo status di player_secondStepStatus è {player_secondStepStatus}}  
                
                // - player_orderGrowingTreeUpdater == thirdChar_storyStatus:
                //     ~ player_thirdStepStatus += redStatus
                // - player_orderGrowingTreeUpdater == fourthChar_storyStatus:
                //     ~ player_fourthStepStatus += redStatus
                // - player_orderGrowingTreeUpdater == fifthChar_storyStatus:
                //     ~ player_fifthStepStatus += redStatus
                     - else:
                        ERRORE
                        ~ temp yrr = 1/0
            }    
        
        - (player_yellow > player_green) && (player_yellow > player_blue) && (player_yellow > player_red) && (player_yellow > player_purple):
            {
                - player_orderGrowingTreeUpdater == player_firstStepClosed:
                    ~ player_firstStepStatus = ()
                    ~ player_firstStepStatus += yellowStatus
                    {debug: Lo status di player_firstStepStatus è {player_firstStepStatus}}
                
                - player_orderGrowingTreeUpdater == player_secondStepClosed:
                    ~ player_secondStepStatus = ()
                    ~ player_secondStepStatus += yellowStatus
                    {debug: Lo status di player_secondStepStatus è {player_secondStepStatus}}  
                
                // - player_orderGrowingTreeUpdater == thirdChar_storyStatus:
                //     ~ player_thirdStepStatus += yellowStatus
                // - player_orderGrowingTreeUpdater == fourthChar_storyStatus:
                //     ~ player_fourthStepStatus += yellowStatus
                // - player_orderGrowingTreeUpdater == fifthChar_storyStatus:
                //     ~ player_fifthStepStatus += yellowStatus
                     - else:
                        ERRORE
                        ~ temp yrrr = 1/0
            }    
        
        - (player_purple > player_green) && (player_purple > player_blue) && (player_purple > player_red) && (player_purple > player_yellow):
            {
                - player_orderGrowingTreeUpdater == player_firstStepClosed:
                    ~ player_firstStepStatus = ()
                    ~ player_firstStepStatus += purpleStatus
                    {debug: Lo status di player_firstStepStatus è {player_firstStepStatus}}
                
                - player_orderGrowingTreeUpdater == player_secondStepClosed:
                    ~ player_secondStepStatus = ()
                    ~ player_secondStepStatus += purpleStatus
                    {debug: Lo status di player_secondStepStatus è {player_secondStepStatus}}  
                
                // - player_orderGrowingTreeUpdater == thirdChar_storyStatus:
                //     ~ player_thirdStepStatus += purpleStatus
                // - player_orderGrowingTreeUpdater == fourthChar_storyStatus:
                //     ~ player_fourthStepStatus += purpleStatus
                // - player_orderGrowingTreeUpdater == fifthChar_storyStatus:
                //     ~ player_fifthStepStatus += purpleStatus
                     - else:
                        ERRORE
                        ~ temp yrtr = 1/0
            }
        
        - else:
            {
                - player_orderGrowingTreeUpdater == player_firstStepClosed:
                    ~ player_firstStepStatus = ()
                    ~ player_thirdStepStatus += mixedStatus
                    {debug: Lo status di player_firstStepStatus è {player_firstStepStatus}}
                    
                - player_orderGrowingTreeUpdater == player_secondStepClosed:
                    ~ player_secondStepStatus = ()
                    ~ player_thirdStepStatus += mixedStatus
                    {debug: Lo status di player_secondStepStatus è {player_secondStepStatus}}  
                    
                // - player_orderGrowingTreeUpdater == thirdChar_storyStatus:
                //     ~ player_thirdStepStatus += mixedStatus
                // - player_orderGrowingTreeUpdater == fourthChar_storyStatus:
                //     ~ player_fourthStepStatus += mixedStatus
                // - player_orderGrowingTreeUpdater == fifthChar_storyStatus:
                //     ~ player_fifthStepStatus += mixedStatus
                     - else:
                        ERRORE
                        ~ temp yrwer = 1/0
            }    
    
    }


