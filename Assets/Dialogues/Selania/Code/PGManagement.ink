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
    //Colori con cui traccio le scelte che riguardano "solo" me
    VAR player_purple = 0.00
    VAR player_yellow = 0.00
    VAR player_blue = 0.00
    VAR player_green = 0.00
    VAR player_red = 0.00
    
    //Scelte prima pg
    VAR player_purple_first_char = 0.00
    VAR player_yellow_first_char = 0.00
    VAR player_blue_first_char = 0.00
    VAR player_green_first_char = 0.00
    VAR player_red_first_char = 0.00
    
    //Scelte secondo pg
    VAR player_purple_second_char = 0.00
    VAR player_yellow_second_char = 0.00
    VAR player_blue_second_char = 0.00
    VAR player_green_second_char = 0.00
    VAR player_red_second_char = 0.00
    
    //Scelte mentore
    VAR player_purple_mentor = 0.00
    VAR player_yellow_mentor = 0.00
    VAR player_blue_mentor = 0.00
    VAR player_green_mentor = 0.00
    VAR player_red_mentor = 0.00
    
    //Scelte terzo pg
    VAR player_purple_third_char = 0.00
    VAR player_yellow_third_char = 0.00
    VAR player_blue_third_char = 0.00
    VAR player_green_third_char = 0.00
    VAR player_red_third_char = 0.00
    
    
    
//Per funzione aggiornamento colore: tengono conto del valore di quel colore dellx PNG la cui storia è stata appena conclusa
    VAR temp_PGRed = 0.00
    VAR temp_PGGreen = 0.00
    VAR temp_PGBlue = 0.00
    VAR temp_PGYellow = 0.00
    VAR temp_PGPurple  = 0.00    
    

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
    {
        - gender == 1:
            <i>Quali sono i pronomi di {player_name}?</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}

        - else:
            E per quanto riguarda i miei pronomi:#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
    }
    
    
    + {gender > 1} [Chiamami coi pronomi {player_pronouns has him:maschili|{player_pronouns has her:femminili|neutri}}.]
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





=== function state_ending_stories(charES)
{debug: <i>Passo per state_ending_stories. Il valore di charES è {charES}.}
//Chiamo questa funzione a fine di una riscrittura, inserendo il valore della personaggia (es: player_firstStepClosed).
//Controllo quante sono le storie concluse, in modo da poter inserire quella personaggia nell'ordine di conclusione delle storie previsto (es: se c'è già una storia chiusa in story_endedStories e ho chiuso player_firstStepClosed, allora metterò firstChar_storyEndingPosition come story_twoStoriesClosed.
{
	- LIST_COUNT(story_endedStories) == 1:
	   {debug: <i>L'elenco di oggetti nella lista endendStories è {story_endedStories}, pari a 1. Per questo vado ad assegnare il valore di prima storia finita a {charES}.}
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
		{
			- charES == FirstCharacter:
				~ firstChar_storyEndingPosition = story_threeStoriesClosed
			
			- charES == SecondCharacter:
				~ secondChar_storyEndingPosition = story_threeStoriesClosed
			
			- charES == ThirdCharacter:
				~ thirdChar_storyEndingPosition = story_threeStoriesClosed	
		}		 
		 
		 
		 
}


=== function tree_advance_management(charES)
//resetto player_orderGrowingTreeUpdater 
{debug: <i>Passo per PG_advance_management. Il valore di charES è {charES}.}

//Prima cosa: svuoto i valori temporanei
    ~ player_orderGrowingTreeUpdater = ()
	~ temp_PGGreen = ()
	~ temp_PGBlue = ()
	~ temp_PGRed = ()
	~ temp_PGYellow = ()
	~ temp_PGPurple = ()
	
//Seconda cosa: aggiorno lo step di 
    {
    	- LIST_COUNT(story_endedStories) == 1:
    	   {debug: <i>L'elenco di oggetti nella lista endendStories è {story_endedStories}, pari a 1. Per questo vado ad assegnare il valore di prima storia finita a {charES}.}
    		~ player_orderGrowingTreeUpdater = player_firstStepClosed
    
    		
    	- LIST_COUNT(story_endedStories) == 2:
    		~ player_orderGrowingTreeUpdater = player_secondStepClosed
    	
    		
    	 - LIST_COUNT(story_endedStories) == 3:
    		~ player_orderGrowingTreeUpdater = player_thirdStepClosed
    
    }

//Terza cosa: a seconda della personaggia che se ne va, devo aggiornare i valori temporanei dei colori della PG
    {
		- charES == FirstCharacter:
			~ temp_PGGreen = player_green_first_char
			~ temp_PGBlue = player_blue_first_char
			~ temp_PGRed = player_red_first_char
			~ temp_PGYellow = player_yellow_first_char
			~ temp_PGPurple = player_purple_first_char
		
		
		- charES == SecondCharacter:
			~ temp_PGGreen = player_green_second_char
			~ temp_PGBlue = player_blue_second_char
			~ temp_PGRed = player_red_second_char
			~ temp_PGYellow = player_yellow_second_char
			~ temp_PGPurple = player_purple_second_char
		
					
		- charES == ThirdCharacter:
			~ temp_PGGreen = player_green_third_char
			~ temp_PGBlue = player_blue_third_char
			~ temp_PGRed = player_red_third_char
			~ temp_PGYellow = player_yellow_third_char
			~ temp_PGPurple = player_purple_third_char
			
		}


//E poi confronto quella che è la storia della personaggia, la progressione delle sue scelte: di fatto per ora basta che non ci siano pareggi tra colori per evitare il marrone. A quel punto emerge il colore dominante.
    {
        - (temp_PGGreen > temp_PGBlue) && (temp_PGGreen > temp_PGRed) && (temp_PGGreen > temp_PGYellow) && (temp_PGGreen > temp_PGPurple):
            
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
            }
        
        - (temp_PGBlue > temp_PGGreen) && (temp_PGBlue > temp_PGRed) && (temp_PGBlue > temp_PGYellow) && (temp_PGBlue > temp_PGPurple):
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
            }        
        
        - (temp_PGRed > temp_PGGreen) && (temp_PGRed > temp_PGBlue) && (temp_PGRed > temp_PGYellow) && (temp_PGRed > temp_PGPurple):
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
            }    
        
        - (temp_PGYellow > temp_PGGreen) && (temp_PGYellow > temp_PGBlue) && (temp_PGYellow > temp_PGRed) && (temp_PGYellow > temp_PGPurple):
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
            }    
        
        - (temp_PGPurple > temp_PGGreen) && (temp_PGPurple > temp_PGBlue) && (temp_PGPurple > temp_PGRed) && (temp_PGPurple > temp_PGYellow):
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
            }    
    
    }


