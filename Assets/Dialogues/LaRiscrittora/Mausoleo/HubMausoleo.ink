=== hub_mausoleo ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Qui non compaiono anime e animelle
//Da qui possiamo riprendere una storia in corso, o prenderne una nuova. Se c'è una storia in corso le altre non sono accessibili, e plausibilmente vedremo il fantasma di turno che ci aspetta.
{hub_mausoleo==1: <i>Ecco il mausoleo</i>|<i>Il mausoleo {~ è pacifico|resta silente|brilla di luce leggera}</i>.}
    + [Mi guardo attorno.]
    -
        -> main

