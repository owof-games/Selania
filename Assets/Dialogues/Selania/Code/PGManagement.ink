//Nome giocatrice e player_pronouns
    VAR player_name = "Senza nome"
    VAR player_nameChosen = false
    LIST player_pronouns = him, her, they

//Tracciamento del riposo.
    //Dalle impostazioni può abilitare/disabilitare le notifiche per il riposo
    VAR player_restingSessionNotification = true
    VAR player_lastRestingSession = 0
    VAR player_maxPlayingTime = 100
    //Questo è il valore a cui viene portato player_lastRestingSession dopo la notifica di invito al riposo, in modo da evitare una notifica troppo frequente, ma anche da non far passare lo stesso tempo da inizio sessione.
    VAR player_notificationRestingReset = 50

    
//Gestione "cose strane" di cui parlare con mentore
    LIST player_somethingStrange = strangeFrog, strangeVoice, strangeGrimoire, strangeVase
    
//Tracciamento dei luoghi accessibili alla giocatrice
    VAR player_accessiblePlaces = (Bedroom, TrainStop, Forest, Pond)

//Ricetta cucinata con la rana
    VAR kitchen_PGCharRecipe = ""   

//Tracciamento colori giocatrice
    //Colori con cui traccio le scelte che riguardano "solo" me
    VAR player_aether = 0.00
    VAR player_earth = 0.00
    VAR player_air = 0.00
    VAR player_water = 0.00
    VAR player_fire = 0.00
    
    //Scelte prima pg
    VAR player_aether_first_char = 0.00
    VAR player_earth_first_char = 0.00
    VAR player_air_first_char = 0.00
    VAR player_water_first_char = 0.00
    VAR player_fire_first_char = 0.00
    
    //Scelte secondo pg
    VAR player_aether_second_char = 0.00
    VAR player_earth_second_char = 0.00
    VAR player_air_second_char = 0.00
    VAR player_water_second_char = 0.00
    VAR player_fire_second_char = 0.00
    
    //Scelte mentore
    VAR player_aether_mentor = 0.00
    VAR player_earth_mentor = 0.00
    VAR player_air_mentor = 0.00
    VAR player_water_mentor = 0.00
    VAR player_fire_mentor = 0.00
    
    //Scelte terzo pg
    VAR player_aether_third_char = 0.00
    VAR player_earth_third_char = 0.00
    VAR player_air_third_char = 0.00
    VAR player_water_third_char = 0.00
    VAR player_fire_third_char = 0.00
    
    
    
//Per funzione aggiornamento colore: tengono conto del valore di quel colore dellx PNG la cui storia è stata appena conclusa
    VAR temp_PGFire= 0.00
    VAR temp_PGWater = 0.00
    VAR temp_PGAir = 0.00
    VAR temp_PGEarth = 0.00
    VAR temp_PGAether  = 0.00    
    

// Lista che indica i possibli esiti delle varie sezioni dell'albero
    LIST player_possibleStepsStatus = emptyStatus, airStatus, aetherStatus, waterStatus, earthStatus, fireStatus
    
    //E tracciamento dei vari status delle singole storie
    VAR player_firstStepStatus = emptyStatus
    VAR player_secondStepStatus = emptyStatus
    VAR player_thirdStepStatus = emptyStatus
    VAR player_fourthStepStatus = emptyStatus
    VAR player_fifthStepStatus = emptyStatus


//Lista che indica in modo progressivo gli step di avanzamento della crescita dellx PG e, quindi, dell'albero nella foresta
    LIST player_advancingSteps = player_firstStepClosed, player_secondStepClosed, player_thirdStepClosed, player_fourthStepClosed, player_fifthStepClosed

    //Questa è una variabile temporanea che utilizzo in function PG_advance_management(charES) per poter tracciare quante storie ho concluso prima di questa, in modo da aggiornare la sezione corretta dell'albero (prima, seconda etc) col giusto colore (es: earthStatus)
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
        ~ temp random_name1 = get_random_name()
        ~ temp random_name2 = get_random_name()
        ~ temp random_name3 = get_random_name()
        
        + [<b>{random_name1}</b>]
            ~ player_name = random_name1
            ~ player_nameChosen = true
        + [<b>{random_name2}</b>]
            ~ player_name = random_name2
            ~ player_nameChosen = true
        + [<b>{random_name3}</b>]
            ~ player_name = random_name3
            ~ player_nameChosen = true
        + [<i>No, non è questo il mio nome.]
            ~ player_nameChosen = false
            -> top
        - 
            ->->



