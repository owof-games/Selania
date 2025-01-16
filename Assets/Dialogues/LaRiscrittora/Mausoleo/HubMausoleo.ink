=== hub_bus_stop ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Qui non compaiono anime e animelle
//Da qui possiamo riprendere una storia in corso, o prenderne una nuova. Se c'è una storia in corso le altre non sono accessibili, e plausibilmente vedremo il fantasma di turno che ci aspetta.
{hub_bus_stop==1: <i>Questa è la fermata del bus</i>|<i>La fermata {~ è pacifica|resta silente|brilla di luce leggera}</i>}.
    + [Mi guardo attorno.]
    -
        -> main

