//Per assegnare/cambiare pronomi di riferimento
=== assegnazione_genere ===
    + {assegnazione_genere> 1} Mi trovo a mio agio con i pronomi {pronomi}
        ->->
    + {assegnazione_genere > 1} <i> Forse qualcosa è cambiato </i>
        -> top
    + ->
    - (top)
        + Mi trovo a mio agio col maschile
            ~ pronomi += maschili
        + Preferisco i pronomi femminili
            ~ pronomi += femminili
        + Vai di neutro, ama
            ~ pronomi += neutri
        -
->->

//Per la scelta del nome
=== il_mio_nome ===
    + {il_mio_nome > 1} Il mio nome è {nome}
        ->->
    + {il_mio_nome > 1} <i> Non sento più questo nome come mio </i>
        -> top
    + ->
    - (top)
        ~ nome = "{~ Alessio|Gianni|Matteo|Alessandro|Lorenzo|Diego|Tommaso|Riccardo|Leonardo|Gabriele|Edoardo|Samuele|Liam|Nathan|Noah|Enea|Cesare|Ivo|Arturo|Nevio|Ettore|Roberto|Valerio|Pierluigi|Gianmaria|Gianmarco|Maurizio|Emanuele|Niccolò|Nicola|Filippo|Santiago|Alberto|Corrado|Ernesto|Giuliano|Ivan|Juri|Lupo|Tancredi|Jacob|Micahel|Ethan|Joshua|Daniel|Aurelio|Mario|Stefano|Cristian|Carmine|Ciro|Corrado|Carlo|Cesare|Carlo|Dante|Dario|Davide|Damiano|Diego|Domenico|Dino|Eugenio|Flavio|Filippo|Fabio|Francesco|Gaetano|Giordano|Giovanni|Alex|Alexander|Luca|Jacopo|Milo|Cristiano|Thomas|Lucas|Joele|Massimo|Giosuè|Oliver|William|James|Lucas|Henry|John|Ryan|Ethan|Gus|Logan|Nolan|Sean|Tyler}"
        
        + (nome_scelto)[<b>Mi chiamo {nome}</b>]Mi chiamo {nome}
        + [<i>No, questo non è il mio nome</i>]-> top
        - 
->->

//Funzioni di gestione della numerazione

//Takes the bottom element from a list, and returns it, modifying the list.
//Returns the empty list () if the source list is empty.
// I eat the {pop(fruitBowl)}. Now the bowl contains {fruitBowl}.