=== function get_random_name()
~ temp random_name = "{~ Alessio|Gianni|Matteo|Alessandro|Lorenzo|Diego|Tommaso|Riccardo|Leonardo|Gabriele|Edoardo|Samuele|Liam|Nathan|Noah|Enea|Cesare|Ivo|Arturo|Nevio|Ettore|Roberto|Valerio|Pierluigi|Gianmaria|Gianmarco|Maurizio|Emanuele|Niccolò|Nicola|Filippo|Santiago|Alberto|Corrado|Ernesto|Giuliano|Ivan|Juri|Lupo|Tancredi|Jacob|Micahel|Ethan|Joshua|Daniel|Aurelio|Mario|Stefano|Cristian|Carmine|Ciro|Corrado|Carlo|Cesare|Carlo|Dante|Dario|Davide|Damiano|Diego|Domenico|Dino|Eugenio|Flavio|Filippo|Fabio|Francesco|Gaetano|Giordano|Giovanni|Alex|Alexander|Luca|Jacopo|Milo|Cristiano|Thomas|Lucas|Joele|Massimo|Giosuè|Oliver|William|James|Henry|John|Ryan|Ethan|Gus|Logan|Nolan|Sean|Tyler|Ursula|Adowa|Amina|Fayola|Dara|Makena|Rashida|Zahra|Ashaki|Obioma|Terehasa|Zainabu|Busara|Dafina|Kamohelo|Mbhali|Aya|Mariam|Adama|Fatouma|Jeannette|Hong|Yu|Min|Xin|Bin|Cheng|Zhen|Eriko|Fujiko|Ikuyo|Keiko|Madoka|Natsumi|Rumiko|Ryo|Toyoko|Yumi|Yuki|Tamafune|Kaori|Chikako|Atsuko|Shaila|Ravi|Gita|Manju|Urmila|Sita|Nirmala|Savita|Kamal|Aadhya|Bimala|Chandra|Uma|Rita|Maura|Giulia|Francesca|Cecilia|Ilaria|Vittoria|Cinzia|Marisa|Antonia|Antonietta|Valeria|Maria|Olga|Tatyana|Natalya|Irina|Svetlana|Ekaterina|Cristina|Kristina|Emma|Jade|Louise|Chloé|Camille|Inès|Sarah|Ivy|Taylor|Sophia|Rosie|Poppy|Sienna|Karen|Ruby|Eva|Violet|Margot|Aurora|Elizabeth|Scarlett|Virginia|Atsushi|Dalai|Edoardo |Haoyu|Ming|Masao|Toshi|Song|Wei|Lang|Wei|Akio|Akihiro|Fumihiko|Bishamon|Chikayoshi|Daiichi|Fumihiro|Genjo|Hiromu|Mitsuo|Vyomesh|Vishwatma|Umachandra|Tarkesh|Sujan|Ranjeet|Mattia|Gabriele|Marco|Prajit|Nripendra|Kundan|Sergey|Aleksandr|Roman|Denis|Igor|Anton|Lev|Pavel|Kirill|Oleg|Stanislav|Antoine|Alexandre|Étienne|François|Henri|Louis|Olivier|Pierre|Vincent|Paul|Almira|Amalia|Charo|Carmen|Clarissa|Elena|Claudia|Estella|Zita|Zoe|Veronica|Felix|Jago|Jose|Jorde|Rodrigo|Sergio|Andrea|Harper|Dakota|Blue|Elliot|Kraken|Charlie|Avery|Jordan |Felice|Noah|Celeste|Fiore|Diamante|Evan|Leslie|Lago|Fiume|Casey|Harper|Sidney|Gail|Syb|Max|Nicky|Sasha|Carmine|Beatrice|Asad|Danilo|Sissi|Javi|Salvo|Sven|Jacopo|Letizia|Ren|Pablo|Guido|Arianna|Simão|Nicolò|Ivana|Lorena|Benedetta|Loris|Tosca|Federica|Fausto|Jay|Mauro|Adriano|Adriene|Romeo|Romi|Simone|Alexias|Alexis|Salvatore}"
~ return random_name




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
	~ temp_PGWater = ()
	~ temp_PGAir = ()
	~ temp_PGFire= ()
	~ temp_PGEarth = ()
	~ temp_PGAether = ()
	
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
			~ temp_PGWater = player_water_first_char
			~ temp_PGAir = player_air_first_char
			~ temp_PGFire= player_fire_first_char
			~ temp_PGEarth = player_earth_first_char
			~ temp_PGAether = player_aether_first_char
		
		
		- charES == SecondCharacter:
			~ temp_PGWater = player_water_second_char
			~ temp_PGAir = player_air_second_char
			~ temp_PGFire= player_fire_second_char
			~ temp_PGEarth = player_earth_second_char
			~ temp_PGAether = player_aether_second_char
		
					
		- charES == ThirdCharacter:
			~ temp_PGWater = player_water_third_char
			~ temp_PGAir = player_air_third_char
			~ temp_PGFire= player_fire_third_char
			~ temp_PGEarth = player_earth_third_char
			~ temp_PGAether = player_aether_third_char
			
		}


