//Nome giocatrice e pronouns
    VAR name = "Senza nome"
    LIST pronouns = him, her, they

//Gestione "cose strane" di cui parlare con mentore
    VAR somethingStrange = 0

//Tracciamento colori giocatrice
    VAR playerPurple = 0
    VAR playerYellow = 0
    VAR playerBlue = 0
    VAR playerGreen = 0
    VAR playerRed = 0

//Per funzione aggiornamento colore
    VAR red = ()
    VAR green = ()
    VAR blue = ()
    VAR yellow = ()
    VAR purple  = ()    
    

// Tracciamento esiti
    LIST playerStatus = emptyStatus, blueStatus, purpleStatus, greenStatus, yellowStatus, redStatus, mixedStatus
    LIST statusPGEndingStories = firstStoryPG, secondStoryPG, thirdStoryPG, fourthStoryPG, fifthStoryPG
    
    VAR playerFirstStory = emptyStatus
    VAR playerSecondStory = emptyStatus
    VAR playerThirdStory = emptyStatus
    VAR playerFourthStory = emptyStatus
    VAR playerFifthStory = emptyStatus

//Traccio gli spostamenti della personaggia per gestire la comparsa delle personagge
    VAR movementsCounter = 0


//Variabili per tracciare i trigger warning. True = non è TW, posso mostrare quelle storie
    VAR ageism = true
    VAR abuses = true
    VAR alcoholism = true
    VAR mourning = true
    VAR fisicalAbuses = true
    VAR dysphoria = true
    VAR sex = true
    VAR religion = true
    VAR depression = true
    VAR racism = true
    VAR misoginy = true
    VAR abilism = true
    VAR LGBTQIA = true
    VAR fatphobia = true


/* ---------------------------------

      Functions 

 ----------------------------------*/


//Per assegnare/cambiare pronouns di riferimento
=== gender ===
    <i>Quali pronomi ti fanno sentire <i>te</i>?</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
    
    + {gender> 1} Mi trovo a mio agio con i pronomi {pronouns has him:maschili|{pronouns has her:femminili|neutri}}.
        ->->
    + {gender > 1} Qualcosa è cambiato, questi non sono più i miei pronomi.
        -> top
    + ->
    
    - (top)
        + [Mi trovo a mio agio col maschile.]
            ~ pronouns = ()
            ~ pronouns += him
        
        + [Preferisco i pronomi femminili.]
            ~ pronouns = ()
            ~ pronouns += her
        
        + [Vai di neutro.]
            ~ pronouns = ()
            ~ pronouns += they
        -
        ->->

//Per la scelta del nome
=== name_choice ===
    <i>C'è qualcosa che vuoi dirci sul tuo nome?</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
    + {name_choice > 1} Il mio nome è {name}.
        ->->
    
    + {name_choice > 1} Non sento più questo nome come mio.
        -> top
    
    + ->
    
    - (top)
        Il mio nome è...#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
        ~ name = "{~ Alessio|Gianni|Matteo|Alessandro|Lorenzo|Diego|Tommaso|Riccardo|Leonardo|Gabriele|Edoardo|Samuele|Liam|Nathan|Noah|Enea|Cesare|Ivo|Arturo|Nevio|Ettore|Roberto|Valerio|Pierluigi|Gianmaria|Gianmarco|Maurizio|Emanuele|Niccolò|Nicola|Filippo|Santiago|Alberto|Corrado|Ernesto|Giuliano|Ivan|Juri|Lupo|Tancredi|Jacob|Micahel|Ethan|Joshua|Daniel|Aurelio|Mario|Stefano|Cristian|Carmine|Ciro|Corrado|Carlo|Cesare|Carlo|Dante|Dario|Davide|Damiano|Diego|Domenico|Dino|Eugenio|Flavio|Filippo|Fabio|Francesco|Gaetano|Giordano|Giovanni|Alex|Alexander|Luca|Jacopo|Milo|Cristiano|Thomas|Lucas|Joele|Massimo|Giosuè|Oliver|William|James|Lucas|Henry|John|Ryan|Ethan|Gus|Logan|Nolan|Sean|Tyler|Ursula|Adowa|Amina|Fayola|Dara|Makena|Rashida|Zahra|Ashaki|Obioma|Terehasa|Zainabu|Busara|Dafina|Kamohelo|Mbhali|Aya|Mariam|Adama|Fatouma|Jeannette|Hong|Yu|Min|Xin|Bin|Cheng|Zhen|Eriko|Fujiko|Ikuyo|Keiko|Madoka|Natsumi|Rumiko|Ryo|Toyoko|Yumi|Yuki|Tamafune|Kaori|Chikako|Atsuko|Shaila|Ravi|Gita|Manju|Urmila|Sita|Nirmala|Savita|Kamal|Aadhya|Bimala|Chandra|Uma|Rita|Maura|Giulia|Francesca|Cecilia|Ilaria|Vittoria|Cinzia|Marisa|Antonia|Antonietta|Valeria|Maria|Olga|Tatyana|Natalya|Irina|Svetlana|Ekaterina|Cristina|Kristina|Emma|Jade|Louise|Chloé|Camille|Inès|Sarah|Ivy|Taylor|Sophia|Rosie|Poppy|Sienna|Karen|Ruby|Eva|Violet|Margot|Aurora|Elizabeth|Scarlett|Virginia|Atsushi|Dalai|Edoardo |Haoyu|Ming|Masao|Toshi|Song|Wei|Lang|Wei|Akio|Akihiro|Fumihiko|Bishamon|Chikayoshi|Daiichi|Fumihiro|Genjo|Hiromu|Mitsuo|Vyomesh|Vishwatma|Umachandra|Tarkesh|Sujan|Ranjeet|Mattia|Gabriele|Marco|Prajit|Nripendra|Kundan|Sergey|Aleksandr|Roman|Denis|Igor|Anton|Lev|Pavel|Kirill|Oleg|Stanislav|Antoine|Alexandre|Étienne|François|Henri|Louis|Olivier|Pierre|Vincent|Paul|Almira|Amalia|Charo|Carmen|Clarissa|Elena|Claudia|Estella|Zita|Zoe|Veronica|Fabio|Felix|Jago|Jose|Jorde|Rodrigo|Sergio|Andrea|Harper|Dakota|Blue|Elliot|Kraken|Charlie|Avery|Jordan |Felice|Noah|Celeste|Fiore|Diamante|Evan|Leslie|Lago|Fiume|Casey|Harper|Sidney|Gail|Syb|Max|Nicky|Sasha|Carmine|Beatrice|Asad|Danilo|Sissi|Javi|Salvo|Sven|Jacopo|Letizia|Ren|Pablo|Guido|Arianna|Simão|Nicolò|Ivana}"
        
        + (nome_scelto)[<b><i>{name}</b>]
        + [No, non è questo il mio nome.]
            -> top
        - 
            ->->

