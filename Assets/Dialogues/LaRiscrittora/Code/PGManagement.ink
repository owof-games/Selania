//Nome giocatrice e pronouns
VAR name = "Senza nome"
LIST pronouns = him, her, they

//Tracciamento colori personaggia
VAR playerPurple = 0
VAR playerYellow = 0
VAR playerBlue = 0
VAR playerGreen = 0
VAR playerRed = 0

// Tracciamento esiti
LIST playerStatus = emptyStatus, blueStatus, purpleStatus, greenStatus, yellowStatus, redStatus, mixedStatus
VAR playerFirstStory = emptyStatus
VAR playerSecondStory = emptyStatus
VAR playerThirdStory = emptyStatus
VAR playerFourthStory = emptyStatus
VAR playerFifthStory = emptyStatus

//Traccio gli spostamenti della personaggia per gestire la comparsa delle personagge
VAR movementsCounter = 0


//Variabili per tracciare i trigger warning. True = non è TW, posso mostrare quelle storie
VAR alcoholism = true
VAR abuses = true
VAR mourning = true
VAR loneliness = true
VAR dysphoria = true
VAR sex = true

/* ---------------------------------

      Functions 

 ----------------------------------*/


//Per assegnare/cambiare pronouns di riferimento
=== gender ===
    + {gender> 1} Mi trovo a mio agio con i pronomi {pronouns has him: maschili|{pronouns has her: femminili|neutri}}.
        ->->
    + {gender > 1} <i>Qualcosa è cambiato, questi non sono più i miei pronomi.</i>
        -> top
    + ->
    - (top)
        + [Mi trovo a mio agio col maschile.]
            ~ pronouns += him
        + [Preferisco i pronomi femminili.]
            ~ pronouns += her
        + [Vai di neutro, ama.]
            ~ pronouns += they
        -
->->

