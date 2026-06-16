//Nome giocatrice e player_pronoun
    VAR player_name = ""
    VAR player_nameChosen = false
    LIST possibile_player_pronouns = (him), (her), (they)
    VAR player_pronoun = ()

//Tracciamento del riposo.
    //Dalle impostazioni può abilitare/disabilitare le notifiche per il riposo
    VAR player_restingSessionNotification = true
    VAR player_lastRestingSession = 0
    VAR player_maxPlayingTime = 100
    //Questo è il valore a cui viene portato player_lastRestingSession dopo la notifica di invito al riposo, in modo da evitare una notifica troppo frequente, ma anche da non far passare lo stesso tempo da inizio sessione.
    VAR player_notificationRestingReset = 50

    
//Gestione "cose strane" di cui parlare con mentore
    LIST player_somethingStrange = strangeFrog, strangeVoice, strangeGrimoire, strangeVase, strangeMentor, strangeBoccale
    VAR player_somethingStrangeTalkable = ()
    
//Tracciamento dei luoghi accessibili alla giocatrice
    VAR player_accessiblePlaces = (Bedroom, TrainStop, Forest, Pond)

//Ricetta cucinata con la rana
    VAR kitchen_PGRecipe = ""
        //Valore ingredienti
        VAR kitchen_PGRecipeNoun = ""
        VAR kitchen_PGRecipeAdjective = ""
        VAR kitchen_PGRecipeComplement = ""   

//Tracciamento colori giocatrice
    //Colori con cui traccio le scelte che riguardano "solo" me
    VAR player_aether = 0
    VAR player_earth = 0
    VAR player_air = 0
    VAR player_water = 0
    VAR player_fire = 0
    
    //Scelte prima pg
    VAR player_aether_first_char = 0
    VAR player_earth_first_char = 0
    VAR player_air_first_char = 0
    VAR player_water_first_char = 0
    VAR player_fire_first_char = 0
    
    //Scelte secondo pg
    VAR player_aether_second_char = 0
    VAR player_earth_second_char = 0
    VAR player_air_second_char = 0
    VAR player_water_second_char = 0
    VAR player_fire_second_char = 0
    
    //Scelte mentore
    VAR player_aether_mentor = 0
    VAR player_earth_mentor = 0
    VAR player_air_mentor = 0
    VAR player_water_mentor = 0
    VAR player_fire_mentor = 0
    
    //Scelte terzo pg
    VAR player_aether_third_char = 0
    VAR player_earth_third_char = 0
    VAR player_air_third_char = 0
    VAR player_water_third_char = 0
    VAR player_fire_third_char = 0

   //Scelte quarta pg
    VAR player_aether_fourth_char = 0
    VAR player_earth_fourth_char = 0
    VAR player_air_fourth_char = 0
    VAR player_water_fourth_char = 0
    VAR player_fire_fourth_char = 0


    //Scelte quinta pg
    VAR player_aether_fifth_char = 0
    VAR player_earth_fifth_char = 0
    VAR player_air_fifth_char = 0
    VAR player_water_fifth_char = 0
    VAR player_fire_fifth_char = 0 
    
    
    
//Per funzione aggiornamento colore: tengono conto del valore di quel colore dellx PNG la cui storia è stata appena conclusa
    VAR temp_PGFire= 0
    VAR temp_PGWater = 0
    VAR temp_PGAir = 0
    VAR temp_PGEarth = 0
    VAR temp_PGAether  = 0    
    

    //Rapporto tra possibili status della crescita dell'albero e valore numerico, per gestire il cambio di assets in ink
    CONST emptyStatus = 0
    CONST airStatus = 1
    CONST earthStatus = 2
    CONST fireStatus = 3
    CONST aetherStatus = 4
    CONST waterStatus = 5


    //Lista per gestire la fase intermedia della funzione, quando passo da numeri a "oggetti"
    LIST list_intermediateTreeStatus = airTree, earthTree, fireTree, waterTree, aetherTree


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


