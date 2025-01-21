//Per assegnare/cambiare pronomi di riferimento
=== assegnazione_genere ===
    + {assegnazione_genere> 1} Mi trovo a mio agio con i pronomi {pronomi}.
        ->->
    + {assegnazione_genere > 1} <i> Forse qualcosa è cambiato. </i>
        -> top
    + ->
    - (top)
        + [Mi trovo a mio agio col maschile.]
            ~ pronomi += maschili
        + [Preferisco i pronomi femminili.]
            ~ pronomi += femminili
        + [Vai di neutro, ama.]
            ~ pronomi += neutri
        -
->->

//Per la scelta del nome
=== il_mio_nome ===
    + {il_mio_nome > 1} Il mio nome è {nome}.
        ->->
    + {il_mio_nome > 1} <i>Non sento più questo nome come mio.</i>
        -> top
    + ->
    - (top)
        Il mio nome è...
        ~ nome = "{~ Alessio|Gianni|Matteo|Alessandro|Lorenzo|Diego|Tommaso|Riccardo|Leonardo|Gabriele|Edoardo|Samuele|Liam|Nathan|Noah|Enea|Cesare|Ivo|Arturo|Nevio|Ettore|Roberto|Valerio|Pierluigi|Gianmaria|Gianmarco|Maurizio|Emanuele|Niccolò|Nicola|Filippo|Santiago|Alberto|Corrado|Ernesto|Giuliano|Ivan|Juri|Lupo|Tancredi|Jacob|Micahel|Ethan|Joshua|Daniel|Aurelio|Mario|Stefano|Cristian|Carmine|Ciro|Corrado|Carlo|Cesare|Carlo|Dante|Dario|Davide|Damiano|Diego|Domenico|Dino|Eugenio|Flavio|Filippo|Fabio|Francesco|Gaetano|Giordano|Giovanni|Alex|Alexander|Luca|Jacopo|Milo|Cristiano|Thomas|Lucas|Joele|Massimo|Giosuè|Oliver|William|James|Lucas|Henry|John|Ryan|Ethan|Gus|Logan|Nolan|Sean|Tyler|Ursula|Adowa|Amina|Fayola|Dara|Makena|Rashida|Zahra|Ashaki|Obioma|Terehasa|Zainabu|Busara|Dafina|Kamohelo|Mbhali|Aya|Mariam|Adama|Fatouma|Jeannette|Hong|Yu|Min|Xin|Bin|Cheng|Zhen|Eriko|Fujiko|Ikuyo|Keiko|Madoka|Natsumi|Rumiko|Ryo|Toyoko|Yumi|Yuki|Tamafune|Kaori|Chikako|Atsuko|Shaila|Ravi|Gita|Manju|Urmila|Sita|Nirmala|Savita|Kamal|Aadhya|Bimala|Chandra|Uma|Rita|Maura|Giulia|Francesca|Cecilia|Ilaria|Vittoria|Cinzia|Marisa|Antonia|Antonietta|Valeria|Maria|Olga|Tatyana|Natalya|Irina|Svetlana|Ekaterina|Cristina|Kristina|Emma|Jade|Louise|Chloé|Camille|Inès|Sarah|Ivy|Taylor|Sophia|Rosie|Poppy|Sienna|Karen|Ruby|Eva|Violet|Margot|Aurora|Elizabeth|Scarlett|Virginia|Atsushi|Dalai |Haoyu|Ming|Masao|Toshi|Song|Wei|Lang|Wei|Akio|Akihiro|Fumihiko|Bishamon|Chikayoshi|Daiichi|Fumihiro|Genjo|Hiromu|Mitsuo|Vyomesh|Vishwatma|Umachandra|Tarkesh|Sujan|Ranjeet|Mattia|Gabriele|Marco|Prajit|Nripendra|Kundan|Sergey|Aleksandr|Roman|Denis|Igor|Anton|Lev|Pavel|Kirill|Oleg|Stanislav|Antoine|Alexandre|Étienne|François|Henri|Louis|Olivier|Pierre|Vincent|Paul|Almira|Amalia|Charo|Carmen|Clarissa|Elena|Claudia|Estella|Zita|Zoe|Veronica|Fabio|Felix|Jago|Jose|Jorde|Rodrigo|Sergio|Andrea|Harper|Dakota|Blue|Elliot|Kraken|Charlie|Avery|Jordan |Felice|Noah|Celeste|Fiore|Diamante|Evan|Leslie|Lago|Fiume|Casey|Harper|Sidney|Gail|Syb|Max|Nicky|Sasha|Carmine|Beatrice|Asad|Danilo|Sissi|Javi|Salvo|Sven|Jacopo|Letizia|Ren|Pablo|Guido|Arianna|Simão|Nicolò|Ivana}"
        
        + (nome_scelto)[<b>{nome}</b>]
        + [No, non è questo il mio nome.]
            -> top
        - 
->->

//Funzioni di gestione del background
//Per la nomenclatura: il back di default è backLuogo, il resto vediamo man mano.
=== function tag_background()
{

    - entity_location(PG) == Forest:
        ~ return "backGiardino"
        
    - entity_location(PG) == BusStop:
        ~ return "backBusStop"
        
    - entity_location(PG) == GreenhouseMiddlePath:
       ~ return "backGreenhouseMiddlePath"
       
    - entity_location(PG) == Greenhouse:
       ~ return "backFunghi"       

    - entity_location(PG) == Falene:
        ~ return "backFalene"
        
    - entity_location(PG) == Labirinto:
        ~ return "backLabirinto"

    - entity_location(PG) == Biblioteca:
       ~ return "backBiblioteca"

    - entity_location(PG) == Tisane:
       ~ return "backTisane"       
                            
}

//Funzioni di gestione sottofondo audio
=== function tag_ambientSounds()
{

    - entity_location(PG) == Forest:
        ~ return "gardenSounds"
        
    - entity_location(PG) == BusStop:
        ~ return "busstopSounds"
        
    - entity_location(PG) == GreenhouseMiddlePath:
       ~ return "greenhouseMiddlePathSounds"        
        
    - entity_location(PG) == Greenhouse:
       ~ return "greenhouseSounds"

    - entity_location(PG) == Falene:
        ~ return "mothSounds"
        
    - entity_location(PG) == Labirinto:
        ~ return "labirinthSounds"

    - entity_location(PG) == Biblioteca:
       ~ return "librarySounds"

    - entity_location(PG) == Tisane:
       ~ return "teaSounds"       
                            
}

=== save ===
    + [Save]
    <i>Il gioco è stato salvato!</i>
    -
    -> main

=== load ===
    + [Load]
    <i>Il salvataggio è stato correttamente caricato.</i>
    -
    -> main
=== quit ===
    + [Quit]
    <i>Progresso salvato. A presto!</i>
    -
    -> main