//Per la scelta del nome
=== name_choice ===
    + {name_choice > 1} Il mio nome è {name}.
        ->->
    + {name_choice > 1} <i>Non sento più questo nome come mio.</i>
        -> top
    + ->
    - (top)
        Il mio nome è...
        ~ name = "{~ Alessio|Gianni|Matteo|Alessandro|Lorenzo|Diego|Tommaso|Riccardo|Leonardo|Gabriele|Edoardo|Samuele|Liam|Nathan|Noah|Enea|Cesare|Ivo|Arturo|Nevio|Ettore|Roberto|Valerio|Pierluigi|Gianmaria|Gianmarco|Maurizio|Emanuele|Niccolò|Nicola|Filippo|Santiago|Alberto|Corrado|Ernesto|Giuliano|Ivan|Juri|Lupo|Tancredi|Jacob|Micahel|Ethan|Joshua|Daniel|Aurelio|Mario|Stefano|Cristian|Carmine|Ciro|Corrado|Carlo|Cesare|Carlo|Dante|Dario|Davide|Damiano|Diego|Domenico|Dino|Eugenio|Flavio|Filippo|Fabio|Francesco|Gaetano|Giordano|Giovanni|Alex|Alexander|Luca|Jacopo|Milo|Cristiano|Thomas|Lucas|Joele|Massimo|Giosuè|Oliver|William|James|Lucas|Henry|John|Ryan|Ethan|Gus|Logan|Nolan|Sean|Tyler|Ursula|Adowa|Amina|Fayola|Dara|Makena|Rashida|Zahra|Ashaki|Obioma|Terehasa|Zainabu|Busara|Dafina|Kamohelo|Mbhali|Aya|Mariam|Adama|Fatouma|Jeannette|Hong|Yu|Min|Xin|Bin|Cheng|Zhen|Eriko|Fujiko|Ikuyo|Keiko|Madoka|Natsumi|Rumiko|Ryo|Toyoko|Yumi|Yuki|Tamafune|Kaori|Chikako|Atsuko|Shaila|Ravi|Gita|Manju|Urmila|Sita|Nirmala|Savita|Kamal|Aadhya|Bimala|Chandra|Uma|Rita|Maura|Giulia|Francesca|Cecilia|Ilaria|Vittoria|Cinzia|Marisa|Antonia|Antonietta|Valeria|Maria|Olga|Tatyana|Natalya|Irina|Svetlana|Ekaterina|Cristina|Kristina|Emma|Jade|Louise|Chloé|Camille|Inès|Sarah|Ivy|Taylor|Sophia|Rosie|Poppy|Sienna|Karen|Ruby|Eva|Violet|Margot|Aurora|Elizabeth|Scarlett|Virginia|Atsushi|Dalai |Haoyu|Ming|Masao|Toshi|Song|Wei|Lang|Wei|Akio|Akihiro|Fumihiko|Bishamon|Chikayoshi|Daiichi|Fumihiro|Genjo|Hiromu|Mitsuo|Vyomesh|Vishwatma|Umachandra|Tarkesh|Sujan|Ranjeet|Mattia|Gabriele|Marco|Prajit|Nripendra|Kundan|Sergey|Aleksandr|Roman|Denis|Igor|Anton|Lev|Pavel|Kirill|Oleg|Stanislav|Antoine|Alexandre|Étienne|François|Henri|Louis|Olivier|Pierre|Vincent|Paul|Almira|Amalia|Charo|Carmen|Clarissa|Elena|Claudia|Estella|Zita|Zoe|Veronica|Fabio|Felix|Jago|Jose|Jorde|Rodrigo|Sergio|Andrea|Harper|Dakota|Blue|Elliot|Kraken|Charlie|Avery|Jordan |Felice|Noah|Celeste|Fiore|Diamante|Evan|Leslie|Lago|Fiume|Casey|Harper|Sidney|Gail|Syb|Max|Nicky|Sasha|Carmine|Beatrice|Asad|Danilo|Sissi|Javi|Salvo|Sven|Jacopo|Letizia|Ren|Pablo|Guido|Arianna|Simão|Nicolò|Ivana}"
        
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
    - char == firstStory:
        ~ red = firstRed
        ~ green = firstGreen
        ~ blue = firstBlue
        ~ yellow = firstYellow
        ~ purple = firstPurple
        ~ playerFirstStory = ()

    - char == secondStory:
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
            - char == firstStory:
               ~ playerFirstStory += greenStatus
               {debug: Lo status di playerFirstStory è {playerFirstStory}}
            - char == secondStory:
                ~ playerSecondStory += greenStatus
            - char == thirdStory:
                ~ playerThirdStory += greenStatus
            - char == fourthStory:
                ~ playerFourthStory += greenStatus
            - char == fifthStory:
                ~ playerFifthStory += greenStatus
        }
    
    - (playerBlue > playerGreen) && (playerBlue > playerRed) && (playerBlue > playerYellow) && (playerBlue > playerPurple):
        {
            - char == firstStory:
                ~ playerFirstStory += blueStatus
                {debug: Lo status di playerFirstStory è {playerFirstStory}}
            - char == secondStory:
                ~ playerSecondStory += blueStatus
            - char == thirdStory:
                ~ playerThirdStory += blueStatus
            - char == fourthStory:
                ~ playerFourthStory += blueStatus
            - char == fifthStory:
                ~ playerFifthStory += blueStatus
        }        
    
    - (playerRed > playerGreen) && (playerRed > playerBlue) && (playerRed > playerYellow) && (playerRed > playerPurple):
        {
            - char == firstStory:
                ~ playerFirstStory += redStatus
                {debug: Lo status di playerFirstStory è {playerFirstStory}}
            - char == secondStory:
                ~ playerSecondStory += redStatus
            - char == thirdStory:
                ~ playerThirdStory += redStatus
            - char == fourthStory:
                ~ playerFourthStory += redStatus
            - char == fifthStory:
                ~ playerFifthStory += redStatus
        }    
    
    - (playerYellow > playerGreen) && (playerYellow > playerBlue) && (playerYellow > playerRed) && (playerYellow > playerPurple):
        {
            - char == firstStory:
                ~ playerFirstStory += yellowStatus
                {debug: Lo status di playerFirstStory è {playerFirstStory}}
            - char == secondStory:
                ~ playerSecondStory += yellowStatus
            - char == thirdStory:
                ~ playerThirdStory += yellowStatus
            - char == fourthStory:
                ~ playerFourthStory += yellowStatus
            - char == fifthStory:
                ~ playerFifthStory += yellowStatus
        }    
    
    - (playerPurple > playerGreen) && (playerPurple > playerBlue) && (playerPurple > playerRed) && (playerPurple > playerYellow):
        {
            - char == firstStory:
                ~ playerFirstStory += purpleStatus
                {debug: Lo status di playerFirstStory è {playerFirstStory}}
            - char == secondStory:
                ~ playerSecondStory += purpleStatus
            - char == thirdStory:
                ~ playerThirdStory += purpleStatus
            - char == fourthStory:
                ~ playerFourthStory += purpleStatus
            - char == fifthStory:
                ~ playerFifthStory += purpleStatus
        }
    
    - else:
        {
            - char == firstStory:
                ~ playerFirstStory += mixedStatus
                {debug: Lo status di playerFirstStory è {playerFirstStory}}
            - char == secondStory:
                ~ playerSecondStory += mixedStatus
            - char == thirdStory:
                ~ playerThirdStory += mixedStatus
            - char == fourthStory:
                ~ playerFourthStory += mixedStatus
            - char == fifthStory:
                ~ playerFifthStory += mixedStatus
        }    

}