//Per assegnare/cambiare player_pronoun di riferimento
=== gender ===
    {
        - gender == 1:
            {charTag(TheWitch, witch_state())}:   <i>Quali sono i pronomi di {player_name}?</i>

        - else:
            {charTag(PG, "neutral")}:      {charTag(PG, "neutral")}   E per quanto riguarda i miei pronomi:
    }
    
    
    + {gender > 1} \ {charTag(PG, "neutral")}:         Chiamami coi pronomi {player_pronoun has him:maschili|{player_pronoun has her:femminili|neutri}}.
        ->->
    + {gender > 1} \ {charTag(PG, "neutral")}:         <i>Cambio i miei pronomi.
        -> top
    + ->
    
    - (top)
    {charTag(PG, "neutral")}: I miei pronomi sono...
        + \ {charTag(PG, "neutral")}:         Mi trovo a mio agio col maschile.
            ~ player_pronoun = ()
            ~ player_pronoun += him
        
        + \ {charTag(PG, "neutral")}:         Preferisco i pronomi femminili.
            ~ player_pronoun = ()
            ~ player_pronoun += her
        
        + \ {charTag(PG, "neutral")}:         Vai di neutro.
            ~ player_pronoun = ()
            ~ player_pronoun += they
        -
        ->->

//Per la scelta del nome
=== name_choice ===
    {charTag(TheWitch, witch_state())}:   <i>Un nome è un incantesimo, una possibilità.
    <i>Quale nome verrà pronunciato?

    - (top2)
    
        + {name_choice > 1} \ {charTag(PG, "neutral")}:         Il mio nome è {player_name}.
            ->->
        
        + {name_choice > 1}\ {charTag(PG, "neutral")}:         <i>Voglio cambiare nome.
            ~ player_nameChosen = false
            -> top
        
        + ->
    
    - (top)
        {charTag(PG, "neutral")}:       Il mio nome è...
        ~ temp random_name1 = get_random_name()
        ~ temp random_name2 = get_random_name()
        ~ temp random_name3 = get_random_name()
        
        + \ {charTag(PG, "neutral")}:         <b>{random_name1}</b>
            ~ player_name = random_name1
            ~ player_nameChosen = true
        + \ {charTag(PG, "neutral")}:         <b>{random_name2}</b>
            ~ player_name = random_name2
            ~ player_nameChosen = true
        + \ {charTag(PG, "neutral")}:         <b>{random_name3}</b>
            ~ player_name = random_name3
            ~ player_nameChosen = true
        + \ {charTag(PG, "neutral")}:         <i>No, non è questo il mio nome.
            ~ player_nameChosen = false
            -> top
        - 
            ->->



        === function get_random_name()
            ~ temp random_name = "{~ Alessio|Gianni|Matteo|Alessandro|Lorenzo|Diego|Tommaso|Riccardo|Leonardo|Gabriele|Edoardo|Samuele|Liam|Nathan|Noah|Enea|Cesare|Ivo|Arturo|Nevio|Ettore|Roberto|Valerio|Pierluigi|Gianmaria|Gianmarco|Maurizio|Emanuele|Niccolò|Nicola|Filippo|Santiago|Alberto|Corrado|Ernesto|Giuliano|Ivan|Juri|Lupo|Tancredi|Jacob|Micahel|Ethan|Joshua|Daniel|Aurelio|Mario|Stefano|Cristian|Carmine|Ciro|Corrado|Carlo|Cesare|Carlo|Dante|Davide|Damiano|Diego|Domenico|Dino|Eugenio|Flavio|Filippo|Fabio|Francesco|Gaetano|Giordano|Giovanni|Alex|Alexander|Luca|Jacopo|Milo|Cristiano|Thomas|Lucas|Joele|Massimo|Giosuè|Oliver|William|James|Henry|John|Ryan|Ethan|Gus|Logan|Nolan|Sean|Tyler|Ursula|Adowa|Amina|Fayola|Dara|Makena|Rashida|Zahra|Ashaki|Obioma|Terehasa|Zainabu|Busara|Dafina|Kamohelo|Mbhali|Aya|Mariam|Adama|Fatouma|Jeannette|Hong|Yu|Min|Xin|Bin|Cheng|Zhen|Eriko|Fujiko|Ikuyo|Keiko|Madoka|Natsumi|Rumiko|Ryo|Toyoko|Yumi|Yuki|Tamafune|Kaori|Chikako|Atsuko|Shaila|Ravi|Gita|Manju|Urmila|Sita|Nirmala|Savita|Kamal|Aadhya|Bimala|Chandra|Uma|Rita|Maura|Giulia|Francesca|Cecilia|Ilaria|Vittoria|Cinzia|Marisa|Antonia|Antonietta|Valeria|Maria|Olga|Tatyana|Natalya|Irina|Svetlana|Ekaterina|Cristina|Kristina|Emma|Jade|Louise|Chloé|Camille|Inès|Sarah|Ivy|Taylor|Sophia|Rosie|Poppy|Sienna|Karen|Ruby|Eva|Violet|Margot|Aurora|Elizabeth|Scarlett|Virginia|Atsushi|Dalai|Edoardo |Haoyu|Ming|Masao|Toshi|Song|Wei|Lang|Wei|Akio|Akihiro|Fumihiko|Bishamon|Chikayoshi|Daiichi|Fumihiro|Genjo|Hiromu|Mitsuo|Vyomesh|Vishwatma|Umachandra|Tarkesh|Sujan|Ranjeet|Mattia|Gabriele|Marco|Prajit|Nripendra|Kundan|Sergey|Aleksandr|Roman|Denis|Igor|Anton|Lev|Pavel|Kirill|Oleg|Stanislav|Antoine|Alexandre|Étienne|François|Henri|Louis|Olivier|Pierre|Vincent|Paul|Almira|Amalia|Charo|Carmen|Clarissa|Elena|Claudia|Estella|Zita|Zoe|Veronica|Felix|Jago|Jose|Jorde|Rodrigo|Sergio|Andrea|Harper|Dakota|Blue|Elliot|Kraken|Charlie|Avery|Jordan |Felice|Noah|Celeste|Fiore|Diamante|Evan|Leslie|Lago|Fiume|Casey|Harper|Sidney|Gail|Syb|Max|Nicky|Sasha|Carmine|Beatrice|Asad|Danilo|Sissi|Javi|Salvo|Sven|Jacopo|Letizia|Ren|Pablo|Guido|Arianna|Simão|Nicolò|Ivana|Lorena|Benedetta|Loris|Tosca|Federica|Fausto|Jay|Mauro|Adriano|Adriene|Romeo|Romi|Simone|Alexias|Alexis|Salvatore|{firstChar_storyStatus == story_storyPostal:Chitarra|Tappo}|{firstChar_storyStatus == story_storyPostal:Triangolo|Joni}|{firstChar_storyStatus == story_storyPostal:Ocarina|Camillo}|{firstChar_storyStatus == story_storyPostal:Orchestra|Giorgia}|{firstChar_storyStatus == story_storyPostal:Flauto|Dalida}|{firstChar_storyStatus == story_storyPostal:Violino|Magda}|{secondChar_storyStatus == story_storyPostal:Riccio|Xavier}|{secondChar_storyStatus == story_storyPostal:Grizzly|Timoteo}|{secondChar_storyStatus == story_storyPostal:Lupo|Dick}|{secondChar_storyStatus == story_storyPostal:Delfino|Anselmo}|{secondChar_storyStatus == story_storyPostal:Capibara|Jeanne}|{secondChar_storyStatus == story_storyPostal:Corvo|Baldo}}"
            ~ return random_name




