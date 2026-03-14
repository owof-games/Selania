
//INDICATORE DELLO STATO DELLA RELAZIONE
//Variabili comuni per l'indicatore dello stato della relazione
VAR relationship_indicator_minValue = -9
VAR relationship_indicator_maxValue = 9
    //E stati della variazioni e delle relativa reazioni
LIST relationship_listTypeReactions = neutral, negative, positive

//RECAP DELLE SCELTE PRESE PER SINGOLX PNG
//Variabili di cap
VAR choicesRecap_indicator_minValue = -9
VAR choicesRecap_indicator_maxValue = 18




//Questa funzione serve solo per comunicare a unity il valore effettivo dello stato delle scelte prese, perché uso il cap con un valore grafico, ma per il resto del gioco mi serve che il recap delle scelte vada senza minimi e massimi.
//=== function choiceRecap_numberCap