//E poi confronto quella che è la storia della personaggia, la progressione delle sue scelte: di fatto per ora basta che non ci siano pareggi tra colori per evitare il marrone. A quel punto emerge il colore dominante.
    {
        - (temp_PGWater > temp_PGAir) && (temp_PGWater > temp_PGFire) && (temp_PGWater > temp_PGEarth) && (temp_PGWater > temp_PGAether):
            
            {
                - player_orderGrowingTreeUpdater == player_firstStepClosed:
                    ~ player_firstStepStatus = ()
                    ~ player_firstStepStatus += waterStatus
                   {debug: Lo status di player_firstStepStatus è {player_firstStepStatus}}
                
                - player_orderGrowingTreeUpdater == player_secondStepClosed:
                    ~ player_secondStepStatus = ()
                    ~ player_secondStepStatus += waterStatus
                    {debug: Lo status di player_secondStepStatus è {player_secondStepStatus}}    
                // - player_orderGrowingTreeUpdater == thirdChar_storyStatus:
                //     ~ player_thirdStepStatus += waterStatus
                // - player_orderGrowingTreeUpdater == fourthChar_storyStatus:
                //     ~ player_fourthStepStatus += waterStatus
                // - player_orderGrowingTreeUpdater == fifthChar_storyStatus:
                //     ~ player_fifthStepStatus += waterStatus
                      - else:
                        ERRORE
            }
        
        - (temp_PGAir > temp_PGWater) && (temp_PGAir > temp_PGFire) && (temp_PGAir > temp_PGEarth) && (temp_PGAir > temp_PGAether):
            {
                - player_orderGrowingTreeUpdater == player_firstStepClosed:
                    ~ player_firstStepStatus = ()
                    ~ player_firstStepStatus += airStatus
                    {debug: Lo status di player_firstStepStatus è {player_firstStepStatus}}
                
                - player_orderGrowingTreeUpdater == player_secondStepClosed:
                    ~ player_secondStepStatus = ()
                    ~ player_secondStepStatus += airStatus
                    {debug: Lo status di player_secondStepStatus è {player_secondStepStatus}}  
                
                // - player_orderGrowingTreeUpdater == thirdChar_storyStatus:
                //     ~ player_thirdStepStatus += airStatus
                // - player_orderGrowingTreeUpdater == fourthChar_storyStatus:
                //     ~ player_fourthStepStatus += airStatus
                // - player_orderGrowingTreeUpdater == fifthChar_storyStatus:
                //     ~ player_fifthStepStatus += airStatus
                      - else:
                        ERRORE
            }        
        
        - (temp_PGFire> temp_PGWater) && (temp_PGFire> temp_PGAir) && (temp_PGFire> temp_PGEarth) && (temp_PGFire> temp_PGAether):
            {
                - player_orderGrowingTreeUpdater == player_firstStepClosed:
                    ~ player_firstStepStatus = ()
                    ~ player_firstStepStatus += fireStatus
                    {debug: Lo status di player_firstStepStatus è {player_firstStepStatus}}
                
                - player_orderGrowingTreeUpdater == player_secondStepClosed:
                    ~ player_secondStepStatus = ()
                    ~ player_secondStepStatus += fireStatus
                    {debug: Lo status di player_secondStepStatus è {player_secondStepStatus}}  
                
                // - player_orderGrowingTreeUpdater == thirdChar_storyStatus:
                //     ~ player_thirdStepStatus += fireStatus
                // - player_orderGrowingTreeUpdater == fourthChar_storyStatus:
                //     ~ player_fourthStepStatus += fireStatus
                // - player_orderGrowingTreeUpdater == fifthChar_storyStatus:
                //     ~ player_fifthStepStatus += fireStatus
                     - else:
                        ERRORE
            }    
        
        - (temp_PGEarth > temp_PGWater) && (temp_PGEarth > temp_PGAir) && (temp_PGEarth > temp_PGFire) && (temp_PGEarth > temp_PGAether):
            {
                - player_orderGrowingTreeUpdater == player_firstStepClosed:
                    ~ player_firstStepStatus = ()
                    ~ player_firstStepStatus += earthStatus
                    {debug: Lo status di player_firstStepStatus è {player_firstStepStatus}}
                
                - player_orderGrowingTreeUpdater == player_secondStepClosed:
                    ~ player_secondStepStatus = ()
                    ~ player_secondStepStatus += earthStatus
                    {debug: Lo status di player_secondStepStatus è {player_secondStepStatus}}  
                
                // - player_orderGrowingTreeUpdater == thirdChar_storyStatus:
                //     ~ player_thirdStepStatus += earthStatus
                // - player_orderGrowingTreeUpdater == fourthChar_storyStatus:
                //     ~ player_fourthStepStatus += earthStatus
                // - player_orderGrowingTreeUpdater == fifthChar_storyStatus:
                //     ~ player_fifthStepStatus += earthStatus
                     - else:
                        ERRORE
            }    
        
        - (temp_PGAether > temp_PGWater) && (temp_PGAether > temp_PGAir) && (temp_PGAether > temp_PGFire) && (temp_PGAether > temp_PGEarth):
            {
                - player_orderGrowingTreeUpdater == player_firstStepClosed:
                    ~ player_firstStepStatus = ()
                    ~ player_firstStepStatus += aetherStatus
                    {debug: Lo status di player_firstStepStatus è {player_firstStepStatus}}
                
                - player_orderGrowingTreeUpdater == player_secondStepClosed:
                    ~ player_secondStepStatus = ()
                    ~ player_secondStepStatus += aetherStatus
                    {debug: Lo status di player_secondStepStatus è {player_secondStepStatus}}  
                
                // - player_orderGrowingTreeUpdater == thirdChar_storyStatus:
                //     ~ player_thirdStepStatus += aetherStatus
                // - player_orderGrowingTreeUpdater == fourthChar_storyStatus:
                //     ~ player_fourthStepStatus += aetherStatus
                // - player_orderGrowingTreeUpdater == fifthChar_storyStatus:
                //     ~ player_fifthStepStatus += aetherStatus
                     - else:
                        ERRORE
            }
        
        // - else:
        //     {
        //         - player_orderGrowingTreeUpdater == player_firstStepClosed:
        //             ~ player_firstStepStatus = ()
        //             ~ player_thirdStepStatus += mixedStatus
        //             {debug: Lo status di player_firstStepStatus è {player_firstStepStatus}}
                    
        //         - player_orderGrowingTreeUpdater == player_secondStepClosed:
        //             ~ player_secondStepStatus = ()
        //             ~ player_thirdStepStatus += mixedStatus
        //             {debug: Lo status di player_secondStepStatus è {player_secondStepStatus}}  
                    
        //         // - player_orderGrowingTreeUpdater == thirdChar_storyStatus:
        //         //     ~ player_thirdStepStatus += mixedStatus
        //         // - player_orderGrowingTreeUpdater == fourthChar_storyStatus:
        //         //     ~ player_fourthStepStatus += mixedStatus
        //         // - player_orderGrowingTreeUpdater == fifthChar_storyStatus:
        //         //     ~ player_fifthStepStatus += mixedStatus
        //              - else:
        //                 ERRORE
        //     }    
    
    }


