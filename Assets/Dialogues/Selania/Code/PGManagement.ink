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
    + {gender> 1} Mi trovo a mio agio con i pronomi {pronouns has him: maschili|{pronouns has her: femminili|neutri}}.
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
    <i>C'è qualcosa che vuoi dirci sul tuo nome?</i>#speaker:{fungus_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait:fungus_neutral
    + {name_choice > 1} Il mio nome è {name}.
        ->->
    
    + {name_choice > 1} Non sento più questo nome come mio.
        -> top
    
    + ->
    
    - (top)
        Il mio nome è...
        ~ name = "{~ Alessio|Gianni|Matteo|Alessandro|Lorenzo|Diego|Tommaso|Riccardo|Leonardo|Gabriele|Edoardo|Samuele|Liam|Nathan|Noah|Enea|Cesare|Ivo|Arturo|Nevio|Ettore|Roberto|Valerio|Pierluigi|Gianmaria|Gianmarco|Maurizio|Emanuele|Niccolò|Nicola|Filippo|Santiago|Alberto|Corrado|Ernesto|Giuliano|Ivan|Juri|Lupo|Tancredi|Jacob|Micahel|Ethan|Joshua|Daniel|Aurelio|Mario|Stefano|Cristian|Carmine|Ciro|Corrado|Carlo|Cesare|Carlo|Dante|Dario|Davide|Damiano|Diego|Domenico|Dino|Eugenio|Flavio|Filippo|Fabio|Francesco|Gaetano|Giordano|Giovanni|Alex|Alexander|Luca|Jacopo|Milo|Cristiano|Thomas|Lucas|Joele|Massimo|Giosuè|Oliver|William|James|Lucas|Henry|John|Ryan|Ethan|Gus|Logan|Nolan|Sean|Tyler|Ursula|Adowa|Amina|Fayola|Dara|Makena|Rashida|Zahra|Ashaki|Obioma|Terehasa|Zainabu|Busara|Dafina|Kamohelo|Mbhali|Aya|Mariam|Adama|Fatouma|Jeannette|Hong|Yu|Min|Xin|Bin|Cheng|Zhen|Eriko|Fujiko|Ikuyo|Keiko|Madoka|Natsumi|Rumiko|Ryo|Toyoko|Yumi|Yuki|Tamafune|Kaori|Chikako|Atsuko|Shaila|Ravi|Gita|Manju|Urmila|Sita|Nirmala|Savita|Kamal|Aadhya|Bimala|Chandra|Uma|Rita|Maura|Giulia|Francesca|Cecilia|Ilaria|Vittoria|Cinzia|Marisa|Antonia|Antonietta|Valeria|Maria|Olga|Tatyana|Natalya|Irina|Svetlana|Ekaterina|Cristina|Kristina|Emma|Jade|Louise|Chloé|Camille|Inès|Sarah|Ivy|Taylor|Sophia|Rosie|Poppy|Sienna|Karen|Ruby|Eva|Violet|Margot|Aurora|Elizabeth|Scarlett|Virginia|Atsushi|Dalai|Edoardo |Haoyu|Ming|Masao|Toshi|Song|Wei|Lang|Wei|Akio|Akihiro|Fumihiko|Bishamon|Chikayoshi|Daiichi|Fumihiro|Genjo|Hiromu|Mitsuo|Vyomesh|Vishwatma|Umachandra|Tarkesh|Sujan|Ranjeet|Mattia|Gabriele|Marco|Prajit|Nripendra|Kundan|Sergey|Aleksandr|Roman|Denis|Igor|Anton|Lev|Pavel|Kirill|Oleg|Stanislav|Antoine|Alexandre|Étienne|François|Henri|Louis|Olivier|Pierre|Vincent|Paul|Almira|Amalia|Charo|Carmen|Clarissa|Elena|Claudia|Estella|Zita|Zoe|Veronica|Fabio|Felix|Jago|Jose|Jorde|Rodrigo|Sergio|Andrea|Harper|Dakota|Blue|Elliot|Kraken|Charlie|Avery|Jordan |Felice|Noah|Celeste|Fiore|Diamante|Evan|Leslie|Lago|Fiume|Casey|Harper|Sidney|Gail|Syb|Max|Nicky|Sasha|Carmine|Beatrice|Asad|Danilo|Sissi|Javi|Salvo|Sven|Jacopo|Letizia|Ren|Pablo|Guido|Arianna|Simão|Nicolò|Ivana}"
        
        + (nome_scelto)[<b>{name}</b>]
        + [No, non è questo il mio nome.]
            -> top
        - 
            ->->

=== function PG_advace_management(char)
VAR red = ()
VAR green = ()
VAR blue = ()
VAR yellow = ()
VAR purple  = ()

    {
        - char == firstStoryPG:
            ~ red = firstRed
            ~ green = firstGreen
            ~ blue = firstBlue
            ~ yellow = firstYellow
            ~ purple = firstPurple
            ~ playerFirstStory = ()
    
        - char == secondStoryPG:
            ~ red = secondRed
            ~ green = secondGreen
            ~ blue = secondBlue
            ~ yellow = secondYellow
            ~ purple = secondPurple
            ~ playerSecondStory = ()
    
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
                   ~ playerFirstStory += greenStatus
                   {debug: Lo status di playerFirstStory è {playerFirstStory}}
                
                - char == secondStoryPG:
                    ~ playerSecondStory += greenStatus
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
                    ~ playerFirstStory += blueStatus
                    {debug: Lo status di playerFirstStory è {playerFirstStory}}
                
                - char == secondStoryPG:
                    ~ playerSecondStory += blueStatus
                
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
                    ~ playerFirstStory += redStatus
                    {debug: Lo status di playerFirstStory è {playerFirstStory}}
                
                - char == secondStoryPG:
                    ~ playerSecondStory += redStatus
                
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
                    ~ playerFirstStory += yellowStatus
                    {debug: Lo status di playerFirstStory è {playerFirstStory}}
                
                - char == secondStoryPG:
                    ~ playerSecondStory += yellowStatus
                
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
                    ~ playerFirstStory += purpleStatus
                    {debug: Lo status di playerFirstStory è {playerFirstStory}}
                
                - char == secondStoryPG:
                    ~ playerSecondStory += purpleStatus
                
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
                    ~ playerFirstStory += mixedStatus
                    {debug: Lo status di playerFirstStory è {playerFirstStory}}
                    
                - char == secondStoryPG:
                    ~ playerSecondStory += mixedStatus
                    
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