=== function PG_advance_management(charES)
{debug: <i>Passo per PG_advance_managemente. Il valore di charES è {charES}.}

{
	- LIST_COUNT(endedStories) == 1:
	   {debug: <i>L'elenco di oggetti nella lista endendStories è {endedStories}, pari a 1. Per questo vado ad assegnare il valore di prima storia finita a {charES}.}
		~ char = firstStoryPG
		{
			- charES == firstStoryPG:
				~ charOneEnding = firstEnd
			{debug: <i>Dato che charES coincide con {charES}. Il valore di charOneEnding è {charOneEnding}.}
			
			- charES == secondStoryPG:
				~ charTwoEnding = firstEnd
			{debug: <i>Dato che charES coincide con {charES}. Il valore di charTwoEnding è {charTwoEnding}.}
						
			- charES == thirdStoryPG:
				~ charThreeEnding = firstEnd
			{debug: <i>Dato che charES coincide con {charES} Il valore di charThreeEnding è {charThreeEnding}.}	
		}
		
	- LIST_COUNT(endedStories) == 2:
		~ char = secondStoryPG
		{
			- charES == firstStoryPG:
				~ charOneEnding = secondEnd
			{debug: <i>Dato che charES coincide con {charES}. Il valore di charOneEnding è {charOneEnding}.}	
			
			- charES == secondStoryPG:
				~ charTwoEnding = secondEnd
			{debug: <i>Dato che charES coincide con {charES}. Il valore di charTwoEnding è {charTwoEnding}.}	
			
			- charES == thirdStoryPG:
				~ charThreeEnding = secondEnd
			{debug: <i>Dato che charES coincide con {charES} Il valore di charThreeEnding è {charThreeEnding}.}	
		}		
		
		
	 - LIST_COUNT(endedStories) == 3:
		 ~char = thirdStoryPG
		{
			- charES == firstStoryPG:
				~ charOneEnding = thirdEnd
			
			- charES == secondStoryPG:
				~ charTwoEnding = thirdEnd
			
			- charES == thirdStoryPG:
				~ charThreeEnding = thirdEnd	
		}		 
		 
		 
		 
}


{debug: <i>Ho finito di assegnare l'ordine di conclusione delle storie, e passo ad aggiornare i colori.}

    {
        - char == firstStoryPG:
            ~ red = firstRed
            ~ green = firstGreen
            ~ blue = firstBlue
            ~ yellow = firstYellow
            ~ purple = firstPurple
            
        - char == secondStoryPG:
            ~ red = secondRed
            ~ green = secondGreen
            ~ blue = secondBlue
            ~ yellow = secondYellow
            ~ purple = secondPurple
            
    
    }

    //Qui aggiorno i valori delle scelte della player
    ~ playerRed = playerRed + red
        {debug: Il valore di PlayerRed è {playerRed}}
    ~ playerPurple = playerPurple + purple
        {debug: Il valore di playerPurple è {playerPurple}}
    ~ playerGreen = playerGreen + green
        {debug: Il valore di playerGreen è {playerGreen}}
    ~ playerYellow = playerYellow + yellow
        {debug: Il valore di playerYellow è {playerYellow}}
    ~ playerBlue = playerBlue + blue
        {debug: Il valore di playerBlue è {playerBlue}}


    //E poi confronto quella che è la storia della personaggia, la progressione delle sue scelte: di fatto per ora basta che non ci siano pareggi tra colori per evitare il marrone. A quel punto emerge il colore dominante.
    {
        - (playerGreen > playerBlue) && (playerGreen > playerRed) && (playerGreen > playerYellow) && (playerGreen > playerPurple):
            
            {
                - char == firstStoryPG:
                    ~ playerFirstStory = ()
                    ~ playerFirstStory += greenStatus
                   {debug: Lo status di playerFirstStory è {playerFirstStory}}
                
                - char == secondStoryPG:
                    ~ playerSecondStory = ()
                    ~ playerSecondStory += greenStatus
                    {debug: Lo status di playerSecondStory è {playerSecondStory}}    
                // - char == thirdStory:
                //     ~ playerThirdStory += greenStatus
                // - char == fourthStory:
                //     ~ playerFourthStory += greenStatus
                // - char == fifthStory:
                //     ~ playerFifthStory += greenStatus
                      - else:
                        ERRORE
            }
        
        - (playerBlue > playerGreen) && (playerBlue > playerRed) && (playerBlue > playerYellow) && (playerBlue > playerPurple):
            {
                - char == firstStoryPG:
                    ~ playerFirstStory = ()
                    ~ playerFirstStory += blueStatus
                    {debug: Lo status di playerFirstStory è {playerFirstStory}}
                
                - char == secondStoryPG:
                    ~ playerSecondStory = ()
                    ~ playerSecondStory += blueStatus
                    {debug: Lo status di playerSecondStory è {playerSecondStory}}  
                
                // - char == thirdStory:
                //     ~ playerThirdStory += blueStatus
                // - char == fourthStory:
                //     ~ playerFourthStory += blueStatus
                // - char == fifthStory:
                //     ~ playerFifthStory += blueStatus
                      - else:
                        ERRORE
            }        
        
        - (playerRed > playerGreen) && (playerRed > playerBlue) && (playerRed > playerYellow) && (playerRed > playerPurple):
            {
                - char == firstStoryPG:
                    ~ playerFirstStory = ()
                    ~ playerFirstStory += redStatus
                    {debug: Lo status di playerFirstStory è {playerFirstStory}}
                
                - char == secondStoryPG:
                    ~ playerSecondStory = ()
                    ~ playerSecondStory += redStatus
                    {debug: Lo status di playerSecondStory è {playerSecondStory}}  
                
                // - char == thirdStory:
                //     ~ playerThirdStory += redStatus
                // - char == fourthStory:
                //     ~ playerFourthStory += redStatus
                // - char == fifthStory:
                //     ~ playerFifthStory += redStatus
                     - else:
                        ERRORE
            }    
        
        - (playerYellow > playerGreen) && (playerYellow > playerBlue) && (playerYellow > playerRed) && (playerYellow > playerPurple):
            {
                - char == firstStoryPG:
                    ~ playerFirstStory = ()
                    ~ playerFirstStory += yellowStatus
                    {debug: Lo status di playerFirstStory è {playerFirstStory}}
                
                - char == secondStoryPG:
                    ~ playerSecondStory = ()
                    ~ playerSecondStory += yellowStatus
                    {debug: Lo status di playerSecondStory è {playerSecondStory}}  
                
                // - char == thirdStory:
                //     ~ playerThirdStory += yellowStatus
                // - char == fourthStory:
                //     ~ playerFourthStory += yellowStatus
                // - char == fifthStory:
                //     ~ playerFifthStory += yellowStatus
                     - else:
                        ERRORE
            }    
        
        - (playerPurple > playerGreen) && (playerPurple > playerBlue) && (playerPurple > playerRed) && (playerPurple > playerYellow):
            {
                - char == firstStoryPG:
                    ~ playerFirstStory = ()
                    ~ playerFirstStory += purpleStatus
                    {debug: Lo status di playerFirstStory è {playerFirstStory}}
                
                - char == secondStoryPG:
                    ~ playerSecondStory = ()
                    ~ playerSecondStory += purpleStatus
                    {debug: Lo status di playerSecondStory è {playerSecondStory}}  
                
                // - char == thirdStory:
                //     ~ playerThirdStory += purpleStatus
                // - char == fourthStory:
                //     ~ playerFourthStory += purpleStatus
                // - char == fifthStory:
                //     ~ playerFifthStory += purpleStatus
                     - else:
                        ERRORE
            }
        
        - else:
            {
                - char == firstStoryPG:
                    ~ playerFirstStory = ()
                    ~ playerFirstStory += yellowStatus
                    {debug: Lo status di playerFirstStory è {playerFirstStory}}
                    
                - char == secondStoryPG:
                    ~ playerSecondStory = ()
                    ~ playerSecondStory += yellowStatus
                    {debug: Lo status di playerSecondStory è {playerSecondStory}}  
                    
                // - char == thirdStory:
                //     ~ playerThirdStory += mixedStatus
                // - char == fourthStory:
                //     ~ playerFourthStory += mixedStatus
                // - char == fifthStory:
                //     ~ playerFifthStory += mixedStatus
                     - else:
                        ERRORE
            }    
    
    }