=== function state_ending_stories(charES)
{debug: <i>Passo per state_ending_stories. Il valore di charES è {charES}.}
//Chiamo questa funzione a fine di una riscrittura, inserendo il valore della personaggia (es: player_firstStepClosed).
//Controllo quante sono le storie concluse, in modo da poter inserire quella personaggia nell'ordine di conclusione delle storie previsto (es: se c'è già una storia chiusa in story_endedStories e ho chiuso player_firstStepClosed, allora metterò firstChar_storyEndingPosition come story_twoStoriesClosed.
{
	- LIST_COUNT(story_endedStories) == 1:
	   {debug: <i>L'elenco di oggetti nella lista endedStories è {story_endedStories}, pari a 1. Per questo vado ad assegnare il valore di prima storia finita a {charES}.}
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
    
    - LIST_COUNT(story_endedStories) == 4:
		{
			- charES == FourthCharacter:
				~ fourthChar_storyEndingPosition = story_fourStoriesClosed
			
			- charES == FifthCharacter:
				~ fifthChar_storyEndingPosition = story_fiveStoriesClosed
		}	    	 
		 
	- LIST_COUNT(story_endedStories) == 5:
		{
			- charES == FourthCharacter:
				~ fourthChar_storyEndingPosition = story_fourStoriesClosed
			
			- charES == FifthCharacter:
				~ fifthChar_storyEndingPosition = story_fiveStoriesClosed
		}		 
		 
}



=== function png_random_sigils_opener()
{debug: passo per png_random_sigils_opener}
//L'idea è: valuto i tre glifi meno usati (togliendo da una lista i due più usati), e apro un glifo random per ognuno di loro.
//La realtà: è un gran casino e mi rompo i coglioni.
//Quello che facciamo è per tre volte prendere in modo casuale un sigillo dalla lista di quelli disponibili, spostarlo nei discovered e bona.

    //Lista temporanea == lista di tutti i sigilli del gioco
    ~ temp allSigils = LIST_ALL(glyph_allSigils)
    //A cui tolgo poi quelli già scoperti
    ~ allSigils -= glyph_discoveredSigils
    //Prendo un sigillo casuale
    ~ temp chosenSigil = LIST_RANDOM(allSigils)
    //Aggiungo il sigillo a quelli scoperti
    ~ glyph_discoveredSigils += chosenSigil
    //Aggiungo il sigillo come "nuovo", per le notifiche
    ~ nest_newSigilDiscovered += chosenSigil






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
    	   {debug: <i>L'elenco di oggetti nella lista endedStories è {story_endedStories}, pari a 1. Per questo vado ad assegnare il valore di prima storia finita a {charES}.}
    		~ player_orderGrowingTreeUpdater = player_firstStepClosed
    
    		
    	- LIST_COUNT(story_endedStories) == 2:
    		~ player_orderGrowingTreeUpdater = player_secondStepClosed
    	
    		
    	- LIST_COUNT(story_endedStories) == 3:
    		~ player_orderGrowingTreeUpdater = player_thirdStepClosed


        - LIST_COUNT(story_endedStories) == 4:
    		~ player_orderGrowingTreeUpdater = player_fourthStepClosed


        - LIST_COUNT(story_endedStories) == 5:
    		~ player_orderGrowingTreeUpdater = player_fifthStepClosed        
    
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

        - charES == FourthCharacter:
			~ temp_PGWater = player_water_fourth_char
			~ temp_PGAir = player_air_fourth_char
			~ temp_PGFire= player_fire_fourth_char
			~ temp_PGEarth = player_earth_fourth_char
			~ temp_PGAether = player_aether_fourth_char

        - charES == ThirdCharacter:
			~ temp_PGWater = player_water_fifth_char
			~ temp_PGAir = player_air_fifth_char
			~ temp_PGFire= player_fire_fifth_char
			~ temp_PGEarth = player_earth_fifth_char
			~ temp_PGAether = player_aether_fifth_char       
			
		}

    ~ temp glyphStatus = -1
    // °°°°° VALORI TEMPORANEI
    // temp_PGWater {temp_PGWater}
    // temp_PGAir {temp_PGAir}
    // temp_PGFire {temp_PGFire}
    // temp_PGEarth {temp_PGEarth}
    // temp_PGAether {temp_PGAether}

//E poi confronto quella che è la storia della personaggia, la progressione delle sue scelte: di fatto per ora basta che non ci siano pareggi tra colori per evitare il marrone. A quel punto emerge il colore dominante.
    {
        - (temp_PGWater > temp_PGAir) && (temp_PGWater > temp_PGFire) && (temp_PGWater > temp_PGEarth) && (temp_PGWater > temp_PGAether):
            ~ glyphStatus = waterStatus
        
        - (temp_PGAir > temp_PGWater) && (temp_PGAir > temp_PGFire) && (temp_PGAir > temp_PGEarth) && (temp_PGAir > temp_PGAether):
            ~ glyphStatus = airStatus
        
        - (temp_PGFire> temp_PGWater) && (temp_PGFire> temp_PGAir) && (temp_PGFire> temp_PGEarth) && (temp_PGFire> temp_PGAether):
            ~ glyphStatus = fireStatus
        
        - (temp_PGEarth > temp_PGWater) && (temp_PGEarth > temp_PGAir) && (temp_PGEarth > temp_PGFire) && (temp_PGEarth > temp_PGAether):
            ~ glyphStatus = earthStatus
        
        - (temp_PGAether > temp_PGWater) && (temp_PGAether > temp_PGAir) && (temp_PGAether > temp_PGFire) && (temp_PGAether > temp_PGEarth):
            ~ glyphStatus = aetherStatus
        
        - else:
            //In caso di pareggio cerco di assegnare un nome casuale da quelli più plausibili, sempre secondo la logica qui sopra elemento == nome.
            //Prima di tutto cerco di capire qual è il valore più alto comune.
            ~ temp maxValue = 0
            ~ temp possibileTreeStatus = ()
            {debug: siamo in un pareggio, passo per la fase successiva} 
                {
                    - temp_PGAether > maxValue:
                        ~ maxValue = temp_PGAether
                }
                {
                    - temp_PGWater > maxValue:
                        ~ maxValue = temp_PGWater
                }
                {
                    - temp_PGFire > maxValue:
                        ~ maxValue = temp_PGFire
                }
                {
                    - temp_PGAir > maxValue:
                        ~ maxValue =  temp_PGAir
                }
                {
                    - temp_PGEarth > maxValue:
                        ~ maxValue = temp_PGEarth
                }

            {debug: Il valore massimo raggiunto dai glifi è {maxValue}.}

            //Poi aggiungo alla lista dei potenziali generatori di nomi solo quei glifi che superano il valore medio delle scelte. 
            {
                - temp_PGAether == maxValue:
                        ~ possibileTreeStatus += aetherTree
            }
            {
                - temp_PGWater == maxValue:
                        ~ possibileTreeStatus += waterTree
            }
            {
                - temp_PGFire == maxValue:
                        ~ possibileTreeStatus += fireTree
            }
            {
                - temp_PGAir == maxValue:
                        ~ possibileTreeStatus += airTree
            }
            {
                - temp_PGEarth == maxValue:
                        ~ possibileTreeStatus += earthTree

            } 
            {debug: La lista di possibili status in caso di pareggio è {possibileTreeStatus}.}
            
            // °°°°° VALORI TEMPORANEI
            // possibileTreeStatus {possibileTreeStatus}

            //E infine ne prendo uno casuale dalla lista. 
            ~ temp random_chosenTreeStatus = LIST_RANDOM(possibileTreeStatus)
            //E lo "traduco" nel valore da comunicare a Unity
            {random_chosenTreeStatus:
                - earthTree:
                    ~ glyphStatus = earthStatus

                - airTree:
                    ~ glyphStatus = airStatus

                - fireTree:
                    ~ glyphStatus = fireStatus

                - waterTree:
                    ~ glyphStatus = waterStatus

                - aetherTree:
                    ~ glyphStatus = aetherStatus


            }

        }

        // °°°°° VALORE DEFINITIVO
        // glyphStatus {glyphStatus}

        // associamo il valore calcolato al personaggio corretto
        {
            - player_orderGrowingTreeUpdater == player_firstStepClosed:
                ~ player_firstStepStatus = glyphStatus
                {debug: Lo status di player_firstStepStatus è {player_firstStepStatus}}
            
            - player_orderGrowingTreeUpdater == player_secondStepClosed:
                ~ player_secondStepStatus = glyphStatus
                {debug: Lo status di player_secondStepStatus è {player_secondStepStatus}}    
            
            - player_orderGrowingTreeUpdater == player_thirdStepClosed:
                ~ player_thirdStepStatus = glyphStatus
                {debug: Lo status di player_thirdStepStatus è {player_thirdStepStatus}}   
            
            - player_orderGrowingTreeUpdater == player_fourthStepClosed:
                ~ player_fourthStepStatus = glyphStatus
                {debug: Lo status di player_fourthStepStatus è {player_fourthStepStatus}}   
            
            - player_orderGrowingTreeUpdater == player_fifthStepClosed:
                ~ player_fifthStepStatus = glyphStatus
                {debug: Lo status di player_secondStepStatus è {player_secondStepStatus}}   
            
        }

    



